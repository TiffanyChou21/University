/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 72 of your 30 day trial period.
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
* Date: 11/27/19
* Time: 18:44:56
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

#line 60 "myparser.cpp"
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
#line 35 ".\\myparser.y"

	// place any extra initialisation code here

#line 84 "myparser.cpp"
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYPARSERNAME::~YYPARSERNAME()
{
	// allows virtual functions to be called properly for correct cleanup
	yydestroy();
#line 40 ".\\myparser.y"

	// place any extra cleanup code here

#line 98 "myparser.cpp"
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
#line 75 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(4 - 4); 
                                        treenode *t=(*(YYSTYPE YYFAR*)yyvalptr);
                                        m1.TypeCheck(t);
                                       m1.display(t);
									   m1.printTable();
									   m1.Error(t);
                                       
#line 214 "myparser.cpp"
			}
		}
		break;
	case 1:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 82 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(5 - 5); 
                                          treenode *t=(*(YYSTYPE YYFAR*)yyvalptr);                                       
                                       m1.TypeCheck(t);
                                       m1.display(t);
									    m1.printTable();
										m1.Error(t);
			                             
#line 233 "myparser.cpp"
			}
		}
		break;
	case 2:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 89 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(5 - 5); 
                                         treenode *t=(*(YYSTYPE YYFAR*)yyvalptr);
										 m1.TypeCheck(t);
                                        m1.display(t);
										 m1.printTable();
										 m1.Error(t);
			                             
#line 252 "myparser.cpp"
			}
		}
		break;
	case 3:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 96 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(6 - 6); 
                                          treenode *t=(*(YYSTYPE YYFAR*)yyvalptr);                                       
                                       m1.TypeCheck(t);
                                       m1.display(t);
									    m1.printTable();
										m1.Error(t);
                                       
#line 271 "myparser.cpp"
			}
		}
		break;
	case 4:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 104 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,Compound_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 3);
#line 284 "myparser.cpp"
			}
		}
		break;
	case 5:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 105 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=NULL;
#line 297 "myparser.cpp"
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
#line 106 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 310 "myparser.cpp"
			}
		}
		break;
	case 7:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 108 ".\\myparser.y"
treenode* t=yyattribute(1 - 2);
                            if(t!=NULL)
                            
                            {
                                while(t->sibling!=NULL)
                                   t=t->sibling;
                                t->sibling=yyattribute(2 - 2);
                                (*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);
                            }
                            else (*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(2 - 2);
                           
#line 333 "myparser.cpp"
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
#line 119 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 346 "myparser.cpp"
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
#line 121 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 359 "myparser.cpp"
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
#line 122 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 372 "myparser.cpp"
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
#line 123 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 385 "myparser.cpp"
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
#line 124 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 398 "myparser.cpp"
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
#line 125 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 411 "myparser.cpp"
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
#line 126 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 424 "myparser.cpp"
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
#line 127 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 437 "myparser.cpp"
			}
		}
		break;
	case 16:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 128 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 450 "myparser.cpp"
			}
		}
		break;
	case 17:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 130 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,Input_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 4);
#line 463 "myparser.cpp"
			}
		}
		break;
	case 18:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 131 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,Output_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 4);
#line 476 "myparser.cpp"
			}
		}
		break;
	case 19:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 133 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,Var_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 3);
                                         
#line 490 "myparser.cpp"
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
#line 136 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,Type_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->wordtype=Int;
#line 503 "myparser.cpp"
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
#line 137 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,Type_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->wordtype=Char;
#line 516 "myparser.cpp"
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
#line 138 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,Type_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->wordtype=Bool;
#line 529 "myparser.cpp"
			}
		}
		break;
	case 23:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 140 ".\\myparser.y"
 treenode* t=yyattribute(1 - 3);
                            if(t!=NULL)
                            {
                                while(t->sibling!=NULL)
                                   t=t->sibling;
                                t->sibling=yyattribute(3 - 3);
                                (*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 3);
                            }
                            else (*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(3 - 3);
                            
#line 551 "myparser.cpp"
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
#line 152 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 564 "myparser.cpp"
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
#line 153 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(1 - 3); 
#line 577 "myparser.cpp"
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
#line 154 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 590 "myparser.cpp"
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
#line 156 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,ID_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->IDaddr=yyattribute(1 - 1)->IDaddr;
#line 603 "myparser.cpp"
			}
		}
		break;
	case 28:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 158 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,If_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 616 "myparser.cpp"
			}
		}
		break;
	case 29:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 159 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,If_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 629 "myparser.cpp"
			}
		}
		break;
	case 30:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[10];
			yyinitdebug((void YYFAR**)yya, 10);
#endif
			{
#line 161 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(9 - 9);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 642 "myparser.cpp"
			}
		}
		break;
	case 31:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 162 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(4 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(6 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(8 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[1]->linenum;
#line 655 "myparser.cpp"
			}
		}
		break;
	case 32:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 163 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(6 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(8 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 668 "myparser.cpp"
			}
		}
		break;
	case 33:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 164 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(8 - 8);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 681 "myparser.cpp"
			}
		}
		break;
	case 34:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 165 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(7 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[2]->linenum;
#line 694 "myparser.cpp"
			}
		}
		break;
	case 35:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 166 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(4 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(7 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[1]->linenum;
#line 707 "myparser.cpp"
			}
		}
		break;
	case 36:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 167 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(7 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 720 "myparser.cpp"
			}
		}
		break;
	case 37:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 168 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,For_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[3]=yyattribute(6 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[3]->linenum;
#line 733 "myparser.cpp"
			}
		}
		break;
	case 38:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 170 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,While_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 746 "myparser.cpp"
			}
		}
		break;
	case 39:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 171 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Stmt,While_Stmt);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 6);(*(YYSTYPE YYFAR*)yyvalptr)->linenum=(*(YYSTYPE YYFAR*)yyvalptr)->child[0]->linenum;
#line 759 "myparser.cpp"
			}
		}
		break;
	case 40:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 173 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);
#line 772 "myparser.cpp"
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
#line 174 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=NULL;
#line 785 "myparser.cpp"
			}
		}
		break;
	case 42:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 176 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 798 "myparser.cpp"
			}
		}
		break;
	case 43:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 178 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Assign_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="=";
#line 811 "myparser.cpp"
			}
		}
		break;
	case 44:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 179 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 824 "myparser.cpp"
			}
		}
		break;
	case 45:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 181 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="||";
#line 837 "myparser.cpp"
			}
		}
		break;
	case 46:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 182 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 850 "myparser.cpp"
			}
		}
		break;
	case 47:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 184 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="&&";
#line 863 "myparser.cpp"
			}
		}
		break;
	case 48:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 185 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 876 "myparser.cpp"
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
#line 187 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="|";
#line 889 "myparser.cpp"
			}
		}
		break;
	case 50:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 188 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 902 "myparser.cpp"
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
#line 190 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="^";
#line 915 "myparser.cpp"
			}
		}
		break;
	case 52:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 191 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 928 "myparser.cpp"
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
#line 193 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="&";
#line 941 "myparser.cpp"
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
#line 194 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 954 "myparser.cpp"
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
#line 196 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Comp_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="==";
#line 967 "myparser.cpp"
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
#line 197 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Comp_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="!=";
#line 980 "myparser.cpp"
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
#line 198 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Comp_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="<";
#line 993 "myparser.cpp"
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
#line 199 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Comp_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op=">";
#line 1006 "myparser.cpp"
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
#line 200 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Comp_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="<=";
#line 1019 "myparser.cpp"
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
#line 201 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Comp_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op=">=";
#line 1032 "myparser.cpp"
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
#line 202 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1045 "myparser.cpp"
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
#line 204 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="<<";
#line 1058 "myparser.cpp"
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
#line 205 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op=">>";
#line 1071 "myparser.cpp"
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
#line 206 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1084 "myparser.cpp"
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
#line 208 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,OP_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="+";
#line 1097 "myparser.cpp"
			}
		}
		break;
	case 66:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 209 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,OP_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="-";
#line 1110 "myparser.cpp"
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
#line 210 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1123 "myparser.cpp"
			}
		}
		break;
	case 68:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 212 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,OP_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="*";
#line 1136 "myparser.cpp"
			}
		}
		break;
	case 69:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 213 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,OP_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="/";
#line 1149 "myparser.cpp"
			}
		}
		break;
	case 70:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 214 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,OP_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)->op="%";
#line 1162 "myparser.cpp"
			}
		}
		break;
	case 71:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 215 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1175 "myparser.cpp"
			}
		}
		break;
	case 72:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 217 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(2 - 3);
#line 1188 "myparser.cpp"
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
#line 218 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1201 "myparser.cpp"
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
#line 219 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,Const_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->IDaddr=yyattribute(1 - 1)->val;
#line 1214 "myparser.cpp"
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
#line 220 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Decl,Const_Decl);(*(YYSTYPE YYFAR*)yyvalptr)->IDaddr=yyattribute(1 - 1)->constchar;(*(YYSTYPE YYFAR*)yyvalptr)->constchar=yyattribute(1 - 1)->constchar;
#line 1227 "myparser.cpp"
			}
		}
		break;
	case 76:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 221 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->op="!";
#line 1240 "myparser.cpp"
			}
		}
		break;
	case 77:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 222 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=m1.createnode(Expr,Log_Exp);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 2);(*(YYSTYPE YYFAR*)yyvalptr)->op="~";
#line 1253 "myparser.cpp"
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
		{ "MAIN", 262 },
		{ "ID", 263 },
		{ "ADD", 264 },
		{ "SUB", 265 },
		{ "MUL", 266 },
		{ "DIV", 267 },
		{ "MOD", 268 },
		{ "ASSIGN", 271 },
		{ "LB", 272 },
		{ "RB", 273 },
		{ "LP", 274 },
		{ "RP", 275 },
		{ "SEMICOLON", 278 },
		{ "COMMA", 279 },
		{ "EQ", 280 },
		{ "GT", 281 },
		{ "LT", 282 },
		{ "GE", 283 },
		{ "LE", 284 },
		{ "NE", 285 },
		{ "BAND", 286 },
		{ "BOR", 287 },
		{ "BNOT", 288 },
		{ "XOR", 289 },
		{ "AND", 290 },
		{ "OR", 291 },
		{ "NOT", 292 },
		{ "IF", 293 },
		{ "ELSE", 294 },
		{ "WHILE", 295 },
		{ "DO", 296 },
		{ "FOR", 297 },
		{ "CIN", 300 },
		{ "COUT", 301 },
		{ "SHL", 302 },
		{ "SHR", 303 },
		{ "NUMBER", 304 },
		{ "CONSTCHAR", 305 },
		{ NULL, 0 }
	};
	yysymbol = symbol;

	static const char* const YYNEARFAR YYBASED_CODE rule[] = {
		"$accept: mainstmt",
		"mainstmt: MAIN LP RP comp_stmt",
		"mainstmt: MAIN LP VOID RP comp_stmt",
		"mainstmt: VOID MAIN LP RP comp_stmt",
		"mainstmt: VOID MAIN LP VOID RP comp_stmt",
		"comp_stmt: LB stmt_list RB",
		"comp_stmt: LB RB",
		"comp_stmt: stmt",
		"stmt_list: stmt_list stmt",
		"stmt_list: stmt",
		"stmt: var_dec",
		"stmt: exp_stmt",
		"stmt: if_stmt",
		"stmt: for_stmt",
		"stmt: exp_stmt",
		"stmt: while_stmt",
		"stmt: io_stmt",
		"stmt: SEMICOLON",
		"io_stmt: CIN SHR exp SEMICOLON",
		"io_stmt: COUT SHL exp SEMICOLON",
		"var_dec: type idlist SEMICOLON",
		"type: INT",
		"type: CHAR",
		"type: BOOL",
		"idlist: idlist COMMA id",
		"idlist: id",
		"idlist: idlist COMMA assign_exp",
		"idlist: assign_exp",
		"id: ID",
		"if_stmt: IF LP exp RP comp_stmt ELSE comp_stmt",
		"if_stmt: IF LP exp RP comp_stmt",
		"for_stmt: FOR LP exp SEMICOLON exp SEMICOLON exp RP comp_stmt",
		"for_stmt: FOR LP SEMICOLON exp SEMICOLON exp RP comp_stmt",
		"for_stmt: FOR LP exp SEMICOLON SEMICOLON exp RP comp_stmt",
		"for_stmt: FOR LP exp SEMICOLON exp SEMICOLON RP comp_stmt",
		"for_stmt: FOR LP SEMICOLON SEMICOLON exp RP comp_stmt",
		"for_stmt: FOR LP SEMICOLON exp SEMICOLON RP comp_stmt",
		"for_stmt: FOR LP exp SEMICOLON SEMICOLON RP comp_stmt",
		"for_stmt: FOR LP SEMICOLON SEMICOLON RP comp_stmt",
		"while_stmt: WHILE LP exp RP comp_stmt",
		"while_stmt: DO comp_stmt WHILE LP exp RP",
		"exp_stmt: exp SEMICOLON",
		"exp_stmt: SEMICOLON",
		"exp: assign_exp",
		"assign_exp: id ASSIGN exp",
		"assign_exp: or_exp",
		"or_exp: or_exp OR and_exp",
		"or_exp: and_exp",
		"and_exp: and_exp AND bor_exp",
		"and_exp: bor_exp",
		"bor_exp: bor_exp BOR xor_exp",
		"bor_exp: xor_exp",
		"xor_exp: xor_exp XOR band_exp",
		"xor_exp: band_exp",
		"band_exp: band_exp BAND comp_exp",
		"band_exp: comp_exp",
		"comp_exp: comp_exp EQ sh_exp",
		"comp_exp: comp_exp NE sh_exp",
		"comp_exp: comp_exp LT sh_exp",
		"comp_exp: comp_exp GT sh_exp",
		"comp_exp: comp_exp LE sh_exp",
		"comp_exp: comp_exp GE sh_exp",
		"comp_exp: sh_exp",
		"sh_exp: sh_exp SHL as_exp",
		"sh_exp: sh_exp SHR as_exp",
		"sh_exp: as_exp",
		"as_exp: as_exp ADD term",
		"as_exp: as_exp SUB term",
		"as_exp: term",
		"term: term MUL factor",
		"term: term DIV factor",
		"term: term MOD factor",
		"term: factor",
		"factor: LP exp RP",
		"factor: id",
		"factor: NUMBER",
		"factor: CONSTCHAR",
		"factor: NOT factor",
		"factor: BNOT factor"
	};
	yyrule = rule;
#endif

	static const yyreduction_t YYNEARFAR YYBASED_CODE reduction[] = {
		{ 0, 1, -1 },
		{ 1, 4, 0 },
		{ 1, 5, 1 },
		{ 1, 5, 2 },
		{ 1, 6, 3 },
		{ 2, 3, 4 },
		{ 2, 2, 5 },
		{ 2, 1, 6 },
		{ 3, 2, 7 },
		{ 3, 1, 8 },
		{ 4, 1, 9 },
		{ 4, 1, 10 },
		{ 4, 1, 11 },
		{ 4, 1, 12 },
		{ 4, 1, 13 },
		{ 4, 1, 14 },
		{ 4, 1, 15 },
		{ 4, 1, 16 },
		{ 5, 4, 17 },
		{ 5, 4, 18 },
		{ 6, 3, 19 },
		{ 7, 1, 20 },
		{ 7, 1, 21 },
		{ 7, 1, 22 },
		{ 8, 3, 23 },
		{ 8, 1, 24 },
		{ 8, 3, 25 },
		{ 8, 1, 26 },
		{ 9, 1, 27 },
		{ 10, 7, 28 },
		{ 10, 5, 29 },
		{ 11, 9, 30 },
		{ 11, 8, 31 },
		{ 11, 8, 32 },
		{ 11, 8, 33 },
		{ 11, 7, 34 },
		{ 11, 7, 35 },
		{ 11, 7, 36 },
		{ 11, 6, 37 },
		{ 12, 5, 38 },
		{ 12, 6, 39 },
		{ 13, 2, 40 },
		{ 13, 1, 41 },
		{ 14, 1, 42 },
		{ 15, 3, 43 },
		{ 15, 1, 44 },
		{ 16, 3, 45 },
		{ 16, 1, 46 },
		{ 17, 3, 47 },
		{ 17, 1, 48 },
		{ 18, 3, 49 },
		{ 18, 1, 50 },
		{ 19, 3, 51 },
		{ 19, 1, 52 },
		{ 20, 3, 53 },
		{ 20, 1, 54 },
		{ 21, 3, 55 },
		{ 21, 3, 56 },
		{ 21, 3, 57 },
		{ 21, 3, 58 },
		{ 21, 3, 59 },
		{ 21, 3, 60 },
		{ 21, 1, 61 },
		{ 22, 3, 62 },
		{ 22, 3, 63 },
		{ 22, 1, 64 },
		{ 23, 3, 65 },
		{ 23, 3, 66 },
		{ 23, 1, 67 },
		{ 24, 3, 68 },
		{ 24, 3, 69 },
		{ 24, 3, 70 },
		{ 24, 1, 71 },
		{ 25, 3, 72 },
		{ 25, 1, 73 },
		{ 25, 1, 74 },
		{ 25, 1, 75 },
		{ 25, 2, 76 },
		{ 25, 2, 77 }
	};
	yyreduction = reduction;

	yytokenaction_size = 121;

	static const yytokenaction_t YYNEARFAR YYBASED_CODE tokenaction[] = {
		{ 160, YYAT_SHIFT, 12 },
		{ 160, YYAT_SHIFT, 13 },
		{ 6, YYAT_SHIFT, 9 },
		{ 160, YYAT_SHIFT, 14 },
		{ 5, YYAT_SHIFT, 7 },
		{ 148, YYAT_SHIFT, 15 },
		{ 109, YYAT_SHIFT, 68 },
		{ 109, YYAT_SHIFT, 69 },
		{ 109, YYAT_SHIFT, 70 },
		{ 109, YYAT_SHIFT, 71 },
		{ 109, YYAT_SHIFT, 72 },
		{ 109, YYAT_SHIFT, 73 },
		{ 118, YYAT_SHIFT, 87 },
		{ 118, YYAT_SHIFT, 88 },
		{ 118, YYAT_SHIFT, 89 },
		{ 160, YYAT_SHIFT, 16 },
		{ 148, YYAT_SHIFT, 17 },
		{ 148, YYAT_SHIFT, 155 },
		{ 6, YYAT_SHIFT, 10 },
		{ 156, YYAT_SHIFT, 160 },
		{ 5, YYAT_SHIFT, 8 },
		{ 160, YYAT_SHIFT, 18 },
		{ 36, YYAT_SHIFT, 68 },
		{ 36, YYAT_SHIFT, 69 },
		{ 36, YYAT_SHIFT, 70 },
		{ 36, YYAT_SHIFT, 71 },
		{ 36, YYAT_SHIFT, 72 },
		{ 36, YYAT_SHIFT, 73 },
		{ 111, YYAT_SHIFT, 85 },
		{ 111, YYAT_SHIFT, 86 },
		{ 148, YYAT_SHIFT, 19 },
		{ 117, YYAT_SHIFT, 87 },
		{ 117, YYAT_SHIFT, 88 },
		{ 117, YYAT_SHIFT, 89 },
		{ 148, YYAT_SHIFT, 20 },
		{ 147, YYAT_SHIFT, 154 },
		{ 160, YYAT_SHIFT, 21 },
		{ 145, YYAT_SHIFT, 152 },
		{ 160, YYAT_SHIFT, 22 },
		{ 160, YYAT_SHIFT, 23 },
		{ 160, YYAT_SHIFT, 24 },
		{ 130, YYAT_SHIFT, 67 },
		{ 139, YYAT_SHIFT, 148 },
		{ 160, YYAT_SHIFT, 25 },
		{ 160, YYAT_SHIFT, 26 },
		{ 78, YYAT_SHIFT, 67 },
		{ 148, YYAT_SHIFT, 27 },
		{ 148, YYAT_SHIFT, 28 },
		{ 130, YYAT_REDUCE, 24 },
		{ 130, YYAT_REDUCE, 24 },
		{ 110, YYAT_SHIFT, 85 },
		{ 110, YYAT_SHIFT, 86 },
		{ 78, YYAT_REDUCE, 25 },
		{ 78, YYAT_REDUCE, 25 },
		{ 49, YYAT_SHIFT, 87 },
		{ 49, YYAT_SHIFT, 88 },
		{ 49, YYAT_SHIFT, 89 },
		{ 0, YYAT_SHIFT, 1 },
		{ 107, YYAT_SHIFT, 76 },
		{ 107, YYAT_SHIFT, 77 },
		{ 0, YYAT_SHIFT, 2 },
		{ 106, YYAT_SHIFT, 76 },
		{ 106, YYAT_SHIFT, 77 },
		{ 105, YYAT_SHIFT, 76 },
		{ 105, YYAT_SHIFT, 77 },
		{ 104, YYAT_SHIFT, 76 },
		{ 104, YYAT_SHIFT, 77 },
		{ 103, YYAT_SHIFT, 76 },
		{ 103, YYAT_SHIFT, 77 },
		{ 102, YYAT_SHIFT, 76 },
		{ 102, YYAT_SHIFT, 77 },
		{ 79, YYAT_SHIFT, 112 },
		{ 79, YYAT_SHIFT, 113 },
		{ 55, YYAT_ERROR, 0 },
		{ 55, YYAT_SHIFT, 91 },
		{ 48, YYAT_SHIFT, 85 },
		{ 48, YYAT_SHIFT, 86 },
		{ 39, YYAT_SHIFT, 76 },
		{ 39, YYAT_SHIFT, 77 },
		{ 138, YYAT_SHIFT, 146 },
		{ 137, YYAT_SHIFT, 144 },
		{ 136, YYAT_SHIFT, 143 },
		{ 134, YYAT_SHIFT, 141 },
		{ 132, YYAT_SHIFT, 140 },
		{ 127, YYAT_SHIFT, 138 },
		{ 126, YYAT_SHIFT, 137 },
		{ 125, YYAT_SHIFT, 135 },
		{ 124, YYAT_ERROR, 0 },
		{ 116, YYAT_SHIFT, 75 },
		{ 115, YYAT_SHIFT, 74 },
		{ 114, YYAT_SHIFT, 83 },
		{ 108, YYAT_SHIFT, 84 },
		{ 100, YYAT_SHIFT, 129 },
		{ 99, YYAT_SHIFT, 128 },
		{ 98, YYAT_SHIFT, 127 },
		{ 97, YYAT_SHIFT, 125 },
		{ 96, YYAT_SHIFT, 124 },
		{ 95, YYAT_SHIFT, 123 },
		{ 94, YYAT_SHIFT, 122 },
		{ 64, YYAT_SHIFT, 97 },
		{ 63, YYAT_SHIFT, 96 },
		{ 57, YYAT_SHIFT, 93 },
		{ 47, YYAT_SHIFT, 84 },
		{ 46, YYAT_SHIFT, 83 },
		{ 44, YYAT_SHIFT, 82 },
		{ 43, YYAT_SHIFT, 81 },
		{ 38, YYAT_SHIFT, 75 },
		{ 37, YYAT_SHIFT, 74 },
		{ 35, YYAT_SHIFT, 67 },
		{ 26, YYAT_SHIFT, 66 },
		{ 25, YYAT_SHIFT, 65 },
		{ 24, YYAT_SHIFT, 64 },
		{ 22, YYAT_SHIFT, 62 },
		{ 21, YYAT_SHIFT, 61 },
		{ 16, YYAT_SHIFT, 54 },
		{ 9, YYAT_SHIFT, 51 },
		{ 7, YYAT_SHIFT, 11 },
		{ 4, YYAT_SHIFT, 6 },
		{ 3, YYAT_ACCEPT, 0 },
		{ 2, YYAT_SHIFT, 5 },
		{ 1, YYAT_SHIFT, 4 }
	};
	yytokenaction = tokenaction;

	static const yystateaction_t YYNEARFAR YYBASED_CODE stateaction[] = {
		{ -202, 1, YYAT_ERROR, 0 },
		{ -142, 1, YYAT_ERROR, 0 },
		{ -155, 1, YYAT_ERROR, 0 },
		{ 118, 1, YYAT_ERROR, 0 },
		{ -157, 1, YYAT_ERROR, 0 },
		{ -255, 1, YYAT_ERROR, 0 },
		{ -257, 1, YYAT_ERROR, 0 },
		{ -159, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -160, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_REDUCE, 21 },
		{ 0, 0, YYAT_REDUCE, 22 },
		{ 0, 0, YYAT_REDUCE, 23 },
		{ 0, 0, YYAT_REDUCE, 28 },
		{ -159, 1, YYAT_DEFAULT, 55 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_REDUCE, 17 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ -161, 1, YYAT_ERROR, 0 },
		{ -162, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -163, 1, YYAT_ERROR, 0 },
		{ -193, 1, YYAT_ERROR, 0 },
		{ -193, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 75 },
		{ 0, 0, YYAT_REDUCE, 76 },
		{ 0, 0, YYAT_REDUCE, 1 },
		{ 0, 0, YYAT_REDUCE, 10 },
		{ 0, 0, YYAT_REDUCE, 12 },
		{ 0, 0, YYAT_REDUCE, 11 },
		{ 0, 0, YYAT_REDUCE, 13 },
		{ 0, 0, YYAT_REDUCE, 7 },
		{ -163, 1, YYAT_REDUCE, 74 },
		{ -258, 1, YYAT_REDUCE, 55 },
		{ -180, 1, YYAT_REDUCE, 49 },
		{ -180, 1, YYAT_REDUCE, 53 },
		{ -225, 1, YYAT_REDUCE, 62 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_REDUCE, 16 },
		{ 0, 0, YYAT_REDUCE, 15 },
		{ -173, 1, YYAT_ERROR, 0 },
		{ -187, 1, YYAT_REDUCE, 45 },
		{ 0, 0, YYAT_REDUCE, 43 },
		{ -187, 1, YYAT_REDUCE, 47 },
		{ -187, 1, YYAT_REDUCE, 51 },
		{ -189, 1, YYAT_REDUCE, 65 },
		{ -212, 1, YYAT_REDUCE, 68 },
		{ 0, 0, YYAT_REDUCE, 72 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_REDUCE, 3 },
		{ 0, 0, YYAT_REDUCE, 2 },
		{ 0, 0, YYAT_REDUCE, 6 },
		{ -199, 1, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_REDUCE, 9 },
		{ -174, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 74 },
		{ 0, 0, YYAT_REDUCE, 78 },
		{ 0, 0, YYAT_REDUCE, 77 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ -195, 1, YYAT_ERROR, 0 },
		{ -179, 1, YYAT_DEFAULT, 127 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ -226, 1, YYAT_REDUCE, 74 },
		{ -207, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 27 },
		{ 0, 0, YYAT_REDUCE, 41 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_REDUCE, 4 },
		{ 0, 0, YYAT_REDUCE, 5 },
		{ 0, 0, YYAT_REDUCE, 8 },
		{ 0, 0, YYAT_REDUCE, 73 },
		{ -177, 1, YYAT_ERROR, 0 },
		{ -178, 1, YYAT_ERROR, 0 },
		{ -178, 1, YYAT_ERROR, 0 },
		{ -183, 1, YYAT_DEFAULT, 127 },
		{ -184, 1, YYAT_ERROR, 0 },
		{ -185, 1, YYAT_ERROR, 0 },
		{ -186, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 44 },
		{ -233, 1, YYAT_REDUCE, 56 },
		{ -235, 1, YYAT_REDUCE, 59 },
		{ -237, 1, YYAT_REDUCE, 58 },
		{ -239, 1, YYAT_REDUCE, 61 },
		{ -241, 1, YYAT_REDUCE, 60 },
		{ -244, 1, YYAT_REDUCE, 57 },
		{ -198, 1, YYAT_REDUCE, 50 },
		{ -274, 1, YYAT_REDUCE, 54 },
		{ -214, 1, YYAT_REDUCE, 63 },
		{ -236, 1, YYAT_REDUCE, 64 },
		{ 0, 0, YYAT_REDUCE, 20 },
		{ 0, 0, YYAT_DEFAULT, 124 },
		{ -200, 1, YYAT_REDUCE, 46 },
		{ -198, 1, YYAT_REDUCE, 48 },
		{ -198, 1, YYAT_REDUCE, 52 },
		{ -235, 1, YYAT_REDUCE, 66 },
		{ -254, 1, YYAT_REDUCE, 67 },
		{ 0, 0, YYAT_REDUCE, 69 },
		{ 0, 0, YYAT_REDUCE, 70 },
		{ 0, 0, YYAT_REDUCE, 71 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -188, 1, YYAT_DEFAULT, 148 },
		{ -189, 1, YYAT_DEFAULT, 148 },
		{ -193, 1, YYAT_ERROR, 0 },
		{ -194, 1, YYAT_DEFAULT, 124 },
		{ 0, 0, YYAT_REDUCE, 18 },
		{ 0, 0, YYAT_REDUCE, 19 },
		{ -230, 1, YYAT_REDUCE, 74 },
		{ 0, 0, YYAT_REDUCE, 26 },
		{ -211, 1, YYAT_REDUCE, 30 },
		{ 0, 0, YYAT_REDUCE, 39 },
		{ -193, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -194, 1, YYAT_ERROR, 0 },
		{ -195, 1, YYAT_DEFAULT, 148 },
		{ -196, 1, YYAT_DEFAULT, 148 },
		{ -236, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_REDUCE, 40 },
		{ 0, 0, YYAT_REDUCE, 38 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -238, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -240, 1, YYAT_ERROR, 0 },
		{ -258, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 29 },
		{ 0, 0, YYAT_REDUCE, 35 },
		{ 0, 0, YYAT_REDUCE, 36 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_REDUCE, 37 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ 0, 0, YYAT_DEFAULT, 160 },
		{ -256, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 32 },
		{ 0, 0, YYAT_REDUCE, 33 },
		{ 0, 0, YYAT_REDUCE, 34 },
		{ -257, 1, YYAT_DEFAULT, 127 },
		{ 0, 0, YYAT_REDUCE, 31 }
	};
	yystateaction = stateaction;

	yynontermgoto_size = 84;

	static const yynontermgoto_t YYNEARFAR YYBASED_CODE nontermgoto[] = {
		{ 160, 161 },
		{ 89, 58 },
		{ 160, 34 },
		{ 160, 41 },
		{ 160, 30 },
		{ 160, 40 },
		{ 86, 118 },
		{ 86, 50 },
		{ 160, 31 },
		{ 160, 33 },
		{ 160, 42 },
		{ 160, 32 },
		{ 160, 43 },
		{ 148, 35 },
		{ 155, 159 },
		{ 40, 79 },
		{ 40, 78 },
		{ 89, 121 },
		{ 148, 156 },
		{ 148, 45 },
		{ 148, 44 },
		{ 148, 46 },
		{ 40, 80 },
		{ 113, 130 },
		{ 84, 116 },
		{ 84, 36 },
		{ 84, 39 },
		{ 154, 158 },
		{ 113, -1 },
		{ 113, 131 },
		{ 55, -1 },
		{ 152, 157 },
		{ 55, 92 },
		{ 83, 115 },
		{ 83, 47 },
		{ 82, 114 },
		{ 82, 37 },
		{ 77, 111 },
		{ 77, 49 },
		{ 75, -1 },
		{ 75, 109 },
		{ 74, 108 },
		{ 74, 38 },
		{ 73, 107 },
		{ 73, 48 },
		{ 16, 55 },
		{ 16, 56 },
		{ 146, 153 },
		{ 144, 151 },
		{ 143, 150 },
		{ 140, 149 },
		{ 138, 147 },
		{ 137, 145 },
		{ 135, 142 },
		{ 127, 139 },
		{ 125, 136 },
		{ 124, 134 },
		{ 123, 133 },
		{ 122, 132 },
		{ 97, 126 },
		{ 88, 120 },
		{ 87, 119 },
		{ 85, 117 },
		{ 76, 110 },
		{ 72, 106 },
		{ 71, 105 },
		{ 70, 104 },
		{ 69, 103 },
		{ 68, 102 },
		{ 67, 101 },
		{ 66, 100 },
		{ 65, 99 },
		{ 64, 98 },
		{ 62, 95 },
		{ 61, 94 },
		{ 51, 90 },
		{ 23, 63 },
		{ 20, 60 },
		{ 19, 59 },
		{ 17, 57 },
		{ 11, 53 },
		{ 10, 52 },
		{ 8, 29 },
		{ 0, 3 }
	};
	yynontermgoto = nontermgoto;

	static const yystategoto_t YYNEARFAR YYBASED_CODE stategoto[] = {
		{ 82, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 80, 160 },
		{ 0, -1 },
		{ 79, 160 },
		{ 78, 160 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 42, 55 },
		{ 65, 148 },
		{ 0, -1 },
		{ 53, 89 },
		{ 52, 89 },
		{ 0, -1 },
		{ 0, -1 },
		{ 74, 160 },
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
		{ 7, 113 },
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
		{ 73, 160 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 28, 160 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 60, 148 },
		{ 59, 148 },
		{ 0, -1 },
		{ 58, 148 },
		{ 57, 148 },
		{ 56, 148 },
		{ 55, 148 },
		{ 46, 73 },
		{ 45, 73 },
		{ 44, 73 },
		{ 43, 73 },
		{ 42, 73 },
		{ 21, 77 },
		{ 22, 84 },
		{ 19, 84 },
		{ 40, 77 },
		{ 14, 86 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 18, 83 },
		{ 15, 74 },
		{ 4, 73 },
		{ 38, 86 },
		{ -18, 89 },
		{ 36, 89 },
		{ 35, 89 },
		{ -8, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 45, 148 },
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
		{ 14, 148 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 56, 160 },
		{ 55, 160 },
		{ 42, 148 },
		{ 41, 148 },
		{ 0, -1 },
		{ 40, 148 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 51, 160 },
		{ 0, -1 },
		{ 38, 148 },
		{ 37, 148 },
		{ 0, -1 },
		{ 48, 160 },
		{ 0, -1 },
		{ 0, -1 },
		{ 47, 160 },
		{ 46, 160 },
		{ 0, -1 },
		{ 45, 160 },
		{ 0, -1 },
		{ 4, 82 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 29, 160 },
		{ 0, -1 },
		{ 25, 160 },
		{ 12, 160 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ -2, 148 },
		{ 0, -1 }
	};
	yystategoto = stategoto;

	yydestructorptr = NULL;

	yytokendestptr = NULL;
	yytokendest_size = 0;

	yytokendestbaseptr = NULL;
	yytokendestbase_size = 0;
}
#line 224 ".\\myparser.y"


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

