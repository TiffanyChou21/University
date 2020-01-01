#include "tree.h"
#include<map>
#include<iomanip>
using namespace std;

extern TreeNode *root;
extern int rownum;
extern int lineno;
map<string, VarType> _idTable;

TreeNode* newStmtNode(StmtType type)
{
	TreeNode* t = new TreeNode();
	int i;
	for(i=0;i<MAXCHILDREN;i++)
		t->child[i]=NULL;
	t->sibling = NULL;
	t->nodeType = Stmt;
	t->type.stmtType = type;
	t->lineNo = lineno++;
	t->beginLabel = "";
	t->nextLabel = "";
	t->trueLabel = "";
	t->falseLabel = "";
	return t;
}
TreeNode* newExprNode(ExprType type)
{
	TreeNode* t = new TreeNode();
	int i;
	for(i=0;i<MAXCHILDREN;i++)
		t->child[i]=NULL;
	t->sibling = NULL;
	t->nodeType = Expr;
	t->type.exprType = type;
	t->lineNo = lineno++;
	t->varType = Void;		
	t->beginLabel ="";
	t->nextLabel = "";
	t->trueLabel = "";
	t->falseLabel = "";
	return t;
}
TreeNode * newDeclNode(DeclType type)
{
	TreeNode * t = new TreeNode();
	int i;
	for (i = 0; i<MAXCHILDREN; i++) 
		t->child[i] = NULL;
	t->sibling = NULL;
	t->nodeType = Decl;
	t->type.declType = type;
	t->lineNo = lineno++;
	t->beginLabel = "";
	t->nextLabel = "";
	t->trueLabel = "";
	t->falseLabel = "";
	return t;
}

void Display(TreeNode* root)
{
	if(root==NULL)
		return;
	else
	{
		for(int i=0;i<MAXCHILDREN;i++)
		{
			if(root->child[i]!=NULL)
				Display(root->child[i]);
		}
		getTemp(root);       //Get temp var for all vars
		showNode(root);
		TreeNode* temp = root -> sibling;
		if(temp!=NULL)
			Display(temp);
		return;
	}
}

void showNode(TreeNode* node)
{
	node->lineNo=rownum++;
	cout<<node->lineNo<<":\t";
	switch(node->nodeType)
	{	
		case Stmt:
		{
			string names[8]={"Block statement","If statement","While statement,","For statement","Return statement,","Input statement","Output statement" };
			cout<<names[node->type.stmtType]<<"\t\t\t";
			break;
		}
		case Expr:
		{
			string names[6]={"Expr,\t\t","Const Declaration,","ID Declaration,\t","Type,\t\t","Array\t","Function Call\t" };
			string types[6]={"Void,\t","Integer,","Boolean,\t","Char,\t","Float,\t","Double,\t"};
			cout<<names[node->type.exprType]<<"\t";
			switch(node->type.exprType)
			{
				case Op:
				{
					switch(node->attr.op)
					{
						case ASSIGN:
						{
							cout<<"op:=\t";
							break;
						}
						case OR:
						{
							cout<<"op:||\t";
							break;
						}
						case AND:
						{
							cout<<"op:&&\t";
							break;
						}
						case EQ:
						{
							cout<<"op:==\t";
							break;
						}
						case NE:
						{
							cout<<"op:!=\t";
							break;
						}
						case LT:
						{
							cout<<"op:<\t";
							break;
						}
						case GT:
						{
							cout<<"op:>\t";
							break;
						}
						case LE:
						{
							cout<<"op:<=\t";
							break;
						}
						case GE:
						{
							cout<<"op:>=\t";
							break;
						}
						case ADD:
						{
							cout<<"op:+\t";
							break;
						}
						case SUB:
						{
							cout<<"op:-\t";
							break;
						}
						case MUL:
						{
							cout<<"op:*\t";
							break;
						}
						case DIV:
						{
							cout<<"op:/\t";
							break;
						}
						case MOD:
						{
							cout<<"op:%\t";
							break;
						}
						case INC:
						{
							cout<<"op:++\t";
							break;
						}
						case DEC:
						{
							cout<<"op:--\t";
							break;
						}
						case OPPSITE:
						{
							cout<<"op:!\t";
							break;
						}
						case BAND:
						{
							cout << "op:&\t";
							break;
						}
						case BOR:
						{
							cout << "op:|\t";
							break;
						}
						case XOR:
						{
							cout << "op:^\t";
							break;
						}
						case NOT:
						{
							cout << "op:~\t";
							break;
						}
					}
					cout<<"\t";
					break;
				}
				case Const:
				{
					cout<<"value: "<<node->attr.value<<"\t";
					break;
				}
				case Id:
				{
					cout<<"symbol: "<<node->attr.id<<"\t";
					break;
				}
				case Type:
				{
					cout<<types[node->varType]<<"\t";
					break;
				}
				case Array:         //Array
				{
					cout << "Arrsymbol: " << node->attr.id << "\t";
					break;
				}
			}
			break;
		}	
		case Decl:
		{
			string names[3] = { "Var Declaration, ", "Func Declaration","Main Func" };
			cout << names[node->type.declType] << "\t\t\t";
			break;
		}
	}
	cout<<"children: ";
	for (int i = 0; i < MAXCHILDREN; i++)
	{
		if (node->child[i] != NULL)
		{
			cout << node->child[i]->lineNo << "   ";
			TreeNode* temp = node->child[i]->sibling;
			while (temp != NULL)
			{
				cout << temp->lineNo << "   ";
				temp = temp->sibling;
			}
		}
	}
	cout << endl;
	return;
}

void typeCheck(TreeNode *root)     //Type Check & Assign Type Preprocess
{
	traverse(root, assignType, checkNode);
}
static void traverse(TreeNode * node, void(*preProc) (TreeNode *),void(*postProc) (TreeNode *))
{
	if (node != NULL)     //Deep Traverse same as Display
	{
		preProc(node);
		{ 
			int i;
			for (i = 0; i < MAXCHILDREN; i++)
				traverse(node->child[i], preProc, postProc);
		}
		postProc(node);
		traverse(node->sibling, preProc, postProc);
	}
}
static void assignType(TreeNode* node)
{
	if (node->nodeType == Decl&&node->type.declType == Var)
	{
		VarType vartype = node->child[0]->varType;
		TreeNode* temp = node->child[1];
		while (temp != NULL)
		{
			if (temp->type.exprType == Id||temp->type.exprType==Array)   //Array is no use so use array->child[0]
			{
				_idTable[temp->attr.id] = vartype;
				temp->varType = vartype;
				node->varType = vartype;
			}
			if (temp->type.exprType == Array)
			{
				_idTable[temp->attr.id] = vartype;
				temp->varType = vartype;
				temp->child[0]->varType = vartype;
				node->varType = vartype;
			}
			if (temp->type.exprType == Op && temp->attr.op == ASSIGN)
			{
				TreeNode* idNode = temp->child[0];
				if (idNode->type.exprType == Id)
				{
					_idTable[idNode->attr.id] = vartype;
					idNode->varType = vartype;
					node->varType = vartype;
				}
			}
			temp = temp->sibling;
		}
	}
	else if (node->nodeType == Decl && node->type.declType == Func)   //Func Decl & Assign Type
	{
		VarType vartype = node->child[0]->varType;
		TreeNode* temp = node->child[1];
		if (temp->type.exprType == Id)
		{
			_idTable[temp->attr.id] = vartype;
			temp->varType = vartype;
			node->varType = vartype;
		}
	}
}
static void checkNode(TreeNode *node)
{
	switch (node->nodeType)
	{
		case Expr:
			switch (node->type.exprType)
			{
				case Op:
					switch(node->attr.op)	
					{
						case ASSIGN:    //Array is split from Id
							{
							if (node->child[0]->type.exprType == Array)
							{
								if (node->child[1]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "1 arr assign type error------" << left << setw(3) << node->lineNo << "= Expr type error." << endl;
									}
								}
								else
								{
									if (node->child[0]->child[0]->varType == node->child[1]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										if (node->child[1]->type.exprType == Funcs && node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
											break;
										else 
											cout << "2 arr assign type error----------" << left << setw(3) << node->lineNo << ":= Expr type error." << endl;
									}
								}
							}
							else if (node->child[1]->type.exprType == Array)
							{
								if (node->child[0]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "3arr----------" << left << setw(3) << node->lineNo << ":= Expr type error." << endl;
									}
								}
								else
								{
									if (node->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[1]->child[0]->varType;
										break;
									}
									else
									{
										cout << "4arr----------" << left << setw(3) << node->lineNo << ":= Expr type error." << endl;
									}
								}
							}
							if (node->child[0]->varType != node->child[1]->varType)
								cout << "5id----------" << left << setw(3) << node->lineNo << ":= Expr type error." << endl;
							node->varType = node->child[0]->varType;
							break;
							}
						case BAND:
						case BOR:
						case XOR:
						{
							if (node->child[0]->type.exprType == Array)
							{
								if (node->child[1]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "1----------" << left << setw(3) << node->lineNo << ":&,|,^ Expr type error." << endl;
									}
								}
								else
								{
									if (node->child[0]->child[0]->varType == node->child[1]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "2----------" << left << setw(3) << node->lineNo << ":&,|,^ Expr type error." << endl;
									}
								}
							}
							else if (node->child[1]->type.exprType == Array)
							{
								if (node->child[0]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "1----------" << left << setw(3) << node->lineNo << ":&,|,^ Expr type error." << endl;
									}
								}
								else
								{
									if (node->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[1]->child[0]->varType;
										break;
									}
									else
									{
										cout << "1----------" << left << setw(3) << node->lineNo << ":&,|,^ Expr type error." << endl;
									}
								}
							}
							if (node->child[0]->varType != node->child[1]->varType)
								cout << "2----------" << left << setw(3) << node->lineNo << ":&,|,^ Expr type error." << endl;
							node->varType = node->child[0]->varType;
							break;

						}
						case SHL:
						case SHR:
						{
							if (node->child[0]->type.exprType == Array)
							{
								if (node->child[1]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "----------" << left << setw(3) << node->lineNo << ":<<,>> Expr type error." << endl;
									}
								}
								else
								{
									if (node->child[0]->child[0]->varType == node->child[1]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "----------" << left << setw(3) << node->lineNo << ":<<,>> Expr type error." << endl;
									}
								}
							}
							else if (node->child[1]->type.exprType == Array)
							{
								if (node->child[0]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[0]->child[0]->varType;
										break;
									}
									else
									{
										cout << "----------" << left << setw(3) << node->lineNo << ":<<,>> Expr type error." << endl;
									}
								}
								else
								{
									if (node->child[0]->varType == node->child[1]->child[0]->varType)
									{
										node->varType = node->child[1]->child[0]->varType;
										break;
									}
									else
									{
										cout << "----------" << left << setw(3) << node->lineNo << ":<<,>> Expr type error." << endl;
									}
								}
							}
							if (node->child[0]->varType != node->child[1]->varType)
								cout << "----------" << left << setw(3) << node->lineNo << ":<<,>> Expr type error." << endl;
							node->varType = node->child[0]->varType;
							break;

						}
						case ADD:
						case SUB:
						case MUL:
						case DIV:
						case MOD:
						{

								if (node->child[0]->type.exprType == Array)
								{
									if (node->child[1]->type.exprType == Array)
									{
										if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
										{
											node->varType = node->child[0]->child[0]->varType;
											break;
										}
										else
										{
											cout << "----------" << left << setw(3) << node->lineNo << ":+-*/% Expr type error." << endl;
										}
									}
									else
									{
										if(node->child[0]->child[0]->varType == node->child[1]->varType)
										{
											node->varType = node->child[0]->child[0]->varType;
											break;
										}
										else
										{
											cout << "----------" << left << setw(3) << node->lineNo << ":+-*/% Expr type error." << endl;
										}
									}
								}
								else if (node->child[1]->type.exprType == Array)
								{
									if (node->child[0]->type.exprType == Array)
									{
										if (node->child[0]->child[0]->varType == node->child[1]->child[0]->varType)
										{
											node->varType = node->child[0]->child[0]->varType;
											break;
										}
										else
										{
											cout << "----------" << left << setw(3) << node->lineNo << ":+-*/% Expr type error." << endl;
										}
									}
									else
									{
										if (node->child[0]->varType == node->child[1]->child[0]->varType)
										{
											node->varType = node->child[1]->child[0]->varType;
											break;
										}
										else
										{
											cout << "----------" << left << setw(3) << node->lineNo << ":+-*/% Expr type error." << endl;
										}
									}
								}
							if (node->child[0]->varType != node->child[1]->varType)
								cout << "----------" << left << setw(3) << node->lineNo << ":+-*/% Expr type error." << endl;
							node->varType = node->child[0]->varType;
							break;
						}
						case INC:
						case DEC:
						case NOT:
							{
								
								if (node->child[0]->type.exprType == Array)
								{
									if (node->child[0]->child[0]->varType != Int || node->child[0]->child[0]->varType != Char)
									{
										node->varType = node->child[0]->child[0]->varType;
									}
									else
										cout << "1----------" << left << setw(3) << node->lineNo << ": ++,--,~  Expr type error." << endl;
									break;
								}
								else if (node->child[0]->type.exprType!=Array )
								{
									if (node->child[0]->varType != Int && node->child[0]->varType != Char)
										cout << "2----------" << left << setw(3) << node->lineNo << ": ++,--,~  Expr type error." << endl;
									break;
								}
							}
						case EQ:
						case NE:
						case GT:
						case LT:
						case GE:
						case LE:
							{
								node->varType = Bool;
								if(node->child[0]->varType!=node->child[1]->varType)
									cout<<"----------"<<left<<setw(3)<<node->lineNo<<": equal Expr type error."<<endl;
								break;
							}
						case AND:
						case OR:
							{
								node->varType = Bool;
								if(node->child[0]->varType!=Bool||node->child[1]->varType!=Bool)
									cout<<"----------"<<left<<setw(3)<<node->lineNo<<": logit Expr type error."<<endl;
								break;
							}
						case OPPSITE:
							{
								node->varType = Bool;
								if(node->child[0]->varType!=Bool)
									cout<<"----------"<<left<<setw(3)<<node->lineNo<<": logit Expr type error."<<endl;
								break;
							}
					}
					break;
				case Id:
					node->varType = _idTable[node->attr.id];
					break;
				case Type:
					break;
				default:
					break;
			}
			break;
		case Stmt:
			switch (node->type.stmtType)
			{
				case Block:
					break;
				case If:
					{
						if(node->child[0]->varType!=Bool)
							cout<<"----------"<<left<<setw(3)<<node->lineNo<<": If Stmt type error."<<endl;
						break;
					}
				case While:
					{
						if(node->child[0]->varType!=Bool)
							cout<<"----------"<<left<<setw(3)<<node->lineNo<<": While Stmt type error."<<endl;
						break;
					}
				case For:
					{
						if(node->child[1]->varType!=Bool)
							cout<<"----------"<<left<<setw(3)<<node->lineNo<<": For Stmt type error."<<endl;
						break;
					}
				case Return:
					break;
				default:
					break;
			}
			break;
		default:
			break;
	}
}

void getTemp(TreeNode *node)
{
	if (node->nodeType != Expr)
		return;
	if (node->attr.op < ADD || node->attr.op > NOT )
		return;
	TreeNode *arg1 = node->child[0];
	TreeNode *arg2 = node->child[1];
	if (arg1->type.exprType == Op)
		tempNum--;                      //reuse
	if (arg2 && arg2->type.exprType==Op)
		tempNum--;
	node->tempNo = tempNum;
	tempNum++;
}
void newLabel(string &label)
{
	label = "L" + to_string(labelNum);
	labelNum++;
}
void getLabel()
{
	TreeNode *temp=root;
	if(temp->type.declType==Main)                //You must define your func before main
		temp->beginLabel = "_start";
	else
	{
		temp->beginLabel = temp->child[1]->attr.id;
		TreeNode* temp2 = temp->sibling;
		for (; temp2;)
		{
			if (temp2 && temp2->type.declType == Func)
				temp2->beginLabel = temp2->child[1]->attr.id;
			else if (temp2 && temp2->type.declType == Main)
				temp2->beginLabel = "_start";
			temp2 = temp2->sibling;
		}
	}
	for (; temp;)
	{
		recursiveGetLabel(temp->child[3]);
		temp = temp->sibling;
	}
}
void recursiveGetLabel(TreeNode *node)
{
	if(node->nodeType==Stmt)
		stmtGetLabel(node);
	if(node->nodeType==Expr)
		exprGetLabel(node);
}
void stmtGetLabel(TreeNode *node)
{
	switch(node->type.stmtType)
	{
		case Block:
			{
				for(int i=0;node->child[i];i++)
				{
					recursiveGetLabel(node->child[i]);
					for(TreeNode *temp=node->child[i]->sibling;temp;temp=temp->sibling)
						recursiveGetLabel(temp);
				}
			}
			break;
		case If:
			{
				TreeNode *t=node->child[0];
				TreeNode *c1=node->child[1];
				TreeNode *c2=node->child[2];
				newLabel(t->trueLabel);
				c1->beginLabel = t->trueLabel;
				if(node->nextLabel=="")
					newLabel(node->nextLabel);
				c1->nextLabel = node->nextLabel;
				if (c2)
				{
					newLabel(t->falseLabel);
					c2->beginLabel = t->falseLabel;
					c2->nextLabel = node->nextLabel;
				}
				else
					t->falseLabel = node->nextLabel;
				if (node->sibling)
					node->sibling->beginLabel = node->nextLabel;
				recursiveGetLabel(t);
				recursiveGetLabel(c1);
				if(c2)
					recursiveGetLabel(c2);
			}
			break;
		case While:
			{
				TreeNode *t=node->child[0];
				TreeNode *c=node->child[1];
				newLabel(node->beginLabel);
				c->nextLabel = node->beginLabel;
				newLabel(t->trueLabel);
				c->beginLabel = t->trueLabel;
				if(node->nextLabel=="")
					newLabel(node->nextLabel);
				t->falseLabel = node->nextLabel;
				if (node->sibling)
					node->sibling->beginLabel = node->nextLabel;
				recursiveGetLabel(t);
				recursiveGetLabel(c);
			}
			break;
		case For:                              //The same as While
			{
				TreeNode *t=node->child[1];
				TreeNode *c=node->child[3];
				newLabel(node->beginLabel);
				c->nextLabel = node->beginLabel;
				newLabel(t->trueLabel);
				c->beginLabel = t->trueLabel;
				if(node->nextLabel=="")
					newLabel(node->nextLabel);
				t->falseLabel = node->nextLabel;
				if (node->sibling)
					node->sibling->beginLabel = node->nextLabel;
				recursiveGetLabel(t);
				recursiveGetLabel(c);
			}
			break;
		default:
			break;
	}
}
void exprGetLabel(TreeNode *node)
{
	if(node->varType!=Bool)
		return;
	TreeNode *c1=node->child[0];
	TreeNode *c2=node->child[1];
	switch(node->attr.op)
	{
		case AND:                              //One false All false
			{
				newLabel(c1->trueLabel);
				c2->trueLabel = node->trueLabel;
				c2->falseLabel = node->falseLabel;
				c1->falseLabel = c2->falseLabel;
			}
			break;
		case OR:									//One true All true
			{
				newLabel(c1->falseLabel);
				c2->falseLabel = node->falseLabel;
				c2->trueLabel = node->trueLabel;
				c1->trueLabel = c2->trueLabel;
			}
			break;
		case OPPSITE:
			{
			c1->trueLabel = node->falseLabel;
			c1->falseLabel = node->trueLabel;
			}
			break;
		default:
			break;
	}
	if(c1)
		recursiveGetLabel(c1);
	if(c2)
		recursiveGetLabel(c2);
}

void genCode(ostream &out)
{
	genHeader(out);
	out << endl << endl << "\t.data" << endl;   //protect from redefining¡ª¡ªsource£ºgenDecl
	if (root->child[2] && root->child[2]->nodeType == Decl)
		genDecl(out, root->child[2]);
	TreeNode *decl=root->child[3];
	if(decl->child[0]->nodeType==Decl)
		genDecl(out,decl->child[0]);
	TreeNode* temp = root->sibling;
	for (; temp;)
	{
		if (temp->child[2])
			genDecl(out, temp->child[2]);
		if (temp->child[3]->child[0]->nodeType == Decl)
			genDecl(out, temp->child[3]->child[0]);
		temp = temp->sibling;
	}
	for (int i = 0; i < tempNum; i++)        //protect from redefining
		out << "\t\tt" << i << " DWORD 0" << endl;
	out<<endl<<endl<<"\t.code"<<endl;
	if (root->type.declType == Main)
	{
		out << "\t" << root->beginLabel << ":" << endl;
		recursiveGenCode(out, root->child[3]);
		if (root->child[3]->nextLabel != "")
			out << root->child[3]->nextLabel << ":" << endl;
		out << "\t\tinvoke crt_printf, SADD(\"print any key to continue...\")" << endl;
		out << "\t\tinvoke crt__getch" << endl;
		out << "\t\tinvoke crt__exit, 0" << endl;
		out << "\tend " << root->beginLabel << endl;
	}
	else
	{
		string end_label;
		out << "\t" << root->beginLabel << ":" << endl;
		TreeNode* temp = root->child[2];
		int offset=1;
		if(temp)out << "\t\tpush ebp\n\t\tMOV ebp,esp\n\t\tpush ebx\n";    //Func
		while (temp)
		{
			offset++;
			temp = temp->sibling;
		}	
		temp = root->child[2];
		while(temp)
		{
			if (temp->child[1]->varType == Int)
			{
				out << "\t\tMOV ebx, DWORD ptr[ebp+" << 4 * offset << "]\n";   //Args attain
				out << "\t\tMOV _" << temp->child[1]->attr.id << ",ebx\n";
				offset--;
			}
			if (temp->child[1]->varType == Char)
			{
				out << "\t\tMOV bx,WORD ptr[ebp+" << 4 * offset << "]\n";
				out << "\t\tMOV _" << temp->child[1]->attr.id << ",bl\n";
				offset--;
			}
			temp = temp->sibling;
		}
		recursiveGenCode(out, root->child[3]);
		if (root->child[2])
			out << "\t\tpop ebx\n\t\tpop ebp\n";
		out << "\t\tret\n";
		if (root->child[3]->nextLabel != "")
			out << root->child[3]->nextLabel << ":" << endl;
		TreeNode* temp3 = root->sibling;
		while (temp3)
		{
			out << "\t" << temp3->beginLabel << ":" << endl;
			TreeNode* temp2 = temp3->child[2];
			int offset = 1;
			if (temp2)out << "\t\tpush ebp\n\t\tMOV ebp,esp\n\t\tpush ebx\n";
			while (temp2) { offset++; temp2 = temp2->sibling; }
			temp2 = temp3->child[2];
			while (temp2)
			{
				if (temp2->child[1]->varType == Int)
				{
					out << "\t\tMOV ebx, DWORD ptr[ebp+" << 4 * offset << "]\n";
					out << "\t\tMOV _" << temp2->child[1]->attr.id << ",ebx\n";
					offset--;
				}
				if (temp2->child[1]->varType == Char)
				{
					out << "\t\tMOV bx,WORD ptr[ebp+" << 4 * offset << "]\n";
					out << "\t\tMOV _" << temp2->child[1]->attr.id << ",bl\n";
					offset--;
				}
				temp2 = temp2->sibling;
			}
			recursiveGenCode(out, temp3->child[3]);
			if (temp3->child[2])
				out << "\t\tpop ebx\n\t\tpop ebp\n";
			end_label = temp3->beginLabel;
			temp3 = temp3->sibling;
			if (end_label != "_start")
				out << "\t\tret\n";
		}
		out << "\t\tinvoke crt_printf, SADD(\"print any key to continue...\")" << endl;
		out << "\t\tinvoke crt__getch" << endl;
		out << "\t\tinvoke crt__exit, 0" << endl;
		out << "\tend " << end_label << endl;
	}
}
void genHeader(ostream &out)
{
	out << "\t.486" << endl;
	out << "\t.model flat, stdcall" << endl;
	out << "\toption casemap :none" << endl;
	out << endl;
	out << "\tinclude \\masm32\\macros\\macros.asm" << endl;
	out << "\tinclude \\masm32\\include\\msvcrt.inc" << endl;
	out << "\tincludelib \\masm32\\lib\\msvcrt.lib" << endl;
	out << "\tinclude \\masm32\\include\\masm32.inc" << endl;
	out << "\tincludelib \\masm32\\lib\\masm32.lib" << endl;
	out << "\tinclude \\masm32\\include\\user32.inc" << endl;
	out << "\tinclude \\masm32\\include\\kernel32.inc" << endl;
	out << "\tincludelib \\masm32\\lib\\user32.lib" << endl;
	out << "\tincludelib \\masm32\\lib\\kernel32.lib" << endl;
}
void genDecl(ostream &out, TreeNode *node)
{
	for(;node&&node->nodeType==Decl;node=node->sibling)
	{
		for(TreeNode *temp=node->child[1];temp;temp=temp->sibling)
		{
			if (temp->type.exprType == Array)
			{
				if (temp->child[0]->varType == Int)
					out << "\t\t_" << temp->child[0]->attr.id << " DWORD "<<temp->child[1]->attr.value<<" dup(0)"<<endl;
				else if (temp->child[0]->varType == Char)
					out << "\t\t_" << temp->child[0]->attr.id << " BYTE " << temp->child[1]->attr.value << " dup(0)" << endl;
			}
			else if (temp->varType == Int)
				out << "\t\t_" << temp->attr.id << " DWORD 0" << endl;
			else if(temp->varType==Char)
				out<<"\t\t_"<<temp->attr.id<<" BYTE 0"<<endl;
		}
	}
}
void recursiveGenCode(ostream &out, TreeNode *node)
{
	if (node->nodeType == Stmt)
		stmtGenCode(out, node);
	if(node->nodeType==Expr&&node->type.exprType==Op)
	{
		if(node->child[0]->nodeType==Expr&&node->child[0]->type.exprType==Op)
			recursiveGenCode(out,node->child[0]);
		if(node->attr.op==AND)
			if(node->child[0]->trueLabel!="")
				out<<"\t"<<node->child[0]->trueLabel<<":"<<endl;
		if(node->attr.op==OR)
			if(node->child[0]->falseLabel!="")
				out<<"\t"<<node->child[0]->falseLabel<<":"<<endl;
		if(node->attr.op!=OPPSITE)
 			if(node->child[1]&&node->child[1]->nodeType==Expr&&node->child[1]->type.exprType==Op)
				recursiveGenCode(out,node->child[1]);
		exprGenCode(out,node);
	}
	else if (node->nodeType == Expr && node->type.exprType == Funcs)
	{
		exprGenCode(out, node);
	}
}
void stmtGenCode(ostream &out, TreeNode *node)
{
	switch(node->type.stmtType)
	{
		case Block:
		{
			for(int i=0;node->child[i];i++)
			{
				recursiveGenCode(out,node->child[i]);
				for(TreeNode *temp=node->child[i]->sibling ;temp;temp=temp->sibling)
					recursiveGenCode(out,temp);
			}
			break;
		}
		case If:
		{
			recursiveGenCode(out,node->child[0]);
			if(node->child[0]->trueLabel!="")
				out<<"\t"<<node->child[0]->trueLabel<<":"<<endl;
			recursiveGenCode(out,node->child[1]);
			out<<"\t\tjmp "<<node->nextLabel<<endl;
			if(node->child[2])
			{
				if(node->child[0]->falseLabel!="")
					out<<"\t"<<node->child[0]->falseLabel<<":"<<endl;
				recursiveGenCode(out,node->child[2]);
				out<<"\t\tjmp "<<node->nextLabel<<endl;
			}
			if(node->nextLabel!="")
				out<<"\t"<<node->nextLabel<<":"<<endl;
			break;
		}
		case While:
		{
			if(node->beginLabel!="")
				out<<"\t"<<node->beginLabel<<":"<<endl;
			recursiveGenCode(out,node->child[0]);
			if(node->child[0]->trueLabel!="")
				out<<"\t"<<node->child[0]->trueLabel<<":"<<endl;
			recursiveGenCode(out,node->child[1]);
			out<<"\t\tjmp "<<node->beginLabel<<endl;
			if(node->nextLabel!="")
				out<<"\t"<<node->nextLabel<<":"<<endl;
			break;
		}
		case For:
		{
			if(node->child[0])
				recursiveGenCode(out,node->child[0]);
			if(node->beginLabel!="")
				out<<"\t"<<node->beginLabel<<":"<<endl;
			recursiveGenCode(out,node->child[1]);
			if(node->child[1]->trueLabel!="")
				out<<"\t"<<node->child[1]->trueLabel<<":"<<endl;
			recursiveGenCode(out,node->child[3]);
			if(node->child[2])
				recursiveGenCode(out,node->child[2]);
			out<<"\t\tjmp "<<node->beginLabel<<endl;
			if(node->nextLabel!="")
				out<<"\t"<<node->nextLabel<<":"<<endl;
			break;
		}
		case Input:
		{
			if(node->child[0]->type.exprType==Id)
			{
				if (node->child[0]->varType == Int)
				{
					out << "\t\tinvoke crt_scanf, SADD(\"%d\",0), addr _" << node->child[0]->attr.id << endl;
				}
				if (node->child[0]->varType == Char)
				{
					out << "\t\tinvoke StdIn,addr _" << node->child[0]->attr.id <<",8"<< endl;
				}
			}
			else if (node->child[0]->type.exprType == Array)
			{
				if (node->child[0]->child[0]->varType == Int)
				{
					if (node->child[0]->child[1]->type.exprType == Const)
					{
						out << "\t\tMOV ebx," << node->child[0]->child[1]->attr.value << endl;
						out << "\t\tinvoke crt_scanf, SADD(\"%d\",0), addr _" << node->child[0]->child[0]->attr.id << "[4*ebx]\n";
					}
					else if (node->child[0]->child[1]->type.exprType == Id)
					{
						out << "\t\tMOV ebx," << node->child[0]->child[1]->attr.id << endl;
						out << "\t\tinvoke crt_scanf, SADD(\"%d\",0), addr _" << node->child[0]->child[0]->attr.id << "[4*ebx]\n";
					}
				}
				else if (node->child[0]->child[0]->varType == Char)
				{
					if (node->child[0]->child[1]->type.exprType == Const)
					{
						out << "\t\tMOV ebx," << node->child[0]->child[1]->attr.value << endl;
						out << "\t\tinvoke crt_scanf, SADD(\"%c\",0), addr _" << node->child[0]->child[0]->attr.id << "[ebx]\n";
					}
					else if (node->child[0]->child[1]->type.exprType == Id)
					{
						out << "\t\tMOV ebx," << node->child[0]->child[1]->attr.id << endl;
						out << "\t\tinvoke crt_scanf, SADD(\"%c\",0), addr _" << node->child[0]->child[0]->attr.id << "[ebx]\n";
					}
				}

			}
			break;
		}
		case Output:
		{
			if (node->child[0]->type.exprType == Id)
			{
				if (node->child[0]->varType == Int)
					out << "\t\tinvoke crt_printf, SADD(\"%d\", 13, 10), _" << node->child[0]->attr.id << endl;
				if (node->child[0]->varType == Char)
				{
					out << "\t\tMOV eax,0\n";
					out << "\t\tMOV al,_" << node->child[0]->attr.id << endl;
					out << "\t\tinvoke crt_printf, SADD(\"%c\", 13, 10), eax" << endl;
				}
			}
			else if (node->child[0]->type.exprType == Const)
			{
				if (node->child[0]->varType == Int)
					out << "\t\tinvoke crt_printf, SADD(\"%d\", 13, 10), " << node->child[0]->attr.value << endl;
				else if (node->child[0]->varType == Char)
				{
					out << "\t\tMOV eax,0\n";
					out << "\t\tMOV al," << node->child[0]->attr.value << endl;
					out << "\t\tinvoke crt_printf, SADD(\"%c\", 13, 10), eax" << endl;
				}

				else if (node->child[0]->varType == Void)
				{
					out << "\t\tinvoke crt_printf, SADD( 13, 10)" << endl;
				}
			}
			else if (node->child[0]->type.exprType == Array)
			{
				if (node->child[0]->child[0]->varType == Int)
				{
					if (node->child[0]->child[1]->type.exprType == Const)
						out << "\t\tMOV ebx," << node->child[0]->child[1]->attr.value << endl;
					else if (node->child[0]->child[1]->type.exprType == Id)
						out << "\t\tMOV ebx,_" << node->child[0]->child[1]->attr.id << endl;
					out << "\t\tMOV eax,_" << node->child[0]->attr.id << "[4*ebx]\n";
					out << "\t\tinvoke crt_printf, SADD(\"%d\", 13, 10),eax\n";
				}
				else if (node->child[0]->child[0]->varType == Char)
				{
					if (node->child[0]->child[1]->type.exprType == Const)
						out << "\t\tMOV ebx," << node->child[0]->child[1]->attr.value << endl;
					else if (node->child[0]->child[1]->type.exprType == Id)
						out << "\t\tMOV ebx,_" << node->child[0]->child[1]->attr.id << endl;
					out << "\t\tMOV eax,0\n";
					out << "\t\tMOV al,_" << node->child[0]->attr.id << "[ebx]\n";
					out << "\t\tinvoke crt_printf, SADD(\"%c\", 13, 10), eax" << endl;
				}
			}
			else if (node->child[0]->nodeType == Expr&&node->child[0]->type.exprType==Op)
			{
				recursiveGenCode(out, node->child[0]);
				if(node->child[0]->varType==Int)
					out << "\t\tinvoke crt_printf, SADD(\"%d\", 13, 10), t"<<node->child[0]->tempNo << endl;
				else if (node->child[0]->varType == Char)
					out << "\t\tinvoke crt_printf, SADD(\"%c\", 13, 10), t" << node->child[0]->tempNo << endl;
			}
			break;
		}
		
		case Return:
		{
			if (node->child[0]->type.exprType == Id)
			{
				if (node->child[0]->varType == Int)
				{
					out << "\t\tMOV eax,_" << node->child[0]->attr.id << endl;
				}
				else if (node->child[0]->varType == Char)
				{
					out << "\t\tMOV eax,0\n";
					out << "\t\tMOV al,_" << node->child[0]->attr.id << endl;
				}
			}
			else if (node->child[0]->type.exprType == Const)
			{
				out << "\t\tMOV eax," << node->child[0]->attr.value << endl;
			}
			break;
		}
		default:
			break;
	}	
}
void exprGenCode(ostream &out, TreeNode *node)
{
	TreeNode *c1=node->child[0];
	TreeNode *c2=node->child[1];
	if (node->type.exprType == Funcs)
	{
	
			//no args
			if (!node->child[1])
			{
				out << "\t\tpush ebx" << endl;
				out << "\t\tcall " << node->child[0]->attr.id << endl;
				out << "\t\tpop ebx" << endl;
			}
			//args !=0
			else if (node->child[1])
			{
				int poptime = 0;
				string po;
				recursiveGenCode(out, node->child[1]);

				if (node->child[1]->varType == Int)
				{
					out << "\t\tMOV ebx,_" << node->child[1]->attr.id << endl;
					out << "\t\tpush ebx\n";
					po = "ebx";

				}
				if (node->child[1]->varType == Char)
				{
					out << "\t\tMOV bl,_" << node->child[1]->attr.id << endl;
					out << "\t\tpush bx\n";
					po = "bx";
				}
				poptime++;
				TreeNode* temp = node->child[1]->sibling;
				while (temp)
				{
					recursiveGenCode(out, temp);
					if (temp->varType == Int)
					{
						out << "\t\tMOV ebx,_" << temp->attr.id << endl;
						out << "\t\tpush ebx\n";
					}
					if (temp->varType == Char)
					{
						out << "\t\tMOV bl,_" << temp->attr.id << endl;
						out << "\t\tpush bx\n";
					}
					poptime++;
					temp = temp->sibling;
				}
				out << "\t\tcall " << node->child[0]->attr.id << endl;
				while (poptime--)
					out << "\t\tpop " << po << endl;
		}
	}
	switch(node->attr.op)
	{//Array apart from ID
		case ADD:
		{
			if(c1->varType==Char)
			{
				
				out<<"\t\tMOV eax, 0"<<endl;
				out<<"\t\tMOV al, ";
			}
			else if(c1->varType==Int)
				out<<"\t\tMOV eax, ";
			if(c1->type.exprType==Id)
				out<<"_"<<c1->attr.id;
			else if(c1->type.exprType==Const)
				out<<c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]\n";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]\n";
			}
			else
				out<<"t"<<c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tADD eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType==Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			out<<"\t\tMOV t"<<node->tempNo<<", eax"<<endl;
			break;
		}
		case SUB:
		{
			if(c1->varType==Char)
			{
				out<<"\t\tMOV eax, 0"<<endl;
				out<<"\t\tMOV al, ";
			}
			else if(c1->varType==Int)
				out<<"\t\tMOV eax, ";
			if(c1->type.exprType==Id)
				out<<"_"<<c1->attr.id;
			else if(c1->type.exprType==Const)
				out<<c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]\n";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]\n";
			}
			else
				out<<"t"<<c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tSUB eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			out<<"\t\tMOV t"<<node->tempNo<<", eax"<<endl;
			break;
		}
		case MUL:
		{
			if(c1->varType==Char)
			{
				out<<"\t\tMOV eax, 0"<<endl;
				out<<"\t\tMOV al, ";
			}
			else if(c1->varType==Int)
				out<<"\t\tMOV eax, ";
			if(c1->type.exprType==Id)
				out<<"_"<<c1->attr.id;
			else if(c1->type.exprType==Const)
				out<<c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]\n";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]\n";
			}
			else
				out<<"t"<<c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tIMUL eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			out<<"\t\tMOV t"<<node->tempNo<<", eax"<<endl;
			break;
		}
		case DIV:
		{
			if(c1->varType==Char)
			{
				out<<"\t\tMOV eax, 0"<<endl;
				out<<"\t\tMOV al, ";
			}
			else if(c1->varType==Int)
				out<<"\t\tMOV eax, ";
			if(c1->type.exprType==Id)
				out<<"_"<<c1->attr.id;
			else if(c1->type.exprType==Const)
				out<<c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]\n";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]\n";
			}
			else
				out<<"t"<<c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tMOV edx,0" << endl;
			out << "\t\tCDQ" << endl;
			out << "\t\tMOV ecx, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			out << "\t\tIDIV ecx"<<endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case MOD:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, ";
			if (c1->type.exprType == Id)
				out << "_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]\n";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]\n";
			}
			else
				out << "t" << c1->tempNo;
			out << endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tMOV edx,0" << endl;
			out << "\t\tCDQ" << endl;
			out << "\t\tMOV ecx, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out << "t" << c2->tempNo;
			out << endl;
			out << "\t\tIDIV ecx" << endl;
			out << "\t\t MOV eax, edx" << endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case ASSIGN:
		{
			if (c2->type.exprType == Funcs)
			{
				recursiveGenCode(out, c2);
				if (c1->type.exprType == Array)
				{
					if (c1->child[1]->type.exprType == Const)
						out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
					else if (c1->child[1]->type.exprType = Id)
						out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
					else
						out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
					if (c1->child[0]->varType == Int)
						out << "\t\tMOV _" << c1->attr.id << "[4*ebx],eax\n";
					else if (c1->child[0]->varType == Char)
						out << "\t\tMOV _" << c1->attr.id << "[ebx],al\n";
					break;
				}
				if (c1->type.exprType == Id)
					out << "\t\tMOV _" << c1->attr.id;
				if (c1->varType == Char)
					out << ", al" << endl;
				else if (c1->varType == Int)
					out << ", eax" << endl;
				break;
			}
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				if(c1->varType==Int)
					out << "\t\tMOV eax,_" << c2->attr.id << "[4*ebx]\n";
				else if (c1->varType == Char)
				{
					out << "\t\tMOV eax, 0" << endl;
					out << "\t\tMOV al,_" << c2->attr.id << "[ebx]\n";
				}
				if (c1->type.exprType == Id)
					out << "\t\tMOV _" << c1->attr.id<<",eax\n";
				else if (c1->type.exprType == Array)
				{
					if (c1->child[1]->type.exprType == Const)
						out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
					else if (c1->child[1]->type.exprType = Id)
						out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
					else
						out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
					if(c1->child[0]->varType==Int)
						out << "\t\tMOV _" << c1->attr.id << "[4*ebx],eax\n";
					else if(c1->child[0]->varType == Char)
						out << "\t\tMOV _" << c1->attr.id << "[ebx],al\n";
				}
				break;
			}
			if (c2->type.exprType == Op && c2->attr.op == ASSIGN)
			{
				if (c2->varType == Char)
				{
					out << "\t\tMOV eax, 0" << endl;
					out << "\t\tMOV al, _" << c2->child[0]->attr.id << endl;
					out << "\t\tMOV _" << c1->attr.id << ",al\n";
				}
				else if (c2->varType == Int)
				{
					out << "\t\tMOV eax,_" << c2->child[0]->attr.id << endl;
					out << "\t\tMOV _" << c1->attr.id << ",eax\n";
				}
				break;
			}
			if (c2->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c2->varType == Int)
				out << "\t\tMOV eax, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else 
				out << "t" << c2->tempNo;
			out << endl;
			if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV _" << c1->attr.id << "[4*ebx],eax\n";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV _" << c1->attr.id << "[ebx],al\n";
				break;
			}
			if (c1->type.exprType == Id)
				out << "\t\tMOV _" << c1->attr.id;
			//else if (c1->type.exprType == Const)
			//	out <<"\t\tMOV " <<c1->attr.value;
			else
				out<<"\t\tMOV t"<<c1->tempNo;
			if(c1->varType==Char)
				out<<", al"<<endl;
			else
				out<<", eax"<<endl;
			break;
		}
		case LT:
		{
			if (c1->type.exprType == Id)
				out << "\t\tMOV eax,_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << "\t\tMOV eax," << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "\t\tMOV eax,t" << c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tCMP eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			
			out<<"\t\tjl "<<node->trueLabel<<endl;
			out<<"\t\tjmp "<<node->falseLabel<<endl;
			break;
		}
		case GT:
		{
			if(c1->type.exprType==Id)
				out<< "\t\tMOV eax, _" <<c1->attr.id;
			else if(c1->type.exprType==Const)
				out<< "\t\tMOV eax, " <<c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "\t\tMOV eax,t" << c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tCMP eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			
			out<<"\t\tjg "<<node->trueLabel<<endl;
			out<<"\t\tjmp "<<node->falseLabel<<endl;
			break;
		}
		case LE:
		{
			if (c1->type.exprType == Id)
				out << "\t\tMOV eax, _" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << "\t\tMOV eax, " << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "\t\tMOV eax,t" << c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tCMP eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			
			out<<"\t\tjle "<<node->trueLabel<<endl;
			out<<"\t\tjmp "<<node->falseLabel<<endl;
			break;
		}
		case GE:
		{
			if (c1->type.exprType == Id)
				out << "\t\tMOV eax, _" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << "\t\tMOV eax, " << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "\t\tMOV eax,t" << c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tCMP eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			
			out<<"\t\tjge "<<node->trueLabel<<endl;
			out<<"\t\tjmp "<<node->falseLabel<<endl;
			break;
		}
		case EQ:
		{
			if (c1->type.exprType == Id)
				out << "\t\tMOV eax, _" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << "\t\tMOV eax, " << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "\t\tMOV eax,t" << c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tCMP eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			
			out<<"\t\tje "<<node->trueLabel<<endl;
			out<<"\t\tjmp "<<node->falseLabel<<endl;
			break;
		}
		case NE:
		{
			if (c1->type.exprType == Id)
				out << "\t\tMOV eax, _" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << "\t\tMOV eax, " << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "\t\tMOV eax,t" << c1->tempNo;
			out<<endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out<<"\t\tCMP eax, ";
			if(c2->type.exprType==Id)
				out<<"_"<<c2->attr.id;
			else if(c2->type.exprType==Const)
				out<<c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]\n";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]\n";
			else
				out<<"t"<<c2->tempNo;
			out<<endl;
			
			out<<"\t\tjne "<<node->trueLabel<<endl;
			out<<"\t\tjmp "<<node->falseLabel<<endl;
			break;
		}
		case INC:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, _"<<  c1->attr.id;
			}
			else if(c1->varType==Int)
				out << "\t\tMOV eax, _"<< c1->attr.id;
			else if (c1->type.exprType == Array)
			{
			if (c1->child[1]->type.exprType == Const)
				out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
			else if (c1->child[1]->type.exprType = Id)
				out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
			else
				out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
			if (c1->child[0]->varType == Int)
				out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
			else if (c1->child[0]->varType == Char)
				out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			out << endl;
			out << "\t\tINC eax";
			out << endl;
			out << "\t\tMOV _" <<c1->attr.id << ", eax" << endl;
			break;
		}
		case DEC:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, _" << c1->attr.id;
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, _" << c1->attr.id;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			out << endl;
			out << "\t\tDEC eax";
			out << endl;
			out << "\t\tMOV _" << c1->attr.id << ", eax" << endl;
			break;
		}
		case SHL:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, ";
			if (c1->type.exprType == Id)
				out << "_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "t" << c1->tempNo;
			out << endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tMOV ecx, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]";
			else
				out << "t" << c2->tempNo;
			out << endl;
			out <<"\t\tSHL eax,cl"<<endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case SHR:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, ";
			if (c1->type.exprType == Id)
				out << "_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "t" << c1->tempNo;
			out << endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tMOV ecx, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]";
			else
				out << "t" << c2->tempNo;
			out << endl;
			out << "\t\tSHR eax,cl" << endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case BAND:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, ";
			if (c1->type.exprType == Id)
				out << "_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "t" << c1->tempNo;
			out << endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tAND eax, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]";
			else
				out << "t" << c2->tempNo;
			out << endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case BOR:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, ";
			if (c1->type.exprType == Id)
				out << "_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "t" << c1->tempNo;
			out << endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tOR eax, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]";
			else
				out << "t" << c2->tempNo;
			out << endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case XOR:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, ";
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, ";
			if (c1->type.exprType == Id)
				out << "_" << c1->attr.id;
			else if (c1->type.exprType == Const)
				out << c1->attr.value;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			else
				out << "t" << c1->tempNo;
			out << endl;
			if (c2->type.exprType == Array)
			{
				if (c2->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c2->child[1]->attr.value << endl;
				else if (c2->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c2->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c2->child[1]->tempNo << endl;
			}
			out << "\t\tXOR eax, ";
			if (c2->type.exprType == Id)
				out << "_" << c2->attr.id;
			else if (c2->type.exprType == Const)
				out << c2->attr.value;
			else if (c2->type.exprType == Array && c2->child[0]->varType == Int)
				out << "_" << c2->attr.id << "[4*ebx]";
			else if (c2->type.exprType == Array && c2->child[0]->varType == Char)
				out << "_" << c2->attr.id << "[ebx]";
			else
				out << "t" << c2->tempNo;
			out << endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;
		}
		case NOT:
		{
			if (c1->varType == Char)
			{
				out << "\t\tMOV eax, 0" << endl;
				out << "\t\tMOV al, _" << c1->attr.id;
			}
			else if (c1->varType == Int)
				out << "\t\tMOV eax, _" << c1->attr.id;
			else if (c1->type.exprType == Array)
			{
				if (c1->child[1]->type.exprType == Const)
					out << "\t\tMOV ebx," << c1->child[1]->attr.value << endl;
				else if (c1->child[1]->type.exprType = Id)
					out << "\t\tMOV ebx,_" << c1->child[1]->attr.id << endl;
				else
					out << "\t\tMOV ebx,t" << c1->child[1]->tempNo << endl;
				if (c1->child[0]->varType == Int)
					out << "\t\tMOV eax,_" << c1->attr.id << "[4*ebx]";
				else if (c1->child[0]->varType == Char)
					out << "\t\tMOV al,_" << c1->attr.id << "[ebx]";
			}
			out << endl;
			out << "\t\tNOT eax";
			out << endl;
			out << "\t\tMOV t" << node->tempNo << ", eax" << endl;
			break;



		}
		default:
			break;
	}
}

void makeAsm()
{
	getLabel();      //Get label for while if and or not
	ofstream ansout("ans.asm");
	genCode(ansout);
	ansout.close();
}
























