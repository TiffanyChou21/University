/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 29 of your 30 day trial period.
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
* post.cpp
* C++ source file generated from post.y.
* 
* Date: 10/15/19
* Time: 20:34:02
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

#line 1 ".\\post.y"

/****************************************************************************
post.y
ParserWizard generated YACC file.

Date: 2019年10月13日
3.修改 Yacc 程序，不进行表达式的计算，而是实现中缀表达式到后缀表达式 的转换。
****************************************************************************/
#include <ctype.h>
#include <stdio.h>
#include <iostream>
#include <cstring>
using namespace std;

#line 53 "post.cpp"
// repeated because of possible precompiled header
#include <yycpars.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\post.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYPARSERNAME::YYPARSERNAME()
{
	yytables();
#line 37 ".\\post.y"

	// place any extra initialisation code here

#line 77 "post.cpp"
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYPARSERNAME::~YYPARSERNAME()
{
	// allows virtual functions to be called properly for correct cleanup
	yydestroy();
#line 42 ".\\post.y"

	// place any extra cleanup code here

#line 91 "post.cpp"
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
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 61 ".\\post.y"
 cout << yyattribute(2 - 3) << endl; 
#line 201 "post.cpp"
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
#line 65 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[50]; strcpy((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(1 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(3 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), "+ ");  
#line 214 "post.cpp"
			}
		}
		break;
	case 2:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 66 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[50]; strcpy((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(1 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(3 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), "- "); 
#line 227 "post.cpp"
			}
		}
		break;
	case 3:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 67 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[50]; strcpy((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(1 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(3 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), "* "); 
#line 240 "post.cpp"
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
#line 68 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[50]; strcpy((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(1 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(3 - 3));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr), "/ "); 
#line 253 "post.cpp"
			}
		}
		break;
	case 5:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 69 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[50]; strcpy((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(2 - 3)); 
#line 266 "post.cpp"
			}
		}
		break;
	case 6:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 70 ".\\post.y"
(*(YYSTYPE YYFAR*)yyvalptr) = new char[50]; strcpy((*(YYSTYPE YYFAR*)yyvalptr), yyattribute(2 - 2));strcat((*(YYSTYPE YYFAR*)yyvalptr)," ");strcat((*(YYSTYPE YYFAR*)yyvalptr),"  -  ");
#line 279 "post.cpp"
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
#line 74 ".\\post.y"
(*(YYSTYPE YYFAR*)yyvalptr)=new char[50];strcpy((*(YYSTYPE YYFAR*)yyvalptr),yyattribute(1 - 2));strcat((*(YYSTYPE YYFAR*)yyvalptr),yyattribute(2 - 2));
#line 292 "post.cpp"
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
#line 76 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "0"); 
#line 305 "post.cpp"
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
#line 77 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "1"); 
#line 318 "post.cpp"
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
#line 78 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "2");
#line 331 "post.cpp"
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
#line 79 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "3"); 
#line 344 "post.cpp"
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
#line 80 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "4"); 
#line 357 "post.cpp"
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
#line 81 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "5"); 
#line 370 "post.cpp"
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
#line 82 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "6"); 
#line 383 "post.cpp"
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
#line 83 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "7"); 
#line 396 "post.cpp"
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
#line 84 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "8"); 
#line 409 "post.cpp"
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
#line 85 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "9"); 
#line 422 "post.cpp"
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
#line 86 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "_"); 
#line 435 "post.cpp"
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
#line 87 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "a"); 
#line 448 "post.cpp"
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
#line 88 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "b"); 
#line 461 "post.cpp"
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
#line 89 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "c");
#line 474 "post.cpp"
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
#line 90 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "d"); 
#line 487 "post.cpp"
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
#line 91 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "e"); 
#line 500 "post.cpp"
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
#line 92 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "f"); 
#line 513 "post.cpp"
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
#line 93 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "g"); 
#line 526 "post.cpp"
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
#line 94 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "h"); 
#line 539 "post.cpp"
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
#line 95 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "i"); 
#line 552 "post.cpp"
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
#line 96 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "j"); 
#line 565 "post.cpp"
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
#line 97 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "k"); 
#line 578 "post.cpp"
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
#line 98 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "l"); 
#line 591 "post.cpp"
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
#line 99 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "m"); 
#line 604 "post.cpp"
			}
		}
		break;
	case 32:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 100 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "n");
#line 617 "post.cpp"
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
#line 101 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "o"); 
#line 630 "post.cpp"
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
#line 102 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "p"); 
#line 643 "post.cpp"
			}
		}
		break;
	case 35:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 103 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "q"); 
#line 656 "post.cpp"
			}
		}
		break;
	case 36:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 104 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "r"); 
#line 669 "post.cpp"
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
#line 105 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "s"); 
#line 682 "post.cpp"
			}
		}
		break;
	case 38:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 106 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "t"); 
#line 695 "post.cpp"
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
#line 107 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "u"); 
#line 708 "post.cpp"
			}
		}
		break;
	case 40:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 108 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "v"); 
#line 721 "post.cpp"
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
#line 109 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "w"); 
#line 734 "post.cpp"
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
#line 110 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "x"); 
#line 747 "post.cpp"
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
#line 111 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "y");
#line 760 "post.cpp"
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
#line 112 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "z"); 
#line 773 "post.cpp"
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
#line 113 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "A"); 
#line 786 "post.cpp"
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
#line 114 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "B"); 
#line 799 "post.cpp"
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
#line 115 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "C"); 
#line 812 "post.cpp"
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
#line 116 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "D"); 
#line 825 "post.cpp"
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
#line 117 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "E"); 
#line 838 "post.cpp"
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
#line 118 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "F"); 
#line 851 "post.cpp"
			}
		}
		break;
	case 51:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 119 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "G"); 
#line 864 "post.cpp"
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
#line 120 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "H"); 
#line 877 "post.cpp"
			}
		}
		break;
	case 53:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 121 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "I"); 
#line 890 "post.cpp"
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
#line 122 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "J");
#line 903 "post.cpp"
			}
		}
		break;
	case 55:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 123 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "K"); 
#line 916 "post.cpp"
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
#line 124 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "L"); 
#line 929 "post.cpp"
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
#line 125 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "M"); 
#line 942 "post.cpp"
			}
		}
		break;
	case 58:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 126 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "N"); 
#line 955 "post.cpp"
			}
		}
		break;
	case 59:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 127 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "O"); 
#line 968 "post.cpp"
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
#line 128 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "P"); 
#line 981 "post.cpp"
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
#line 129 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "Q"); 
#line 994 "post.cpp"
			}
		}
		break;
	case 62:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 130 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "R"); 
#line 1007 "post.cpp"
			}
		}
		break;
	case 63:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 131 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "S"); 
#line 1020 "post.cpp"
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
#line 132 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "T"); 
#line 1033 "post.cpp"
			}
		}
		break;
	case 65:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 133 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "U");
#line 1046 "post.cpp"
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
#line 134 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "V"); 
#line 1059 "post.cpp"
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
#line 135 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "W"); 
#line 1072 "post.cpp"
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
#line 136 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "X"); 
#line 1085 "post.cpp"
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
#line 137 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "Y"); 
#line 1098 "post.cpp"
			}
		}
		break;
	case 70:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 138 ".\\post.y"
 (*(YYSTYPE YYFAR*)yyvalptr) = new char[2];	strcpy((*(YYSTYPE YYFAR*)yyvalptr), "Z"); 
#line 1111 "post.cpp"
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
		{ "\'0\'", 48 },
		{ "\'1\'", 49 },
		{ "\'2\'", 50 },
		{ "\'3\'", 51 },
		{ "\'4\'", 52 },
		{ "\'5\'", 53 },
		{ "\'6\'", 54 },
		{ "\'7\'", 55 },
		{ "\'8\'", 56 },
		{ "\'9\'", 57 },
		{ "\';\'", 59 },
		{ "\'A\'", 65 },
		{ "\'B\'", 66 },
		{ "\'C\'", 67 },
		{ "\'D\'", 68 },
		{ "\'E\'", 69 },
		{ "\'F\'", 70 },
		{ "\'G\'", 71 },
		{ "\'H\'", 72 },
		{ "\'I\'", 73 },
		{ "\'J\'", 74 },
		{ "\'K\'", 75 },
		{ "\'L\'", 76 },
		{ "\'M\'", 77 },
		{ "\'N\'", 78 },
		{ "\'O\'", 79 },
		{ "\'P\'", 80 },
		{ "\'Q\'", 81 },
		{ "\'R\'", 82 },
		{ "\'S\'", 83 },
		{ "\'T\'", 84 },
		{ "\'U\'", 85 },
		{ "\'V\'", 86 },
		{ "\'W\'", 87 },
		{ "\'X\'", 88 },
		{ "\'Y\'", 89 },
		{ "\'Z\'", 90 },
		{ "\'_\'", 95 },
		{ "\'a\'", 97 },
		{ "\'b\'", 98 },
		{ "\'c\'", 99 },
		{ "\'d\'", 100 },
		{ "\'e\'", 101 },
		{ "\'f\'", 102 },
		{ "\'g\'", 103 },
		{ "\'h\'", 104 },
		{ "\'i\'", 105 },
		{ "\'j\'", 106 },
		{ "\'k\'", 107 },
		{ "\'l\'", 108 },
		{ "\'m\'", 109 },
		{ "\'n\'", 110 },
		{ "\'o\'", 111 },
		{ "\'p\'", 112 },
		{ "\'q\'", 113 },
		{ "\'r\'", 114 },
		{ "\'s\'", 115 },
		{ "\'t\'", 116 },
		{ "\'u\'", 117 },
		{ "\'v\'", 118 },
		{ "\'w\'", 119 },
		{ "\'x\'", 120 },
		{ "\'y\'", 121 },
		{ "\'z\'", 122 },
		{ "error", 256 },
		{ "ADD", 257 },
		{ "SUB", 258 },
		{ "MUL", 259 },
		{ "DIV", 260 },
		{ "LP", 261 },
		{ "RP", 262 },
		{ "UMINUS", 263 },
		{ NULL, 0 }
	};
	yysymbol = symbol;

	static const char* const YYNEARFAR YYBASED_CODE rule[] = {
		"$accept: lines",
		"lines: lines expr \';\'",
		"lines: lines \';\'",
		"lines:",
		"expr: expr ADD expr",
		"expr: expr SUB expr",
		"expr: expr MUL expr",
		"expr: expr DIV expr",
		"expr: LP expr RP",
		"expr: SUB expr",
		"expr: ID",
		"ID: CHAR",
		"ID: ID CHAR",
		"CHAR: \'0\'",
		"CHAR: \'1\'",
		"CHAR: \'2\'",
		"CHAR: \'3\'",
		"CHAR: \'4\'",
		"CHAR: \'5\'",
		"CHAR: \'6\'",
		"CHAR: \'7\'",
		"CHAR: \'8\'",
		"CHAR: \'9\'",
		"CHAR: \'_\'",
		"CHAR: \'a\'",
		"CHAR: \'b\'",
		"CHAR: \'c\'",
		"CHAR: \'d\'",
		"CHAR: \'e\'",
		"CHAR: \'f\'",
		"CHAR: \'g\'",
		"CHAR: \'h\'",
		"CHAR: \'i\'",
		"CHAR: \'j\'",
		"CHAR: \'k\'",
		"CHAR: \'l\'",
		"CHAR: \'m\'",
		"CHAR: \'n\'",
		"CHAR: \'o\'",
		"CHAR: \'p\'",
		"CHAR: \'q\'",
		"CHAR: \'r\'",
		"CHAR: \'s\'",
		"CHAR: \'t\'",
		"CHAR: \'u\'",
		"CHAR: \'v\'",
		"CHAR: \'w\'",
		"CHAR: \'x\'",
		"CHAR: \'y\'",
		"CHAR: \'z\'",
		"CHAR: \'A\'",
		"CHAR: \'B\'",
		"CHAR: \'C\'",
		"CHAR: \'D\'",
		"CHAR: \'E\'",
		"CHAR: \'F\'",
		"CHAR: \'G\'",
		"CHAR: \'H\'",
		"CHAR: \'I\'",
		"CHAR: \'J\'",
		"CHAR: \'K\'",
		"CHAR: \'L\'",
		"CHAR: \'M\'",
		"CHAR: \'N\'",
		"CHAR: \'O\'",
		"CHAR: \'P\'",
		"CHAR: \'Q\'",
		"CHAR: \'R\'",
		"CHAR: \'S\'",
		"CHAR: \'T\'",
		"CHAR: \'U\'",
		"CHAR: \'V\'",
		"CHAR: \'W\'",
		"CHAR: \'X\'",
		"CHAR: \'Y\'",
		"CHAR: \'Z\'"
	};
	yyrule = rule;
#endif

	static const yyreduction_t YYNEARFAR YYBASED_CODE reduction[] = {
		{ 0, 1, -1 },
		{ 1, 3, 0 },
		{ 1, 2, -1 },
		{ 1, 0, -1 },
		{ 2, 3, 1 },
		{ 2, 3, 2 },
		{ 2, 3, 3 },
		{ 2, 3, 4 },
		{ 2, 3, 5 },
		{ 2, 2, 6 },
		{ 2, 1, -1 },
		{ 3, 1, -1 },
		{ 3, 2, 7 },
		{ 4, 1, 8 },
		{ 4, 1, 9 },
		{ 4, 1, 10 },
		{ 4, 1, 11 },
		{ 4, 1, 12 },
		{ 4, 1, 13 },
		{ 4, 1, 14 },
		{ 4, 1, 15 },
		{ 4, 1, 16 },
		{ 4, 1, 17 },
		{ 4, 1, 18 },
		{ 4, 1, 19 },
		{ 4, 1, 20 },
		{ 4, 1, 21 },
		{ 4, 1, 22 },
		{ 4, 1, 23 },
		{ 4, 1, 24 },
		{ 4, 1, 25 },
		{ 4, 1, 26 },
		{ 4, 1, 27 },
		{ 4, 1, 28 },
		{ 4, 1, 29 },
		{ 4, 1, 30 },
		{ 4, 1, 31 },
		{ 4, 1, 32 },
		{ 4, 1, 33 },
		{ 4, 1, 34 },
		{ 4, 1, 35 },
		{ 4, 1, 36 },
		{ 4, 1, 37 },
		{ 4, 1, 38 },
		{ 4, 1, 39 },
		{ 4, 1, 40 },
		{ 4, 1, 41 },
		{ 4, 1, 42 },
		{ 4, 1, 43 },
		{ 4, 1, 44 },
		{ 4, 1, 45 },
		{ 4, 1, 46 },
		{ 4, 1, 47 },
		{ 4, 1, 48 },
		{ 4, 1, 49 },
		{ 4, 1, 50 },
		{ 4, 1, 51 },
		{ 4, 1, 52 },
		{ 4, 1, 53 },
		{ 4, 1, 54 },
		{ 4, 1, 55 },
		{ 4, 1, 56 },
		{ 4, 1, 57 },
		{ 4, 1, 58 },
		{ 4, 1, 59 },
		{ 4, 1, 60 },
		{ 4, 1, 61 },
		{ 4, 1, 62 },
		{ 4, 1, 63 },
		{ 4, 1, 64 },
		{ 4, 1, 65 },
		{ 4, 1, 66 },
		{ 4, 1, 67 },
		{ 4, 1, 68 },
		{ 4, 1, 69 },
		{ 4, 1, 70 }
	};
	yyreduction = reduction;

	yytokenaction_size = 215;

	static const yytokenaction_t YYNEARFAR YYBASED_CODE tokenaction[] = {
		{ 77, YYAT_SHIFT, 2 },
		{ 77, YYAT_SHIFT, 3 },
		{ 77, YYAT_SHIFT, 4 },
		{ 77, YYAT_SHIFT, 5 },
		{ 77, YYAT_SHIFT, 6 },
		{ 77, YYAT_SHIFT, 7 },
		{ 77, YYAT_SHIFT, 8 },
		{ 77, YYAT_SHIFT, 9 },
		{ 77, YYAT_SHIFT, 10 },
		{ 77, YYAT_SHIFT, 11 },
		{ -1, YYAT_ERROR, 0 },
		{ 68, YYAT_SHIFT, 73 },
		{ 81, YYAT_SHIFT, 76 },
		{ 81, YYAT_SHIFT, 77 },
		{ 80, YYAT_SHIFT, 76 },
		{ 80, YYAT_SHIFT, 77 },
		{ -1, YYAT_ERROR, 0 },
		{ 77, YYAT_SHIFT, 13 },
		{ 77, YYAT_SHIFT, 14 },
		{ 77, YYAT_SHIFT, 15 },
		{ 77, YYAT_SHIFT, 16 },
		{ 77, YYAT_SHIFT, 17 },
		{ 77, YYAT_SHIFT, 18 },
		{ 77, YYAT_SHIFT, 19 },
		{ 77, YYAT_SHIFT, 20 },
		{ 77, YYAT_SHIFT, 21 },
		{ 77, YYAT_SHIFT, 22 },
		{ 77, YYAT_SHIFT, 23 },
		{ 77, YYAT_SHIFT, 24 },
		{ 77, YYAT_SHIFT, 25 },
		{ 77, YYAT_SHIFT, 26 },
		{ 77, YYAT_SHIFT, 27 },
		{ 77, YYAT_SHIFT, 28 },
		{ 77, YYAT_SHIFT, 29 },
		{ 77, YYAT_SHIFT, 30 },
		{ 77, YYAT_SHIFT, 31 },
		{ 77, YYAT_SHIFT, 32 },
		{ 77, YYAT_SHIFT, 33 },
		{ 77, YYAT_SHIFT, 34 },
		{ 77, YYAT_SHIFT, 35 },
		{ 77, YYAT_SHIFT, 36 },
		{ 77, YYAT_SHIFT, 37 },
		{ 77, YYAT_SHIFT, 38 },
		{ 72, YYAT_SHIFT, 74 },
		{ 72, YYAT_SHIFT, 75 },
		{ 72, YYAT_SHIFT, 76 },
		{ 72, YYAT_SHIFT, 77 },
		{ 77, YYAT_SHIFT, 39 },
		{ 72, YYAT_SHIFT, 79 },
		{ 77, YYAT_SHIFT, 40 },
		{ 77, YYAT_SHIFT, 41 },
		{ 77, YYAT_SHIFT, 42 },
		{ 77, YYAT_SHIFT, 43 },
		{ 77, YYAT_SHIFT, 44 },
		{ 77, YYAT_SHIFT, 45 },
		{ 77, YYAT_SHIFT, 46 },
		{ 77, YYAT_SHIFT, 47 },
		{ 77, YYAT_SHIFT, 48 },
		{ 77, YYAT_SHIFT, 49 },
		{ 77, YYAT_SHIFT, 50 },
		{ 77, YYAT_SHIFT, 51 },
		{ 77, YYAT_SHIFT, 52 },
		{ 77, YYAT_SHIFT, 53 },
		{ 77, YYAT_SHIFT, 54 },
		{ 77, YYAT_SHIFT, 55 },
		{ 77, YYAT_SHIFT, 56 },
		{ 77, YYAT_SHIFT, 57 },
		{ 77, YYAT_SHIFT, 58 },
		{ 77, YYAT_SHIFT, 59 },
		{ 77, YYAT_SHIFT, 60 },
		{ 77, YYAT_SHIFT, 61 },
		{ 77, YYAT_SHIFT, 62 },
		{ 77, YYAT_SHIFT, 63 },
		{ 77, YYAT_SHIFT, 64 },
		{ 77, YYAT_SHIFT, 65 },
		{ 69, YYAT_SHIFT, 2 },
		{ 69, YYAT_SHIFT, 3 },
		{ 69, YYAT_SHIFT, 4 },
		{ 69, YYAT_SHIFT, 5 },
		{ 69, YYAT_SHIFT, 6 },
		{ 69, YYAT_SHIFT, 7 },
		{ 69, YYAT_SHIFT, 8 },
		{ 69, YYAT_SHIFT, 9 },
		{ 69, YYAT_SHIFT, 10 },
		{ 69, YYAT_SHIFT, 11 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ 1, YYAT_ACCEPT, 0 },
		{ 69, YYAT_SHIFT, 13 },
		{ 69, YYAT_SHIFT, 14 },
		{ 69, YYAT_SHIFT, 15 },
		{ 69, YYAT_SHIFT, 16 },
		{ 69, YYAT_SHIFT, 17 },
		{ 69, YYAT_SHIFT, 18 },
		{ 69, YYAT_SHIFT, 19 },
		{ 69, YYAT_SHIFT, 20 },
		{ 69, YYAT_SHIFT, 21 },
		{ 69, YYAT_SHIFT, 22 },
		{ 69, YYAT_SHIFT, 23 },
		{ 69, YYAT_SHIFT, 24 },
		{ 69, YYAT_SHIFT, 25 },
		{ 69, YYAT_SHIFT, 26 },
		{ 69, YYAT_SHIFT, 27 },
		{ 69, YYAT_SHIFT, 28 },
		{ 69, YYAT_SHIFT, 29 },
		{ 69, YYAT_SHIFT, 30 },
		{ 69, YYAT_SHIFT, 31 },
		{ 69, YYAT_SHIFT, 32 },
		{ 69, YYAT_SHIFT, 33 },
		{ 69, YYAT_SHIFT, 34 },
		{ 69, YYAT_SHIFT, 35 },
		{ 69, YYAT_SHIFT, 36 },
		{ 69, YYAT_SHIFT, 37 },
		{ 69, YYAT_SHIFT, 38 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ 69, YYAT_SHIFT, 39 },
		{ -1, YYAT_ERROR, 0 },
		{ 69, YYAT_SHIFT, 40 },
		{ 69, YYAT_SHIFT, 41 },
		{ 69, YYAT_SHIFT, 42 },
		{ 69, YYAT_SHIFT, 43 },
		{ 69, YYAT_SHIFT, 44 },
		{ 69, YYAT_SHIFT, 45 },
		{ 69, YYAT_SHIFT, 46 },
		{ 69, YYAT_SHIFT, 47 },
		{ 69, YYAT_SHIFT, 48 },
		{ 69, YYAT_SHIFT, 49 },
		{ 69, YYAT_SHIFT, 50 },
		{ 69, YYAT_SHIFT, 51 },
		{ 69, YYAT_SHIFT, 52 },
		{ 69, YYAT_SHIFT, 53 },
		{ 69, YYAT_SHIFT, 54 },
		{ 69, YYAT_SHIFT, 55 },
		{ 69, YYAT_SHIFT, 56 },
		{ 69, YYAT_SHIFT, 57 },
		{ 69, YYAT_SHIFT, 58 },
		{ 69, YYAT_SHIFT, 59 },
		{ 69, YYAT_SHIFT, 60 },
		{ 69, YYAT_SHIFT, 61 },
		{ 69, YYAT_SHIFT, 62 },
		{ 69, YYAT_SHIFT, 63 },
		{ 69, YYAT_SHIFT, 64 },
		{ 69, YYAT_SHIFT, 65 },
		{ 1, YYAT_SHIFT, 12 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ 77, YYAT_SHIFT, 66 },
		{ -1, YYAT_ERROR, 0 },
		{ -1, YYAT_ERROR, 0 },
		{ 77, YYAT_SHIFT, 67 },
		{ 68, YYAT_ERROR, 0 }
	};
	yytokenaction = tokenaction;

	static const yystateaction_t YYNEARFAR YYBASED_CODE stateaction[] = {
		{ 0, 0, YYAT_REDUCE, 3 },
		{ 91, 1, YYAT_DEFAULT, 77 },
		{ 0, 0, YYAT_REDUCE, 13 },
		{ 0, 0, YYAT_REDUCE, 14 },
		{ 0, 0, YYAT_REDUCE, 15 },
		{ 0, 0, YYAT_REDUCE, 16 },
		{ 0, 0, YYAT_REDUCE, 17 },
		{ 0, 0, YYAT_REDUCE, 18 },
		{ 0, 0, YYAT_REDUCE, 19 },
		{ 0, 0, YYAT_REDUCE, 20 },
		{ 0, 0, YYAT_REDUCE, 21 },
		{ 0, 0, YYAT_REDUCE, 22 },
		{ 0, 0, YYAT_REDUCE, 2 },
		{ 0, 0, YYAT_REDUCE, 50 },
		{ 0, 0, YYAT_REDUCE, 51 },
		{ 0, 0, YYAT_REDUCE, 52 },
		{ 0, 0, YYAT_REDUCE, 53 },
		{ 0, 0, YYAT_REDUCE, 54 },
		{ 0, 0, YYAT_REDUCE, 55 },
		{ 0, 0, YYAT_REDUCE, 56 },
		{ 0, 0, YYAT_REDUCE, 57 },
		{ 0, 0, YYAT_REDUCE, 58 },
		{ 0, 0, YYAT_REDUCE, 59 },
		{ 0, 0, YYAT_REDUCE, 60 },
		{ 0, 0, YYAT_REDUCE, 61 },
		{ 0, 0, YYAT_REDUCE, 62 },
		{ 0, 0, YYAT_REDUCE, 63 },
		{ 0, 0, YYAT_REDUCE, 64 },
		{ 0, 0, YYAT_REDUCE, 65 },
		{ 0, 0, YYAT_REDUCE, 66 },
		{ 0, 0, YYAT_REDUCE, 67 },
		{ 0, 0, YYAT_REDUCE, 68 },
		{ 0, 0, YYAT_REDUCE, 69 },
		{ 0, 0, YYAT_REDUCE, 70 },
		{ 0, 0, YYAT_REDUCE, 71 },
		{ 0, 0, YYAT_REDUCE, 72 },
		{ 0, 0, YYAT_REDUCE, 73 },
		{ 0, 0, YYAT_REDUCE, 74 },
		{ 0, 0, YYAT_REDUCE, 75 },
		{ 0, 0, YYAT_REDUCE, 23 },
		{ 0, 0, YYAT_REDUCE, 24 },
		{ 0, 0, YYAT_REDUCE, 25 },
		{ 0, 0, YYAT_REDUCE, 26 },
		{ 0, 0, YYAT_REDUCE, 27 },
		{ 0, 0, YYAT_REDUCE, 28 },
		{ 0, 0, YYAT_REDUCE, 29 },
		{ 0, 0, YYAT_REDUCE, 30 },
		{ 0, 0, YYAT_REDUCE, 31 },
		{ 0, 0, YYAT_REDUCE, 32 },
		{ 0, 0, YYAT_REDUCE, 33 },
		{ 0, 0, YYAT_REDUCE, 34 },
		{ 0, 0, YYAT_REDUCE, 35 },
		{ 0, 0, YYAT_REDUCE, 36 },
		{ 0, 0, YYAT_REDUCE, 37 },
		{ 0, 0, YYAT_REDUCE, 38 },
		{ 0, 0, YYAT_REDUCE, 39 },
		{ 0, 0, YYAT_REDUCE, 40 },
		{ 0, 0, YYAT_REDUCE, 41 },
		{ 0, 0, YYAT_REDUCE, 42 },
		{ 0, 0, YYAT_REDUCE, 43 },
		{ 0, 0, YYAT_REDUCE, 44 },
		{ 0, 0, YYAT_REDUCE, 45 },
		{ 0, 0, YYAT_REDUCE, 46 },
		{ 0, 0, YYAT_REDUCE, 47 },
		{ 0, 0, YYAT_REDUCE, 48 },
		{ 0, 0, YYAT_REDUCE, 49 },
		{ 0, 0, YYAT_DEFAULT, 77 },
		{ 0, 0, YYAT_DEFAULT, 77 },
		{ -48, 1, YYAT_DEFAULT, 72 },
		{ 27, 1, YYAT_REDUCE, 10 },
		{ 0, 0, YYAT_REDUCE, 11 },
		{ 0, 0, YYAT_REDUCE, 9 },
		{ -214, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 1 },
		{ 0, 0, YYAT_DEFAULT, 77 },
		{ 0, 0, YYAT_DEFAULT, 77 },
		{ 0, 0, YYAT_DEFAULT, 77 },
		{ -48, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 12 },
		{ 0, 0, YYAT_REDUCE, 8 },
		{ -245, 1, YYAT_REDUCE, 4 },
		{ -247, 1, YYAT_REDUCE, 5 },
		{ 0, 0, YYAT_REDUCE, 6 },
		{ 0, 0, YYAT_REDUCE, 7 }
	};
	yystateaction = stateaction;

	yynontermgoto_size = 11;

	static const yynontermgoto_t YYNEARFAR YYBASED_CODE nontermgoto[] = {
		{ 77, 83 },
		{ 77, 69 },
		{ 77, 70 },
		{ 76, 82 },
		{ 75, 81 },
		{ 74, 80 },
		{ 69, 78 },
		{ 67, 72 },
		{ 66, 71 },
		{ 1, 68 },
		{ 0, 1 }
	};
	yynontermgoto = nontermgoto;

	static const yystategoto_t YYNEARFAR YYBASED_CODE stategoto[] = {
		{ 9, -1 },
		{ 7, 77 },
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
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 6, 77 },
		{ 5, 77 },
		{ 0, -1 },
		{ 2, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 3, 77 },
		{ 2, 77 },
		{ 1, 77 },
		{ -2, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 }
	};
	yystategoto = stategoto;

	yydestructorptr = NULL;

	yytokendestptr = NULL;
	yytokendest_size = 0;

	yytokendestbaseptr = NULL;
	yytokendestbase_size = 0;
}
#line 140 ".\\post.y"


/////////////////////////////////////////////////////////////////////////////
// programs section

int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
	char c;
	c = cin.get();
	while(true) {
		if(c== ' ' || c == '\t' || c == '\n') 
		{	c = cin.get();continue;}
		switch(c)
       {
         case '+':
              return ADD;
              break;
         case '-':
              return SUB;
              break;
         case '*':
              return MUL;
              break;
         case '/':
              return DIV;
              break;
         case '(':
              return LP;
              break;
         case ')':
              return RP;
              break;
         default:
			  {while (c==' '||c=='\t'||c=='\n')
				c=cin.get();
			   return c;break;
			  }    
        }
        
	}
}

int main(void)
{
	int n = 1;
	post parser;
	if (parser.yycreate()) {
		n = parser.yyparse();
	}
	return n;
}
