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
* parser.cpp
* C++ source file generated from parser.y.
* 
* Date: 11/14/19
* Time: 15:59:13
* 
* AYACC Version: 2.07
****************************************************************************/

#include <yycpars.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#line 1 ".\\parser.y"

/****************************************************************************
parser.y
ParserWizard generated YACC file.

Zcf 1712991

Date: 2019年11月7日
****************************************************************************/
#include<iostream>
#include<string>
#include<fstream>
#include <iomanip>
ofstream out("result.txt");
#pragma warning(disable:4996)
using namespace std;
#define MAXCHILDREN 6
enum NodeType{Stmt,Expr,Decl};
enum Statement{If,While,For,Block,Input,Output,Fuc,Return,Expr_fuc,Fuc_asked,Emp};
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
   int op;//！！由于是token定义，返回int型操作符号的值
   int val;
   char* symbol;
   char* charvalue;
  }attr;
  int lineno;//是递归的顺序并不是行号
};
int NUM=0;      //输出节点的计数
int line=0;   //计数\n
TreeNode*root;
TreeNode*newDeclNode(Declaration dectype)      //新decl节点 变量 函数
{
  TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
  if(t==NULL)
    cout<<"Out of memory error at line "<<line<<endl;
  else{
  for(int i=0;i<MAXCHILDREN;i++)
    t->child[i]=NULL;
  t->sibling=NULL;
  t->nodetype=Decl;
  t->dectype=dectype;
  t->lineno=line++;}
  return t;
}
TreeNode*newExprNode(Expression exprtype)    //新表达式节点op const id type
{
  TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
  if(t==NULL)
    cout<<"Out of memory error at line "<<line<<endl;
  else{
  for(int i=0;i<MAXCHILDREN;i++)
    t->child[i]=NULL;
  t->sibling=NULL;
  t->nodetype=Expr;
  t->exprtype=exprtype;
  t->lineno=line++;
  t->type=Void;}
  return t;
}
TreeNode*newStmtNode(Statement stmttype)   //新结构体节点...
{
  TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
  if(t==NULL)
    cout<<"Out of memory error at line "<<line<<endl;
  else{
  for(int i=0;i<MAXCHILDREN;i++)
    t->child[i]=NULL;
  t->sibling=NULL;
  t->nodetype=Stmt;
  t->stmttype=stmttype;
  t->lineno=line++;}
  return t;
}


#line 126 "parser.cpp"
// repeated because of possible precompiled header
#include <yycpars.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\parser.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYPARSERNAME::YYPARSERNAME()
{
	yytables();
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYPARSERNAME::~YYPARSERNAME()
{
	// allows virtual functions to be called properly for correct cleanup
	yydestroy();
}

#ifndef YYSTYPE
#define YYSTYPE int
#endif
#ifndef YYSTACK_SIZE
#define YYSTACK_SIZE 100
#endif
#ifndef YYSTACK_MAX
#define YYSTACK_MAX 0
#endif

/****************************************************************************
* N O T E
* 
* If the compiler generates a YYPARSERNAME error then you have not declared
* the name of the parser. The easiest way to do this is to use a name
* declaration. This is placed in the declarations section of your YACC
* source file and is introduced with the %name keyword. For instance, the
* following name declaration declares the parser myparser:
* 
* %name myparser
* 
* For more information see help.
****************************************************************************/

// yyattribute
#ifdef YYDEBUG
void YYFAR* YYPARSERNAME::yyattribute1(int index) const
{
	YYSTYPE YYFAR* p = &((YYSTYPE YYFAR*)yyattributestackptr)[yytop + index];
	return p;
}
#define yyattribute(index) (*(YYSTYPE YYFAR*)yyattribute1(index))
#else
#define yyattribute(index) (((YYSTYPE YYFAR*)yyattributestackptr)[yytop + (index)])
#endif

void YYPARSERNAME::yystacktoval(int index)
{
	yyassert(index >= 0);
	*(YYSTYPE YYFAR*)yyvalptr = ((YYSTYPE YYFAR*)yyattributestackptr)[index];
}

void YYPARSERNAME::yyvaltostack(int index)
{
	yyassert(index >= 0);
	((YYSTYPE YYFAR*)yyattributestackptr)[index] = *(YYSTYPE YYFAR*)yyvalptr;
}

void YYPARSERNAME::yylvaltoval()
{
	*(YYSTYPE YYFAR*)yyvalptr = *(YYSTYPE YYFAR*)yylvalptr;
}

void YYPARSERNAME::yyvaltolval()
{
	*(YYSTYPE YYFAR*)yylvalptr = *(YYSTYPE YYFAR*)yyvalptr;
}

void YYPARSERNAME::yylvaltostack(int index)
{
	yyassert(index >= 0);
	((YYSTYPE YYFAR*)yyattributestackptr)[index] = *(YYSTYPE YYFAR*)yylvalptr;
}

void YYFAR* YYPARSERNAME::yynewattribute(int count)
{
	yyassert(count >= 0);
	return new YYFAR YYSTYPE[count];
}

void YYPARSERNAME::yydeleteattribute(void YYFAR* attribute)
{
	delete[] (YYSTYPE YYFAR*)attribute;
}

void YYPARSERNAME::yycopyattribute(void YYFAR* dest, const void YYFAR* src, int count)
{
	for (int i = 0; i < count; i++) {
		((YYSTYPE YYFAR*)dest)[i] = ((YYSTYPE YYFAR*)src)[i];
	}
}

#ifdef YYDEBUG
void YYPARSERNAME::yyinitdebug(void YYFAR** p, int count) const
{
	yyassert(p != NULL);
	yyassert(count >= 1);

	YYSTYPE YYFAR** p1 = (YYSTYPE YYFAR**)p;
	for (int i = 0; i < count; i++) {
		p1[i] = &((YYSTYPE YYFAR*)yyattributestackptr)[yytop + i - (count - 1)];
	}
}
#endif

void YYPARSERNAME::yyaction(int action)
{
	switch (action) {
	case 0:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 134 ".\\parser.y"
 (*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(4 - 4);root=yyattribute(4 - 4);display(root);
#line 264 "parser.cpp"
			}
		}
		break;
	case 1:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 136 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Block);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 3);
#line 277 "parser.cpp"
			}
		}
		break;
	case 2:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 138 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(2 - 2);
#line 290 "parser.cpp"
			}
		}
		break;
	case 3:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 139 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 303 "parser.cpp"
			}
		}
		break;
	case 4:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 141 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 316 "parser.cpp"
			}
		}
		break;
	case 5:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 142 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 329 "parser.cpp"
			}
		}
		break;
	case 6:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 143 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 342 "parser.cpp"
			}
		}
		break;
	case 7:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 144 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 355 "parser.cpp"
			}
		}
		break;
	case 8:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 145 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 368 "parser.cpp"
			}
		}
		break;
	case 9:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 146 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 381 "parser.cpp"
			}
		}
		break;
	case 10:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 147 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 394 "parser.cpp"
			}
		}
		break;
	case 11:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 148 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 407 "parser.cpp"
			}
		}
		break;
	case 12:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 149 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 420 "parser.cpp"
			}
		}
		break;
	case 13:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 150 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 433 "parser.cpp"
			}
		}
		break;
	case 14:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 151 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 446 "parser.cpp"
			}
		}
		break;
	case 15:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 152 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Emp);
#line 459 "parser.cpp"
			}
		}
		break;
	case 16:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 154 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Var);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 3);
#line 472 "parser.cpp"
			}
		}
		break;
	case 17:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 156 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(3 - 3);
#line 485 "parser.cpp"
			}
		}
		break;
	case 18:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 157 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 498 "parser.cpp"
			}
		}
		break;
	case 19:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 159 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(FucVar);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 2);
#line 511 "parser.cpp"
			}
		}
		break;
	case 20:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 161 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);
#line 524 "parser.cpp"
			}
		}
		break;
	case 21:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 163 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->type=Int;
#line 537 "parser.cpp"
			}
		}
		break;
	case 22:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 164 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->type=Char;
#line 550 "parser.cpp"
			}
		}
		break;
	case 23:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 165 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->type=Void;
#line 563 "parser.cpp"
			}
		}
		break;
	case 24:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 166 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->type=Float;
#line 576 "parser.cpp"
			}
		}
		break;
	case 25:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 167 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->type=Double;
#line 589 "parser.cpp"
			}
		}
		break;
	case 26:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 168 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->type=Bool;
#line 602 "parser.cpp"
			}
		}
		break;
	case 27:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 170 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(3 - 3);
#line 615 "parser.cpp"
			}
		}
		break;
	case 28:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 173 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ASSIGN;
#line 628 "parser.cpp"
			}
		}
		break;
	case 29:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 174 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ADDASS;
#line 641 "parser.cpp"
			}
		}
		break;
	case 30:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 175 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SUBASS;
#line 654 "parser.cpp"
			}
		}
		break;
	case 31:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 176 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=MULASS;
#line 667 "parser.cpp"
			}
		}
		break;
	case 32:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 177 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=DIVASS;
#line 680 "parser.cpp"
			}
		}
		break;
	case 33:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 178 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=MODASS;
#line 693 "parser.cpp"
			}
		}
		break;
	case 34:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 179 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ANDASS;
#line 706 "parser.cpp"
			}
		}
		break;
	case 35:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 180 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ORASS;
#line 719 "parser.cpp"
			}
		}
		break;
	case 36:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 181 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=XORASS;
#line 732 "parser.cpp"
			}
		}
		break;
	case 37:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 182 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SHLASS;
#line 745 "parser.cpp"
			}
		}
		break;
	case 38:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 183 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SHRASS;
#line 758 "parser.cpp"
			}
		}
		break;
	case 39:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 184 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 771 "parser.cpp"
			}
		}
		break;
	case 40:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 186 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=OR;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 784 "parser.cpp"
			}
		}
		break;
	case 41:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 187 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 797 "parser.cpp"
			}
		}
		break;
	case 42:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 189 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=AND;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 810 "parser.cpp"
			}
		}
		break;
	case 43:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 190 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 823 "parser.cpp"
			}
		}
		break;
	case 44:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 192 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=BOR;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 836 "parser.cpp"
			}
		}
		break;
	case 45:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 193 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 849 "parser.cpp"
			}
		}
		break;
	case 46:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 195 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=XOR;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 862 "parser.cpp"
			}
		}
		break;
	case 47:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 196 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 875 "parser.cpp"
			}
		}
		break;
	case 48:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 198 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=BAND;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 888 "parser.cpp"
			}
		}
		break;
	case 49:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 199 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 901 "parser.cpp"
			}
		}
		break;
	case 50:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 202 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=EQ;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 914 "parser.cpp"
			}
		}
		break;
	case 51:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 203 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=NE;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 927 "parser.cpp"
			}
		}
		break;
	case 52:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 206 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=GE;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 940 "parser.cpp"
			}
		}
		break;
	case 53:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 207 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=LE;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 953 "parser.cpp"
			}
		}
		break;
	case 54:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 208 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=GT;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 966 "parser.cpp"
			}
		}
		break;
	case 55:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 209 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=LT;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 979 "parser.cpp"
			}
		}
		break;
	case 56:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 210 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 992 "parser.cpp"
			}
		}
		break;
	case 57:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 212 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SHL;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1005 "parser.cpp"
			}
		}
		break;
	case 58:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 213 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SHR;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1018 "parser.cpp"
			}
		}
		break;
	case 59:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 216 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ADD;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1031 "parser.cpp"
			}
		}
		break;
	case 60:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 217 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SUB;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1044 "parser.cpp"
			}
		}
		break;
	case 61:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 218 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1057 "parser.cpp"
			}
		}
		break;
	case 62:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 220 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=MUL;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1070 "parser.cpp"
			}
		}
		break;
	case 63:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 221 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=DIV;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1083 "parser.cpp"
			}
		}
		break;
	case 64:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 222 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1096 "parser.cpp"
			}
		}
		break;
	case 65:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 224 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(2 - 3);
#line 1109 "parser.cpp"
			}
		}
		break;
	case 66:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 225 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1122 "parser.cpp"
			}
		}
		break;
	case 67:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 226 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1135 "parser.cpp"
			}
		}
		break;
	case 68:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 227 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1148 "parser.cpp"
			}
		}
		break;
	case 69:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 228 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=NOT;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);
#line 1161 "parser.cpp"
			}
		}
		break;
	case 70:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 229 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=BNOT;(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);
#line 1174 "parser.cpp"
			}
		}
		break;
	case 71:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 232 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(If);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);
#line 1187 "parser.cpp"
			}
		}
		break;
	case 72:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 233 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(If);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 7);
#line 1200 "parser.cpp"
			}
		}
		break;
	case 73:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[10];
			yyinitdebug((void YYFAR**)yya, 10);
#endif
			{
#line 236 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(9 - 9);
#line 1213 "parser.cpp"
			}
		}
		break;
	case 74:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 237 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(4 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(6 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(8 - 8);
#line 1226 "parser.cpp"
			}
		}
		break;
	case 75:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 238 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(6 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(8 - 8);
#line 1239 "parser.cpp"
			}
		}
		break;
	case 76:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 239 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(8 - 8);
#line 1252 "parser.cpp"
			}
		}
		break;
	case 77:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 240 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(7 - 7);
#line 1265 "parser.cpp"
			}
		}
		break;
	case 78:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 241 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(4 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(7 - 7);
#line 1278 "parser.cpp"
			}
		}
		break;
	case 79:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 242 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(7 - 7);
#line 1291 "parser.cpp"
			}
		}
		break;
	case 80:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 243 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(6 - 6);
#line 1304 "parser.cpp"
			}
		}
		break;
	case 81:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 246 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(While);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);
#line 1317 "parser.cpp"
			}
		}
		break;
	case 82:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 249 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Input);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 4);
#line 1330 "parser.cpp"
			}
		}
		break;
	case 83:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 251 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Output);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 4);
#line 1343 "parser.cpp"
			}
		}
		break;
	case 84:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 254 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Fuc);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(4 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(6 - 6);
#line 1356 "parser.cpp"
			}
		}
		break;
	case 85:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 256 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Fuc);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(4 - 4);
#line 1369 "parser.cpp"
			}
		}
		break;
	case 86:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 257 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1382 "parser.cpp"
			}
		}
		break;
	case 87:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 259 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Fuc_asked);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 5);
#line 1395 "parser.cpp"
			}
		}
		break;
	case 88:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 261 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Expr_fuc);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
#line 1408 "parser.cpp"
			}
		}
		break;
	case 89:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 262 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Expr_fuc);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 1);
#line 1421 "parser.cpp"
			}
		}
		break;
	case 90:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 265 ".\\parser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Return);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);
#line 1434 "parser.cpp"
			}
		}
		break;
	default:
		yyassert(0);
		break;
	}
}

void YYPARSERNAME::yytables()
{
	yyattribute_size = sizeof(YYSTYPE);
	yysstack_size = YYSTACK_SIZE;
	yystack_max = YYSTACK_MAX;

#ifdef YYDEBUG
	static const yysymbol_t YYNEARFAR YYBASED_CODE symbol[] = {
		{ "$end", 0 },
		{ "error", 256 },
		{ "IF", 257 },
		{ "MAIN", 258 },
		{ "FOR", 259 },
		{ "WHILE", 260 },
		{ "CIN", 261 },
		{ "COUT", 262 },
		{ "INT", 263 },
		{ "CHAR", 264 },
		{ "VOID", 265 },
		{ "FLOAT", 267 },
		{ "DOUBLE", 268 },
		{ "BOOL", 269 },
		{ "ID", 270 },
		{ "NUMBER", 271 },
		{ "CHARVAL", 272 },
		{ "ADD", 273 },
		{ "SUB", 274 },
		{ "MUL", 275 },
		{ "DIV", 276 },
		{ "GT", 280 },
		{ "LT", 281 },
		{ "GE", 282 },
		{ "LE", 283 },
		{ "NE", 284 },
		{ "AND", 285 },
		{ "OR", 286 },
		{ "NOT", 287 },
		{ "BNOT", 288 },
		{ "BAND", 289 },
		{ "BOR", 290 },
		{ "XOR", 291 },
		{ "ASSIGN", 292 },
		{ "ADDASS", 293 },
		{ "SUBASS", 294 },
		{ "MULASS", 295 },
		{ "DIVASS", 296 },
		{ "MODASS", 297 },
		{ "ANDASS", 298 },
		{ "ORASS", 299 },
		{ "XORASS", 300 },
		{ "SHLASS", 301 },
		{ "SHRASS", 302 },
		{ "LB", 303 },
		{ "RB", 304 },
		{ "COMMA", 307 },
		{ "SEMI", 308 },
		{ "LP", 309 },
		{ "RP", 310 },
		{ "SHL", 311 },
		{ "SHR", 312 },
		{ "RETURN", 313 },
		{ "EQ", 314 },
		{ "ELSE", 315 },
		{ NULL, 0 }
	};
	yysymbol = symbol;

	static const char* const YYNEARFAR YYBASED_CODE rule[] = {
		"$accept: start",
		"start: MAIN LP RP block",
		"block: LB stmts RB",
		"stmts: stmt stmts",
		"stmts: stmt",
		"stmt: expr_stmt",
		"stmt: var_stmt",
		"stmt: if_stmt",
		"stmt: while_stmt",
		"stmt: for_stmt",
		"stmt: block",
		"stmt: input_stmt",
		"stmt: output_stmt",
		"stmt: fuc_stmt",
		"stmt: fuc_asked_stmt",
		"stmt: return_stmt",
		"stmt: SEMI",
		"var_stmt: type_var id_list SEMI",
		"fuc_var: fuc1_var COMMA fuc_var",
		"fuc_var: fuc1_var",
		"fuc1_var: type_var ID",
		"expr_stmt: expr SEMI",
		"type_var: INT",
		"type_var: CHAR",
		"type_var: VOID",
		"type_var: FLOAT",
		"type_var: DOUBLE",
		"type_var: BOOL",
		"id_list: expr COMMA id_list",
		"id_list: expr",
		"expr: expr ASSIGN expr",
		"expr: expr ADDASS expr",
		"expr: expr SUBASS expr",
		"expr: expr MULASS expr",
		"expr: expr DIVASS expr",
		"expr: expr MODASS expr",
		"expr: expr ANDASS expr",
		"expr: expr ORASS expr",
		"expr: expr XORASS expr",
		"expr: expr SHLASS expr",
		"expr: expr SHRASS expr",
		"expr: or_expr",
		"or_expr: or_expr OR and_expr",
		"or_expr: and_expr",
		"and_expr: and_expr AND bor_expr",
		"and_expr: bor_expr",
		"bor_expr: bor_expr BOR xor_expr",
		"bor_expr: xor_expr",
		"xor_expr: xor_expr XOR xor_expr",
		"xor_expr: band_expr",
		"band_expr: band_expr BAND eq_expr",
		"band_expr: eq_expr",
		"eq_expr: eq_expr EQ rala_expr",
		"eq_expr: eq_expr NE rala_expr",
		"eq_expr: rala_expr",
		"rala_expr: rala_expr GE sh_expr",
		"rala_expr: rala_expr LE sh_expr",
		"rala_expr: rala_expr GT sh_expr",
		"rala_expr: rala_expr LT sh_expr",
		"rala_expr: sh_expr",
		"sh_expr: sh_expr SHL as_expr",
		"sh_expr: sh_expr SHR as_expr",
		"sh_expr: as_expr",
		"as_expr: as_expr ADD md_expr",
		"as_expr: as_expr SUB md_expr",
		"as_expr: md_expr",
		"md_expr: md_expr MUL term",
		"md_expr: md_expr DIV term",
		"md_expr: term",
		"term: LP expr RP",
		"term: ID",
		"term: NUMBER",
		"term: CHARVAL",
		"term: NOT term",
		"term: BNOT term",
		"if_stmt: IF LP expr RP stmt",
		"if_stmt: IF LP expr RP stmt ELSE stmt",
		"for_stmt: FOR LP expr SEMI expr SEMI expr RP stmt",
		"for_stmt: FOR LP SEMI expr SEMI expr RP stmt",
		"for_stmt: FOR LP expr SEMI SEMI expr RP stmt",
		"for_stmt: FOR LP expr SEMI expr SEMI RP stmt",
		"for_stmt: FOR LP SEMI SEMI expr RP stmt",
		"for_stmt: FOR LP SEMI expr SEMI RP stmt",
		"for_stmt: FOR LP expr SEMI SEMI RP stmt",
		"for_stmt: FOR LP SEMI SEMI RP stmt",
		"while_stmt: WHILE LP expr RP stmt",
		"input_stmt: CIN SHR ID SEMI",
		"output_stmt: COUT SHL ID SEMI",
		"fuc_stmt: type_var ID LP fuc_var RP block",
		"fuc_asked_stmt: type_var ID ASSIGN fuc_asked1_stmt",
		"fuc_asked_stmt: fuc_asked1_stmt",
		"fuc_asked1_stmt: ID LP expr_fuc RP SEMI",
		"expr_fuc: expr COMMA expr",
		"expr_fuc: expr",
		"return_stmt: RETURN term"
	};
	yyrule = rule;
#endif

	static const yyreduction_t YYNEARFAR YYBASED_CODE reduction[] = {
		{ 0, 1, -1 },
		{ 1, 4, 0 },
		{ 2, 3, 1 },
		{ 3, 2, 2 },
		{ 3, 1, 3 },
		{ 4, 1, 4 },
		{ 4, 1, 5 },
		{ 4, 1, 6 },
		{ 4, 1, 7 },
		{ 4, 1, 8 },
		{ 4, 1, 9 },
		{ 4, 1, 10 },
		{ 4, 1, 11 },
		{ 4, 1, 12 },
		{ 4, 1, 13 },
		{ 4, 1, 14 },
		{ 4, 1, 15 },
		{ 5, 3, 16 },
		{ 6, 3, 17 },
		{ 6, 1, 18 },
		{ 7, 2, 19 },
		{ 8, 2, 20 },
		{ 9, 1, 21 },
		{ 9, 1, 22 },
		{ 9, 1, 23 },
		{ 9, 1, 24 },
		{ 9, 1, 25 },
		{ 9, 1, 26 },
		{ 10, 3, 27 },
		{ 10, 1, -1 },
		{ 11, 3, 28 },
		{ 11, 3, 29 },
		{ 11, 3, 30 },
		{ 11, 3, 31 },
		{ 11, 3, 32 },
		{ 11, 3, 33 },
		{ 11, 3, 34 },
		{ 11, 3, 35 },
		{ 11, 3, 36 },
		{ 11, 3, 37 },
		{ 11, 3, 38 },
		{ 11, 1, 39 },
		{ 12, 3, 40 },
		{ 12, 1, 41 },
		{ 13, 3, 42 },
		{ 13, 1, 43 },
		{ 14, 3, 44 },
		{ 14, 1, 45 },
		{ 15, 3, 46 },
		{ 15, 1, 47 },
		{ 16, 3, 48 },
		{ 16, 1, 49 },
		{ 17, 3, 50 },
		{ 17, 3, 51 },
		{ 17, 1, -1 },
		{ 18, 3, 52 },
		{ 18, 3, 53 },
		{ 18, 3, 54 },
		{ 18, 3, 55 },
		{ 18, 1, 56 },
		{ 19, 3, 57 },
		{ 19, 3, 58 },
		{ 19, 1, -1 },
		{ 20, 3, 59 },
		{ 20, 3, 60 },
		{ 20, 1, 61 },
		{ 21, 3, 62 },
		{ 21, 3, 63 },
		{ 21, 1, 64 },
		{ 22, 3, 65 },
		{ 22, 1, 66 },
		{ 22, 1, 67 },
		{ 22, 1, 68 },
		{ 22, 2, 69 },
		{ 22, 2, 70 },
		{ 23, 5, 71 },
		{ 23, 7, 72 },
		{ 24, 9, 73 },
		{ 24, 8, 74 },
		{ 24, 8, 75 },
		{ 24, 8, 76 },
		{ 24, 7, 77 },
		{ 24, 7, 78 },
		{ 24, 7, 79 },
		{ 24, 6, 80 },
		{ 25, 5, 81 },
		{ 26, 4, 82 },
		{ 27, 4, 83 },
		{ 28, 6, 84 },
		{ 29, 4, 85 },
		{ 29, 1, 86 },
		{ 30, 5, 87 },
		{ 31, 3, 88 },
		{ 31, 1, 89 },
		{ 32, 2, 90 }
	};
	yyreduction = reduction;

	yytokenaction_size = 308;

	static const yytokenaction_t YYNEARFAR YYBASED_CODE tokenaction[] = {
		{ 38, YYAT_SHIFT, 7 },
		{ 172, YYAT_SHIFT, 181 },
		{ 38, YYAT_SHIFT, 8 },
		{ 38, YYAT_SHIFT, 9 },
		{ 38, YYAT_SHIFT, 10 },
		{ 38, YYAT_SHIFT, 11 },
		{ 38, YYAT_SHIFT, 12 },
		{ 38, YYAT_SHIFT, 13 },
		{ 38, YYAT_SHIFT, 14 },
		{ 78, YYAT_SHIFT, 119 },
		{ 38, YYAT_SHIFT, 15 },
		{ 38, YYAT_SHIFT, 16 },
		{ 38, YYAT_SHIFT, 17 },
		{ 38, YYAT_SHIFT, 18 },
		{ 38, YYAT_SHIFT, 19 },
		{ 38, YYAT_SHIFT, 20 },
		{ 170, YYAT_SHIFT, 179 },
		{ 131, YYAT_SHIFT, 93 },
		{ 49, YYAT_SHIFT, 93 },
		{ 187, YYAT_SHIFT, 7 },
		{ 164, YYAT_SHIFT, 5 },
		{ 187, YYAT_SHIFT, 8 },
		{ 187, YYAT_SHIFT, 9 },
		{ 187, YYAT_SHIFT, 10 },
		{ 187, YYAT_SHIFT, 11 },
		{ 159, YYAT_SHIFT, 173 },
		{ 78, YYAT_SHIFT, 120 },
		{ 159, YYAT_ERROR, 0 },
		{ 137, YYAT_SHIFT, 87 },
		{ 137, YYAT_SHIFT, 88 },
		{ 38, YYAT_SHIFT, 21 },
		{ 38, YYAT_SHIFT, 22 },
		{ 187, YYAT_SHIFT, 18 },
		{ 187, YYAT_SHIFT, 19 },
		{ 187, YYAT_SHIFT, 20 },
		{ 183, YYAT_SHIFT, 66 },
		{ 183, YYAT_SHIFT, 67 },
		{ 183, YYAT_SHIFT, 68 },
		{ 183, YYAT_SHIFT, 69 },
		{ 183, YYAT_SHIFT, 70 },
		{ 183, YYAT_SHIFT, 71 },
		{ 183, YYAT_SHIFT, 72 },
		{ 183, YYAT_SHIFT, 73 },
		{ 183, YYAT_SHIFT, 74 },
		{ 183, YYAT_SHIFT, 75 },
		{ 183, YYAT_SHIFT, 76 },
		{ 38, YYAT_SHIFT, 5 },
		{ 131, YYAT_SHIFT, 94 },
		{ 49, YYAT_SHIFT, 94 },
		{ 187, YYAT_SHIFT, 21 },
		{ 187, YYAT_SHIFT, 22 },
		{ 38, YYAT_SHIFT, 23 },
		{ 38, YYAT_SHIFT, 24 },
		{ 183, YYAT_SHIFT, 187 },
		{ 136, YYAT_SHIFT, 87 },
		{ 136, YYAT_SHIFT, 88 },
		{ 38, YYAT_SHIFT, 25 },
		{ 165, YYAT_SHIFT, 12 },
		{ 165, YYAT_SHIFT, 13 },
		{ 165, YYAT_SHIFT, 14 },
		{ 158, YYAT_SHIFT, 171 },
		{ 165, YYAT_SHIFT, 15 },
		{ 165, YYAT_SHIFT, 16 },
		{ 165, YYAT_SHIFT, 17 },
		{ 157, YYAT_SHIFT, 169 },
		{ 187, YYAT_SHIFT, 5 },
		{ 135, YYAT_SHIFT, 83 },
		{ 135, YYAT_SHIFT, 84 },
		{ 135, YYAT_SHIFT, 85 },
		{ 135, YYAT_SHIFT, 86 },
		{ 187, YYAT_SHIFT, 23 },
		{ 187, YYAT_SHIFT, 24 },
		{ 133, YYAT_SHIFT, 95 },
		{ 133, YYAT_SHIFT, 96 },
		{ 156, YYAT_SHIFT, 168 },
		{ 187, YYAT_SHIFT, 25 },
		{ 105, YYAT_SHIFT, 66 },
		{ 105, YYAT_SHIFT, 67 },
		{ 105, YYAT_SHIFT, 68 },
		{ 105, YYAT_SHIFT, 69 },
		{ 105, YYAT_SHIFT, 70 },
		{ 105, YYAT_SHIFT, 71 },
		{ 105, YYAT_SHIFT, 72 },
		{ 105, YYAT_SHIFT, 73 },
		{ 105, YYAT_SHIFT, 74 },
		{ 105, YYAT_SHIFT, 75 },
		{ 105, YYAT_SHIFT, 76 },
		{ 134, YYAT_SHIFT, 83 },
		{ 134, YYAT_SHIFT, 84 },
		{ 134, YYAT_SHIFT, 85 },
		{ 134, YYAT_SHIFT, 86 },
		{ 105, YYAT_SHIFT, 147 },
		{ 79, YYAT_SHIFT, 66 },
		{ 79, YYAT_SHIFT, 67 },
		{ 79, YYAT_SHIFT, 68 },
		{ 79, YYAT_SHIFT, 69 },
		{ 79, YYAT_SHIFT, 70 },
		{ 79, YYAT_SHIFT, 71 },
		{ 79, YYAT_SHIFT, 72 },
		{ 79, YYAT_SHIFT, 73 },
		{ 79, YYAT_SHIFT, 74 },
		{ 79, YYAT_SHIFT, 75 },
		{ 79, YYAT_SHIFT, 76 },
		{ 44, YYAT_SHIFT, 83 },
		{ 44, YYAT_SHIFT, 84 },
		{ 44, YYAT_SHIFT, 85 },
		{ 44, YYAT_SHIFT, 86 },
		{ 79, YYAT_SHIFT, 121 },
		{ 162, YYAT_SHIFT, 66 },
		{ 162, YYAT_SHIFT, 67 },
		{ 162, YYAT_SHIFT, 68 },
		{ 162, YYAT_SHIFT, 69 },
		{ 162, YYAT_SHIFT, 70 },
		{ 162, YYAT_SHIFT, 71 },
		{ 162, YYAT_SHIFT, 72 },
		{ 162, YYAT_SHIFT, 73 },
		{ 162, YYAT_SHIFT, 74 },
		{ 162, YYAT_SHIFT, 75 },
		{ 162, YYAT_SHIFT, 76 },
		{ 118, YYAT_SHIFT, 66 },
		{ 118, YYAT_SHIFT, 67 },
		{ 118, YYAT_SHIFT, 68 },
		{ 118, YYAT_SHIFT, 69 },
		{ 118, YYAT_SHIFT, 70 },
		{ 118, YYAT_SHIFT, 71 },
		{ 118, YYAT_SHIFT, 72 },
		{ 118, YYAT_SHIFT, 73 },
		{ 118, YYAT_SHIFT, 74 },
		{ 118, YYAT_SHIFT, 75 },
		{ 118, YYAT_SHIFT, 76 },
		{ 117, YYAT_SHIFT, 66 },
		{ 117, YYAT_SHIFT, 67 },
		{ 117, YYAT_SHIFT, 68 },
		{ 117, YYAT_SHIFT, 69 },
		{ 117, YYAT_SHIFT, 70 },
		{ 117, YYAT_SHIFT, 71 },
		{ 117, YYAT_SHIFT, 72 },
		{ 117, YYAT_SHIFT, 73 },
		{ 117, YYAT_SHIFT, 74 },
		{ 117, YYAT_SHIFT, 75 },
		{ 117, YYAT_SHIFT, 76 },
		{ 116, YYAT_SHIFT, 66 },
		{ 116, YYAT_SHIFT, 67 },
		{ 116, YYAT_SHIFT, 68 },
		{ 116, YYAT_SHIFT, 69 },
		{ 116, YYAT_SHIFT, 70 },
		{ 116, YYAT_SHIFT, 71 },
		{ 116, YYAT_SHIFT, 72 },
		{ 116, YYAT_SHIFT, 73 },
		{ 116, YYAT_SHIFT, 74 },
		{ 116, YYAT_SHIFT, 75 },
		{ 116, YYAT_SHIFT, 76 },
		{ 115, YYAT_SHIFT, 66 },
		{ 115, YYAT_SHIFT, 67 },
		{ 115, YYAT_SHIFT, 68 },
		{ 115, YYAT_SHIFT, 69 },
		{ 115, YYAT_SHIFT, 70 },
		{ 115, YYAT_SHIFT, 71 },
		{ 115, YYAT_SHIFT, 72 },
		{ 115, YYAT_SHIFT, 73 },
		{ 115, YYAT_SHIFT, 74 },
		{ 115, YYAT_SHIFT, 75 },
		{ 115, YYAT_SHIFT, 76 },
		{ 114, YYAT_SHIFT, 66 },
		{ 114, YYAT_SHIFT, 67 },
		{ 114, YYAT_SHIFT, 68 },
		{ 114, YYAT_SHIFT, 69 },
		{ 114, YYAT_SHIFT, 70 },
		{ 114, YYAT_SHIFT, 71 },
		{ 114, YYAT_SHIFT, 72 },
		{ 114, YYAT_SHIFT, 73 },
		{ 114, YYAT_SHIFT, 74 },
		{ 114, YYAT_SHIFT, 75 },
		{ 114, YYAT_SHIFT, 76 },
		{ 113, YYAT_SHIFT, 66 },
		{ 113, YYAT_SHIFT, 67 },
		{ 113, YYAT_SHIFT, 68 },
		{ 113, YYAT_SHIFT, 69 },
		{ 113, YYAT_SHIFT, 70 },
		{ 113, YYAT_SHIFT, 71 },
		{ 113, YYAT_SHIFT, 72 },
		{ 113, YYAT_SHIFT, 73 },
		{ 113, YYAT_SHIFT, 74 },
		{ 113, YYAT_SHIFT, 75 },
		{ 113, YYAT_SHIFT, 76 },
		{ 112, YYAT_SHIFT, 66 },
		{ 112, YYAT_SHIFT, 67 },
		{ 112, YYAT_SHIFT, 68 },
		{ 112, YYAT_SHIFT, 69 },
		{ 112, YYAT_SHIFT, 70 },
		{ 112, YYAT_SHIFT, 71 },
		{ 112, YYAT_SHIFT, 72 },
		{ 112, YYAT_SHIFT, 73 },
		{ 112, YYAT_SHIFT, 74 },
		{ 112, YYAT_SHIFT, 75 },
		{ 112, YYAT_SHIFT, 76 },
		{ 111, YYAT_SHIFT, 66 },
		{ 111, YYAT_SHIFT, 67 },
		{ 111, YYAT_SHIFT, 68 },
		{ 111, YYAT_SHIFT, 69 },
		{ 111, YYAT_SHIFT, 70 },
		{ 111, YYAT_SHIFT, 71 },
		{ 111, YYAT_SHIFT, 72 },
		{ 111, YYAT_SHIFT, 73 },
		{ 111, YYAT_SHIFT, 74 },
		{ 111, YYAT_SHIFT, 75 },
		{ 111, YYAT_SHIFT, 76 },
		{ 110, YYAT_SHIFT, 66 },
		{ 110, YYAT_SHIFT, 67 },
		{ 110, YYAT_SHIFT, 68 },
		{ 110, YYAT_SHIFT, 69 },
		{ 110, YYAT_SHIFT, 70 },
		{ 110, YYAT_SHIFT, 71 },
		{ 110, YYAT_SHIFT, 72 },
		{ 110, YYAT_SHIFT, 73 },
		{ 110, YYAT_SHIFT, 74 },
		{ 110, YYAT_SHIFT, 75 },
		{ 110, YYAT_SHIFT, 76 },
		{ 109, YYAT_SHIFT, 66 },
		{ 109, YYAT_SHIFT, 67 },
		{ 109, YYAT_SHIFT, 68 },
		{ 109, YYAT_SHIFT, 69 },
		{ 109, YYAT_SHIFT, 70 },
		{ 109, YYAT_SHIFT, 71 },
		{ 109, YYAT_SHIFT, 72 },
		{ 109, YYAT_SHIFT, 73 },
		{ 109, YYAT_SHIFT, 74 },
		{ 109, YYAT_SHIFT, 75 },
		{ 109, YYAT_SHIFT, 76 },
		{ 108, YYAT_SHIFT, 66 },
		{ 108, YYAT_SHIFT, 67 },
		{ 108, YYAT_SHIFT, 68 },
		{ 108, YYAT_SHIFT, 69 },
		{ 108, YYAT_SHIFT, 70 },
		{ 108, YYAT_SHIFT, 71 },
		{ 108, YYAT_SHIFT, 72 },
		{ 108, YYAT_SHIFT, 73 },
		{ 108, YYAT_SHIFT, 74 },
		{ 108, YYAT_SHIFT, 75 },
		{ 108, YYAT_SHIFT, 76 },
		{ 173, YYAT_SHIFT, 59 },
		{ 173, YYAT_SHIFT, 19 },
		{ 173, YYAT_SHIFT, 20 },
		{ 132, YYAT_SHIFT, 95 },
		{ 132, YYAT_SHIFT, 96 },
		{ 127, YYAT_SHIFT, 91 },
		{ 127, YYAT_SHIFT, 92 },
		{ 126, YYAT_SHIFT, 91 },
		{ 126, YYAT_SHIFT, 92 },
		{ 125, YYAT_SHIFT, 91 },
		{ 125, YYAT_SHIFT, 92 },
		{ 124, YYAT_SHIFT, 91 },
		{ 124, YYAT_SHIFT, 92 },
		{ 50, YYAT_SHIFT, 95 },
		{ 50, YYAT_SHIFT, 96 },
		{ 48, YYAT_SHIFT, 91 },
		{ 48, YYAT_SHIFT, 92 },
		{ 173, YYAT_SHIFT, 21 },
		{ 173, YYAT_SHIFT, 22 },
		{ 45, YYAT_SHIFT, 87 },
		{ 45, YYAT_SHIFT, 88 },
		{ 154, YYAT_SHIFT, 166 },
		{ 152, YYAT_SHIFT, 165 },
		{ 151, YYAT_SHIFT, 164 },
		{ 150, YYAT_SHIFT, 163 },
		{ 148, YYAT_SHIFT, 58 },
		{ 147, YYAT_ERROR, 0 },
		{ 146, YYAT_SHIFT, 161 },
		{ 142, YYAT_SHIFT, 158 },
		{ 141, YYAT_SHIFT, 157 },
		{ 140, YYAT_SHIFT, 155 },
		{ 138, YYAT_SHIFT, 89 },
		{ 130, YYAT_SHIFT, 89 },
		{ 123, YYAT_SHIFT, 97 },
		{ 119, YYAT_SHIFT, 148 },
		{ 107, YYAT_SHIFT, 82 },
		{ 104, YYAT_SHIFT, 146 },
		{ 103, YYAT_SHIFT, 145 },
		{ 102, YYAT_SHIFT, 144 },
		{ 173, YYAT_SHIFT, 24 },
		{ 173, YYAT_SHIFT, 182 },
		{ 101, YYAT_SHIFT, 143 },
		{ 100, YYAT_SHIFT, 142 },
		{ 99, YYAT_SHIFT, 140 },
		{ 98, YYAT_SHIFT, 139 },
		{ 80, YYAT_SHIFT, 122 },
		{ 62, YYAT_SHIFT, 106 },
		{ 57, YYAT_SHIFT, 103 },
		{ 56, YYAT_SHIFT, 102 },
		{ 54, YYAT_SHIFT, 99 },
		{ 52, YYAT_SHIFT, 97 },
		{ 47, YYAT_SHIFT, 90 },
		{ 46, YYAT_SHIFT, 89 },
		{ 43, YYAT_SHIFT, 82 },
		{ 37, YYAT_SHIFT, 78 },
		{ 33, YYAT_SHIFT, 77 },
		{ 30, YYAT_SHIFT, 65 },
		{ 27, YYAT_SHIFT, 64 },
		{ 18, YYAT_SHIFT, 58 },
		{ 11, YYAT_SHIFT, 57 },
		{ 10, YYAT_SHIFT, 56 },
		{ 9, YYAT_SHIFT, 55 },
		{ 8, YYAT_SHIFT, 54 },
		{ 7, YYAT_SHIFT, 53 },
		{ 3, YYAT_SHIFT, 4 },
		{ 2, YYAT_ACCEPT, 0 },
		{ 1, YYAT_SHIFT, 3 },
		{ 0, YYAT_SHIFT, 1 }
	};
	yytokenaction = tokenaction;

	static const yystateaction_t YYNEARFAR YYBASED_CODE stateaction[] = {
		{ 49, 1, YYAT_ERROR, 0 },
		{ -3, 1, YYAT_ERROR, 0 },
		{ 305, 1, YYAT_ERROR, 0 },
		{ -6, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 164 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ 0, 0, YYAT_REDUCE, 1 },
		{ -6, 1, YYAT_ERROR, 0 },
		{ -7, 1, YYAT_ERROR, 0 },
		{ -8, 1, YYAT_ERROR, 0 },
		{ -12, 1, YYAT_ERROR, 0 },
		{ -12, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 22 },
		{ 0, 0, YYAT_REDUCE, 23 },
		{ 0, 0, YYAT_REDUCE, 24 },
		{ 0, 0, YYAT_REDUCE, 25 },
		{ 0, 0, YYAT_REDUCE, 26 },
		{ 0, 0, YYAT_REDUCE, 27 },
		{ -11, 1, YYAT_REDUCE, 70 },
		{ 0, 0, YYAT_REDUCE, 71 },
		{ 0, 0, YYAT_REDUCE, 72 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_REDUCE, 16 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_REDUCE, 90 },
		{ 11, 1, YYAT_REDUCE, 41 },
		{ 0, 0, YYAT_REDUCE, 5 },
		{ 0, 0, YYAT_REDUCE, 8 },
		{ -8, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 12 },
		{ 0, 0, YYAT_REDUCE, 13 },
		{ -13, 1, YYAT_DEFAULT, 159 },
		{ 0, 0, YYAT_REDUCE, 9 },
		{ 0, 0, YYAT_REDUCE, 14 },
		{ 0, 0, YYAT_REDUCE, 11 },
		{ 24, 1, YYAT_DEFAULT, 147 },
		{ -257, 1, YYAT_REDUCE, 4 },
		{ 0, 0, YYAT_REDUCE, 6 },
		{ 0, 0, YYAT_REDUCE, 7 },
		{ 0, 0, YYAT_REDUCE, 15 },
		{ 0, 0, YYAT_REDUCE, 10 },
		{ 8, 1, YYAT_REDUCE, 43 },
		{ -177, 1, YYAT_REDUCE, 54 },
		{ -16, 1, YYAT_REDUCE, 65 },
		{ 1, 1, YYAT_REDUCE, 47 },
		{ 2, 1, YYAT_REDUCE, 49 },
		{ -56, 1, YYAT_REDUCE, 59 },
		{ -266, 1, YYAT_REDUCE, 51 },
		{ -20, 1, YYAT_REDUCE, 62 },
		{ 0, 0, YYAT_REDUCE, 68 },
		{ 0, 1, YYAT_REDUCE, 45 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ -19, 1, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 18, 1, YYAT_ERROR, 0 },
		{ 17, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_REDUCE, 70 },
		{ 0, 0, YYAT_REDUCE, 73 },
		{ 0, 0, YYAT_REDUCE, 74 },
		{ -24, 1, YYAT_DEFAULT, 183 },
		{ 0, 0, YYAT_REDUCE, 94 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_REDUCE, 2 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_REDUCE, 21 },
		{ -283, 1, YYAT_REDUCE, 70 },
		{ -200, 1, YYAT_REDUCE, 29 },
		{ -23, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 3 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ -26, 1, YYAT_DEFAULT, 183 },
		{ -25, 1, YYAT_DEFAULT, 147 },
		{ -26, 1, YYAT_DEFAULT, 159 },
		{ -29, 1, YYAT_DEFAULT, 183 },
		{ -30, 1, YYAT_ERROR, 0 },
		{ -31, 1, YYAT_ERROR, 0 },
		{ -34, 1, YYAT_ERROR, 0 },
		{ -216, 1, YYAT_REDUCE, 93 },
		{ 0, 0, YYAT_REDUCE, 69 },
		{ -10, 1, YYAT_REDUCE, 42 },
		{ -63, 1, YYAT_REDUCE, 30 },
		{ -74, 1, YYAT_REDUCE, 31 },
		{ -85, 1, YYAT_REDUCE, 32 },
		{ -96, 1, YYAT_REDUCE, 33 },
		{ -107, 1, YYAT_REDUCE, 34 },
		{ -118, 1, YYAT_REDUCE, 35 },
		{ -129, 1, YYAT_REDUCE, 36 },
		{ -140, 1, YYAT_REDUCE, 37 },
		{ -151, 1, YYAT_REDUCE, 38 },
		{ -162, 1, YYAT_REDUCE, 39 },
		{ -173, 1, YYAT_REDUCE, 40 },
		{ 4, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 165 },
		{ 0, 0, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_REDUCE, 17 },
		{ -17, 1, YYAT_REDUCE, 44 },
		{ -60, 1, YYAT_REDUCE, 57 },
		{ -62, 1, YYAT_REDUCE, 58 },
		{ -64, 1, YYAT_REDUCE, 55 },
		{ -66, 1, YYAT_REDUCE, 56 },
		{ 0, 0, YYAT_REDUCE, 66 },
		{ 0, 0, YYAT_REDUCE, 67 },
		{ -19, 1, YYAT_REDUCE, 48 },
		{ -267, 1, YYAT_REDUCE, 50 },
		{ -30, 1, YYAT_REDUCE, 60 },
		{ -201, 1, YYAT_REDUCE, 61 },
		{ -193, 1, YYAT_REDUCE, 53 },
		{ -214, 1, YYAT_REDUCE, 52 },
		{ -221, 1, YYAT_REDUCE, 63 },
		{ -247, 1, YYAT_REDUCE, 64 },
		{ -20, 1, YYAT_REDUCE, 46 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ -40, 1, YYAT_DEFAULT, 173 },
		{ -39, 1, YYAT_DEFAULT, 159 },
		{ -40, 1, YYAT_DEFAULT, 147 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ 0, 0, YYAT_REDUCE, 86 },
		{ 0, 0, YYAT_REDUCE, 87 },
		{ -41, 1, YYAT_ERROR, 0 },
		{ -44, 1, YYAT_DEFAULT, 173 },
		{ -44, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 89 },
		{ -6, 1, YYAT_ERROR, 0 },
		{ -47, 1, YYAT_ERROR, 0 },
		{ -45, 1, YYAT_REDUCE, 19 },
		{ 0, 0, YYAT_REDUCE, 28 },
		{ -54, 1, YYAT_REDUCE, 75 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ -236, 1, YYAT_DEFAULT, 183 },
		{ -246, 1, YYAT_DEFAULT, 173 },
		{ -250, 1, YYAT_DEFAULT, 173 },
		{ -283, 1, YYAT_DEFAULT, 183 },
		{ 0, 0, YYAT_REDUCE, 85 },
		{ 0, 0, YYAT_REDUCE, 91 },
		{ -184, 1, YYAT_REDUCE, 92 },
		{ 0, 0, YYAT_REDUCE, 20 },
		{ -283, 1, YYAT_ERROR, 0 },
		{ -206, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ 0, 0, YYAT_REDUCE, 84 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ -294, 1, YYAT_DEFAULT, 183 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ -309, 1, YYAT_DEFAULT, 183 },
		{ -30, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 88 },
		{ 0, 0, YYAT_REDUCE, 18 },
		{ 0, 0, YYAT_REDUCE, 76 },
		{ 0, 0, YYAT_REDUCE, 81 },
		{ 0, 0, YYAT_REDUCE, 82 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ 0, 0, YYAT_REDUCE, 83 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ 0, 0, YYAT_DEFAULT, 187 },
		{ -257, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 78 },
		{ 0, 0, YYAT_REDUCE, 79 },
		{ 0, 0, YYAT_REDUCE, 80 },
		{ -238, 1, YYAT_DEFAULT, 165 },
		{ 0, 0, YYAT_REDUCE, 77 }
	};
	yystateaction = stateaction;

	yynontermgoto_size = 95;

	static const yynontermgoto_t YYNEARFAR YYBASED_CODE nontermgoto[] = {
		{ 187, 42 },
		{ 182, 186 },
		{ 187, 188 },
		{ 187, 39 },
		{ 121, 153 },
		{ 121, 79 },
		{ 187, 28 },
		{ 187, 37 },
		{ 181, 185 },
		{ 187, 33 },
		{ 179, 184 },
		{ 58, 105 },
		{ 165, 175 },
		{ 165, 152 },
		{ 171, 180 },
		{ 165, 150 },
		{ 173, 183 },
		{ 173, 27 },
		{ 173, 43 },
		{ 96, 137 },
		{ 96, 51 },
		{ 187, 40 },
		{ 187, 34 },
		{ 187, 29 },
		{ 187, 36 },
		{ 187, 31 },
		{ 187, 32 },
		{ 187, 35 },
		{ 187, 26 },
		{ 169, 178 },
		{ 187, 41 },
		{ 58, 104 },
		{ 97, 138 },
		{ 97, 47 },
		{ 97, 49 },
		{ 94, 135 },
		{ 94, 48 },
		{ 94, 50 },
		{ 92, 133 },
		{ 92, 45 },
		{ 90, 131 },
		{ 90, 44 },
		{ 86, -1 },
		{ 86, 127 },
		{ 82, 123 },
		{ 82, 46 },
		{ 64, 107 },
		{ 64, 52 },
		{ 38, 81 },
		{ 38, 38 },
		{ 168, 177 },
		{ 166, 176 },
		{ 164, 174 },
		{ 158, 172 },
		{ 157, 170 },
		{ 155, 167 },
		{ 147, 162 },
		{ 143, 160 },
		{ 142, 159 },
		{ 140, 156 },
		{ 139, 154 },
		{ 120, 151 },
		{ 119, 149 },
		{ 99, 141 },
		{ 95, 136 },
		{ 93, 134 },
		{ 91, 132 },
		{ 89, 130 },
		{ 88, 129 },
		{ 87, 128 },
		{ 85, 126 },
		{ 84, 125 },
		{ 83, 124 },
		{ 76, 118 },
		{ 75, 117 },
		{ 74, 116 },
		{ 73, 115 },
		{ 72, 114 },
		{ 71, 113 },
		{ 70, 112 },
		{ 69, 111 },
		{ 68, 110 },
		{ 67, 109 },
		{ 66, 108 },
		{ 55, 101 },
		{ 54, 100 },
		{ 53, 98 },
		{ 37, 80 },
		{ 25, 63 },
		{ 24, 62 },
		{ 22, 61 },
		{ 21, 60 },
		{ 5, 30 },
		{ 4, 6 },
		{ 0, 2 }
	};
	yynontermgoto = nontermgoto;

	static const yystategoto_t YYNEARFAR YYBASED_CODE stategoto[] = {
		{ 93, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 91, -1 },
		{ 89, 38 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 69, -1 },
		{ 68, -1 },
		{ 0, -1 },
		{ 78, 173 },
		{ 66, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 77, 121 },
		{ 45, 187 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 75, 173 },
		{ 74, 173 },
		{ 73, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 33, 82 },
		{ 0, -1 },
		{ 72, 173 },
		{ 71, 173 },
		{ 70, 173 },
		{ 69, 173 },
		{ 68, 173 },
		{ 67, 173 },
		{ 66, 173 },
		{ 65, 173 },
		{ 64, 173 },
		{ 63, 173 },
		{ 62, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 30, 97 },
		{ 53, 86 },
		{ 52, 86 },
		{ 51, 86 },
		{ 24, 94 },
		{ 47, -1 },
		{ 46, -1 },
		{ 52, 97 },
		{ 23, 94 },
		{ 46, 92 },
		{ 18, 96 },
		{ 47, 94 },
		{ 17, 92 },
		{ 43, 96 },
		{ -2, -1 },
		{ 17, 90 },
		{ 0, -1 },
		{ 52, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 32, -1 },
		{ 55, 165 },
		{ -6, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 56, 187 },
		{ 48, 173 },
		{ 0, -1 },
		{ 47, 173 },
		{ 53, 187 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 45, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 51, 187 },
		{ 0, -1 },
		{ 43, 173 },
		{ 42, 173 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 50, -1 },
		{ 6, -1 },
		{ 47, 187 },
		{ 0, -1 },
		{ 46, 187 },
		{ 25, 187 },
		{ 0, -1 },
		{ 10, 187 },
		{ 0, -1 },
		{ 5, 64 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 6, 187 },
		{ 0, -1 },
		{ 4, 187 },
		{ -3, 187 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ -2, 173 },
		{ 0, -1 }
	};
	yystategoto = stategoto;

	yydestructorptr = NULL;

	yytokendestptr = NULL;
	yytokendest_size = 0;

	yytokendestbaseptr = NULL;
	yytokendestbase_size = 0;
}
#line 267 ".\\parser.y"

void parser::display(struct TreeNode* root) //从根display
{
 struct TreeNode *temp=(TreeNode*)malloc(sizeof(TreeNode));
 for(int i=0;i<MAXCHILDREN;i++)
 {
   if(root->child[i]!=NULL)
     display(root->child[i]);//从孩子节点开始向上
 }
 shownode(root);    //叶节点
 temp=root->sibling;   //找兄弟节点
 if(temp!=NULL)     //如果有兄弟节点
 {
   display(temp);    //display
 }
 return;
}
void parser::shownode(struct TreeNode* node)
{
  struct TreeNode* temp=(struct TreeNode*)malloc(sizeof(TreeNode));
  if(node->stmttype==10)
	return ;
  node->lineno=NUM++;
  cout<<node->lineno<<":";//输出行号
  out<<node->lineno<<":";
  switch(node->nodetype)
  {
   case Stmt:
   {  //排序必须和上面enum一致
     string names[11]={"if statement,",  "while statement," , "for statement," , "compound statement,","input statement,","output statement,","fnction statement","return statement","expression fuction" ,"function asked",""};
     cout<<names[node->stmttype]<<"\t\t\t";
     out<<names[node->stmttype]<<"\t\t\t";
     break;
   }
   case Expr:
   {
     string names[4]={"Expr," , "Const Declaration,", "ID Declaration,","Type Specifier," };
     string types[6]={"integer, ","char, ","void, ","bool, ","float, ","double, "};
     cout<<names[node->exprtype]<<'\t';
     out<<names[node->exprtype]<<'\t';
     switch(node->exprtype)
     {
      case Op:
      {
        switch(node->attr.op)
        {
          case ADD:
          {
            cout<<'\t'<<"op:+\t\t";
            out<<'\t'<<"op:+\t\t";
            break;
          }
          case SUB:
          {
            cout<<'\t'<<"op:-\t\t";
            out<<'\t'<<"op:-\t\t";
            break;
          }
          case MUL:
          {
            cout<<'\t'<<"op:*\t\t";
            out<<'\t'<<"op:*\t\t";
            break;
          }
          case DIV:
          {
            cout<<'\t'<<"op:/\t\t";
            out<<'\t'<<"op:/\t\t";
            break;
          }
          case MOD:
          {
            cout<<'\t'<<"op:%\t\t";
            out<<'\t'<<"op:%\t\t";
            break;
          }
          case INC:
          {
            cout<<'\t'<<"op:++\t\t";
            out<<'\t'<<"op:++\t\t";
            break;
          }
          case DEC:
          {
            cout<<'\t'<<"op:--\t\t";
            out<<'\t'<<"op:--\t\t";
            break;
          }
          case LT:
          {
            cout<<'\t'<<"op:<\t\t";
            out<<'\t'<<"op:<\t\t";
            break;
          }
          case GT:
          {
            cout<<'\t'<<"op:>\t\t";
            out<<'\t'<<"op:>\t\t";
            break;
          }
          case LE:
          {
            cout<<'\t'<<"op:<=\t\t";
            out<<'\t'<<"op:<=\t\t";
            break;
          }
          case GE:
          {
            cout<<'\t'<<"op:>=\t\t";
            out<<'\t'<<"op:>=\t\t";
            break;
          }
          case EQ:
          {
            cout<<'\t'<<"op:==\t\t";
            out<<'\t'<<"op:==\t\t";
            break;
          }
          case ASSIGN:
          {
            cout<<'\t'<<"op:=\t\t";
            out<<'\t'<<"op:=\t\t";
            break;
          }
          case ADDASS:
          {
			cout<<'\t'<<"op:+=\t\t";
			out<<'\t'<<"op:+=\t\t";
			break;			
          }
          case SUBASS:
          {
			cout<<'\t'<<"op:-=\t\t";
			out<<'\t'<<"op:-=\t\t";
			break;			
          }
          case MULASS:
          {
			cout<<'\t'<<"op:*=\t\t";
			out<<'\t'<<"op:*=\t\t";
			break;			
          }
          case DIVASS:
          {
			cout<<'\t'<<"op:/=\t\t";
			out<<'\t'<<"op:/=\t\t";
			break;			
          }
          case MODASS:
          {
			cout<<'\t'<<"op:%=\t\t";
			out<<'\t'<<"op:%=\t\t";
			break;			
          }
          case ANDASS:
          {
			cout<<'\t'<<"op:&=\t\t";
			out<<'\t'<<"op:&=\t\t";
			break;			
          }
          case ORASS:
          {
			cout<<'\t'<<"op:|=\t\t";
			out<<'\t'<<"op:|=\t\t";
			break;			
          }
          case XORASS:
          {
			cout<<'\t'<<"op:^=\t\t";
			out<<'\t'<<"op:^=\t\t";
			break;			
          }
          case SHLASS:
          {
			cout<<'\t'<<"op:<<=\t\t";
			out<<'\t'<<"op:<<=\t\t";
			break;			
          }
          case SHRASS:
          {
			cout<<'\t'<<"op:>>=\t\t";
			out<<'\t'<<"op:>>=\t\t";
			break;			
          }
          case NE:
          {
            cout<<'\t'<<"op:!=\t\t";
            out<<'\t'<<"op:!=\t\t";
            break;
          }
          case SHL:
          {
            cout<<'\t'<<"op:<<\t\t";
            out<<'\t'<<"op:<<\t\t";
            break;
          }
           case SHR:
          {
            cout<<'\t'<<"op:>>\t\t";
            out<<'\t'<<"op:>>\t\t";
            break;
          }
          case NOT:
          {
            cout<<'\t'<<"op:!\t\t";
            out<<'\t'<<"op:!\t\t";
            break;
          }
          case OR:
          {
            cout<<'\t'<<"op:||\t\t";
            out<<'\t'<<"op:||\t\t";
            break;
          }
          case AND:
          {
            cout<<'\t'<<"op:&&\t\t";
            out<<'\t'<<"op:&&\t\t";
            break;
          }
          case BAND:
          {
            cout<<'\t'<<"op:&\t\t";
            out<<'\t'<<"op:&\t\t";
            break;
          }
          case BOR:
          {
            cout<<'\t'<<"op:|\t\t";
            out<<'\t'<<"op:|\t\t";
            break;
          }
          case XOR:
          {
            cout<<'\t'<<"op:^\t\t";
            out<<'\t'<<"op:^\t\t";
            break;
          }
          case BNOT:
          {
            cout<<'\t'<<"op:~\t\t";
            out<<'\t'<<"op:~\t\t";
            break;
          }
        }
          break;
       }
        case Const:
        {
		  if(node->attr.val>10000000)//判断输出number还是charval
			{cout<<"value:"<<node->attr.charvalue<<"\t\t";  
			out<<"value:"<<node->attr.charvalue<<"\t\t";}
		  else
			{cout<<"value:"<<node->attr.val<<"\t\t";
			out<<"value:"<<node->attr.val<<"\t\t";}
          break;
        }
        case Idk:
        {
          cout<<"symbol:"<<node->attr.symbol<<'\t';
          out<<"symbol:"<<node->attr.symbol<<'\t';
          break;
        }
        case Type:
        {
          cout<<types[node->type]<<"\t";
          out<<types[node->type]<<"\t";
          break;
        }
      }
      break;
     }
     case Decl:
     {
       string names[2]={"Var Declaration, ", "Fuc Declaration"};
       cout<<names[node->dectype]<<"\t\t\t";
       out<<names[node->dectype]<<"\t\t\t";
       break;
     }
   } 
   cout<<"children:";
   out<<"children:";
   for(int i=0;i<MAXCHILDREN;i++)
   {
     if(node->child[i]!=NULL)
     {
       cout<<node->child[i]->lineno<<" "; //和上面一样先找孩子如果有兄弟则显示兄弟！
       out<<node->child[i]->lineno<<" ";
       temp=node->child[i]->sibling;      //最开始给找成自己的sibling了所以显示总是有问题
       while(temp!=NULL)
       {
        cout<<temp->lineno<<" ";
        out<<temp->lineno<<" ";
        temp=temp->sibling; 
       }
     }
   }
   cout<<endl;
   out<<endl;
   return;
}
int main(void)
{
	int n = 1;
	lexer lexer;
	parser parser;
	ifstream in("a.txt"); 
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			lexer.yyin=&in;
			cout<<"Symbol Table:"<<endl;
			n = parser.yyparse();
		}
	}
	in.close();
	out.close();
	return n;
}


