%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Zcf 1712991

Date: 2019Äê11ÔÂ23ÈÕ
****************************************************************************/
#include<iostream>
#include<fstream>
#include "mylexer.h"
#include "tree.h"
#include <string>
#include <fstream>

using namespace std;
extern mytree m1;
extern int tableuse;
extern int Line;
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
#define YYSTYPE treenode*
#endif
}

// place any declarations here
%token INT CHAR VOID BOOL DOUBLE MAIN ID
%token ADD SUB MUL DIV MOD INC DEC ASSIGN
%token LB RB LP RP LSB RSB SEMICOLON COMMA
%token EQ GT LT GE LE NE BAND BOR BNOT XOR AND OR NOT
%token IF ELSE WHILE DO FOR BREAK RETURN
%token CIN COUT SHL SHR
%token NUMBER ADD ADD CONSTCHAR


%right ASSIGN
%left EQ NE
%left GT LT GE LE
%left ADD SUB
%left MUL DIV MOD
%left INC DEC
%left LB RB LP RP LSB RSB SHL SHR
%right ELSE
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)
mainstmt : MAIN LP RP comp_stmt {$$=$4; 
                                        treenode *t=$$;
                                        m1.TypeCheck(t);
                                       m1.display(t);
									   m1.printTable();
									   m1.Error(t);
                                       }
           | MAIN LP VOID RP comp_stmt{$$=$5; 
                                          treenode *t=$$;                                       
                                       m1.TypeCheck(t);
                                       m1.display(t);
									    m1.printTable();
										m1.Error(t);
			                             }
           | VOID MAIN LP RP comp_stmt {$$=$5; 
                                         treenode *t=$$;
										 m1.TypeCheck(t);
                                        m1.display(t);
										 m1.printTable();
										 m1.Error(t);
			                             }
           | VOID MAIN LP VOID RP comp_stmt{$$=$6; 
                                          treenode *t=$$;                                       
                                       m1.TypeCheck(t);
                                       m1.display(t);
									    m1.printTable();
										m1.Error(t);
                                       }
           ;
comp_stmt : LB stmt_list RB  {$$=m1.createnode(Stmt,Compound_Stmt);$$->child[0]=$2;}
           | LB RB {$$=NULL;}
           | stmt  {$$=$1;}
           ;
stmt_list  : stmt_list stmt{treenode* t=$1;
                            if(t!=NULL)
                            
                            {
                                while(t->sibling!=NULL)
                                   t=t->sibling;
                                t->sibling=$2;
                                $$=$1;
                            }
                            else $$=$2;
                           }
           | stmt{$$=$1;}
           ;
stmt       : var_dec{$$=$1;}
           | exp_stmt{$$=$1;}
           | if_stmt{$$=$1;}
           | for_stmt{$$=$1;}
           | exp_stmt{$$=$1;}
           | while_stmt{$$=$1;}
           | io_stmt{$$=$1;}
           | SEMICOLON  {$$=$1;}
           ;
io_stmt    : CIN  SHR exp SEMICOLON{$$=m1.createnode(Stmt,Input_Stmt);$$->child[0]=$3;}
           | COUT SHL exp SEMICOLON{$$=m1.createnode(Stmt,Output_Stmt);$$->child[0]=$3;}
           ;
var_dec    :type idlist SEMICOLON{$$=m1.createnode(Decl,Var_Decl);$$->child[0]=$1;$$->child[1]=$2;
                                         }
           ;
type       :  INT {$$=m1.createnode(Decl,Type_Decl);$$->wordtype=Int;}
           |  CHAR  {$$=m1.createnode(Decl,Type_Decl);$$->wordtype=Char;}
           |  BOOL  {$$=m1.createnode(Decl,Type_Decl);$$->wordtype=Bool;}
           ;
idlist     : idlist COMMA id{ treenode* t=$1;
                            if(t!=NULL)
                            {
                                while(t->sibling!=NULL)
                                   t=t->sibling;
                                t->sibling=$3;
                                $$=$1;
                            }
                            else $$=$3;
                            }
                              
                                      
           | id     {$$=$1;}
           | idlist COMMA assign_exp{$$=$3;$$->sibling=$1; }
           | assign_exp    {$$=$1;}
           ;
id         : ID   {$$=m1.createnode(Decl,ID_Decl);$$->IDaddr=$1->IDaddr;}
           ;
if_stmt    : IF LP exp RP comp_stmt ELSE comp_stmt{$$=m1.createnode(Stmt,If_Stmt);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;$$->linenum=$$->child[0]->linenum;}
           | IF LP exp RP comp_stmt  {$$=m1.createnode(Stmt,If_Stmt);$$->child[0]=$3;$$->child[1]=$5;$$->linenum=$$->child[0]->linenum;}
           ;
for_stmt   : FOR LP exp SEMICOLON exp SEMICOLON exp  RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;$$->child[3]=$9;$$->linenum=$$->child[0]->linenum;}
           |FOR LP SEMICOLON exp SEMICOLON exp RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[1]=$4;$$->child[2]=$6;$$->child[3]=$8;$$->linenum=$$->child[1]->linenum;}  
           |FOR LP exp SEMICOLON SEMICOLON exp RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[0]=$3;$$->child[2]=$6;$$->child[3]=$8;$$->linenum=$$->child[0]->linenum;}  
           |FOR LP exp SEMICOLON exp SEMICOLON RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[0]=$3;$$->child[1]=$5;$$->child[3]=$8;$$->linenum=$$->child[0]->linenum;}  
           |FOR LP SEMICOLON SEMICOLON exp RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[2]=$5;$$->child[3]=$7;$$->linenum=$$->child[2]->linenum;} 
           |FOR LP SEMICOLON exp SEMICOLON RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[1]=$4;$$->child[3]=$7;$$->linenum=$$->child[1]->linenum;}
           |FOR LP exp SEMICOLON SEMICOLON RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[0]=$3;$$->child[3]=$7;$$->linenum=$$->child[0]->linenum;}
           |FOR LP SEMICOLON SEMICOLON RP comp_stmt{$$=m1.createnode(Stmt,For_Stmt);$$->child[3]=$6;$$->linenum=$$->child[3]->linenum;}
           ;
while_stmt : WHILE LP exp RP comp_stmt{$$=m1.createnode(Stmt,While_Stmt);$$->child[0]=$3;$$->child[1]=$5;$$->linenum=$$->child[0]->linenum;}
           | DO comp_stmt WHILE LP exp RP{$$=m1.createnode(Stmt,While_Stmt);$$->child[0]=$2;$$->child[1]=$5;$$->linenum=$$->child[0]->linenum;}
           ;
exp_stmt   : exp SEMICOLON{$$=$1;}
           | SEMICOLON  {$$=NULL;}
           ;
exp        : assign_exp{$$=$1;}
           ;
assign_exp : id ASSIGN exp{$$=m1.createnode(Expr,Assign_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="=";}
           | or_exp   {$$=$1;}
           ;
or_exp     : or_exp OR and_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="||";}
		   | and_exp{$$=$1;}
		   ;
and_exp    : and_exp AND bor_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="&&";}
           | bor_exp{$$=$1;}
		   ;
bor_exp    : bor_exp BOR xor_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="|";}
           | xor_exp{$$=$1;}
		   ;
xor_exp    : xor_exp XOR band_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="^";}
           | band_exp{$$=$1;}
		   ;
band_exp    : band_exp BAND comp_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="&";}
           | comp_exp{$$=$1;}
		   ;
comp_exp   : comp_exp EQ sh_exp {$$=m1.createnode(Expr,Comp_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="==";}
           | comp_exp NE sh_exp {$$=m1.createnode(Expr,Comp_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="!=";}
           | comp_exp LT sh_exp {$$=m1.createnode(Expr,Comp_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="<";}
           | comp_exp GT sh_exp {$$=m1.createnode(Expr,Comp_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op=">";}                                                                                                                       
           | comp_exp LE sh_exp {$$=m1.createnode(Expr,Comp_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="<=";}
           | comp_exp GE sh_exp {$$=m1.createnode(Expr,Comp_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op=">=";}
           | sh_exp {$$=$1;}
           ;
sh_exp    : sh_exp SHL as_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="<<";}
	       |sh_exp SHR as_exp{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op=">>";}
           | as_exp{$$=$1;}
		   ;
as_exp     : as_exp ADD term{$$=m1.createnode(Expr,OP_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="+";}
           | as_exp SUB term{$$=m1.createnode(Expr,OP_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="-";}
           | term  {$$=$1;}
           ;
term       : term MUL factor{$$=m1.createnode(Expr,OP_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="*";}
           | term DIV factor{$$=m1.createnode(Expr,OP_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="/";}
           | term MOD factor{$$=m1.createnode(Expr,OP_Exp);$$->child[0]=$1;$$->child[1]=$3;$$->op="%";}
           | factor   {$$=$1;}
           ;
factor     : LP exp RP{$$=$2;} 
           | id {$$=$1;}
           | NUMBER {$$=m1.createnode(Decl,Const_Decl);$$->IDaddr=$1->val;}
           | CONSTCHAR{$$=m1.createnode(Decl,Const_Decl);$$->IDaddr=$1->constchar;$$->constchar=$1->constchar;}
		   |NOT factor{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$2;$$->op="!";}
		   |BNOT factor{$$=m1.createnode(Expr,Log_Exp);$$->child[0]=$2;$$->op="~";}
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
		}
	}
	return n;
}
