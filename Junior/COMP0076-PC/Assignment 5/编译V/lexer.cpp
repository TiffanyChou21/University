/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 59 of your 30 day trial period.
* 
* This file was produced by an UNREGISTERED COPY of Parser Generator. It is
* for evaluation purposes only. If you continue to use Parser Generator 30
* days after installation then you are required to purchase a license. For
* more information see the online help or go to the Bumble-Bee Software
* homepage at:
* 
* http://www.bumblebeesoftware.com
* 
* This notice must remain present in the file. It cannot be removed.
****************************************************************************/

/****************************************************************************
* lexer.cpp
* C++ source file generated from lexer.l.
* 
* Date: 11/14/19
* Time: 15:59:13
* 
* ALex Version: 2.07
****************************************************************************/

#include <yyclex.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#line 1 ".\\lexer.l"

/****************************************************************************
lexer.l
ParserWizard generated Lex file.

Zcf 1712991

Date: 2019年11月7日
****************************************************************************/
#include "parser.h"
#include<iostream>
#include <string>
#include <fstream>
#pragma warning(disable:4996)
ofstream outa("result-attachment.txt");
#define MAXCHILDREN 6
enum NodeType{Stmt,Expr,Decl};
enum Statement{If,While,For,Block,Input,Output,Fuc,Return,Expr_fuc,Fuc_asked};
enum Expression{Op,Const,Idk,Type};
enum Declaration{Var,FucVar};
enum TypeK{Int,Char,Void,Bool,Float,Double};
struct TreeNode
{
  struct TreeNode*child[MAXCHILDREN];
  struct TreeNode*sibling;
  NodeType nodetype; 
  Statement stmttype;
  Expression exprtype;
  Declaration dectype;
  TypeK type;
  union{
   int op;//！！token定义，返回int型操作符号的值
   int val;
   char* charvalue;
   char* symbol;
  }attr;
  int lineno;  //是递归的顺序并不是行号
};
extern int line;

void insert(const char*letter,char*lexeme,char*type);
int lookup(const char*letter,char*lexeme);
extern YYSTYPE yylval;
extern int line;

#line 84 "lexer.cpp"
// repeated because of possible precompiled header
#include <yyclex.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\lexer.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYLEXERNAME::YYLEXERNAME()
{
	yytables();
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYLEXERNAME::~YYLEXERNAME()
{
}

#ifndef YYTEXT_SIZE
#define YYTEXT_SIZE 100
#endif
#ifndef YYUNPUT_SIZE
#define YYUNPUT_SIZE YYTEXT_SIZE
#endif
#ifndef YYTEXT_MAX
#define YYTEXT_MAX 0
#endif
#ifndef YYUNPUT_MAX
#define YYUNPUT_MAX YYTEXT_MAX
#endif

/****************************************************************************
* N O T E
* 
* If the compiler generates a YYLEXERNAME error then you have not declared
* the name of the lexical analyser. The easiest way to do this is to use a
* name declaration. This is placed in the declarations section of your Lex
* source file and is introduced with the %name keyword. For instance, the
* following name declaration declares the lexer mylexer:
* 
* %name mylexer
* 
* For more information see help.
****************************************************************************/

// backwards compatability with lex
#ifdef input
int YYLEXERNAME::yyinput()
{
	return input();
}
#else
#define input yyinput
#endif

#ifdef output
void YYLEXERNAME::yyoutput(int ch)
{
	output(ch);
}
#else
#define output yyoutput
#endif

#ifdef unput
void YYLEXERNAME::yyunput(int ch)
{
	unput(ch);
}
#else
#define unput yyunput
#endif

#ifndef YYNBORLANDWARN
#ifdef __BORLANDC__
#pragma warn -rch		// <warning: unreachable code> off
#endif
#endif

int YYLEXERNAME::yyaction(int action)
{
#line 69 ".\\lexer.l"

	YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;

#line 180 "lexer.cpp"
	yyreturnflg = yytrue;
	switch (action) {
	case 1:
		{
#line 72 ".\\lexer.l"
/*doing nothing*/
#line 187 "lexer.cpp"
		}
		break;
	case 2:
		{
#line 73 ".\\lexer.l"
line++;
#line 194 "lexer.cpp"
		}
		break;
	case 3:
		{
#line 74 ".\\lexer.l"
/*doing nothing*/
#line 201 "lexer.cpp"
		}
		break;
	case 4:
		{
#line 75 ".\\lexer.l"
/*doing nothing*/
#line 208 "lexer.cpp"
		}
		break;
	case 5:
		{
#line 76 ".\\lexer.l"
return COMMA;
#line 215 "lexer.cpp"
		}
		break;
	case 6:
		{
#line 77 ".\\lexer.l"
return SEMI;
#line 222 "lexer.cpp"
		}
		break;
	case 7:
		{
#line 78 ".\\lexer.l"
return LP;
#line 229 "lexer.cpp"
		}
		break;
	case 8:
		{
#line 79 ".\\lexer.l"
return RP;
#line 236 "lexer.cpp"
		}
		break;
	case 9:
		{
#line 80 ".\\lexer.l"
return LB;
#line 243 "lexer.cpp"
		}
		break;
	case 10:
		{
#line 81 ".\\lexer.l"
return RB;
#line 250 "lexer.cpp"
		}
		break;
	case 11:
		{
#line 82 ".\\lexer.l"
return LSP;
#line 257 "lexer.cpp"
		}
		break;
	case 12:
		{
#line 83 ".\\lexer.l"
return RSP;
#line 264 "lexer.cpp"
		}
		break;
	case 13:
		{
#line 85 ".\\lexer.l"
return IF;
#line 271 "lexer.cpp"
		}
		break;
	case 14:
		{
#line 86 ".\\lexer.l"
return ELSE;
#line 278 "lexer.cpp"
		}
		break;
	case 15:
		{
#line 87 ".\\lexer.l"
return WHILE;
#line 285 "lexer.cpp"
		}
		break;
	case 16:
		{
#line 88 ".\\lexer.l"
return FOR;
#line 292 "lexer.cpp"
		}
		break;
	case 17:
		{
#line 89 ".\\lexer.l"
return CIN;
#line 299 "lexer.cpp"
		}
		break;
	case 18:
		{
#line 90 ".\\lexer.l"
return COUT;
#line 306 "lexer.cpp"
		}
		break;
	case 19:
		{
#line 91 ".\\lexer.l"
return VOID;
#line 313 "lexer.cpp"
		}
		break;
	case 20:
		{
#line 92 ".\\lexer.l"
tp[0]='\0';strcpy(tp,yytext);return INT;
#line 320 "lexer.cpp"
		}
		break;
	case 21:
		{
#line 93 ".\\lexer.l"
tp[0]='\0';strcpy(tp,yytext);return CHAR;
#line 327 "lexer.cpp"
		}
		break;
	case 22:
		{
#line 94 ".\\lexer.l"
tp[0]='\0';strcpy(tp,yytext);return STRING;
#line 334 "lexer.cpp"
		}
		break;
	case 23:
		{
#line 95 ".\\lexer.l"
tp[0]='\0';strcpy(tp,yytext);return FLOAT;
#line 341 "lexer.cpp"
		}
		break;
	case 24:
		{
#line 96 ".\\lexer.l"
tp[0]='\0';strcpy(tp,yytext);return DOUBLE;
#line 348 "lexer.cpp"
		}
		break;
	case 25:
		{
#line 97 ".\\lexer.l"
tp[0]='\0';strcpy(tp,yytext);return BOOL;
#line 355 "lexer.cpp"
		}
		break;
	case 26:
		{
#line 98 ".\\lexer.l"
return MAIN;
#line 362 "lexer.cpp"
		}
		break;
	case 27:
		{
#line 99 ".\\lexer.l"
return RETURN;
#line 369 "lexer.cpp"
		}
		break;
	case 28:
		{
#line 101 ".\\lexer.l"
return ASSIGN;
#line 376 "lexer.cpp"
		}
		break;
	case 29:
		{
#line 102 ".\\lexer.l"
return ADDASS;
#line 383 "lexer.cpp"
		}
		break;
	case 30:
		{
#line 103 ".\\lexer.l"
return SUBASS;
#line 390 "lexer.cpp"
		}
		break;
	case 31:
		{
#line 104 ".\\lexer.l"
return MULASS;
#line 397 "lexer.cpp"
		}
		break;
	case 32:
		{
#line 105 ".\\lexer.l"
return DIVASS;
#line 404 "lexer.cpp"
		}
		break;
	case 33:
		{
#line 106 ".\\lexer.l"
return MODASS;
#line 411 "lexer.cpp"
		}
		break;
	case 34:
		{
#line 107 ".\\lexer.l"
return ANDASS;
#line 418 "lexer.cpp"
		}
		break;
	case 35:
		{
#line 108 ".\\lexer.l"
return ORASS;
#line 425 "lexer.cpp"
		}
		break;
	case 36:
		{
#line 109 ".\\lexer.l"
return XORASS;
#line 432 "lexer.cpp"
		}
		break;
	case 37:
		{
#line 110 ".\\lexer.l"
return SHLASS;
#line 439 "lexer.cpp"
		}
		break;
	case 38:
		{
#line 111 ".\\lexer.l"
return SHRASS;
#line 446 "lexer.cpp"
		}
		break;
	case 39:
		{
#line 114 ".\\lexer.l"
return ADD;
#line 453 "lexer.cpp"
		}
		break;
	case 40:
		{
#line 115 ".\\lexer.l"
return SUB;
#line 460 "lexer.cpp"
		}
		break;
	case 41:
		{
#line 116 ".\\lexer.l"
return MUL;
#line 467 "lexer.cpp"
		}
		break;
	case 42:
		{
#line 117 ".\\lexer.l"
return DIV;
#line 474 "lexer.cpp"
		}
		break;
	case 43:
		{
#line 118 ".\\lexer.l"
return MOD;
#line 481 "lexer.cpp"
		}
		break;
	case 44:
		{
#line 119 ".\\lexer.l"
return INC;
#line 488 "lexer.cpp"
		}
		break;
	case 45:
		{
#line 120 ".\\lexer.l"
return DEC;
#line 495 "lexer.cpp"
		}
		break;
	case 46:
		{
#line 122 ".\\lexer.l"
return BNOT;
#line 502 "lexer.cpp"
		}
		break;
	case 47:
		{
#line 123 ".\\lexer.l"
return BAND;
#line 509 "lexer.cpp"
		}
		break;
	case 48:
		{
#line 124 ".\\lexer.l"
return BOR;
#line 516 "lexer.cpp"
		}
		break;
	case 49:
		{
#line 125 ".\\lexer.l"
return EQ;
#line 523 "lexer.cpp"
		}
		break;
	case 50:
		{
#line 126 ".\\lexer.l"
return GT;
#line 530 "lexer.cpp"
		}
		break;
	case 51:
		{
#line 127 ".\\lexer.l"
return LT;
#line 537 "lexer.cpp"
		}
		break;
	case 52:
		{
#line 128 ".\\lexer.l"
return GE;
#line 544 "lexer.cpp"
		}
		break;
	case 53:
		{
#line 129 ".\\lexer.l"
return LE;
#line 551 "lexer.cpp"
		}
		break;
	case 54:
		{
#line 130 ".\\lexer.l"
return NE;
#line 558 "lexer.cpp"
		}
		break;
	case 55:
		{
#line 131 ".\\lexer.l"
return AND;
#line 565 "lexer.cpp"
		}
		break;
	case 56:
		{
#line 132 ".\\lexer.l"
return OR;
#line 572 "lexer.cpp"
		}
		break;
	case 57:
		{
#line 133 ".\\lexer.l"
return NOT;
#line 579 "lexer.cpp"
		}
		break;
	case 58:
		{
#line 134 ".\\lexer.l"
return SHL;
#line 586 "lexer.cpp"
		}
		break;
	case 59:
		{
#line 135 ".\\lexer.l"
return SHR;
#line 593 "lexer.cpp"
		}
		break;
	case 60:
		{
#line 136 ".\\lexer.l"

                         struct TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
                         for(int i=0;i<MAXCHILDREN;i++)
                          {
                           t->child[i]=NULL;
                          }
                          t->sibling=NULL;
                          t->nodetype=Expr;
                          t->exprtype=Idk;
                          t->attr.symbol=new char[yyleng+1];
                          strcpy(t->attr.symbol,yytext);
                          t->lineno=line++;
                          t->type=Void;
                          yylval=t;
                          insert("ID",yytext,tp);
                          return ID;
                         
#line 616 "lexer.cpp"
		}
		break;
	case 61:
		{
#line 153 ".\\lexer.l"

                         struct TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
                         for(int i=0;i<MAXCHILDREN;i++)
                          {
                           t->child[i]=NULL;
                          }
                          t->sibling=NULL;
                          t->nodetype=Expr;
                          t->exprtype=Const;
                          t->attr.val=atoi(yytext);
                          t->lineno=line++;
                          t->type=Void;
                          yylval=t;
                          return NUMBER;
#line 636 "lexer.cpp"
		}
		break;
	case 62:
		{
#line 167 ".\\lexer.l"

						  struct TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
                          for(int i=0;i<MAXCHILDREN;i++)
                          {
                           t->child[i]=NULL;
                          }
                          t->sibling=NULL;
                          t->nodetype=Expr;
                          t->exprtype=Const; 
                          t->attr.charvalue=new char[yyleng+1];//去掉''
                          strcpy(t->attr.charvalue,yytext);
                          strncpy(t->attr.charvalue,t->attr.charvalue+1,yyleng);
                          for(int i=0;i<yyleng;i++)
                          {
							if(t->attr.charvalue[i]=='\'')
								t->attr.charvalue[i]='\0';
                          }
                          t->lineno=line++;
                          t->type=Void;
                          yylval=t;
                          return CHARVAL;
						
#line 664 "lexer.cpp"
		}
		break;
	default:
		yyassert(0);
		break;
	}
	yyreturnflg = yyfalse;
	return 0;
}

#ifndef YYNBORLANDWARN
#ifdef __BORLANDC__
#pragma warn .rch		// <warning: unreachable code> to the old state
#endif
#endif

void YYLEXERNAME::yytables()
{
	yystext_size = YYTEXT_SIZE;
	yysunput_size = YYUNPUT_SIZE;
	yytext_max = YYTEXT_MAX;
	yyunput_max = YYUNPUT_MAX;

	static const yymatch_t YYNEARFAR YYBASED_CODE match[] = {
		0
	};
	yymatch = match;

	yytransitionmax = 260;
	static const yytransition_t YYNEARFAR YYBASED_CODE transition[] = {
		{ 0, 0 },
		{ 3, 1 },
		{ 4, 1 },
		{ 3, 1 },
		{ 3, 1 },
		{ 80, 39 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 107, 107 },
		{ 104, 83 },
		{ 76, 34 },
		{ 0, 15 },
		{ 71, 31 },
		{ 73, 32 },
		{ 105, 83 },
		{ 72, 31 },
		{ 0, 85 },
		{ 3, 1 },
		{ 5, 1 },
		{ 77, 35 },
		{ 58, 107 },
		{ 74, 32 },
		{ 6, 1 },
		{ 7, 1 },
		{ 8, 1 },
		{ 9, 1 },
		{ 10, 1 },
		{ 11, 1 },
		{ 12, 1 },
		{ 13, 1 },
		{ 14, 1 },
		{ 15, 1 },
		{ 16, 1 },
		{ 17, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 0, 15 },
		{ 19, 1 },
		{ 20, 1 },
		{ 21, 1 },
		{ 22, 1 },
		{ 0, 85 },
		{ 44, 7 },
		{ 54, 16 },
		{ 3, 3 },
		{ 58, 107 },
		{ 3, 3 },
		{ 3, 3 },
		{ 55, 16 },
		{ 78, 36 },
		{ 49, 12 },
		{ 54, 106 },
		{ 66, 28 },
		{ 67, 28 },
		{ 81, 39 },
		{ 59, 20 },
		{ 60, 20 },
		{ 51, 14 },
		{ 0, 119 },
		{ 68, 28 },
		{ 79, 37 },
		{ 86, 58 },
		{ 56, 16 },
		{ 86, 58 },
		{ 119, 106 },
		{ 45, 7 },
		{ 83, 119 },
		{ 3, 3 },
		{ 50, 12 },
		{ 24, 1 },
		{ 84, 119 },
		{ 25, 1 },
		{ 26, 1 },
		{ 52, 14 },
		{ 62, 22 },
		{ 63, 22 },
		{ 27, 1 },
		{ 28, 1 },
		{ 29, 1 },
		{ 30, 1 },
		{ 31, 1 },
		{ 42, 5 },
		{ 82, 46 },
		{ 32, 1 },
		{ 0, 47 },
		{ 61, 21 },
		{ 0, 55 },
		{ 33, 1 },
		{ 47, 8 },
		{ 64, 26 },
		{ 88, 59 },
		{ 89, 63 },
		{ 34, 1 },
		{ 35, 1 },
		{ 90, 65 },
		{ 91, 66 },
		{ 36, 1 },
		{ 37, 1 },
		{ 92, 67 },
		{ 93, 68 },
		{ 94, 69 },
		{ 38, 1 },
		{ 39, 1 },
		{ 40, 1 },
		{ 41, 1 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 95, 70 },
		{ 96, 71 },
		{ 97, 72 },
		{ 98, 74 },
		{ 99, 75 },
		{ 100, 76 },
		{ 101, 77 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 102, 78 },
		{ 103, 79 },
		{ 65, 27 },
		{ 106, 84 },
		{ 23, 127 },
		{ 48, 11 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 23, 127 },
		{ 85, 57 },
		{ 69, 29 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 57, 57 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 53, 53 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 87, 87 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 108, 90 },
		{ 109, 91 },
		{ 110, 93 },
		{ 111, 94 },
		{ 112, 95 },
		{ 113, 96 },
		{ 114, 99 },
		{ 115, 100 },
		{ 116, 101 },
		{ 117, 102 },
		{ 118, 103 },
		{ 54, 104 },
		{ 70, 30 },
		{ 15, 17 },
		{ 120, 111 },
		{ 121, 113 },
		{ 122, 115 },
		{ 123, 116 },
		{ 124, 118 },
		{ 43, 6 },
		{ 125, 120 },
		{ 126, 122 },
		{ 127, 123 },
		{ 75, 33 }
	};
	yytransition = transition;

	static const yystate_t YYNEARFAR YYBASED_CODE state[] = {
		{ 0, 0, 0 },
		{ 127, -8, 0 },
		{ 1, 0, 0 },
		{ 0, 49, 1 },
		{ 0, 0, 2 },
		{ 0, 34, 57 },
		{ 0, 194, 43 },
		{ 0, 18, 47 },
		{ 47, 10, 0 },
		{ 0, 0, 7 },
		{ 0, 0, 8 },
		{ 0, 106, 41 },
		{ 0, 21, 39 },
		{ 0, 0, 5 },
		{ 0, 26, 40 },
		{ 53, -51, 0 },
		{ 0, 15, 42 },
		{ 57, 203, 61 },
		{ 17, 178, 61 },
		{ 0, 0, 6 },
		{ 0, 9, 51 },
		{ 0, 38, 28 },
		{ 0, 27, 50 },
		{ 127, 0, 60 },
		{ 0, 0, 11 },
		{ 0, 0, 12 },
		{ 0, 42, 0 },
		{ 127, 53, 60 },
		{ 127, -38, 60 },
		{ 127, 84, 60 },
		{ 127, 140, 60 },
		{ 127, -89, 60 },
		{ 127, -82, 60 },
		{ 127, 162, 60 },
		{ 127, -84, 60 },
		{ 127, -90, 60 },
		{ 127, -48, 60 },
		{ 127, -30, 60 },
		{ 0, 0, 9 },
		{ 0, -56, 48 },
		{ 0, 0, 10 },
		{ 0, 0, 46 },
		{ 0, 0, 54 },
		{ 0, 0, 33 },
		{ 0, 0, 55 },
		{ 0, 0, 34 },
		{ 0, 57, 0 },
		{ -46, 88, 0 },
		{ 0, 0, 31 },
		{ 0, 0, 44 },
		{ 0, 0, 29 },
		{ 0, 0, 45 },
		{ 0, 0, 30 },
		{ 107, 158, 61 },
		{ 119, 0, 0 },
		{ -55, 90, 3 },
		{ 0, 0, 32 },
		{ 107, 148, 0 },
		{ 87, 32, 0 },
		{ 0, 43, 58 },
		{ 0, 0, 53 },
		{ 0, 0, 49 },
		{ 0, 0, 52 },
		{ 0, 44, 59 },
		{ 0, 0, 36 },
		{ 127, -3, 60 },
		{ 127, 12, 60 },
		{ 127, 2, 60 },
		{ 127, -4, 60 },
		{ 127, -3, 60 },
		{ 127, 14, 60 },
		{ 127, 19, 60 },
		{ 127, 17, 60 },
		{ 127, 0, 13 },
		{ 127, 16, 60 },
		{ 127, 28, 60 },
		{ 127, 18, 60 },
		{ 127, 21, 60 },
		{ 127, 57, 60 },
		{ 127, 58, 60 },
		{ 0, 0, 35 },
		{ 0, 0, 56 },
		{ 0, 0, 62 },
		{ -54, -26, 0 },
		{ 119, 123, 0 },
		{ 107, -46, 0 },
		{ 87, 0, 0 },
		{ 0, 168, 61 },
		{ 0, 0, 37 },
		{ 0, 0, 38 },
		{ 127, 128, 60 },
		{ 127, 123, 60 },
		{ 127, 0, 17 },
		{ 127, 122, 60 },
		{ 127, 141, 60 },
		{ 127, 139, 60 },
		{ 127, 144, 60 },
		{ 127, 0, 16 },
		{ 127, 0, 20 },
		{ 127, 132, 60 },
		{ 127, 126, 60 },
		{ 127, 139, 60 },
		{ 127, 145, 60 },
		{ 127, 138, 60 },
		{ 106, 200, 0 },
		{ 0, 0, 4 },
		{ 84, 31, 0 },
		{ 0, -42, 0 },
		{ 127, 0, 25 },
		{ 127, 0, 21 },
		{ 127, 0, 18 },
		{ 127, 142, 60 },
		{ 127, 0, 14 },
		{ 127, 135, 60 },
		{ 127, 0, 26 },
		{ 127, 138, 60 },
		{ 127, 143, 60 },
		{ 127, 0, 19 },
		{ 127, 153, 60 },
		{ -54, 38, 4 },
		{ 127, 155, 60 },
		{ 127, 0, 23 },
		{ 127, 147, 60 },
		{ 127, 155, 60 },
		{ 127, 0, 15 },
		{ 127, 0, 24 },
		{ 127, 0, 27 },
		{ 0, 71, 22 }
	};
	yystate = state;

	static const yybackup_t YYNEARFAR YYBASED_CODE backup[] = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	};
	yybackup = backup;
}
#line 189 ".\\lexer.l"

struct symbol1{
 char* letter;  //单词
 char* lexeme;   //词素 
 char* type;   //类型
 int value;    //第几个这样的
 struct symbol1 *m_next;//下一个symtable的字符
};
struct symbol1* symtable;//symtable中的第一个元素
int lexer::lookup(const char*letter,char*lexeme)
{
 struct symbol1 *st=symtable;
 int count=-1;
 for(;st;st=st->m_next)
 {
   if(strcmp(st->letter,letter)==0)   //有这个单词则计数++
   {
     count++;
     if(strcmp(st->lexeme,lexeme)==0)
     {
       return -2;   //说明已在符号表中
     }
   } 
 }
 return count;
}
void lexer::insert(const char*letter,char*lexeme,char* type)
{
    struct symbol1 *st;
    int count=lookup(letter,lexeme);
    if(count==-2)//已在则返回
    {
      return ;
    }
    //不在
    st=(struct symbol1*)malloc(sizeof(struct symbol1));
    st->m_next=symtable;
    st->letter=(char*)malloc(strlen(letter)+1);
    strcpy(st->letter,letter);
    st->lexeme=(char*)malloc(strlen(lexeme)+1);
    strcpy(st->lexeme,lexeme);
    st->value=count+1;
    st->type=type;
    cout<<"单词   "<<st->letter<<"\t\t"<<"词素   "<<st->lexeme<<"\t"<<"类型    "<<st->type<<"\t"<<"属性   "<<st->value<<endl;
    outa<<"单词   "<<st->letter<<"\t\t"<<"词素   "<<st->lexeme<<"\t"<<"类型    "<<st->type<<"\t"<<"属性   "<<st->value<<endl;
    symtable=st;   //symtable第一个变为st 
}
