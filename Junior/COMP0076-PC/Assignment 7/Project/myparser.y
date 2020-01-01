%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Zcf 1712991

Date: 2019年12月3日
****************************************************************************/
#include "mylexer.h"
#include <iostream>
#include <fstream>
#include <cctype>
#include "tree.h"
using namespace std;

TreeNode *root;
int rownum = 0;
int lineno = 0;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// parser name
%name myparser

// class definition
{
	// place any extra class members here
}

// constructor
{
	// place any extra initialisation code here
}

// destructor
{
	// place any extra cleanup code here
}

// attribute type
%include {
#ifndef YYSTYPE
#define YYSTYPE TreeNode*
#endif
}

// place any declarations here
%token INT,CHAR,VOID,BOOL,FLOAT,DOUBLE
%token IF,ELSE,WHILE,FOR,RETURN
%token ASSIGN,ADD,SUB,MUL,DIV,MOD,INC,DEC,SHL,SHR,BAND,BOR,XOR,NOT
%token EQ,GT,LT,GE,LE,NE,AND,OR,OPPSITE
%token LB,RB,LP,RP,LSP,RSP,SEMI,COMMA
%token ID,NUMBER,MAIN,CIN,COUT,CHARVAL,ENDL

%left COMMA
%right ASSIGN
%left EQ NE
%left LT LE GT GE
%left ADD SUB
%left MUL DIV MOD
%left INC DEC
%left LP RP LB RB LSP RSP SHL SHR
%right ELSE
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)

start	:codes{$$=$1;root=$$;
			typeCheck(root);
			Display(root);
		}
		;
codes    :  funs{$$=$1;}
		 ;
funs     :fun_decl funs{$1->sibling=$2;$$=$1;}
		 |fun_decl {$$=$1;}
		 ;
//The first func is the root,and others funcs are its siblings,and the main func is special
fun_decl : vartype ID LP args RP comp_stmt
			{$$=newDeclNode(Func);$$->child[0]=$1;$$->child[1]=$2;$$->child[2]=$4;$$->child[3]=$6;}
		|vartype ID LP RP comp_stmt
			{$$=newDeclNode(Func);$$->child[0]=$1;$$->child[1]=$2;$$->child[3]=$5;}
		| MAIN LP RP comp_stmt{$$=newDeclNode(Main);$$->child[3]=$4;}
		| VOID MAIN LP RP comp_stmt{$$=newDeclNode(Main);$$->child[3]=$5;}
		| INT MAIN LP RP comp_stmt{$$=newDeclNode(Main);$$->child[3]=$5;}
		 ;
args    :vartype ID COMMA args{$$=newDeclNode(Var);$$->child[0]=$1;$$->child[1]=$2;$$->sibling=$4;}
		|vartype ID {$$=newDeclNode(Var);$$->child[0]=$1;$$->child[1]=$2;}
		;
comp_stmt	:	LB stmts RB	{$$ = newStmtNode(Block);$$->child[0] = $2;}
		    |	LB RB	{$$ = newStmtNode(Block);}
		    ;
stmts	:	stmt stmts			{$1->sibling=$2;$$ = $1;}
		|	stmt	{$$ = $1;}
		;
stmt	:	comp_stmt		{ $$ = $1;}
		|	expr SEMI	{ $$ = $1;}
		|	varstmt		{ $$ = $1;}
		|	ifstmt		{ $$ = $1;}
		|	whilestmt	{ $$ = $1;}
		|	forstmt		{ $$ = $1;}
		|	returnstmt	{ $$ = $1;}
		|	inputstmt	{ $$ = $1;}
		|   outputstmt	{ $$ = $1;}
		| SEMI   {}
		;
varstmt	:	vartype idlist SEMI	{ $$=newDeclNode(Var);$$->child[0]=$1;$$->child[1]=$2;}
			;
vartype	:	INT	{$$=newExprNode(Type);$$->varType=Int;}
		|	CHAR{$$=newExprNode(Type);$$->varType=Char;}
		|	VOID{$$=newExprNode(Type);$$->varType=Void;}
		|	BOOL{$$=newExprNode(Type);$$->varType=Bool;}
		|	FLOAT{$$=newExprNode(Type);$$->varType=Float;}
		|	DOUBLE{$$=newExprNode(Type);$$->varType=Double;}
		;
idlist	:	expr COMMA idlist				{$$=$1;$$->sibling=$3;}
		|	expr	{ $$=$1;}
		;
expr	:	assign_expr	{$$=$1;}
		;
assign_expr	:	ID ASSIGN expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ASSIGN;}
			| array ASSIGN expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ASSIGN;}
			|or_expr   {$$=$1;}
			;
or_expr     :  or_expr OR and_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=OR;}
			|  and_expr {$$=$1;}
			;
and_expr    : and_expr AND bor_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=AND;}
			| bor_expr{$$=$1;}
			;
bor_expr    :bor_expr BOR xor_expr {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=BOR;}
			| xor_expr{$$=$1;}
			;
xor_expr    : xor_expr XOR band_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=XOR;}
			| band_expr{$$=$1;}
			;
band_expr    : band_expr BAND equal_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=BAND;}
			| equal_expr{$$=$1;}
			;
equal_expr	:	equal_expr EQ sh_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=EQ;}
			|	equal_expr NE sh_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=NE;}
			|	equal_expr GE sh_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=GE;}
			|	equal_expr LE sh_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=LE;}
			|	equal_expr GT sh_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=GT;}
			|	equal_expr LT sh_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=LT;}
			|	sh_expr	{$$=$1;}
			;
sh_expr     :  sh_expr SHL simp_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=SHL;}
			| sh_expr SHR simp_expr{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=SHR;}
			|  simp_expr {$$=$1;}
			;
simp_expr	:	simp_expr ADD simp_expr2{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ADD;}
			|	simp_expr SUB simp_expr2{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=SUB;}
			|	simp_expr2	{$$=$1;}
			;
simp_expr2  :	simp_expr2 MUL term{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=MUL;}
			|	simp_expr2 DIV term{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=DIV;}
			|	simp_expr2 MOD term{$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=MOD;}
			|   simp_expr2 INC{$$=newExprNode(Op);$$->child[0]=$1;$$->attr.op=INC;}
			|	simp_expr2 DEC{$$=newExprNode(Op);$$->child[0]=$1;$$->attr.op=DEC;}
			|   term {$$=$1;}
			;
term	:	LP expr RP	{$$=$2;}
		|	ID			{$$=$1;}
		|	NUMBER		{$$=$1;}
		|   NOT term    {$$=newExprNode(Op);$$->child[0]=$2;$$->attr.op=NOT;}
		|   OPPSITE term {$$=newExprNode(Op);$$->child[0]=$2;$$->attr.op=OPPSITE;}
		| CHARVAL{$$=$1;}
		| ENDL{$$=newExprNode(Const);$$->varType=Void;$$->attr.value=0;}
		| array{$$=$1;}
		|func_call{$$=$1;}
		;
// Array feature which not support pointer 
array   :ID LSP expr RSP{$$=newExprNode(Array);$$->child[0]=$1;$$->child[1]=$3;$$->attr.id=$1->attr.id;}//数组
		;
//Function call in the block
func_call: ID LP idlist RP{$$=newExprNode(Funcs);$$->child[0]=$1;$$->child[1]=$3;}
		|ID LP RP {$$=newExprNode(Funcs);$$->child[0]=$1;}
		;
ifstmt	:	IF LP expr RP stmt{$$=newStmtNode(If);$$->child[0]=$3;$$->child[1]=$5;}
		|	IF LP expr RP stmt ELSE stmt{$$=newStmtNode(If);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;}
		;
forstmt	:	FOR LP expr SEMI expr SEMI expr RP stmt{$$=newStmtNode(For);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;$$->child[3]=$9;}
		| FOR LP SEMI expr SEMI RP stmt{$$=newStmtNode(For);$$->child[1]=$4;$$->child[3]=$7;}
		| FOR LP expr SEMI SEMI RP stmt{$$=newStmtNode(For);$$->child[0]=$3;$$->child[3]=$7;}
		| FOR LP SEMI SEMI expr RP stmt{$$=newStmtNode(For);$$->child[2]=$5;$$->child[3]=$7;}
		| FOR LP expr SEMI expr SEMI RP stmt{$$=newStmtNode(For);$$->child[0]=$3;$$->child[1]=$5;$$->child[3]=$8;}
		| FOR LP expr SEMI  SEMI expr RP stmt{$$=newStmtNode(For);$$->child[0]=$3;$$->child[2]=$6;$$->child[3]=$8;}
		| FOR LP SEMI expr SEMI expr RP stmt{$$=newStmtNode(For);$$->child[1]=$4;$$->child[2]=$6;$$->child[3]=$8;}
		| FOR LP SEMI SEMI RP stmt{$$=newStmtNode(For);$$->child[3]=$6;}
		;
whilestmt	:	WHILE LP expr RP stmt{$$=newStmtNode(While);$$->child[0]=$3;$$->child[1]=$5;}
			;
inputstmt	:	CIN SHR expr SEMI{$$=newStmtNode(Input);$$->child[0]=$3;}
			;
outputstmt	:	COUT SHL expr SEMI{$$=newStmtNode(Output);$$->child[0]=$3;}
			;
returnstmt	:	RETURN expr SEMI{$$=newStmtNode(Return);$$->child[0]=$2;}
			;
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	int n = 1;
	mylexer lexer;
	myparser parser;
	lexer.yyin=new ifstream("a.txt");
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			n = parser.yyparse();
	makeAsm();
		}
	}
	return n;
}


