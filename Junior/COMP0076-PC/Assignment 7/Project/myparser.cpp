/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 94 of your 30 day trial period.
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
* myparser.cpp
* C++ source file generated from myparser.y.
* 
* Date: 12/19/19
* Time: 20:34:12
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

#line 1 ".\\myparser.y"

/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Zcf 1712991

Date: 2019Äê12ÔÂ3ÈÕ
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

#line 59 "myparser.cpp"
// repeated because of possible precompiled header
#include <yycpars.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\myparser.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYPARSERNAME::YYPARSERNAME()
{
	yytables();
#line 34 ".\\myparser.y"

	// place any extra initialisation code here

#line 83 "myparser.cpp"
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYPARSERNAME::~YYPARSERNAME()
{
	// allows virtual functions to be called properly for correct cleanup
	yydestroy();
#line 39 ".\\myparser.y"

	// place any extra cleanup code here

#line 97 "myparser.cpp"
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
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 74 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);root=(*(YYSTYPE YYFAR*)yyvalptr);
			typeCheck(root);
			Display(root);
		
#line 210 "myparser.cpp"
			}
		}
		break;
	case 1:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 79 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 223 "myparser.cpp"
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
#line 81 ".\\myparser.y"
yyattribute(1 - 2)->sibling=yyattribute(2 - 2);(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);
#line 236 "myparser.cpp"
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
#line 82 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 249 "myparser.cpp"
			}
		}
		break;
	case 4:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 86 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Func);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(4 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(6 - 6);
#line 262 "myparser.cpp"
			}
		}
		break;
	case 5:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 88 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Func);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(5 - 5);
#line 275 "myparser.cpp"
			}
		}
		break;
	case 6:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 89 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Main);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(4 - 4);
#line 288 "myparser.cpp"
			}
		}
		break;
	case 7:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 90 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Main);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(5 - 5);
#line 301 "myparser.cpp"
			}
		}
		break;
	case 8:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 91 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Main);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(5 - 5);
#line 314 "myparser.cpp"
			}
		}
		break;
	case 9:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 93 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Var);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(4 - 4);
#line 327 "myparser.cpp"
			}
		}
		break;
	case 10:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 94 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Var);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 2);
#line 340 "myparser.cpp"
			}
		}
		break;
	case 11:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 96 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(Block);(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = yyattribute(2 - 3);
#line 353 "myparser.cpp"
			}
		}
		break;
	case 12:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 97 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(Block);
#line 366 "myparser.cpp"
			}
		}
		break;
	case 13:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 99 ".\\myparser.y"
yyattribute(1 - 2)->sibling=yyattribute(2 - 2);(*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 2);
#line 379 "myparser.cpp"
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
#line 100 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 392 "myparser.cpp"
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
#line 102 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 405 "myparser.cpp"
			}
		}
		break;
	case 16:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 103 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 2);
#line 418 "myparser.cpp"
			}
		}
		break;
	case 17:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 104 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 431 "myparser.cpp"
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
#line 105 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 444 "myparser.cpp"
			}
		}
		break;
	case 19:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 106 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 457 "myparser.cpp"
			}
		}
		break;
	case 20:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 107 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 470 "myparser.cpp"
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
#line 108 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 483 "myparser.cpp"
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
#line 109 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 496 "myparser.cpp"
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
#line 110 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = yyattribute(1 - 1);
#line 509 "myparser.cpp"
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
#line 112 ".\\myparser.y"

#line 522 "myparser.cpp"
			}
		}
		break;
	case 25:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 114 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr)=newDeclNode(Var);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 3);
#line 535 "myparser.cpp"
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
#line 116 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Int;
#line 548 "myparser.cpp"
			}
		}
		break;
	case 27:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 117 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Char;
#line 561 "myparser.cpp"
			}
		}
		break;
	case 28:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 118 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Void;
#line 574 "myparser.cpp"
			}
		}
		break;
	case 29:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 119 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Bool;
#line 587 "myparser.cpp"
			}
		}
		break;
	case 30:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 120 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Float;
#line 600 "myparser.cpp"
			}
		}
		break;
	case 31:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 121 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Type);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Double;
#line 613 "myparser.cpp"
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
#line 123 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(3 - 3);
#line 626 "myparser.cpp"
			}
		}
		break;
	case 33:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 124 ".\\myparser.y"
 (*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 639 "myparser.cpp"
			}
		}
		break;
	case 34:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 126 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 652 "myparser.cpp"
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
#line 128 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ASSIGN;
#line 665 "myparser.cpp"
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
#line 129 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ASSIGN;
#line 678 "myparser.cpp"
			}
		}
		break;
	case 37:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 130 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 691 "myparser.cpp"
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
#line 132 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=OR;
#line 704 "myparser.cpp"
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
#line 133 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 717 "myparser.cpp"
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
#line 135 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=AND;
#line 730 "myparser.cpp"
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
#line 136 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 743 "myparser.cpp"
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
#line 138 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=BOR;
#line 756 "myparser.cpp"
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
#line 139 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 769 "myparser.cpp"
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
#line 141 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=XOR;
#line 782 "myparser.cpp"
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
#line 142 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 795 "myparser.cpp"
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
#line 144 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=BAND;
#line 808 "myparser.cpp"
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
#line 145 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 821 "myparser.cpp"
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
#line 147 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=EQ;
#line 834 "myparser.cpp"
			}
		}
		break;
	case 49:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 148 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=NE;
#line 847 "myparser.cpp"
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
#line 149 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=GE;
#line 860 "myparser.cpp"
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
#line 150 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=LE;
#line 873 "myparser.cpp"
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
#line 151 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=GT;
#line 886 "myparser.cpp"
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
#line 152 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=LT;
#line 899 "myparser.cpp"
			}
		}
		break;
	case 54:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 153 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 912 "myparser.cpp"
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
#line 155 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SHL;
#line 925 "myparser.cpp"
			}
		}
		break;
	case 56:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 156 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SHR;
#line 938 "myparser.cpp"
			}
		}
		break;
	case 57:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 157 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 951 "myparser.cpp"
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
#line 159 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=ADD;
#line 964 "myparser.cpp"
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
#line 160 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=SUB;
#line 977 "myparser.cpp"
			}
		}
		break;
	case 60:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 161 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 990 "myparser.cpp"
			}
		}
		break;
	case 61:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 163 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=MUL;
#line 1003 "myparser.cpp"
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
#line 164 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=DIV;
#line 1016 "myparser.cpp"
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
#line 165 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=MOD;
#line 1029 "myparser.cpp"
			}
		}
		break;
	case 64:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 166 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=INC;
#line 1042 "myparser.cpp"
			}
		}
		break;
	case 65:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 167 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=DEC;
#line 1055 "myparser.cpp"
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
#line 168 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1068 "myparser.cpp"
			}
		}
		break;
	case 67:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 170 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(2 - 3);
#line 1081 "myparser.cpp"
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
#line 171 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1094 "myparser.cpp"
			}
		}
		break;
	case 69:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 172 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1107 "myparser.cpp"
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
#line 173 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=NOT;
#line 1120 "myparser.cpp"
			}
		}
		break;
	case 71:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 174 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Op);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->attr.op=OPPSITE;
#line 1133 "myparser.cpp"
			}
		}
		break;
	case 72:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 175 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1146 "myparser.cpp"
			}
		}
		break;
	case 73:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 176 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Const);(*(YYSTYPE YYFAR*)yyvalptr)->varType=Void;(*(YYSTYPE YYFAR*)yyvalptr)->attr.value=0;
#line 1159 "myparser.cpp"
			}
		}
		break;
	case 74:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 177 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1172 "myparser.cpp"
			}
		}
		break;
	case 75:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 178 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1185 "myparser.cpp"
			}
		}
		break;
	case 76:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 181 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Array);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->attr.id=yyattribute(1 - 4)->attr.id;
#line 1198 "myparser.cpp"
			}
		}
		break;
	case 77:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 184 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Funcs);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 4);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 4);
#line 1211 "myparser.cpp"
			}
		}
		break;
	case 78:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 185 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newExprNode(Funcs);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);
#line 1224 "myparser.cpp"
			}
		}
		break;
	case 79:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 187 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(If);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);
#line 1237 "myparser.cpp"
			}
		}
		break;
	case 80:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 188 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(If);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 7);
#line 1250 "myparser.cpp"
			}
		}
		break;
	case 81:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[10];
			yyinitdebug((void YYFAR**)yya, 10);
#endif
			{
#line 190 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(9 - 9);
#line 1263 "myparser.cpp"
			}
		}
		break;
	case 82:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 191 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(4 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(7 - 7);
#line 1276 "myparser.cpp"
			}
		}
		break;
	case 83:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 192 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(7 - 7);
#line 1289 "myparser.cpp"
			}
		}
		break;
	case 84:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 193 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(7 - 7);
#line 1302 "myparser.cpp"
			}
		}
		break;
	case 85:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 194 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(8 - 8);
#line 1315 "myparser.cpp"
			}
		}
		break;
	case 86:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 195 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(6 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(8 - 8);
#line 1328 "myparser.cpp"
			}
		}
		break;
	case 87:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 196 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(4 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(6 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(8 - 8);
#line 1341 "myparser.cpp"
			}
		}
		break;
	case 88:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 197 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(For);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(6 - 6);
#line 1354 "myparser.cpp"
			}
		}
		break;
	case 89:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 199 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(While);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);
#line 1367 "myparser.cpp"
			}
		}
		break;
	case 90:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 201 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Input);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 4);
#line 1380 "myparser.cpp"
			}
		}
		break;
	case 91:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 203 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Output);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 4);
#line 1393 "myparser.cpp"
			}
		}
		break;
	case 92:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 205 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(Return);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 3);
#line 1406 "myparser.cpp"
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
		{ "INT", 257 },
		{ "CHAR", 258 },
		{ "VOID", 259 },
		{ "BOOL", 260 },
		{ "FLOAT", 261 },
		{ "DOUBLE", 262 },
		{ "IF", 263 },
		{ "ELSE", 264 },
		{ "WHILE", 265 },
		{ "FOR", 266 },
		{ "RETURN", 267 },
		{ "ASSIGN", 268 },
		{ "ADD", 269 },
		{ "SUB", 270 },
		{ "MUL", 271 },
		{ "DIV", 272 },
		{ "MOD", 273 },
		{ "INC", 274 },
		{ "DEC", 275 },
		{ "SHL", 276 },
		{ "SHR", 277 },
		{ "BAND", 278 },
		{ "BOR", 279 },
		{ "XOR", 280 },
		{ "NOT", 281 },
		{ "EQ", 282 },
		{ "GT", 283 },
		{ "LT", 284 },
		{ "GE", 285 },
		{ "LE", 286 },
		{ "NE", 287 },
		{ "AND", 288 },
		{ "OR", 289 },
		{ "OPPSITE", 290 },
		{ "LB", 291 },
		{ "RB", 292 },
		{ "LP", 293 },
		{ "RP", 294 },
		{ "LSP", 295 },
		{ "RSP", 296 },
		{ "SEMI", 297 },
		{ "COMMA", 298 },
		{ "ID", 299 },
		{ "NUMBER", 300 },
		{ "MAIN", 301 },
		{ "CIN", 302 },
		{ "COUT", 303 },
		{ "CHARVAL", 304 },
		{ "ENDL", 305 },
		{ NULL, 0 }
	};
	yysymbol = symbol;

	static const char* const YYNEARFAR YYBASED_CODE rule[] = {
		"$accept: start",
		"start: codes",
		"codes: funs",
		"funs: fun_decl funs",
		"funs: fun_decl",
		"fun_decl: vartype ID LP args RP comp_stmt",
		"fun_decl: vartype ID LP RP comp_stmt",
		"fun_decl: MAIN LP RP comp_stmt",
		"fun_decl: VOID MAIN LP RP comp_stmt",
		"fun_decl: INT MAIN LP RP comp_stmt",
		"args: vartype ID COMMA args",
		"args: vartype ID",
		"comp_stmt: LB stmts RB",
		"comp_stmt: LB RB",
		"stmts: stmt stmts",
		"stmts: stmt",
		"stmt: comp_stmt",
		"stmt: expr SEMI",
		"stmt: varstmt",
		"stmt: ifstmt",
		"stmt: whilestmt",
		"stmt: forstmt",
		"stmt: returnstmt",
		"stmt: inputstmt",
		"stmt: outputstmt",
		"stmt: SEMI",
		"varstmt: vartype idlist SEMI",
		"vartype: INT",
		"vartype: CHAR",
		"vartype: VOID",
		"vartype: BOOL",
		"vartype: FLOAT",
		"vartype: DOUBLE",
		"idlist: expr COMMA idlist",
		"idlist: expr",
		"expr: assign_expr",
		"assign_expr: ID ASSIGN expr",
		"assign_expr: array ASSIGN expr",
		"assign_expr: or_expr",
		"or_expr: or_expr OR and_expr",
		"or_expr: and_expr",
		"and_expr: and_expr AND bor_expr",
		"and_expr: bor_expr",
		"bor_expr: bor_expr BOR xor_expr",
		"bor_expr: xor_expr",
		"xor_expr: xor_expr XOR band_expr",
		"xor_expr: band_expr",
		"band_expr: band_expr BAND equal_expr",
		"band_expr: equal_expr",
		"equal_expr: equal_expr EQ sh_expr",
		"equal_expr: equal_expr NE sh_expr",
		"equal_expr: equal_expr GE sh_expr",
		"equal_expr: equal_expr LE sh_expr",
		"equal_expr: equal_expr GT sh_expr",
		"equal_expr: equal_expr LT sh_expr",
		"equal_expr: sh_expr",
		"sh_expr: sh_expr SHL simp_expr",
		"sh_expr: sh_expr SHR simp_expr",
		"sh_expr: simp_expr",
		"simp_expr: simp_expr ADD simp_expr2",
		"simp_expr: simp_expr SUB simp_expr2",
		"simp_expr: simp_expr2",
		"simp_expr2: simp_expr2 MUL term",
		"simp_expr2: simp_expr2 DIV term",
		"simp_expr2: simp_expr2 MOD term",
		"simp_expr2: simp_expr2 INC",
		"simp_expr2: simp_expr2 DEC",
		"simp_expr2: term",
		"term: LP expr RP",
		"term: ID",
		"term: NUMBER",
		"term: NOT term",
		"term: OPPSITE term",
		"term: CHARVAL",
		"term: ENDL",
		"term: array",
		"term: func_call",
		"array: ID LSP expr RSP",
		"func_call: ID LP idlist RP",
		"func_call: ID LP RP",
		"ifstmt: IF LP expr RP stmt",
		"ifstmt: IF LP expr RP stmt ELSE stmt",
		"forstmt: FOR LP expr SEMI expr SEMI expr RP stmt",
		"forstmt: FOR LP SEMI expr SEMI RP stmt",
		"forstmt: FOR LP expr SEMI SEMI RP stmt",
		"forstmt: FOR LP SEMI SEMI expr RP stmt",
		"forstmt: FOR LP expr SEMI expr SEMI RP stmt",
		"forstmt: FOR LP expr SEMI SEMI expr RP stmt",
		"forstmt: FOR LP SEMI expr SEMI expr RP stmt",
		"forstmt: FOR LP SEMI SEMI RP stmt",
		"whilestmt: WHILE LP expr RP stmt",
		"inputstmt: CIN SHR expr SEMI",
		"outputstmt: COUT SHL expr SEMI",
		"returnstmt: RETURN expr SEMI"
	};
	yyrule = rule;
#endif

	static const yyreduction_t YYNEARFAR YYBASED_CODE reduction[] = {
		{ 0, 1, -1 },
		{ 1, 1, 0 },
		{ 2, 1, 1 },
		{ 3, 2, 2 },
		{ 3, 1, 3 },
		{ 4, 6, 4 },
		{ 4, 5, 5 },
		{ 4, 4, 6 },
		{ 4, 5, 7 },
		{ 4, 5, 8 },
		{ 5, 4, 9 },
		{ 5, 2, 10 },
		{ 6, 3, 11 },
		{ 6, 2, 12 },
		{ 7, 2, 13 },
		{ 7, 1, 14 },
		{ 8, 1, 15 },
		{ 8, 2, 16 },
		{ 8, 1, 17 },
		{ 8, 1, 18 },
		{ 8, 1, 19 },
		{ 8, 1, 20 },
		{ 8, 1, 21 },
		{ 8, 1, 22 },
		{ 8, 1, 23 },
		{ 8, 1, 24 },
		{ 9, 3, 25 },
		{ 10, 1, 26 },
		{ 10, 1, 27 },
		{ 10, 1, 28 },
		{ 10, 1, 29 },
		{ 10, 1, 30 },
		{ 10, 1, 31 },
		{ 11, 3, 32 },
		{ 11, 1, 33 },
		{ 12, 1, 34 },
		{ 13, 3, 35 },
		{ 13, 3, 36 },
		{ 13, 1, 37 },
		{ 14, 3, 38 },
		{ 14, 1, 39 },
		{ 15, 3, 40 },
		{ 15, 1, 41 },
		{ 16, 3, 42 },
		{ 16, 1, 43 },
		{ 17, 3, 44 },
		{ 17, 1, 45 },
		{ 18, 3, 46 },
		{ 18, 1, 47 },
		{ 19, 3, 48 },
		{ 19, 3, 49 },
		{ 19, 3, 50 },
		{ 19, 3, 51 },
		{ 19, 3, 52 },
		{ 19, 3, 53 },
		{ 19, 1, 54 },
		{ 20, 3, 55 },
		{ 20, 3, 56 },
		{ 20, 1, 57 },
		{ 21, 3, 58 },
		{ 21, 3, 59 },
		{ 21, 1, 60 },
		{ 22, 3, 61 },
		{ 22, 3, 62 },
		{ 22, 3, 63 },
		{ 22, 2, 64 },
		{ 22, 2, 65 },
		{ 22, 1, 66 },
		{ 23, 3, 67 },
		{ 23, 1, 68 },
		{ 23, 1, 69 },
		{ 23, 2, 70 },
		{ 23, 2, 71 },
		{ 23, 1, 72 },
		{ 23, 1, 73 },
		{ 23, 1, 74 },
		{ 23, 1, 75 },
		{ 24, 4, 76 },
		{ 25, 4, 77 },
		{ 25, 3, 78 },
		{ 26, 5, 79 },
		{ 26, 7, 80 },
		{ 27, 9, 81 },
		{ 27, 7, 82 },
		{ 27, 7, 83 },
		{ 27, 7, 84 },
		{ 27, 8, 85 },
		{ 27, 8, 86 },
		{ 27, 8, 87 },
		{ 27, 6, 88 },
		{ 28, 5, 89 },
		{ 29, 4, 90 },
		{ 30, 4, 91 },
		{ 31, 3, 92 }
	};
	yyreduction = reduction;

	yytokenaction_size = 172;

	static const yytokenaction_t YYNEARFAR YYBASED_CODE tokenaction[] = {
		{ 52, YYAT_SHIFT, 26 },
		{ 52, YYAT_SHIFT, 2 },
		{ 52, YYAT_SHIFT, 27 },
		{ 52, YYAT_SHIFT, 4 },
		{ 52, YYAT_SHIFT, 5 },
		{ 52, YYAT_SHIFT, 6 },
		{ 52, YYAT_SHIFT, 33 },
		{ 184, YYAT_SHIFT, 188 },
		{ 52, YYAT_SHIFT, 34 },
		{ 52, YYAT_SHIFT, 35 },
		{ 52, YYAT_SHIFT, 36 },
		{ 8, YYAT_SHIFT, 1 },
		{ 8, YYAT_SHIFT, 2 },
		{ 8, YYAT_SHIFT, 3 },
		{ 8, YYAT_SHIFT, 4 },
		{ 8, YYAT_SHIFT, 5 },
		{ 8, YYAT_SHIFT, 6 },
		{ 188, YYAT_SHIFT, 26 },
		{ 188, YYAT_SHIFT, 2 },
		{ 188, YYAT_SHIFT, 27 },
		{ 188, YYAT_SHIFT, 4 },
		{ 188, YYAT_SHIFT, 5 },
		{ 188, YYAT_SHIFT, 6 },
		{ 188, YYAT_SHIFT, 33 },
		{ 52, YYAT_SHIFT, 37 },
		{ 188, YYAT_SHIFT, 34 },
		{ 188, YYAT_SHIFT, 35 },
		{ 188, YYAT_SHIFT, 36 },
		{ 0, YYAT_SHIFT, 1 },
		{ 175, YYAT_SHIFT, 182 },
		{ 0, YYAT_SHIFT, 3 },
		{ 42, YYAT_SHIFT, 85 },
		{ 173, YYAT_SHIFT, 180 },
		{ 52, YYAT_SHIFT, 38 },
		{ 52, YYAT_SHIFT, 24 },
		{ 80, YYAT_SHIFT, 86 },
		{ 52, YYAT_SHIFT, 40 },
		{ 80, YYAT_SHIFT, 87 },
		{ 146, YYAT_SHIFT, 112 },
		{ 146, YYAT_SHIFT, 113 },
		{ 52, YYAT_SHIFT, 41 },
		{ 176, YYAT_SHIFT, 37 },
		{ 52, YYAT_SHIFT, 42 },
		{ 52, YYAT_SHIFT, 43 },
		{ 168, YYAT_SHIFT, 176 },
		{ 52, YYAT_SHIFT, 44 },
		{ 52, YYAT_SHIFT, 45 },
		{ 52, YYAT_SHIFT, 46 },
		{ 52, YYAT_SHIFT, 47 },
		{ 167, YYAT_SHIFT, 174 },
		{ 176, YYAT_SHIFT, 38 },
		{ 188, YYAT_SHIFT, 24 },
		{ 166, YYAT_SHIFT, 172 },
		{ 176, YYAT_SHIFT, 40 },
		{ 176, YYAT_SHIFT, 183 },
		{ 8, YYAT_SHIFT, 7 },
		{ 42, YYAT_SHIFT, 86 },
		{ 188, YYAT_SHIFT, 41 },
		{ 42, YYAT_SHIFT, 87 },
		{ 176, YYAT_SHIFT, 42 },
		{ 176, YYAT_SHIFT, 43 },
		{ 165, YYAT_SHIFT, 171 },
		{ 188, YYAT_SHIFT, 44 },
		{ 188, YYAT_SHIFT, 45 },
		{ 176, YYAT_SHIFT, 46 },
		{ 176, YYAT_SHIFT, 47 },
		{ 140, YYAT_SHIFT, 92 },
		{ 140, YYAT_SHIFT, 93 },
		{ 140, YYAT_SHIFT, 94 },
		{ 140, YYAT_SHIFT, 95 },
		{ 140, YYAT_SHIFT, 96 },
		{ 140, YYAT_SHIFT, 97 },
		{ 0, YYAT_SHIFT, 7 },
		{ 116, YYAT_SHIFT, 26 },
		{ 116, YYAT_SHIFT, 2 },
		{ 116, YYAT_SHIFT, 27 },
		{ 116, YYAT_SHIFT, 4 },
		{ 116, YYAT_SHIFT, 5 },
		{ 116, YYAT_SHIFT, 6 },
		{ 51, YYAT_SHIFT, 92 },
		{ 51, YYAT_SHIFT, 93 },
		{ 51, YYAT_SHIFT, 94 },
		{ 51, YYAT_SHIFT, 95 },
		{ 51, YYAT_SHIFT, 96 },
		{ 51, YYAT_SHIFT, 97 },
		{ 148, YYAT_SHIFT, 105 },
		{ 148, YYAT_SHIFT, 106 },
		{ 148, YYAT_SHIFT, 107 },
		{ 148, YYAT_SHIFT, 108 },
		{ 148, YYAT_SHIFT, 109 },
		{ 147, YYAT_SHIFT, 105 },
		{ 147, YYAT_SHIFT, 106 },
		{ 147, YYAT_SHIFT, 107 },
		{ 147, YYAT_SHIFT, 108 },
		{ 147, YYAT_SHIFT, 109 },
		{ 67, YYAT_SHIFT, 105 },
		{ 67, YYAT_SHIFT, 106 },
		{ 67, YYAT_SHIFT, 107 },
		{ 67, YYAT_SHIFT, 108 },
		{ 67, YYAT_SHIFT, 109 },
		{ 145, YYAT_SHIFT, 112 },
		{ 145, YYAT_SHIFT, 113 },
		{ 137, YYAT_SHIFT, 110 },
		{ 137, YYAT_SHIFT, 111 },
		{ 136, YYAT_SHIFT, 110 },
		{ 136, YYAT_SHIFT, 111 },
		{ 135, YYAT_SHIFT, 110 },
		{ 135, YYAT_SHIFT, 111 },
		{ 134, YYAT_SHIFT, 110 },
		{ 134, YYAT_SHIFT, 111 },
		{ 133, YYAT_SHIFT, 110 },
		{ 133, YYAT_SHIFT, 111 },
		{ 132, YYAT_SHIFT, 110 },
		{ 132, YYAT_SHIFT, 111 },
		{ 69, YYAT_SHIFT, 112 },
		{ 69, YYAT_SHIFT, 113 },
		{ 68, YYAT_SHIFT, 110 },
		{ 68, YYAT_SHIFT, 111 },
		{ 162, YYAT_SHIFT, 169 },
		{ 156, YYAT_SHIFT, 167 },
		{ 155, YYAT_SHIFT, 166 },
		{ 154, YYAT_SHIFT, 164 },
		{ 150, YYAT_ERROR, 0 },
		{ 141, YYAT_SHIFT, 100 },
		{ 139, YYAT_SHIFT, 91 },
		{ 131, YYAT_SHIFT, 90 },
		{ 130, YYAT_SHIFT, 101 },
		{ 129, YYAT_SHIFT, 160 },
		{ 128, YYAT_SHIFT, 159 },
		{ 127, YYAT_SHIFT, 158 },
		{ 126, YYAT_SHIFT, 157 },
		{ 121, YYAT_SHIFT, 156 },
		{ 120, YYAT_SHIFT, 154 },
		{ 119, YYAT_SHIFT, 153 },
		{ 118, YYAT_SHIFT, 152 },
		{ 115, YYAT_SHIFT, 150 },
		{ 114, YYAT_SHIFT, 149 },
		{ 113, YYAT_SHIFT, 80 },
		{ 86, YYAT_SHIFT, 125 },
		{ 84, YYAT_SHIFT, 123 },
		{ 79, YYAT_SHIFT, 122 },
		{ 78, YYAT_SHIFT, 120 },
		{ 75, YYAT_SHIFT, 24 },
		{ 74, YYAT_SHIFT, 116 },
		{ 62, YYAT_SHIFT, 104 },
		{ 61, YYAT_SHIFT, 103 },
		{ 58, YYAT_SHIFT, 102 },
		{ 57, YYAT_SHIFT, 101 },
		{ 56, YYAT_SHIFT, 100 },
		{ 54, YYAT_SHIFT, 99 },
		{ 50, YYAT_SHIFT, 91 },
		{ 49, YYAT_SHIFT, 90 },
		{ 45, YYAT_SHIFT, 89 },
		{ 44, YYAT_SHIFT, 88 },
		{ 35, YYAT_SHIFT, 78 },
		{ 34, YYAT_SHIFT, 77 },
		{ 33, YYAT_SHIFT, 76 },
		{ 30, YYAT_SHIFT, 75 },
		{ 29, YYAT_SHIFT, 74 },
		{ 24, YYAT_SHIFT, 39 },
		{ 21, YYAT_SHIFT, 28 },
		{ 19, YYAT_SHIFT, 23 },
		{ 18, YYAT_SHIFT, 22 },
		{ 17, YYAT_SHIFT, 21 },
		{ 15, YYAT_SHIFT, 20 },
		{ 14, YYAT_SHIFT, 19 },
		{ 13, YYAT_SHIFT, 18 },
		{ 12, YYAT_SHIFT, 17 },
		{ 9, YYAT_ACCEPT, 0 },
		{ 7, YYAT_SHIFT, 15 },
		{ 3, YYAT_SHIFT, 14 },
		{ 1, YYAT_SHIFT, 13 }
	};
	yytokenaction = tokenaction;

	static const yystateaction_t YYNEARFAR YYBASED_CODE stateaction[] = {
		{ -229, 1, YYAT_DEFAULT, 116 },
		{ -130, 1, YYAT_REDUCE, 27 },
		{ 0, 0, YYAT_REDUCE, 28 },
		{ -131, 1, YYAT_REDUCE, 29 },
		{ 0, 0, YYAT_REDUCE, 30 },
		{ 0, 0, YYAT_REDUCE, 31 },
		{ 0, 0, YYAT_REDUCE, 32 },
		{ -124, 1, YYAT_ERROR, 0 },
		{ -246, 1, YYAT_REDUCE, 4 },
		{ 168, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 1 },
		{ 0, 0, YYAT_REDUCE, 2 },
		{ -132, 1, YYAT_ERROR, 0 },
		{ -127, 1, YYAT_ERROR, 0 },
		{ -128, 1, YYAT_ERROR, 0 },
		{ -130, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 3 },
		{ -130, 1, YYAT_ERROR, 0 },
		{ -132, 1, YYAT_ERROR, 0 },
		{ -133, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 75 },
		{ -134, 1, YYAT_DEFAULT, 116 },
		{ 0, 0, YYAT_DEFAULT, 75 },
		{ 0, 0, YYAT_DEFAULT, 75 },
		{ -133, 1, YYAT_DEFAULT, 188 },
		{ 0, 0, YYAT_REDUCE, 7 },
		{ 0, 0, YYAT_REDUCE, 27 },
		{ 0, 0, YYAT_REDUCE, 29 },
		{ 0, 0, YYAT_DEFAULT, 75 },
		{ -141, 1, YYAT_ERROR, 0 },
		{ -137, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 9 },
		{ 0, 0, YYAT_REDUCE, 8 },
		{ -137, 1, YYAT_ERROR, 0 },
		{ -138, 1, YYAT_ERROR, 0 },
		{ -139, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_REDUCE, 13 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_REDUCE, 25 },
		{ -237, 1, YYAT_REDUCE, 69 },
		{ 0, 0, YYAT_REDUCE, 70 },
		{ -124, 1, YYAT_ERROR, 0 },
		{ -124, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 73 },
		{ 0, 0, YYAT_REDUCE, 74 },
		{ 0, 0, YYAT_REDUCE, 21 },
		{ -129, 1, YYAT_REDUCE, 44 },
		{ -129, 1, YYAT_REDUCE, 42 },
		{ -203, 1, YYAT_REDUCE, 48 },
		{ -257, 1, YYAT_REDUCE, 15 },
		{ 0, 0, YYAT_REDUCE, 22 },
		{ -119, 1, YYAT_REDUCE, 75 },
		{ 0, 0, YYAT_REDUCE, 20 },
		{ -140, 1, YYAT_REDUCE, 40 },
		{ -131, 1, YYAT_REDUCE, 46 },
		{ -143, 1, YYAT_REDUCE, 38 },
		{ 0, 0, YYAT_REDUCE, 35 },
		{ 0, 0, YYAT_REDUCE, 18 },
		{ -147, 1, YYAT_ERROR, 0 },
		{ -153, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 23 },
		{ 0, 0, YYAT_REDUCE, 24 },
		{ 0, 0, YYAT_REDUCE, 19 },
		{ 0, 0, YYAT_REDUCE, 67 },
		{ -176, 1, YYAT_REDUCE, 61 },
		{ -160, 1, YYAT_REDUCE, 55 },
		{ -155, 1, YYAT_REDUCE, 58 },
		{ 0, 0, YYAT_REDUCE, 76 },
		{ 0, 0, YYAT_REDUCE, 16 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_REDUCE, 6 },
		{ -155, 1, YYAT_REDUCE, 11 },
		{ -149, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ -156, 1, YYAT_DEFAULT, 156 },
		{ -157, 1, YYAT_ERROR, 0 },
		{ -258, 1, YYAT_REDUCE, 69 },
		{ 0, 0, YYAT_REDUCE, 75 },
		{ 0, 0, YYAT_REDUCE, 71 },
		{ 0, 0, YYAT_REDUCE, 72 },
		{ -155, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ -156, 1, YYAT_DEFAULT, 176 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_REDUCE, 14 },
		{ 0, 0, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_REDUCE, 12 },
		{ 0, 0, YYAT_REDUCE, 17 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_REDUCE, 65 },
		{ 0, 0, YYAT_REDUCE, 66 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ 0, 0, YYAT_DEFAULT, 113 },
		{ -162, 1, YYAT_DEFAULT, 150 },
		{ -161, 1, YYAT_ERROR, 0 },
		{ -163, 1, YYAT_REDUCE, 34 },
		{ -184, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 5 },
		{ -160, 1, YYAT_ERROR, 0 },
		{ -161, 1, YYAT_ERROR, 0 },
		{ -165, 1, YYAT_DEFAULT, 156 },
		{ -166, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 93 },
		{ 0, 0, YYAT_REDUCE, 68 },
		{ 0, 0, YYAT_REDUCE, 36 },
		{ 0, 0, YYAT_REDUCE, 79 },
		{ -164, 1, YYAT_ERROR, 0 },
		{ -167, 1, YYAT_ERROR, 0 },
		{ -169, 1, YYAT_ERROR, 0 },
		{ -170, 1, YYAT_ERROR, 0 },
		{ -152, 1, YYAT_REDUCE, 45 },
		{ -155, 1, YYAT_REDUCE, 43 },
		{ -164, 1, YYAT_REDUCE, 49 },
		{ -166, 1, YYAT_REDUCE, 53 },
		{ -168, 1, YYAT_REDUCE, 54 },
		{ -170, 1, YYAT_REDUCE, 51 },
		{ -172, 1, YYAT_REDUCE, 52 },
		{ -174, 1, YYAT_REDUCE, 50 },
		{ 0, 0, YYAT_REDUCE, 37 },
		{ -155, 1, YYAT_REDUCE, 41 },
		{ -216, 1, YYAT_REDUCE, 47 },
		{ -165, 1, YYAT_REDUCE, 39 },
		{ 0, 0, YYAT_REDUCE, 62 },
		{ 0, 0, YYAT_REDUCE, 63 },
		{ 0, 0, YYAT_REDUCE, 64 },
		{ -169, 1, YYAT_REDUCE, 56 },
		{ -231, 1, YYAT_REDUCE, 57 },
		{ -181, 1, YYAT_REDUCE, 59 },
		{ -186, 1, YYAT_REDUCE, 60 },
		{ 0, 0, YYAT_REDUCE, 26 },
		{ -172, 1, YYAT_DEFAULT, 176 },
		{ 0, 0, YYAT_REDUCE, 10 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ -173, 1, YYAT_DEFAULT, 176 },
		{ -177, 1, YYAT_ERROR, 0 },
		{ -178, 1, YYAT_DEFAULT, 150 },
		{ 0, 0, YYAT_REDUCE, 78 },
		{ 0, 0, YYAT_REDUCE, 77 },
		{ 0, 0, YYAT_REDUCE, 91 },
		{ 0, 0, YYAT_REDUCE, 92 },
		{ 0, 0, YYAT_REDUCE, 33 },
		{ -146, 1, YYAT_REDUCE, 80 },
		{ 0, 0, YYAT_REDUCE, 90 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ -233, 1, YYAT_ERROR, 0 },
		{ -242, 1, YYAT_DEFAULT, 176 },
		{ -245, 1, YYAT_DEFAULT, 176 },
		{ -253, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ 0, 0, YYAT_REDUCE, 89 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ -262, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ -265, 1, YYAT_ERROR, 0 },
		{ -240, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 81 },
		{ 0, 0, YYAT_REDUCE, 85 },
		{ 0, 0, YYAT_REDUCE, 83 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ 0, 0, YYAT_REDUCE, 84 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ 0, 0, YYAT_DEFAULT, 188 },
		{ -287, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 88 },
		{ 0, 0, YYAT_REDUCE, 87 },
		{ 0, 0, YYAT_REDUCE, 86 },
		{ -240, 1, YYAT_DEFAULT, 156 },
		{ 0, 0, YYAT_REDUCE, 82 }
	};
	yystateaction = stateaction;

	yynontermgoto_size = 95;

	static const yynontermgoto_t YYNEARFAR YYBASED_CODE nontermgoto[] = {
		{ 188, 71 },
		{ 183, 187 },
		{ 188, 189 },
		{ 188, 60 },
		{ 188, 72 },
		{ 182, 186 },
		{ 188, 62 },
		{ 176, 184 },
		{ 176, 59 },
		{ 176, 58 },
		{ 176, 56 },
		{ 8, 16 },
		{ 8, 8 },
		{ 113, 148 },
		{ 113, 66 },
		{ 113, 81 },
		{ 113, 70 },
		{ 180, 185 },
		{ 8, 12 },
		{ 176, 54 },
		{ 188, 65 },
		{ 188, 48 },
		{ 188, 55 },
		{ 188, 63 },
		{ 188, 64 },
		{ 188, 53 },
		{ 102, 141 },
		{ 102, 50 },
		{ 102, 49 },
		{ 102, 57 },
		{ 116, 151 },
		{ 0, 9 },
		{ 0, 10 },
		{ 0, 11 },
		{ 174, 181 },
		{ 116, 29 },
		{ 150, 161 },
		{ 150, 115 },
		{ 111, 146 },
		{ 111, 67 },
		{ 107, -1 },
		{ 107, 144 },
		{ 101, 140 },
		{ 101, 68 },
		{ 100, -1 },
		{ 100, 139 },
		{ 97, 137 },
		{ 97, 69 },
		{ 91, -1 },
		{ 91, 131 },
		{ 90, 130 },
		{ 90, 51 },
		{ 52, 98 },
		{ 52, 52 },
		{ 172, 179 },
		{ 171, 178 },
		{ 169, 177 },
		{ 167, 175 },
		{ 166, 173 },
		{ 164, 170 },
		{ 156, 168 },
		{ 154, 165 },
		{ 153, 163 },
		{ 152, 162 },
		{ 120, 155 },
		{ 112, 147 },
		{ 110, 145 },
		{ 106, 143 },
		{ 105, 142 },
		{ 99, 138 },
		{ 96, 136 },
		{ 95, 135 },
		{ 94, 134 },
		{ 93, 133 },
		{ 92, 132 },
		{ 89, 129 },
		{ 88, 128 },
		{ 87, 127 },
		{ 86, 126 },
		{ 85, 124 },
		{ 78, 121 },
		{ 77, 119 },
		{ 76, 118 },
		{ 75, 117 },
		{ 72, 114 },
		{ 40, 84 },
		{ 38, 83 },
		{ 37, 82 },
		{ 36, 79 },
		{ 28, 73 },
		{ 24, 61 },
		{ 23, 32 },
		{ 22, 31 },
		{ 21, 30 },
		{ 20, 25 }
	};
	yynontermgoto = nontermgoto;

	static const yystategoto_t YYNEARFAR YYBASED_CODE stategoto[] = {
		{ 30, 8 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 8, -1 },
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
		{ 88, -1 },
		{ 88, 116 },
		{ 86, -1 },
		{ 85, -1 },
		{ 83, 52 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 83, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 76, 176 },
		{ 64, 107 },
		{ 63, 107 },
		{ 0, -1 },
		{ 73, 176 },
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
		{ 45, 188 },
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
		{ 73, 150 },
		{ 0, -1 },
		{ 0, -1 },
		{ 77, -1 },
		{ 70, 176 },
		{ 69, 176 },
		{ 68, 176 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 67, 176 },
		{ 67, 150 },
		{ 65, 176 },
		{ 64, 176 },
		{ 63, 176 },
		{ 32, 101 },
		{ 32, 100 },
		{ 54, 97 },
		{ 53, 97 },
		{ 52, 97 },
		{ 51, 97 },
		{ 50, 97 },
		{ 26, 111 },
		{ 0, -1 },
		{ 57, 176 },
		{ 29, 102 },
		{ 23, 97 },
		{ 11, 90 },
		{ 0, -1 },
		{ 0, -1 },
		{ 45, 107 },
		{ 44, 107 },
		{ 18, 113 },
		{ 0, -1 },
		{ 0, -1 },
		{ 45, 111 },
		{ 17, 113 },
		{ 43, 113 },
		{ -9, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 25, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 52, 176 },
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
		{ 25, 176 },
		{ 0, -1 },
		{ 55, 188 },
		{ 54, 188 },
		{ 49, 176 },
		{ 0, -1 },
		{ 48, 176 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 51, 188 },
		{ 0, -1 },
		{ 46, 176 },
		{ 45, 176 },
		{ 0, -1 },
		{ 48, 188 },
		{ 0, -1 },
		{ 47, 188 },
		{ 46, 188 },
		{ 0, -1 },
		{ 26, 188 },
		{ 0, -1 },
		{ -5, 102 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 9, 188 },
		{ 0, -1 },
		{ -3, 188 },
		{ -7, 188 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ -6, 176 },
		{ 0, -1 }
	};
	yystategoto = stategoto;

	yydestructorptr = NULL;

	yytokendestptr = NULL;
	yytokendest_size = 0;

	yytokendestbaseptr = NULL;
	yytokendestbase_size = 0;
}
#line 207 ".\\myparser.y"


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



