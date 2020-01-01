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
* mylexer.cpp
* C++ source file generated from mylexer.l.
* 
* Date: 12/19/19
* Time: 20:34:11
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

#line 1 ".\\mylexer.l"

/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Zcf 1712991

Date: 2019年12月3日
****************************************************************************/

#include "myparser.h"
#include <iostream>
#include <string>
#include <cstring>
#include <stdlib.h>
#include "tree.h"

char idTable[100][100];
int idNum=0;
int Line=0;

#line 60 "mylexer.cpp"
// repeated because of possible precompiled header
#include <yyclex.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\mylexer.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYLEXERNAME::YYLEXERNAME()
{
	yytables();
#line 35 ".\\mylexer.l"

	// place any extra initialisation code here

#line 84 "mylexer.cpp"
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYLEXERNAME::~YYLEXERNAME()
{
#line 40 ".\\mylexer.l"

	// place any extra cleanup code here

#line 96 "mylexer.cpp"
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
#line 56 ".\\mylexer.l"

	// extract yylval for use later on in actions
	YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;

#line 167 "mylexer.cpp"
	yyreturnflg = yytrue;
	switch (action) {
	case 1:
		{
#line 62 ".\\mylexer.l"
/*do nothing*/
#line 174 "mylexer.cpp"
		}
		break;
	case 2:
		{
#line 63 ".\\mylexer.l"
/*do nothing*/
#line 181 "mylexer.cpp"
		}
		break;
	case 3:
		{
#line 64 ".\\mylexer.l"
Line++;
#line 188 "mylexer.cpp"
		}
		break;
	case 4:
		{
#line 66 ".\\mylexer.l"
return INT;
#line 195 "mylexer.cpp"
		}
		break;
	case 5:
		{
#line 67 ".\\mylexer.l"
return CHAR;
#line 202 "mylexer.cpp"
		}
		break;
	case 6:
		{
#line 68 ".\\mylexer.l"
return BOOL;
#line 209 "mylexer.cpp"
		}
		break;
	case 7:
		{
#line 69 ".\\mylexer.l"
return VOID;
#line 216 "mylexer.cpp"
		}
		break;
	case 8:
		{
#line 70 ".\\mylexer.l"
return FLOAT;
#line 223 "mylexer.cpp"
		}
		break;
	case 9:
		{
#line 71 ".\\mylexer.l"
return DOUBLE;
#line 230 "mylexer.cpp"
		}
		break;
	case 10:
		{
#line 72 ".\\mylexer.l"
return IF;
#line 237 "mylexer.cpp"
		}
		break;
	case 11:
		{
#line 73 ".\\mylexer.l"
return ELSE;
#line 244 "mylexer.cpp"
		}
		break;
	case 12:
		{
#line 74 ".\\mylexer.l"
return WHILE;
#line 251 "mylexer.cpp"
		}
		break;
	case 13:
		{
#line 75 ".\\mylexer.l"
return FOR;
#line 258 "mylexer.cpp"
		}
		break;
	case 14:
		{
#line 76 ".\\mylexer.l"
return RETURN;
#line 265 "mylexer.cpp"
		}
		break;
	case 15:
		{
#line 77 ".\\mylexer.l"
return MAIN;
#line 272 "mylexer.cpp"
		}
		break;
	case 16:
		{
#line 78 ".\\mylexer.l"
return ENDL;
#line 279 "mylexer.cpp"
		}
		break;
	case 17:
		{
#line 79 ".\\mylexer.l"
return CIN;
#line 286 "mylexer.cpp"
		}
		break;
	case 18:
		{
#line 80 ".\\mylexer.l"
return COUT;
#line 293 "mylexer.cpp"
		}
		break;
	case 19:
		{
#line 81 ".\\mylexer.l"
return ASSIGN;
#line 300 "mylexer.cpp"
		}
		break;
	case 20:
		{
#line 83 ".\\mylexer.l"
return ADD;
#line 307 "mylexer.cpp"
		}
		break;
	case 21:
		{
#line 84 ".\\mylexer.l"
return SUB;
#line 314 "mylexer.cpp"
		}
		break;
	case 22:
		{
#line 85 ".\\mylexer.l"
return MUL;
#line 321 "mylexer.cpp"
		}
		break;
	case 23:
		{
#line 86 ".\\mylexer.l"
return DIV;
#line 328 "mylexer.cpp"
		}
		break;
	case 24:
		{
#line 87 ".\\mylexer.l"
return MOD;
#line 335 "mylexer.cpp"
		}
		break;
	case 25:
		{
#line 89 ".\\mylexer.l"
return LP;
#line 342 "mylexer.cpp"
		}
		break;
	case 26:
		{
#line 90 ".\\mylexer.l"
return RP;
#line 349 "mylexer.cpp"
		}
		break;
	case 27:
		{
#line 91 ".\\mylexer.l"
return LB;
#line 356 "mylexer.cpp"
		}
		break;
	case 28:
		{
#line 92 ".\\mylexer.l"
return RB;
#line 363 "mylexer.cpp"
		}
		break;
	case 29:
		{
#line 93 ".\\mylexer.l"
return LSP;
#line 370 "mylexer.cpp"
		}
		break;
	case 30:
		{
#line 94 ".\\mylexer.l"
return RSP;
#line 377 "mylexer.cpp"
		}
		break;
	case 31:
		{
#line 96 ".\\mylexer.l"
return INC;
#line 384 "mylexer.cpp"
		}
		break;
	case 32:
		{
#line 97 ".\\mylexer.l"
return DEC;
#line 391 "mylexer.cpp"
		}
		break;
	case 33:
		{
#line 98 ".\\mylexer.l"
return SHL;
#line 398 "mylexer.cpp"
		}
		break;
	case 34:
		{
#line 99 ".\\mylexer.l"
return SHR;
#line 405 "mylexer.cpp"
		}
		break;
	case 35:
		{
#line 100 ".\\mylexer.l"
return BAND;
#line 412 "mylexer.cpp"
		}
		break;
	case 36:
		{
#line 101 ".\\mylexer.l"
return BOR;
#line 419 "mylexer.cpp"
		}
		break;
	case 37:
		{
#line 102 ".\\mylexer.l"
return XOR;
#line 426 "mylexer.cpp"
		}
		break;
	case 38:
		{
#line 103 ".\\mylexer.l"
return NOT;
#line 433 "mylexer.cpp"
		}
		break;
	case 39:
		{
#line 105 ".\\mylexer.l"
return EQ;
#line 440 "mylexer.cpp"
		}
		break;
	case 40:
		{
#line 106 ".\\mylexer.l"
return GT;
#line 447 "mylexer.cpp"
		}
		break;
	case 41:
		{
#line 107 ".\\mylexer.l"
return LT;
#line 454 "mylexer.cpp"
		}
		break;
	case 42:
		{
#line 108 ".\\mylexer.l"
return GE;
#line 461 "mylexer.cpp"
		}
		break;
	case 43:
		{
#line 109 ".\\mylexer.l"
return LE;
#line 468 "mylexer.cpp"
		}
		break;
	case 44:
		{
#line 110 ".\\mylexer.l"
return NE;
#line 475 "mylexer.cpp"
		}
		break;
	case 45:
		{
#line 111 ".\\mylexer.l"
return AND;
#line 482 "mylexer.cpp"
		}
		break;
	case 46:
		{
#line 112 ".\\mylexer.l"
return OR;
#line 489 "mylexer.cpp"
		}
		break;
	case 47:
		{
#line 113 ".\\mylexer.l"
return OPPSITE;
#line 496 "mylexer.cpp"
		}
		break;
	case 48:
		{
#line 114 ".\\mylexer.l"
return SEMI;
#line 503 "mylexer.cpp"
		}
		break;
	case 49:
		{
#line 115 ".\\mylexer.l"
return COMMA;
#line 510 "mylexer.cpp"
		}
		break;
	case 50:
		{
#line 117 ".\\mylexer.l"
	
				for(int i=0;i<idNum;i++)
				{
					if(strcmp(idTable[i],yytext)==0)
					{
						TreeNode* idNode=newExprNode(Id);
						idNode->attr.id=new char[yyleng+1];
						strcpy_s(idNode->attr.id,strlen(yytext)+1,yytext);
						yylval=idNode;
						return ID;
					}
				}
				strcpy_s(idTable[idNum++],strlen(yytext)+1,yytext);
				TreeNode* idNode=newExprNode(Id);
				idNode->attr.id=new char[yyleng+1];
				idNode->sibling = NULL;
                idNode->nodeType = Expr;
                idNode->type.exprType = Id;
                idNode->varType = Void;
				strcpy_s(idNode->attr.id,strlen(yytext)+1,yytext);
				yylval=idNode;
				return ID;
			
#line 539 "mylexer.cpp"
		}
		break;
	case 51:
		{
#line 140 ".\\mylexer.l"

				double value=0;
				int index=-1;
				double count=10;
				for(int i=0;i<yyleng;i++)
					if(yytext[i]=='.')
						index=i;
				if (index != -1)   //浮点
				{
					for (int i = 0; i < index; i++)
						value = value * 10 + yytext[i] - '0';
					for (int i = index + 1; i < yyleng; i++)
					{
						value += (yytext[i] - '0') / count;
						count = count * 10;
					}
				}
				else   //整数
				{
					//for (int i = 0; i < yyleng; i++)
						//value = value * 10 + yytext[i] - '0';
					value=atoi(yytext);
				}
				TreeNode* constNode=newExprNode(Const);
				constNode->attr.value=value;
				constNode->varType=Int;
				yylval=constNode;
				return NUMBER;
			
#line 574 "mylexer.cpp"
		}
		break;
	case 52:
		{
#line 169 ".\\mylexer.l"
TreeNode* constNode=newExprNode(Const);   //Save as ASCII
				constNode->attr.value=yytext[1];
				constNode->varType=Char;
				yylval=constNode;
				return CHARVAL;
			
#line 586 "mylexer.cpp"
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

	yytransitionmax = 224;
	static const yytransition_t YYNEARFAR YYBASED_CODE transition[] = {
		{ 0, 0 },
		{ 3, 1 },
		{ 4, 1 },
		{ 3, 1 },
		{ 3, 1 },
		{ 3, 1 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 72, 72 },
		{ 53, 26 },
		{ 54, 26 },
		{ 0, 46 },
		{ 59, 29 },
		{ 61, 30 },
		{ 64, 32 },
		{ 60, 29 },
		{ 55, 26 },
		{ 3, 1 },
		{ 5, 1 },
		{ 0, 8 },
		{ 88, 72 },
		{ 62, 30 },
		{ 6, 1 },
		{ 7, 1 },
		{ 8, 1 },
		{ 9, 1 },
		{ 10, 1 },
		{ 11, 1 },
		{ 12, 1 },
		{ 13, 1 },
		{ 14, 1 },
		{ 65, 33 },
		{ 15, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 16, 1 },
		{ 0, 46 },
		{ 17, 1 },
		{ 18, 1 },
		{ 19, 1 },
		{ 20, 1 },
		{ 0, 8 },
		{ 44, 87 },
		{ 66, 34 },
		{ 3, 3 },
		{ 88, 72 },
		{ 3, 3 },
		{ 3, 3 },
		{ 3, 3 },
		{ 0, 100 },
		{ 101, 88 },
		{ 87, 69 },
		{ 101, 88 },
		{ 44, 15 },
		{ 67, 36 },
		{ 100, 87 },
		{ 71, 69 },
		{ 69, 100 },
		{ 45, 15 },
		{ 68, 41 },
		{ 57, 28 },
		{ 70, 100 },
		{ 58, 28 },
		{ 47, 18 },
		{ 48, 18 },
		{ 50, 20 },
		{ 51, 20 },
		{ 3, 3 },
		{ 71, 45 },
		{ 22, 1 },
		{ 43, 14 },
		{ 23, 1 },
		{ 24, 1 },
		{ 73, 52 },
		{ 74, 53 },
		{ 75, 54 },
		{ 25, 1 },
		{ 26, 1 },
		{ 27, 1 },
		{ 28, 1 },
		{ 29, 1 },
		{ 76, 55 },
		{ 77, 56 },
		{ 30, 1 },
		{ 78, 57 },
		{ 79, 58 },
		{ 80, 59 },
		{ 31, 1 },
		{ 81, 60 },
		{ 82, 62 },
		{ 83, 63 },
		{ 84, 64 },
		{ 32, 1 },
		{ 85, 65 },
		{ 86, 66 },
		{ 52, 25 },
		{ 33, 1 },
		{ 34, 1 },
		{ 87, 70 },
		{ 40, 7 },
		{ 89, 73 },
		{ 35, 1 },
		{ 36, 1 },
		{ 37, 1 },
		{ 38, 1 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 90, 74 },
		{ 91, 76 },
		{ 92, 77 },
		{ 93, 78 },
		{ 94, 79 },
		{ 95, 80 },
		{ 96, 83 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 97, 84 },
		{ 98, 85 },
		{ 99, 86 },
		{ 56, 27 },
		{ 21, 108 },
		{ 39, 5 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 21, 108 },
		{ 46, 16 },
		{ 103, 92 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 16, 16 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 102, 102 },
		{ 104, 95 },
		{ 105, 97 },
		{ 106, 99 },
		{ 42, 12 },
		{ 49, 19 },
		{ 107, 103 },
		{ 108, 105 },
		{ 63, 31 }
	};
	yytransition = transition;

	static const yystate_t YYNEARFAR YYBASED_CODE state[] = {
		{ 0, 0, 0 },
		{ 108, -8, 0 },
		{ 1, 0, 0 },
		{ 0, 49, 1 },
		{ 0, 0, 3 },
		{ 0, 106, 47 },
		{ 0, 0, 24 },
		{ 0, 75, 35 },
		{ -41, 16, 0 },
		{ 0, 0, 25 },
		{ 0, 0, 26 },
		{ 0, 0, 22 },
		{ 0, 176, 20 },
		{ 0, 0, 49 },
		{ 0, 39, 21 },
		{ 0, 25, 23 },
		{ 0, 148, 51 },
		{ 0, 0, 48 },
		{ 0, 17, 41 },
		{ 0, 159, 19 },
		{ 0, 18, 40 },
		{ 108, 0, 50 },
		{ 0, 0, 29 },
		{ 0, 0, 30 },
		{ 0, 0, 37 },
		{ 108, -2, 50 },
		{ 108, -88, 50 },
		{ 108, 54, 50 },
		{ 108, -34, 50 },
		{ 108, -89, 50 },
		{ 108, -82, 50 },
		{ 108, 126, 50 },
		{ 108, -80, 50 },
		{ 108, -73, 50 },
		{ 108, -47, 50 },
		{ 0, 0, 27 },
		{ 0, -56, 36 },
		{ 0, 0, 28 },
		{ 0, 0, 38 },
		{ 0, 0, 44 },
		{ 0, 0, 45 },
		{ 0, 34, 0 },
		{ 0, 0, 31 },
		{ 0, 0, 32 },
		{ 100, 0, 0 },
		{ -45, 72, 0 },
		{ 72, -51, 0 },
		{ 0, 0, 33 },
		{ 0, 0, 43 },
		{ 0, 0, 39 },
		{ 0, 0, 42 },
		{ 0, 0, 34 },
		{ 108, -24, 50 },
		{ 108, -9, 50 },
		{ 108, -21, 50 },
		{ 108, -22, 50 },
		{ 108, -21, 50 },
		{ 108, -17, 50 },
		{ 108, -1, 50 },
		{ 108, -11, 50 },
		{ 108, -12, 50 },
		{ 108, 0, 10 },
		{ 108, -13, 50 },
		{ 108, -1, 50 },
		{ 108, -11, 50 },
		{ 108, 2, 50 },
		{ 108, 3, 50 },
		{ 0, 0, 46 },
		{ 0, 0, 52 },
		{ -44, 23, 0 },
		{ 100, 70, 0 },
		{ 0, 0, 2 },
		{ 0, -42, 51 },
		{ 108, 6, 50 },
		{ 108, 15, 50 },
		{ 108, 0, 17 },
		{ 108, 14, 50 },
		{ 108, 33, 50 },
		{ 108, 31, 50 },
		{ 108, 25, 50 },
		{ 108, 37, 50 },
		{ 108, 0, 13 },
		{ 108, 0, 4 },
		{ 108, 25, 50 },
		{ 108, 45, 50 },
		{ 108, 63, 50 },
		{ 108, 56, 50 },
		{ 70, 22, 0 },
		{ 102, 21, 0 },
		{ 108, 0, 6 },
		{ 108, 0, 5 },
		{ 108, 0, 18 },
		{ 108, 87, 50 },
		{ 108, 0, 11 },
		{ 108, 0, 16 },
		{ 108, 100, 50 },
		{ 108, 0, 15 },
		{ 108, 103, 50 },
		{ 108, 0, 7 },
		{ 108, 117, 50 },
		{ -44, 29, 2 },
		{ 102, 0, 0 },
		{ 0, 158, 51 },
		{ 108, 120, 50 },
		{ 108, 0, 8 },
		{ 108, 112, 50 },
		{ 108, 0, 12 },
		{ 108, 0, 9 },
		{ 0, 71, 14 }
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
		0
	};
	yybackup = backup;
}
#line 175 ".\\mylexer.l"


/////////////////////////////////////////////////////////////////////////////
// programs section


