#pragma once

#include<iostream>
#include<string>
#include<cstring>
#include<fstream>
#include"myparser.h"
#include"mylexer.h"
#pragma warning(disable:4996)
using namespace std;

#define MAXCHILDREN 6
enum NodeType {Stmt,Expr,Decl};
enum StmtType {Block,If,While,For,Return,Input,Output};
enum ExprType {Op,Const,Id,Type,Array,Funcs};        /*New Funcs Array*/
enum DeclType { Var, Func, Main };                   /*New Func decl*/
enum VarType  {Void,Int,Bool,Char,Float,Double};     /*Only support int char*/

static int tempNum;
static int labelNum;

union _Type
{
	StmtType stmtType;
	ExprType exprType;
	DeclType declType;
};
union Attribute
{
	int op;
	double value;
	char *id;
};

struct TreeNode
{
	TreeNode *child[MAXCHILDREN];
	TreeNode *sibling;
	NodeType nodeType;
	_Type type;
	Attribute attr;
	VarType varType;
	int tempNo;
	string trueLabel;
	string falseLabel;
	string beginLabel;
	string nextLabel;
	int lineNo;
};

TreeNode* newStmtNode(StmtType type);
TreeNode* newExprNode(ExprType type);
TreeNode* newDeclNode(DeclType type);

void typeCheck(TreeNode *root);
static void traverse(TreeNode *node, void(*preProc) (TreeNode *),void (*postProc) (TreeNode *));
static void checkNode(TreeNode *node);
static void assignType(TreeNode *node);

void Display(TreeNode* root);
void showNode(TreeNode* node);

void getTemp(TreeNode *node);
void newLabel(string &label);
void getLabel();
void recursiveGetLabel(TreeNode *node);
void stmtGetLabel(TreeNode *node);
void exprGetLabel(TreeNode *node);

void genCode(ostream &out);
void genHeader(ostream &out);
void genDecl(ostream &out, TreeNode *node);
void recursiveGenCode(ostream &out, TreeNode *node);
void stmtGenCode(ostream &out, TreeNode *node);
void exprGenCode(ostream &out, TreeNode *node);

void makeAsm();

	
	