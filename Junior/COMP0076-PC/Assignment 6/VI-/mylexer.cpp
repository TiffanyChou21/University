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
* mylexer.cpp
* C++ source file generated from mylexer.l.
* 
* Date: 11/27/19
* Time: 18:44:56
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

Date: 2019Äê11ÔÂ23ÈÕ
****************************************************************************/
#include "myparser.h"
#include "tree.h"
#include<iostream>
#pragma warning(disable:4996)

using namespace std;
extern IDtable SymTable[1000];
treenode *node;
extern mytree m1;
extern int symNum;
extern int Line;

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
#line 57 ".\\mylexer.l"

	// extract yylval for use later on in actions
	YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;

#line 167 "mylexer.cpp"
	yyreturnflg = yytrue;
	switch (action) {
	case 1:
		{
#line 63 ".\\mylexer.l"
/*doing nothing*/
#line 174 "mylexer.cpp"
		}
		break;
	case 2:
		{
#line 64 ".\\mylexer.l"
/*doing nothing*/
#line 181 "mylexer.cpp"
		}
		break;
	case 3:
		{
#line 65 ".\\mylexer.l"
Line++;
#line 188 "mylexer.cpp"
		}
		break;
	case 4:
		{
#line 66 ".\\mylexer.l"
return MAIN;
#line 195 "mylexer.cpp"
		}
		break;
	case 5:
		{
#line 67 ".\\mylexer.l"
return INT;
#line 202 "mylexer.cpp"
		}
		break;
	case 6:
		{
#line 68 ".\\mylexer.l"
return CHAR;
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
return BOOL;
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
return CIN;
#line 237 "mylexer.cpp"
		}
		break;
	case 11:
		{
#line 73 ".\\mylexer.l"
return COUT;
#line 244 "mylexer.cpp"
		}
		break;
	case 12:
		{
#line 74 ".\\mylexer.l"
return IF;
#line 251 "mylexer.cpp"
		}
		break;
	case 13:
		{
#line 75 ".\\mylexer.l"
return ELSE;
#line 258 "mylexer.cpp"
		}
		break;
	case 14:
		{
#line 76 ".\\mylexer.l"
return WHILE;
#line 265 "mylexer.cpp"
		}
		break;
	case 15:
		{
#line 77 ".\\mylexer.l"
return DO;
#line 272 "mylexer.cpp"
		}
		break;
	case 16:
		{
#line 78 ".\\mylexer.l"
return FOR;
#line 279 "mylexer.cpp"
		}
		break;
	case 17:
		{
#line 79 ".\\mylexer.l"
return BREAK;
#line 286 "mylexer.cpp"
		}
		break;
	case 18:
		{
#line 80 ".\\mylexer.l"
return RETURN;
#line 293 "mylexer.cpp"
		}
		break;
	case 19:
		{
#line 82 ".\\mylexer.l"
return ADD;
#line 300 "mylexer.cpp"
		}
		break;
	case 20:
		{
#line 83 ".\\mylexer.l"
return SUB;
#line 307 "mylexer.cpp"
		}
		break;
	case 21:
		{
#line 84 ".\\mylexer.l"
return MUL;
#line 314 "mylexer.cpp"
		}
		break;
	case 22:
		{
#line 85 ".\\mylexer.l"
return DIV;
#line 321 "mylexer.cpp"
		}
		break;
	case 23:
		{
#line 86 ".\\mylexer.l"
return MOD;
#line 328 "mylexer.cpp"
		}
		break;
	case 24:
		{
#line 87 ".\\mylexer.l"
return INC;
#line 335 "mylexer.cpp"
		}
		break;
	case 25:
		{
#line 88 ".\\mylexer.l"
return DEC;
#line 342 "mylexer.cpp"
		}
		break;
	case 26:
		{
#line 90 ".\\mylexer.l"
return ASSIGN;
#line 349 "mylexer.cpp"
		}
		break;
	case 27:
		{
#line 92 ".\\mylexer.l"
return LB;
#line 356 "mylexer.cpp"
		}
		break;
	case 28:
		{
#line 93 ".\\mylexer.l"
return RB;
#line 363 "mylexer.cpp"
		}
		break;
	case 29:
		{
#line 94 ".\\mylexer.l"
return LP;
#line 370 "mylexer.cpp"
		}
		break;
	case 30:
		{
#line 95 ".\\mylexer.l"
return RP;
#line 377 "mylexer.cpp"
		}
		break;
	case 31:
		{
#line 96 ".\\mylexer.l"
return LSB;
#line 384 "mylexer.cpp"
		}
		break;
	case 32:
		{
#line 97 ".\\mylexer.l"
return RSB;
#line 391 "mylexer.cpp"
		}
		break;
	case 33:
		{
#line 98 ".\\mylexer.l"
return SEMICOLON;
#line 398 "mylexer.cpp"
		}
		break;
	case 34:
		{
#line 99 ".\\mylexer.l"
return COMMA;
#line 405 "mylexer.cpp"
		}
		break;
	case 35:
		{
#line 101 ".\\mylexer.l"
return EQ;
#line 412 "mylexer.cpp"
		}
		break;
	case 36:
		{
#line 102 ".\\mylexer.l"
return GT;
#line 419 "mylexer.cpp"
		}
		break;
	case 37:
		{
#line 103 ".\\mylexer.l"
return LT;
#line 426 "mylexer.cpp"
		}
		break;
	case 38:
		{
#line 104 ".\\mylexer.l"
return GE;
#line 433 "mylexer.cpp"
		}
		break;
	case 39:
		{
#line 105 ".\\mylexer.l"
return LE;
#line 440 "mylexer.cpp"
		}
		break;
	case 40:
		{
#line 106 ".\\mylexer.l"
return NE;
#line 447 "mylexer.cpp"
		}
		break;
	case 41:
		{
#line 108 ".\\mylexer.l"
return BNOT;
#line 454 "mylexer.cpp"
		}
		break;
	case 42:
		{
#line 109 ".\\mylexer.l"
return BAND;
#line 461 "mylexer.cpp"
		}
		break;
	case 43:
		{
#line 110 ".\\mylexer.l"
return BOR;
#line 468 "mylexer.cpp"
		}
		break;
	case 44:
		{
#line 111 ".\\mylexer.l"
return AND;
#line 475 "mylexer.cpp"
		}
		break;
	case 45:
		{
#line 112 ".\\mylexer.l"
return OR;
#line 482 "mylexer.cpp"
		}
		break;
	case 46:
		{
#line 113 ".\\mylexer.l"
return NOT;
#line 489 "mylexer.cpp"
		}
		break;
	case 47:
		{
#line 114 ".\\mylexer.l"
return XOR;
#line 496 "mylexer.cpp"
		}
		break;
	case 48:
		{
#line 115 ".\\mylexer.l"
return SHL;
#line 503 "mylexer.cpp"
		}
		break;
	case 49:
		{
#line 116 ".\\mylexer.l"
return SHR;
#line 510 "mylexer.cpp"
		}
		break;
	case 50:
		{
#line 121 ".\\mylexer.l"
   node=new treenode;
                   yylval=node;
                   yylval->constchar=yytext[1];
				   /*yylval->charval=new char[yyleng+1];
				   strcpy(yylval->charval,yytext);
				   strncpy(yylval->charval,yylval->charval+1,yyleng);
				   for(int i=0;i<yyleng;i++)
				   {
						if(yylval->charval[i]=='\'')
							yylval->charval[i]='\0';
				   }*/
                   return CONSTCHAR;
                   
#line 529 "mylexer.cpp"
		}
		break;
#line 134 ".\\mylexer.l"
 
#line 534 "mylexer.cpp"
	case 51:
		{
#line 135 ".\\mylexer.l"

               node=new treenode;
               int address;
               if(m1.addSymbol(yytext)==-1)  address=symNum-1;
               else address=m1.addSymbol(yytext);
               SymTable[address].type="";
               yylval=node;
               yylval->IDaddr=address; 
               return ID;
               
#line 548 "mylexer.cpp"
		}
		break;
	case 52:
		{
#line 145 ".\\mylexer.l"

             node=new treenode;
             yylval=node;
             yylval->val=atoi(yytext);
             return NUMBER;
            
#line 560 "mylexer.cpp"
		}
		break;
	case 53:
		{
#line 151 ".\\mylexer.l"

#line 567 "mylexer.cpp"
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
		{ 4, 1 },
		{ 5, 1 },
		{ 4, 1 },
		{ 4, 1 },
		{ 4, 1 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 73, 73 },
		{ 0, 101 },
		{ 89, 71 },
		{ 63, 31 },
		{ 74, 49 },
		{ 55, 26 },
		{ 74, 49 },
		{ 90, 71 },
		{ 56, 26 },
		{ 71, 101 },
		{ 6, 1 },
		{ 64, 31 },
		{ 49, 73 },
		{ 72, 101 },
		{ 7, 1 },
		{ 8, 1 },
		{ 9, 1 },
		{ 10, 1 },
		{ 11, 1 },
		{ 12, 1 },
		{ 13, 1 },
		{ 14, 1 },
		{ 15, 1 },
		{ 62, 30 },
		{ 16, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 17, 1 },
		{ 46, 16 },
		{ 18, 1 },
		{ 19, 1 },
		{ 20, 1 },
		{ 21, 1 },
		{ 47, 16 },
		{ 41, 8 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 23, 1 },
		{ 65, 32 },
		{ 24, 1 },
		{ 25, 1 },
		{ 22, 1 },
		{ 66, 33 },
		{ 22, 1 },
		{ 26, 1 },
		{ 27, 1 },
		{ 28, 1 },
		{ 29, 1 },
		{ 30, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 31, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 32, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 33, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 34, 1 },
		{ 35, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 22, 1 },
		{ 36, 1 },
		{ 37, 1 },
		{ 38, 1 },
		{ 39, 1 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 4, 4 },
		{ 67, 34 },
		{ 4, 4 },
		{ 4, 4 },
		{ 4, 4 },
		{ 50, 19 },
		{ 51, 19 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 53, 21 },
		{ 54, 21 },
		{ 68, 35 },
		{ 69, 37 },
		{ 22, 107 },
		{ 70, 42 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 22, 107 },
		{ 46, 89 },
		{ 48, 17 },
		{ 0, 43 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 17, 17 },
		{ 101, 89 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 75, 75 },
		{ 57, 27 },
		{ 58, 27 },
		{ 0, 47 },
		{ 0, 48 },
		{ 43, 9 },
		{ 76, 55 },
		{ 77, 56 },
		{ 59, 27 },
		{ 78, 57 },
		{ 79, 58 },
		{ 80, 59 },
		{ 81, 60 },
		{ 82, 61 },
		{ 83, 62 },
		{ 84, 64 },
		{ 85, 65 },
		{ 86, 66 },
		{ 87, 67 },
		{ 88, 68 },
		{ 52, 20 },
		{ 89, 72 },
		{ 44, 13 },
		{ 45, 15 },
		{ 91, 76 },
		{ 92, 77 },
		{ 93, 78 },
		{ 94, 80 },
		{ 95, 81 },
		{ 96, 82 },
		{ 97, 85 },
		{ 98, 86 },
		{ 99, 87 },
		{ 100, 88 },
		{ 40, 6 },
		{ 102, 92 },
		{ 103, 95 },
		{ 104, 98 },
		{ 105, 100 },
		{ 60, 28 },
		{ 106, 103 },
		{ 107, 104 },
		{ 61, 29 }
	};
	yytransition = transition;

	static const yystate_t YYNEARFAR YYBASED_CODE state[] = {
		{ 0, 0, 0 },
		{ -3, -8, 0 },
		{ 1, 0, 0 },
		{ 0, 0, 53 },
		{ 0, 120, 2 },
		{ 0, 0, 3 },
		{ 0, 190, 46 },
		{ 0, 0, 23 },
		{ 0, 18, 42 },
		{ 43, 130, 53 },
		{ 0, 0, 29 },
		{ 0, 0, 30 },
		{ 0, 0, 21 },
		{ 0, 196, 19 },
		{ 0, 0, 34 },
		{ 0, 195, 20 },
		{ 0, 8, 22 },
		{ 73, 149, 52 },
		{ 0, 0, 33 },
		{ 0, 74, 37 },
		{ 0, 176, 26 },
		{ 0, 101, 36 },
		{ 107, 0, 51 },
		{ 0, 0, 31 },
		{ 0, 0, 32 },
		{ 0, 0, 47 },
		{ 107, -91, 51 },
		{ 107, 114, 51 },
		{ 107, 145, 51 },
		{ 107, 151, 51 },
		{ 107, -73, 51 },
		{ 107, -84, 51 },
		{ 107, -13, 51 },
		{ 107, -13, 51 },
		{ 107, 19, 51 },
		{ 107, 60, 51 },
		{ 0, 0, 27 },
		{ 0, 41, 43 },
		{ 0, 0, 28 },
		{ 0, 0, 41 },
		{ 0, 0, 40 },
		{ 0, 0, 44 },
		{ 0, 128, 0 },
		{ -42, 186, 0 },
		{ 0, 0, 24 },
		{ 0, 0, 25 },
		{ 101, 0, 0 },
		{ -47, 210, 1 },
		{ 73, 152, 0 },
		{ 75, -24, 0 },
		{ 0, 0, 48 },
		{ 0, 0, 39 },
		{ 0, 0, 35 },
		{ 0, 0, 38 },
		{ 0, 0, 49 },
		{ 107, 112, 51 },
		{ 107, 123, 51 },
		{ 107, 129, 51 },
		{ 107, 117, 51 },
		{ 107, 111, 51 },
		{ 107, 112, 15 },
		{ 107, 115, 51 },
		{ 107, 117, 51 },
		{ 107, 0, 12 },
		{ 107, 116, 51 },
		{ 107, 128, 51 },
		{ 107, 118, 51 },
		{ 107, 130, 51 },
		{ 107, 131, 51 },
		{ 0, 0, 45 },
		{ 0, 0, 50 },
		{ -46, -25, 0 },
		{ 101, 196, 0 },
		{ 0, -42, 52 },
		{ 75, 0, 0 },
		{ 0, 160, 52 },
		{ 107, 133, 51 },
		{ 107, 145, 51 },
		{ 107, 129, 51 },
		{ 107, 0, 10 },
		{ 107, 128, 51 },
		{ 107, 147, 51 },
		{ 107, 145, 51 },
		{ 107, 0, 16 },
		{ 107, 0, 5 },
		{ 107, 137, 51 },
		{ 107, 131, 51 },
		{ 107, 149, 51 },
		{ 107, 142, 51 },
		{ 72, 160, 0 },
		{ 0, 0, 1 },
		{ 107, 0, 8 },
		{ 107, 145, 51 },
		{ 107, 0, 6 },
		{ 107, 0, 11 },
		{ 107, 145, 51 },
		{ 107, 0, 13 },
		{ 107, 0, 4 },
		{ 107, 140, 51 },
		{ 107, 0, 7 },
		{ 107, 154, 51 },
		{ -46, -18, 1 },
		{ 107, 0, 17 },
		{ 107, 156, 51 },
		{ 107, 148, 51 },
		{ 107, 0, 14 },
		{ 107, 0, 9 },
		{ 0, 71, 18 }
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
		0
	};
	yybackup = backup;
}
#line 152 ".\\mylexer.l"


/////////////////////////////////////////////////////////////////////////////
// programs section


