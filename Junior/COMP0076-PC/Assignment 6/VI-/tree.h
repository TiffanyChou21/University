#pragma once
#include<iostream>
#include <fstream>
#include<string>
#include<string.h>
#include<map>
#include<iomanip>
#pragma warning(disable:4996)
#define MAXCHILDREN 6
using namespace std;
enum NodeType{Stmt,Expr,Decl};
enum Declaration{Const_Decl,ID_Decl,Type_Decl,Var_Decl};
enum Type{Char,Int,Bool};
enum Statement{If_Stmt,For_Stmt,While_Stmt,Compound_Stmt,Input_Stmt,Output_Stmt};
enum Expression{Assign_Exp,Comp_Exp,OP_Exp,Log_Exp};
struct IDtable
{
	string name;
	string type;
};
struct treenode
{
	int temp_var;
	NodeType nodetype;    //stmt,expr,decl
	int type_type;      //上述的具体划分
	int wordtype;       //变量类型int char bool
	int IDaddr;        //ID的位置  以及判断charval和intval
	int val;             //intval
	char constchar;       //charval
	int linenum;         //行号
	int nodenum;        //节点序
	string op;           //用于输出op
	string property;      //节点属性类型，报错等
	treenode* child[MAXCHILDREN];
	treenode *sibling;

};
class mytree
{
	int nodenum;
public:
	mytree();
	treenode* createnode(NodeType node_type, int type_type);
	void TypeCheck(treenode *node);
	void showNode(treenode * node);
	void display(treenode* node);
	int addSymbol(string str);
	void printTable();
	void Error(treenode* node);
	void printError(treenode* node);
	void showError(treenode* node);
	~mytree();
};

