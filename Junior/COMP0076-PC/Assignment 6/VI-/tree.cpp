#include "tree.h"
mytree m1;
IDtable SymTable[1000];
int symNum = 0;
int temp_var_seq = 0;
int label_count = 0;
int Line = 1;         //Node��������
int ID_num = 0;
int Err_num = 1;    //err��
ofstream out("Error List.txt");
mytree::mytree()
{
	nodenum = 0;
}
mytree::~mytree()
{
}
void mytree::showNode(treenode *node)
{
	string Type[4] = { "Char","Int","Bool","Void" };
	string decl[4] = { "Const Declaration","ID Declaration ","Type Specifier","Var Declaration" };
	string stmt[6] = { "If Statement","For Statement","While Statement","Compound Statement","Input Statement","Output Statement" };
	string exp[4] = { "Assign Expr","Compare Expr","Op Expr","Logical Expr" };
	string str = "<Line " + to_string(node->linenum);
	str += ", Node";
	str += to_string(node->nodenum);
	str += ">";
	cout << left << setw(20) <<str <<" ";
	if (node->nodetype == Stmt)
	{
		cout << left<<setw(15)<<stmt[node->type_type]<<"\t\t"<<"\t";
	}
	else if (node->nodetype == Expr)
	{
		cout  << left << setw(15)<< exp[node->type_type] << "\t" << "OP:" << node->op << "\t\t";
	}
	else if (node->nodetype == Decl)
	{
		cout << left << setw(15) << decl[node->type_type] << "\t";
		if (node->type_type == Const_Decl)
		{
			if (node->property == "Int")
			{
				string str = "value:" + to_string(node->IDaddr);
				cout << left << setw(15) << str << "\t";
			}
			else
			{
				cout << left << setw(6) << "value:"<<left<<setw(9)<<node->constchar<< "\t";
			}
		}
		else if (node->type_type == ID_Decl)
		{
			string str = "symbol:" + SymTable[node->IDaddr].name;
			cout << left << setw(15) << str<<"\t";
		}
		else if (node->type_type == Var_Decl)
		{
			cout << "\t\t";
		}
		else
		{
			cout << left << setw(15) << Type[node->wordtype] << "\t";
		}
	}
		cout << "Children:";
		treenode* temp;
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if (node->child[i] != NULL)
			{
				cout << node->child[i]->nodenum << " ";
				temp = node->child[i]->sibling;
				while (temp != NULL)
				{
					cout << temp->nodenum << " ";
					temp = temp->sibling;
				}
			}
		}
		cout <<left<<setw(15)<< "\t\tProperty:" << node->property;
		cout << endl;
}
int mytree::addSymbol(string str)
{
	for (int i = 0; i < symNum; i++)
	{
		if (SymTable[i].name.compare(str)==0)
		{
			return i;
		}
	}
	symNum++;
	SymTable[symNum - 1].name = str;
	return -1;
}
treenode * mytree::createnode(NodeType node_type, int type_type)
{
	struct treenode *node = new treenode;
	if (node == NULL) cout << "�����ڵ����" << endl;
	else
	{
		node->nodetype = node_type;
		node->type_type = type_type;
		node->constchar = '\0x00';
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			node->child[i] = NULL;
		}
		node->sibling = NULL;
		node->linenum = Line;
		node->nodenum = nodenum++;
	}
	return node;
}
void mytree::TypeCheck(treenode *node)
{
	string Type[4] = { "Char","Int","Bool","Void" };
	string decl[4] = { "Const_Decl","ID_Decl ","Type_Decl","Var_Decl" };
	string stmt[6] = { "If_Stmt","For_Stmt","While_Stmt" ,"Compound_Stmt","In_Stmt","Out_Stmt"};
	string exp[4] = { "Assign_Exp","Comp_Exp","OP_Exp","Log_Exp" };
	treenode *temp;
	//���ǰ��ʼ���������
    if (node->nodetype == Decl)
	{
		if (node->type_type ==ID_Decl)    //��ID����type
		{
			if (node->property != "")   //��һ������
			{
				SymTable[node->IDaddr].type = node->property; 
			}
			else    //�������
			{
				node->property = SymTable[node->IDaddr].type;
			}
		}
		else if (node->type_type == Const_Decl)   //�����ڵ�����
		{
			if (char(node->IDaddr) == node->constchar)   //charval
			{
				node->property = "Char";
			}
			else 
				node->property = "Int";
		}
		else if (node->type_type == Var_Decl)       //���������µ����нڵ�����
		{
			node->child[0]->property = Type[node->child[0]->wordtype];
			for (int i = 0; i < MAXCHILDREN; i++)
			{
				if (node->child[i] != NULL)
				{
					node->child[i]->property = Type[node->child[0]->wordtype];
					temp = node->child[i]->sibling;
					while (temp != NULL)
					{
						temp->property= Type[node->child[0]->wordtype];
						temp = temp->sibling;
					}
				}
			}
			node->property = "Void";
		}
			
	}
	for (int i = 0; i < MAXCHILDREN; i++)//����DFS�ı������
	{
		if (node->child[i] != NULL)
		{
			TypeCheck(node->child[i]);
			temp = node->child[i]->sibling;
			while (temp != NULL)
			{
				TypeCheck(temp);
				temp = temp->sibling;
			}
		}
	}
	if (node->nodetype == Stmt)
	{
		temp = node;
		if (stmt[node->type_type] == "If_Stmt")
		{
			temp = temp->child[0];
			if (temp->property == "Bool")
				node->property = "Void";
			else
				node->property = "If�ж�������";
		}
		else if (stmt[node->type_type] == "For_Stmt")
		{
			temp = node->child[1];
			if (temp != NULL)
			{
				if (temp->property == "Bool")
				{
					node->property = "Void";
				}
				else
				{
					node->property = "For�ж�������";
				}
			}
			else
			{
				node->property = "Void";
			}
		}
		else if (stmt[node->type_type] == "While_Stmt")
		{
			temp = temp->child[0];
			if (temp->property == "Bool")
				node->property = "Void";
			else
				node->property = "While�ж�������";
		}
		else if (stmt[node->type_type] == "Compound_Stmt")
		{
			node->property = "Void";
		}
		else if (stmt[node->type_type] == "In_Stmt" || stmt[node->type_type] == "Out_Stmt")
		{
			if (node->child[0]->property == "Bool")
				node->property = "IO���ʹ���";
			else
				node->property = "Void";
		}
	}

	if (node->nodetype == Expr)
	{
		if (exp[node->type_type] == "Assign_Exp")
		{
			temp = node->child[0];
			if (SymTable[temp->IDaddr].type.length() == 0)
			{
				node->property = "δ��������";
			}
			else if (node->child[1]->property != temp->property)
			{
				node->property = "��ֵ����";
			}
			else
			{
				node->property = temp->property;
			}
		}
		else if (exp[node->type_type] == "OP_Exp")
		{
			temp = node->child[0];
			treenode* temp1 = node->child[1];
			if (temp->type_type == ID_Decl)
			{
				if (SymTable[temp->IDaddr].type.length() == 0)
				{
					node->property = "δ��������";
				}
				else if (temp->property == temp1->property)
					node->property = temp->property;
				else if (temp->property != temp1->property)
					node->property = "�������";
			}
			else if(temp1->type_type == ID_Decl)
			{
				if (SymTable[temp1->IDaddr].type.length() == 0)
				{
					node->property = "δ��������";
				}
				else if (temp->property == temp1->property)
					node->property = temp->property;
				else if (temp->property != temp1->property)
					node->property = "�������";
			}
			else
			{
				node->property = temp->property;
			}
		}
		else if (exp[node->type_type] == "Comp_Exp")
		{
			temp = node->child[0];
			if (temp->type_type == ID_Decl)
			{
				if (SymTable[temp->IDaddr].type.length() == 0)
				{
					node->property = "δ��������";
				}
				else if (node->child[0]->property == node->child[1]->property)
					node->property = "Bool";
				else if (temp->nodetype != Decl)
				{
					node->property = "��ֵ����";

				}
			}
			else
			{
				treenode *mytemp = node;
				mytemp = temp->sibling;
				if (mytemp->property != temp->property)
				{
					node->property = "�������";
				}
				else
					node->property = "Bool";
			}
		}
		else if (exp[node->type_type] == "Log_Exp")
		{
			if (node->op == "!" || node->op == "~")    //��Ŀ
			{
				temp = node->child[0];
				if (temp->property == "Bool")
					node->property = "Bool";
				else
					node->property = "�߼�����";
			
			}
			else     //˫Ŀ
			{
				temp = node->child[0];
				treenode* temp1 = node->child[1];
				if (temp->property == "Bool" && temp1->property == "Bool" && temp->property == temp1->property)
					node->property = "Bool";
				else
					node->property = "�߼�����";
			}
		}
	}
}
void mytree::display(treenode *node)
{
	treenode *temp;
	for (int i = 0; i < MAXCHILDREN; i++)
	{
		if (node->child[i] != NULL)
			display(node->child[i]);
	}
	showNode(node);
	temp = node->sibling;
	if (temp != NULL)
	{
		display(temp);
	}
	return;
}
void mytree::printTable()
{
	cout << "****Symbol Table****\n";
	cout << left << setw(7) << "������" << left << setw(5) << "����"<<endl;
	for (int i = 0; i < symNum; i++)
	{
		cout << left<<setw(7)<<SymTable[i].name <<left<<setw(5)<<SymTable[i].type<<endl;
	}
	cout << "******The End******\n";
}

void mytree::Error(treenode* node)
{
	cout << "************Error List************\n";
	out<< "************Error List************\n";
	cout << left << setw(5) <<"���"<< left << setw(5) << "�к�" << left << setw(5) << "�ڵ�" <<left<<setw(5)<<"����"<< endl;
	out << left << setw(5) << "���" << left << setw(5) << "�к�" << left << setw(5) << "�ڵ�" << left << setw(5) << "����" << endl;
	printError(node);
	cout << "*************The End*************\n";
	out << "*************The End*************\n";
	out.close();
}

void mytree::printError(treenode* node)
{
	treenode* temp;
	for (int i = 0; i < MAXCHILDREN; i++)
	{
		if (node->child[i] != NULL)
			printError(node->child[i]);
	}
	showError(node);
	temp = node->sibling;
	if (temp != NULL)
	{
		printError(temp);
	}
}

void mytree::showError(treenode* node)
{
	if (node->property != "Int" && node->property != "Char" && node->property != "Bool" && node->property != "" && node->property != "Void")
	{
		cout << left << setw(5) <<to_string(Err_num)<< left << setw(5) << to_string(node->linenum) << left << setw(5) << to_string(node->nodenum);
		out << left << setw(5) << to_string(Err_num) << left << setw(5) << to_string(node->linenum) << left << setw(5) << to_string(node->nodenum);
		Err_num++;
		if(node->property=="δ��������")
		{
			string str1 = "δ��������";
			cout << left << setw(15)<<str1;
			out << left << setw(15) << str1;
			string str="";
			for (int i = 0; i < MAXCHILDREN; i++)
			{
				if(node->child[i]!=NULL)
					if (node->child[i]->property == "")
					{
						str += "Node";
						str += to_string(node->child[i]->nodenum);
						str += " ";
						str += SymTable[node->child[i]->IDaddr].name;
					}
			}
			cout << left << setw(20) << str<< endl;
			out << left << setw(20) << str << endl;
		}
		else if (node->property == "��ֵ����")
		{
			string str1 = "��ֵ����";
			cout << left << setw(15) << str1;
			out << left << setw(15) << str1;
			string str = "";
			str += "��ֵNode";
			str += to_string(node->child[0]->nodenum);
			str += "����:";
			str += node->child[0]->property;
			str +=" ��ֵNode";
			str += to_string(node->child[1]->nodenum);
			str += "����:";
			str += node->child[1]->property;
			cout << left << setw(20) << str << endl;
			out << left << setw(20) << str << endl;
		}
		else if (node->property =="�������")
		{

			string str1 = node->op;
			str1 += "������� ";
			cout << left << setw(15) << str1;
			out << left << setw(15) << str1;
			string str = "";
			str += "��ֵNode";
			str += to_string(node->child[0]->nodenum);
			str += "����:";
			str += node->child[0]->property;
			str += " ��ֵNode";
			str += to_string(node->child[1]->nodenum);
			str += "����:";
			str += node->child[1]->property;
			cout << left << setw(20) << str << endl;
			out << left << setw(20) << str << endl;
		}
		else if (node->property == "�߼�����")
		{
			string str1 = node->op;
			str1 += "�߼����� ";
			cout << left << setw(15) << str1;
			out << left << setw(15) << str1;
			string str = "";
			if (node->op == "!" || node->op == "~")
			{
				str += "��ֵNode";
				str += to_string(node->child[0]->nodenum);
				str += "����:";
				str += node->child[0]->property;
				cout << left << setw(20) << str << endl;
				out << left << setw(20) << str << endl;
			}
			else
			{
				str += "��ֵNode";
				str += to_string(node->child[0]->nodenum);
				str += "����:";
				str += node->child[0]->property;
				str += " ��ֵNode";
				str += to_string(node->child[1]->nodenum);
				str += "����:";
				str += node->child[1]->property;
				cout << left << setw(20) << str << endl;
				out << left << setw(20) << str << endl;
			}

		}
		else if (node->property == "For�ж�������")
		{
			string str1 = "For������";
			cout << left << setw(15) << str1;
			out << left << setw(15) << str1;
			string str = "";
			str += "�ж�Node";
			str += to_string(node->child[1]->nodenum);
			str += "����:";
			str += node->child[0]->property;
			cout << left << setw(20) << str << endl;
			out << left << setw(20) << str << endl;
		}
		else if (node->property == "If�ж�������")
		{
			string str1 = "If������";
			cout << left << setw(15) << str1;
			out << left << setw(15) << str1;
			string str = "";
			str += "�ж�Node";
			str += to_string(node->child[0]->nodenum);
			str += "����:";
			str += node->child[0]->property;
			cout << left << setw(20) << str << endl;
			out << left << setw(20) << str << endl;
		}
		else if (node->property == "While�ж�������")
		{
		string str1 = "While������";
		cout << left << setw(15) << str1;
		out << left << setw(15) << str1;
		string str = "";
			str += "�ж�Node";
			str += to_string(node->child[0]->nodenum);
			str += "����:";
			str += node->child[0]->property;
			cout << left << setw(20) << str << endl;
			out << left << setw(20) << str << endl;
		}
		else if (node->property == "IO���ʹ���")
		{
		string str1 = "IO���ʹ���";
		cout << left << setw(15) << str1;
		out << left << setw(15) << str1;
		string str = "";
			str += "Node";
			str += to_string(node->child[0]->nodenum);
			str += "����:";
			str += node->child[0]->property;
			cout << left << setw(20) << str << endl;
			out << left << setw(20) << str << endl;
		}
	}

}