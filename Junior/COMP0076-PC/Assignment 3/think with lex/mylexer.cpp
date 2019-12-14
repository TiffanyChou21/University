/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 28 of your 30 day trial period.
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
* Date: 10/14/19
* Time: 07:56:02
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

Date: 2019年10月14日
****************************************************************************/
#include <iostream>
#include "think.h"
#include "token_table.h"
using namespace std;

#line 51 "mylexer.cpp"
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
#line 25 ".\\mylexer.l"

//this code will be added into yyaction function
    YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;

#line 148 "mylexer.cpp"
	yyreturnflg = yytrue;
	switch (action) {
	case 1:
		{
#line 30 ".\\mylexer.l"
/* do nothing */
#line 155 "mylexer.cpp"
		}
		break;
	case 2:
		{
#line 31 ".\\mylexer.l"
return ADD;
#line 162 "mylexer.cpp"
		}
		break;
	case 3:
		{
#line 32 ".\\mylexer.l"
return SUB;
#line 169 "mylexer.cpp"
		}
		break;
	case 4:
		{
#line 33 ".\\mylexer.l"
return MUL;
#line 176 "mylexer.cpp"
		}
		break;
	case 5:
		{
#line 34 ".\\mylexer.l"
return DIV;
#line 183 "mylexer.cpp"
		}
		break;
	case 6:
		{
#line 35 ".\\mylexer.l"
return LP;
#line 190 "mylexer.cpp"
		}
		break;
	case 7:
		{
#line 36 ".\\mylexer.l"
return RP;
#line 197 "mylexer.cpp"
		}
		break;
	case 8:
		{
#line 37 ".\\mylexer.l"
return ASSIGN;
#line 204 "mylexer.cpp"
		}
		break;
	case 9:
		{
#line 38 ".\\mylexer.l"
return EOL;
#line 211 "mylexer.cpp"
		}
		break;
	case 10:
		{
#line 39 ".\\mylexer.l"

				int pos = token_table.find(yytext);
				if(pos == -1){
					pos = token_table.insert(yytext);
				}
				yylval = pos;//return the position
				return ID;
			
#line 225 "mylexer.cpp"
		}
		break;
	case 11:
		{
#line 47 ".\\mylexer.l"
yylval = atof(yytext);//字符串转数
			 return NUMBER;
#line 233 "mylexer.cpp"
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

	yytransitionmax = 139;
	static const yytransition_t YYNEARFAR YYBASED_CODE transition[] = {
		{ 0, 0 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 13, 13 },
		{ 0, 0 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 13, 13 },
		{ 3, 1 },
		{ 3, 1 },
		{ 3, 3 },
		{ 3, 3 },
		{ 14, 10 },
		{ 0, 0 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 10, 10 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 3, 1 },
		{ 0, 0 },
		{ 3, 3 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 0, 0 },
		{ 4, 1 },
		{ 5, 1 },
		{ 6, 1 },
		{ 7, 1 },
		{ 0, 0 },
		{ 8, 1 },
		{ 0, 0 },
		{ 9, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 10, 1 },
		{ 0, 0 },
		{ 11, 1 },
		{ 0, 0 },
		{ 12, 1 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 },
		{ 15, 15 }
	};
	yytransition = transition;

	static const yystate_t YYNEARFAR YYBASED_CODE state[] = {
		{ 0, 0, 0 },
		{ 13, 67, 0 },
		{ 1, 0, 0 },
		{ 0, 69, 1 },
		{ 0, 0, 6 },
		{ 0, 0, 7 },
		{ 0, 0, 4 },
		{ 0, 0, 2 },
		{ 0, 0, 3 },
		{ 0, 0, 5 },
		{ 0, 34, 11 },
		{ 0, 0, 9 },
		{ 0, 0, 8 },
		{ 0, -47, 10 },
		{ 15, 0, 0 },
		{ 0, 81, 11 }
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
		0
	};
	yybackup = backup;
}
#line 49 ".\\mylexer.l"


