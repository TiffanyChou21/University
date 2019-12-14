/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 42 of your 30 day trial period.
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
* Date: 10/28/19
* Time: 21:12:54
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

Author:Chenfei Zhou

ID:1712991

NKU CS

Date: 2019年10月22日
****************************************************************************/
#include <iostream>
#include <fstream>
#include <string>
#include <unordered_map>
#pragma warning(disable:4996)
using namespace std;

int num_lines=0;
void lexing(string word, string lexeme);

ifstream in("a.txt");
ofstream out("lex.txt");

#line 65 "mylexer.cpp"
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
#line 43 ".\\mylexer.l"

	// place any extra initialisation code here

#line 89 "mylexer.cpp"
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYLEXERNAME::~YYLEXERNAME()
{
#line 48 ".\\mylexer.l"

	// place any extra cleanup code here

#line 101 "mylexer.cpp"
}

#line 160 ".\\mylexer.l"
		
#line 106 "mylexer.cpp"
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
	yyreturnflg = yytrue;
	switch (action) {
	case 1:
		{
#line 187 ".\\mylexer.l"
num_lines++;
#line 176 "mylexer.cpp"
		}
		break;
	case 2:
		{
#line 188 ".\\mylexer.l"
/*skip*/
#line 183 "mylexer.cpp"
		}
		break;
	case 3:
		{
#line 189 ".\\mylexer.l"
/*do nothing*/
#line 190 "mylexer.cpp"
		}
		break;
	case 4:
		{
#line 190 ".\\mylexer.l"
/*do nothing*/
#line 197 "mylexer.cpp"
		}
		break;
	case 5:
		{
#line 192 ".\\mylexer.l"
out<<"CHARVAL\t"<<yytext<<endl;
#line 204 "mylexer.cpp"
		}
		break;
	case 6:
		{
#line 193 ".\\mylexer.l"
out<<"STRINGVAL\t"<<yytext<<endl;
#line 211 "mylexer.cpp"
		}
		break;
	case 7:
		{
#line 194 ".\\mylexer.l"
lexing("IF",yytext);
#line 218 "mylexer.cpp"
		}
		break;
	case 8:
		{
#line 195 ".\\mylexer.l"
lexing("ELSE",yytext);
#line 225 "mylexer.cpp"
		}
		break;
	case 9:
		{
#line 196 ".\\mylexer.l"
lexing("WHILE",yytext);
#line 232 "mylexer.cpp"
		}
		break;
	case 10:
		{
#line 197 ".\\mylexer.l"
lexing("SIGNED",yytext);
#line 239 "mylexer.cpp"
		}
		break;
	case 11:
		{
#line 198 ".\\mylexer.l"
lexing("THROW",yytext);
#line 246 "mylexer.cpp"
		}
		break;
	case 12:
		{
#line 199 ".\\mylexer.l"
lexing("UNION",yytext);
#line 253 "mylexer.cpp"
		}
		break;
	case 13:
		{
#line 200 ".\\mylexer.l"
lexing("THIS",yytext);
#line 260 "mylexer.cpp"
		}
		break;
	case 14:
		{
#line 201 ".\\mylexer.l"
lexing("INT",yytext);
#line 267 "mylexer.cpp"
		}
		break;
	case 15:
		{
#line 202 ".\\mylexer.l"
lexing("CHAR",yytext);
#line 274 "mylexer.cpp"
		}
		break;
	case 16:
		{
#line 203 ".\\mylexer.l"
lexing("DOUBLE",yytext);
#line 281 "mylexer.cpp"
		}
		break;
	case 17:
		{
#line 204 ".\\mylexer.l"
lexing("FLOAT",yytext);
#line 288 "mylexer.cpp"
		}
		break;
	case 18:
		{
#line 205 ".\\mylexer.l"
lexing("LONG",yytext);
#line 295 "mylexer.cpp"
		}
		break;
	case 19:
		{
#line 206 ".\\mylexer.l"
lexing("SHORT",yytext);
#line 302 "mylexer.cpp"
		}
		break;
	case 20:
		{
#line 207 ".\\mylexer.l"
lexing("UNSIGNED",yytext);
#line 309 "mylexer.cpp"
		}
		break;
	case 21:
		{
#line 208 ".\\mylexer.l"
lexing("CONST",yytext);
#line 316 "mylexer.cpp"
		}
		break;
	case 22:
		{
#line 209 ".\\mylexer.l"
lexing("GOTO",yytext);
#line 323 "mylexer.cpp"
		}
		break;
	case 23:
		{
#line 210 ".\\mylexer.l"
lexing("VIRTUAL",yytext);
#line 330 "mylexer.cpp"
		}
		break;
	case 24:
		{
#line 211 ".\\mylexer.l"
lexing("FOR",yytext);
#line 337 "mylexer.cpp"
		}
		break;
	case 25:
		{
#line 212 ".\\mylexer.l"
lexing("BREAK",yytext);
#line 344 "mylexer.cpp"
		}
		break;
	case 26:
		{
#line 213 ".\\mylexer.l"
lexing("CONTINUE",yytext);
#line 351 "mylexer.cpp"
		}
		break;
	case 27:
		{
#line 214 ".\\mylexer.l"
lexing("AUTO",yytext);
#line 358 "mylexer.cpp"
		}
		break;
	case 28:
		{
#line 215 ".\\mylexer.l"
lexing("CLASS",yytext);
#line 365 "mylexer.cpp"
		}
		break;
	case 29:
		{
#line 216 ".\\mylexer.l"
lexing("OPERATOR",yytext);
#line 372 "mylexer.cpp"
		}
		break;
	case 30:
		{
#line 217 ".\\mylexer.l"
lexing("CASE",yytext);
#line 379 "mylexer.cpp"
		}
		break;
	case 31:
		{
#line 218 ".\\mylexer.l"
lexing("DO",yytext);
#line 386 "mylexer.cpp"
		}
		break;
	case 32:
		{
#line 219 ".\\mylexer.l"
lexing("TYPEDEF",yytext);
#line 393 "mylexer.cpp"
		}
		break;
	case 33:
		{
#line 220 ".\\mylexer.l"
lexing("STATIC",yytext);
#line 400 "mylexer.cpp"
		}
		break;
	case 34:
		{
#line 221 ".\\mylexer.l"
lexing("FRIEND",yytext);
#line 407 "mylexer.cpp"
		}
		break;
	case 35:
		{
#line 222 ".\\mylexer.l"
lexing("TEMPLATE",yytext);
#line 414 "mylexer.cpp"
		}
		break;
	case 36:
		{
#line 223 ".\\mylexer.l"
lexing("DEFAULT",yytext);
#line 421 "mylexer.cpp"
		}
		break;
	case 37:
		{
#line 224 ".\\mylexer.l"
lexing("NEW",yytext);
#line 428 "mylexer.cpp"
		}
		break;
	case 38:
		{
#line 225 ".\\mylexer.l"
lexing("VOID",yytext);
#line 435 "mylexer.cpp"
		}
		break;
	case 39:
		{
#line 226 ".\\mylexer.l"
lexing("REGISTER",yytext);
#line 442 "mylexer.cpp"
		}
		break;
	case 40:
		{
#line 227 ".\\mylexer.l"
lexing("EXTERN",yytext);
#line 449 "mylexer.cpp"
		}
		break;
	case 41:
		{
#line 228 ".\\mylexer.l"
lexing("RETURN",yytext);
#line 456 "mylexer.cpp"
		}
		break;
	case 42:
		{
#line 229 ".\\mylexer.l"
lexing("ENUM",yytext);
#line 463 "mylexer.cpp"
		}
		break;
	case 43:
		{
#line 230 ".\\mylexer.l"
lexing("INLINE",yytext);
#line 470 "mylexer.cpp"
		}
		break;
	case 44:
		{
#line 231 ".\\mylexer.l"
lexing("TRY",yytext);
#line 477 "mylexer.cpp"
		}
		break;
	case 45:
		{
#line 232 ".\\mylexer.l"
lexing("SIZEOF",yytext);
#line 484 "mylexer.cpp"
		}
		break;
	case 46:
		{
#line 233 ".\\mylexer.l"
lexing("SWITCH",yytext);
#line 491 "mylexer.cpp"
		}
		break;
	case 47:
		{
#line 234 ".\\mylexer.l"
lexing("PRIVATE",yytext);
#line 498 "mylexer.cpp"
		}
		break;
	case 48:
		{
#line 235 ".\\mylexer.l"
lexing("PROTECTED",yytext);
#line 505 "mylexer.cpp"
		}
		break;
	case 49:
		{
#line 236 ".\\mylexer.l"
lexing("ASM",yytext);
#line 512 "mylexer.cpp"
		}
		break;
	case 50:
		{
#line 237 ".\\mylexer.l"
lexing("CATCH",yytext);
#line 519 "mylexer.cpp"
		}
		break;
	case 51:
		{
#line 238 ".\\mylexer.l"
lexing("DELETE",yytext);
#line 526 "mylexer.cpp"
		}
		break;
	case 52:
		{
#line 239 ".\\mylexer.l"
lexing("PUBLIC",yytext);
#line 533 "mylexer.cpp"
		}
		break;
	case 53:
		{
#line 240 ".\\mylexer.l"
lexing("VOLATILE",yytext);
#line 540 "mylexer.cpp"
		}
		break;
	case 54:
		{
#line 241 ".\\mylexer.l"
lexing("STRUCT",yytext);
#line 547 "mylexer.cpp"
		}
		break;
	case 55:
		{
#line 242 ".\\mylexer.l"
lexing("BOOL",yytext);
#line 554 "mylexer.cpp"
		}
		break;
	case 56:
		{
#line 243 ".\\mylexer.l"
lexing("CONST_CAST",yytext);
#line 561 "mylexer.cpp"
		}
		break;
	case 57:
		{
#line 244 ".\\mylexer.l"
lexing("DYNAMIC_CAST",yytext);
#line 568 "mylexer.cpp"
		}
		break;
	case 58:
		{
#line 245 ".\\mylexer.l"
lexing("EXPLICIT",yytext);
#line 575 "mylexer.cpp"
		}
		break;
	case 59:
		{
#line 246 ".\\mylexer.l"
lexing("TRUE",yytext);
#line 582 "mylexer.cpp"
		}
		break;
	case 60:
		{
#line 247 ".\\mylexer.l"
lexing("FALSE",yytext);
#line 589 "mylexer.cpp"
		}
		break;
	case 61:
		{
#line 248 ".\\mylexer.l"
lexing("MUTABLE",yytext);
#line 596 "mylexer.cpp"
		}
		break;
	case 62:
		{
#line 249 ".\\mylexer.l"
lexing("NAMESPACE",yytext);
#line 603 "mylexer.cpp"
		}
		break;
	case 63:
		{
#line 250 ".\\mylexer.l"
lexing("REINTERPRET_CAST",yytext);
#line 610 "mylexer.cpp"
		}
		break;
	case 64:
		{
#line 251 ".\\mylexer.l"
lexing("STATIC_CAST",yytext);
#line 617 "mylexer.cpp"
		}
		break;
	case 65:
		{
#line 252 ".\\mylexer.l"
lexing("TYPEID",yytext);
#line 624 "mylexer.cpp"
		}
		break;
	case 66:
		{
#line 253 ".\\mylexer.l"
lexing("TYPENAME",yytext);
#line 631 "mylexer.cpp"
		}
		break;
	case 67:
		{
#line 254 ".\\mylexer.l"
lexing("USING",yytext);
#line 638 "mylexer.cpp"
		}
		break;
	case 68:
		{
#line 255 ".\\mylexer.l"
lexing("WCHAR_T",yytext);
#line 645 "mylexer.cpp"
		}
		break;
	case 69:
		{
#line 257 ".\\mylexer.l"
out<<"LBRACE\t\t"<<yytext<<endl;
#line 652 "mylexer.cpp"
		}
		break;
	case 70:
		{
#line 258 ".\\mylexer.l"
out<<"RBRACE\t\t"<<yytext<<endl;
#line 659 "mylexer.cpp"
		}
		break;
	case 71:
		{
#line 259 ".\\mylexer.l"
out<<"LPAREN\t\t"<<yytext<<endl;
#line 666 "mylexer.cpp"
		}
		break;
	case 72:
		{
#line 260 ".\\mylexer.l"
out<<"RPAREN\t\t"<<yytext<<endl;
#line 673 "mylexer.cpp"
		}
		break;
	case 73:
		{
#line 261 ".\\mylexer.l"
out<<"SEMI\t\t"<<yytext<<endl;
#line 680 "mylexer.cpp"
		}
		break;
	case 74:
		{
#line 262 ".\\mylexer.l"
out<<"COMMA\t\t"<<yytext<<endl;
#line 687 "mylexer.cpp"
		}
		break;
	case 75:
		{
#line 264 ".\\mylexer.l"
out<<"PLUS\t\t"<<yytext<<endl;
#line 694 "mylexer.cpp"
		}
		break;
	case 76:
		{
#line 265 ".\\mylexer.l"
out<<"MINUS\t\t"<<yytext<<endl;
#line 701 "mylexer.cpp"
		}
		break;
	case 77:
		{
#line 266 ".\\mylexer.l"
out<<"MUL\t\t"<<yytext<<endl;
#line 708 "mylexer.cpp"
		}
		break;
	case 78:
		{
#line 267 ".\\mylexer.l"
out<<"DIV\t\t"<<yytext<<endl;
#line 715 "mylexer.cpp"
		}
		break;
	case 79:
		{
#line 268 ".\\mylexer.l"
out<<"MOD\t\t"<<yytext<<endl;
#line 722 "mylexer.cpp"
		}
		break;
	case 80:
		{
#line 269 ".\\mylexer.l"
out<<"INC\t\t"<<yytext<<endl;
#line 729 "mylexer.cpp"
		}
		break;
	case 81:
		{
#line 270 ".\\mylexer.l"
out<<"DEC\t\t"<<yytext<<endl;
#line 736 "mylexer.cpp"
		}
		break;
	case 82:
		{
#line 271 ".\\mylexer.l"
out<<"BAND\t\t"<<yytext<<endl;
#line 743 "mylexer.cpp"
		}
		break;
	case 83:
		{
#line 272 ".\\mylexer.l"
out<<"BOR\t\t"<<yytext<<endl;
#line 750 "mylexer.cpp"
		}
		break;
	case 84:
		{
#line 273 ".\\mylexer.l"
out<<"NOR\t\t"<<yytext<<endl;
#line 757 "mylexer.cpp"
		}
		break;
	case 85:
		{
#line 274 ".\\mylexer.l"
out<<"BNOT\t\t"<<yytext<<endl;
#line 764 "mylexer.cpp"
		}
		break;
	case 86:
		{
#line 275 ".\\mylexer.l"
out<<"LSHIFT\t\t"<<yytext<<endl;
#line 771 "mylexer.cpp"
		}
		break;
	case 87:
		{
#line 276 ".\\mylexer.l"
out<<"RSHIFT\t\t"<<yytext<<endl;
#line 778 "mylexer.cpp"
		}
		break;
	case 88:
		{
#line 278 ".\\mylexer.l"
out<<"ASSIGN\t\t"<<yytext<<endl;
#line 785 "mylexer.cpp"
		}
		break;
	case 89:
		{
#line 279 ".\\mylexer.l"
out<<"EQ\t\t"<<yytext<<endl;
#line 792 "mylexer.cpp"
		}
		break;
	case 90:
		{
#line 280 ".\\mylexer.l"
out<<"LE\t\t"<<yytext<<endl;
#line 799 "mylexer.cpp"
		}
		break;
	case 91:
		{
#line 281 ".\\mylexer.l"
out<<"LT\t\t"<<yytext<<endl;
#line 806 "mylexer.cpp"
		}
		break;
	case 92:
		{
#line 282 ".\\mylexer.l"
out<<"GE\t\t"<<yytext<<endl;
#line 813 "mylexer.cpp"
		}
		break;
	case 93:
		{
#line 283 ".\\mylexer.l"
out<<"GT\t\t"<<yytext<<endl;
#line 820 "mylexer.cpp"
		}
		break;
	case 94:
		{
#line 284 ".\\mylexer.l"
out<<"NE\t\t"<<yytext<<endl;
#line 827 "mylexer.cpp"
		}
		break;
	case 95:
		{
#line 286 ".\\mylexer.l"
out<<"AND\t\t"<<yytext<<endl;
#line 834 "mylexer.cpp"
		}
		break;
	case 96:
		{
#line 287 ".\\mylexer.l"
out<<"OR\t\t"<<yytext<<endl;
#line 841 "mylexer.cpp"
		}
		break;
	case 97:
		{
#line 288 ".\\mylexer.l"
out<<"NOT\t\t"<<yytext<<endl;
#line 848 "mylexer.cpp"
		}
		break;
	case 98:
		{
#line 290 ".\\mylexer.l"
out<<"NUMBER\t\t"<<yytext<<"\t"<<atof(yytext)<<endl;
#line 855 "mylexer.cpp"
		}
		break;
	case 99:
		{
#line 291 ".\\mylexer.l"
out<<"NUMBER\t\t"<<yytext<<"\t0"<<atof(yytext)<<endl;
#line 862 "mylexer.cpp"
		}
		break;
	case 100:
		{
#line 292 ".\\mylexer.l"
out<<"NUMBER\t\t"<<yytext<<"\t"<<yytext<<endl;
#line 869 "mylexer.cpp"
		}
		break;
	case 101:
		{
#line 294 ".\\mylexer.l"
if(idlist.find(yytext)==idlist.end())
				{
					idlist[yytext]=id_count;
					id_count++;
				}
				out<<"ID\t\t"<<yytext<<"\t"<<idlist[yytext]<<endl;
#line 881 "mylexer.cpp"
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

	yytransitionmax = 584;
	static const yytransition_t YYNEARFAR YYBASED_CODE transition[] = {
		{ 0, 0 },
		{ 3, 1 },
		{ 4, 1 },
		{ 3, 1 },
		{ 3, 1 },
		{ 0, 9 },
		{ 50, 6 },
		{ 102, 41 },
		{ 16, 18 },
		{ 158, 99 },
		{ 103, 41 },
		{ 169, 106 },
		{ 267, 225 },
		{ 151, 95 },
		{ 69, 26 },
		{ 136, 81 },
		{ 70, 26 },
		{ 268, 225 },
		{ 0, 54 },
		{ 152, 95 },
		{ 104, 41 },
		{ 170, 106 },
		{ 269, 225 },
		{ 0, 16 },
		{ 3, 1 },
		{ 5, 1 },
		{ 6, 1 },
		{ 105, 41 },
		{ 159, 99 },
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
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 19, 1 },
		{ 63, 18 },
		{ 20, 1 },
		{ 21, 1 },
		{ 22, 1 },
		{ 23, 1 },
		{ 0, 16 },
		{ 114, 54 },
		{ 114, 54 },
		{ 114, 54 },
		{ 114, 54 },
		{ 114, 54 },
		{ 114, 54 },
		{ 114, 54 },
		{ 114, 54 },
		{ 51, 6 },
		{ 58, 181 },
		{ 0, 118 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 182, 182 },
		{ 144, 89 },
		{ 234, 181 },
		{ 58, 17 },
		{ 71, 27 },
		{ 87, 32 },
		{ 63, 18 },
		{ 72, 27 },
		{ 59, 17 },
		{ 145, 89 },
		{ 25, 1 },
		{ 54, 9 },
		{ 62, 182 },
		{ 26, 1 },
		{ 27, 1 },
		{ 28, 1 },
		{ 29, 1 },
		{ 30, 1 },
		{ 31, 1 },
		{ 32, 1 },
		{ 115, 54 },
		{ 33, 1 },
		{ 0, 118 },
		{ 131, 77 },
		{ 34, 1 },
		{ 35, 1 },
		{ 36, 1 },
		{ 37, 1 },
		{ 38, 1 },
		{ 132, 77 },
		{ 39, 1 },
		{ 40, 1 },
		{ 41, 1 },
		{ 42, 1 },
		{ 43, 1 },
		{ 44, 1 },
		{ 98, 40 },
		{ 99, 40 },
		{ 139, 83 },
		{ 45, 1 },
		{ 46, 1 },
		{ 47, 1 },
		{ 48, 1 },
		{ 3, 3 },
		{ 62, 182 },
		{ 3, 3 },
		{ 3, 3 },
		{ 160, 100 },
		{ 100, 40 },
		{ 190, 130 },
		{ 191, 130 },
		{ 101, 40 },
		{ 115, 54 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 108, 43 },
		{ 161, 100 },
		{ 173, 109 },
		{ 3, 3 },
		{ 140, 84 },
		{ 174, 109 },
		{ 109, 43 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 179, 116 },
		{ 119, 62 },
		{ 141, 85 },
		{ 119, 62 },
		{ 24, 361 },
		{ 180, 116 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 24, 361 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 110, 44 },
		{ 106, 42 },
		{ 126, 73 },
		{ 127, 73 },
		{ 142, 86 },
		{ 111, 44 },
		{ 107, 42 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 95, 38 },
		{ 166, 104 },
		{ 154, 97 },
		{ 96, 38 },
		{ 155, 97 },
		{ 167, 104 },
		{ 143, 87 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 53, 178 },
		{ 53, 178 },
		{ 156, 97 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 121, 121 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 77, 29 },
		{ 88, 33 },
		{ 92, 36 },
		{ 67, 23 },
		{ 68, 23 },
		{ 56, 15 },
		{ 93, 36 },
		{ 83, 31 },
		{ 164, 103 },
		{ 89, 33 },
		{ 78, 29 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 178, 115 },
		{ 165, 103 },
		{ 84, 31 },
		{ 137, 82 },
		{ 79, 29 },
		{ 85, 31 },
		{ 146, 90 },
		{ 138, 82 },
		{ 86, 31 },
		{ 73, 28 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 53, 178 },
		{ 74, 28 },
		{ 0, 234 },
		{ 147, 91 },
		{ 80, 30 },
		{ 75, 28 },
		{ 81, 30 },
		{ 148, 92 },
		{ 76, 28 },
		{ 149, 93 },
		{ 116, 234 },
		{ 64, 21 },
		{ 65, 21 },
		{ 150, 94 },
		{ 117, 234 },
		{ 118, 61 },
		{ 82, 30 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 61, 61 },
		{ 16, 19 },
		{ 90, 34 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
		{ 19, 19 },
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
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 120, 120 },
		{ 60, 60 },
		{ 60, 60 },
		{ 60, 60 },
		{ 60, 60 },
		{ 60, 60 },
		{ 60, 60 },
		{ 60, 60 },
		{ 60, 60 },
		{ 177, 114 },
		{ 177, 114 },
		{ 177, 114 },
		{ 177, 114 },
		{ 177, 114 },
		{ 177, 114 },
		{ 177, 114 },
		{ 177, 114 },
		{ 53, 177 },
		{ 53, 177 },
		{ 53, 177 },
		{ 53, 177 },
		{ 53, 177 },
		{ 53, 177 },
		{ 53, 177 },
		{ 53, 177 },
		{ 153, 96 },
		{ 112, 46 },
		{ 157, 98 },
		{ 0, 51 },
		{ 113, 53 },
		{ 162, 101 },
		{ 163, 102 },
		{ 91, 35 },
		{ 52, 8 },
		{ 168, 105 },
		{ 0, 59 },
		{ 171, 107 },
		{ 172, 108 },
		{ 94, 37 },
		{ 175, 110 },
		{ 176, 111 },
		{ 66, 22 },
		{ 97, 39 },
		{ 122, 69 },
		{ 181, 117 },
		{ 123, 70 },
		{ 124, 71 },
		{ 125, 72 },
		{ 183, 123 },
		{ 184, 124 },
		{ 185, 125 },
		{ 186, 126 },
		{ 187, 127 },
		{ 188, 128 },
		{ 189, 129 },
		{ 49, 5 },
		{ 192, 131 },
		{ 193, 132 },
		{ 194, 133 },
		{ 195, 134 },
		{ 196, 135 },
		{ 197, 136 },
		{ 198, 137 },
		{ 199, 138 },
		{ 200, 139 },
		{ 201, 140 },
		{ 202, 142 },
		{ 203, 143 },
		{ 204, 144 },
		{ 205, 146 },
		{ 206, 147 },
		{ 207, 148 },
		{ 208, 150 },
		{ 209, 151 },
		{ 210, 152 },
		{ 211, 153 },
		{ 212, 154 },
		{ 213, 155 },
		{ 214, 156 },
		{ 215, 157 },
		{ 216, 158 },
		{ 217, 159 },
		{ 218, 160 },
		{ 219, 161 },
		{ 220, 162 },
		{ 221, 163 },
		{ 222, 164 },
		{ 223, 165 },
		{ 224, 166 },
		{ 225, 168 },
		{ 226, 169 },
		{ 227, 170 },
		{ 228, 171 },
		{ 229, 172 },
		{ 230, 173 },
		{ 231, 174 },
		{ 232, 175 },
		{ 233, 176 },
		{ 128, 74 },
		{ 129, 75 },
		{ 58, 179 },
		{ 130, 76 },
		{ 55, 13 },
		{ 235, 185 },
		{ 236, 187 },
		{ 237, 189 },
		{ 238, 190 },
		{ 239, 191 },
		{ 240, 192 },
		{ 241, 193 },
		{ 242, 194 },
		{ 243, 195 },
		{ 244, 198 },
		{ 245, 199 },
		{ 246, 200 },
		{ 247, 201 },
		{ 248, 202 },
		{ 249, 204 },
		{ 250, 206 },
		{ 251, 207 },
		{ 252, 208 },
		{ 253, 209 },
		{ 254, 210 },
		{ 255, 211 },
		{ 256, 212 },
		{ 257, 213 },
		{ 258, 214 },
		{ 259, 215 },
		{ 260, 216 },
		{ 261, 217 },
		{ 262, 218 },
		{ 263, 219 },
		{ 264, 220 },
		{ 265, 221 },
		{ 266, 223 },
		{ 133, 78 },
		{ 270, 226 },
		{ 271, 227 },
		{ 272, 228 },
		{ 273, 229 },
		{ 274, 231 },
		{ 275, 232 },
		{ 276, 233 },
		{ 134, 79 },
		{ 277, 238 },
		{ 278, 239 },
		{ 279, 240 },
		{ 280, 241 },
		{ 281, 242 },
		{ 282, 243 },
		{ 283, 244 },
		{ 284, 245 },
		{ 285, 248 },
		{ 286, 249 },
		{ 287, 250 },
		{ 288, 251 },
		{ 289, 252 },
		{ 290, 253 },
		{ 291, 254 },
		{ 292, 255 },
		{ 293, 256 },
		{ 294, 257 },
		{ 295, 258 },
		{ 296, 260 },
		{ 297, 261 },
		{ 298, 262 },
		{ 299, 263 },
		{ 300, 264 },
		{ 301, 265 },
		{ 302, 267 },
		{ 303, 268 },
		{ 304, 269 },
		{ 305, 271 },
		{ 306, 273 },
		{ 307, 274 },
		{ 308, 275 },
		{ 309, 277 },
		{ 310, 278 },
		{ 311, 279 },
		{ 312, 282 },
		{ 313, 283 },
		{ 314, 287 },
		{ 315, 288 },
		{ 316, 289 },
		{ 317, 290 },
		{ 318, 291 },
		{ 319, 293 },
		{ 320, 294 },
		{ 321, 298 },
		{ 322, 301 },
		{ 323, 302 },
		{ 324, 304 },
		{ 325, 305 },
		{ 326, 306 },
		{ 327, 307 },
		{ 328, 308 },
		{ 329, 309 },
		{ 330, 310 },
		{ 331, 312 },
		{ 332, 313 },
		{ 333, 315 },
		{ 334, 316 },
		{ 335, 318 },
		{ 336, 319 },
		{ 337, 320 },
		{ 338, 321 },
		{ 339, 322 },
		{ 340, 324 },
		{ 341, 325 },
		{ 342, 327 },
		{ 343, 329 },
		{ 344, 331 },
		{ 345, 333 },
		{ 346, 335 },
		{ 347, 337 },
		{ 348, 338 },
		{ 349, 343 },
		{ 350, 344 },
		{ 351, 347 },
		{ 352, 348 },
		{ 353, 350 },
		{ 354, 351 },
		{ 355, 352 },
		{ 356, 353 },
		{ 357, 354 },
		{ 358, 357 },
		{ 359, 358 },
		{ 360, 359 },
		{ 361, 360 },
		{ 135, 80 }
	};
	yytransition = transition;

	static const yystate_t YYNEARFAR YYBASED_CODE state[] = {
		{ 0, 0, 0 },
		{ 361, -8, 0 },
		{ 1, 0, 0 },
		{ 0, 110, 2 },
		{ 0, 0, 1 },
		{ 0, 348, 97 },
		{ 51, -28, 0 },
		{ 0, 0, 79 },
		{ 0, 349, 82 },
		{ -53, -5, 0 },
		{ 0, 0, 71 },
		{ 0, 0, 72 },
		{ 0, 0, 77 },
		{ 0, 413, 75 },
		{ 0, 0, 74 },
		{ 0, 225, 76 },
		{ 57, -46, 0 },
		{ 0, 37, 78 },
		{ 60, -38, 98 },
		{ 182, 277, 98 },
		{ 0, 0, 73 },
		{ 0, 247, 91 },
		{ 0, 334, 88 },
		{ 0, 207, 93 },
		{ 361, 0, 101 },
		{ 0, 0, 84 },
		{ 361, -101, 101 },
		{ 361, -31, 101 },
		{ 361, 193, 101 },
		{ 361, 164, 101 },
		{ 361, 192, 101 },
		{ 361, 175, 101 },
		{ 361, -30, 101 },
		{ 361, 164, 101 },
		{ 361, 213, 101 },
		{ 361, 269, 101 },
		{ 361, 170, 101 },
		{ 361, 280, 101 },
		{ 361, 123, 101 },
		{ 361, 295, 101 },
		{ 361, 8, 101 },
		{ 361, -94, 101 },
		{ 361, 105, 101 },
		{ 361, 34, 101 },
		{ 361, 115, 101 },
		{ 0, 0, 69 },
		{ 0, 256, 83 },
		{ 0, 0, 70 },
		{ 0, 0, 85 },
		{ 0, 0, 94 },
		{ 0, 0, 6 },
		{ -6, 372, 0 },
		{ 0, 0, 95 },
		{ 0, 344, 0 },
		{ -53, 8, 0 },
		{ 0, 0, 80 },
		{ 0, 0, 81 },
		{ 182, 287, 98 },
		{ 234, 0, 0 },
		{ -59, 379, 3 },
		{ 61, 307, 99 },
		{ 182, 265, 0 },
		{ 120, 130, 0 },
		{ 121, 0, 0 },
		{ 0, 0, 86 },
		{ 0, 0, 90 },
		{ 0, 0, 89 },
		{ 0, 0, 92 },
		{ 0, 0, 87 },
		{ 361, 288, 101 },
		{ 361, 283, 101 },
		{ 361, 289, 101 },
		{ 361, 300, 101 },
		{ 361, 101, 101 },
		{ 361, 355, 101 },
		{ 361, 356, 101 },
		{ 361, 345, 101 },
		{ 361, -3, 101 },
		{ 361, 372, 31 },
		{ 361, 387, 101 },
		{ 361, 468, 101 },
		{ 361, -102, 101 },
		{ 361, 172, 101 },
		{ 361, 6, 101 },
		{ 361, 32, 101 },
		{ 361, 60, 101 },
		{ 361, 113, 101 },
		{ 361, 127, 101 },
		{ 361, 0, 7 },
		{ 361, -31, 101 },
		{ 361, 177, 101 },
		{ 361, 183, 101 },
		{ 361, 194, 101 },
		{ 361, 186, 101 },
		{ 361, 208, 101 },
		{ 361, -92, 101 },
		{ 361, 281, 101 },
		{ 361, 136, 101 },
		{ 361, 270, 101 },
		{ 361, -94, 101 },
		{ 361, 26, 101 },
		{ 361, 279, 101 },
		{ 361, 276, 101 },
		{ 361, 168, 101 },
		{ 361, 121, 101 },
		{ 361, 276, 101 },
		{ 361, -94, 101 },
		{ 361, 285, 101 },
		{ 361, 277, 101 },
		{ 361, 36, 101 },
		{ 361, 289, 101 },
		{ 361, 289, 101 },
		{ 0, 0, 96 },
		{ 0, 0, 5 },
		{ 177, 315, 0 },
		{ 178, 179, 0 },
		{ -58, 130, 0 },
		{ 234, 356, 0 },
		{ 182, -3, 0 },
		{ 120, 0, 0 },
		{ 0, 297, 98 },
		{ 0, 156, 100 },
		{ 361, 0, 49 },
		{ 361, 291, 101 },
		{ 361, 295, 101 },
		{ 361, 307, 101 },
		{ 361, 304, 101 },
		{ 361, 307, 101 },
		{ 361, 293, 101 },
		{ 361, 293, 101 },
		{ 361, 10, 101 },
		{ 361, 313, 101 },
		{ 361, 310, 101 },
		{ 361, 314, 101 },
		{ 361, 316, 101 },
		{ 361, 313, 101 },
		{ 361, 306, 101 },
		{ 361, 308, 101 },
		{ 361, 316, 101 },
		{ 361, 303, 101 },
		{ 361, 322, 101 },
		{ 361, 0, 24 },
		{ 361, 319, 101 },
		{ 361, 310, 101 },
		{ 361, 317, 101 },
		{ 361, 0, 14 },
		{ 361, 320, 101 },
		{ 361, 327, 101 },
		{ 361, 324, 101 },
		{ 361, 0, 37 },
		{ 361, 312, 101 },
		{ 361, 309, 101 },
		{ 361, 312, 101 },
		{ 361, 321, 101 },
		{ 361, 325, 101 },
		{ 361, 321, 101 },
		{ 361, 315, 101 },
		{ 361, 319, 101 },
		{ 361, 324, 101 },
		{ 361, 334, 101 },
		{ 361, 320, 101 },
		{ 361, 320, 101 },
		{ 361, 322, 101 },
		{ 361, 327, 101 },
		{ 361, 325, 101 },
		{ 361, 330, 101 },
		{ 361, 341, 101 },
		{ 361, 0, 44 },
		{ 361, 342, 101 },
		{ 361, 333, 101 },
		{ 361, 340, 101 },
		{ 361, 336, 101 },
		{ 361, 331, 101 },
		{ 361, 348, 101 },
		{ 361, 352, 101 },
		{ 361, 353, 101 },
		{ 361, 343, 101 },
		{ 53, 323, 0 },
		{ 177, 194, 0 },
		{ 181, 407, 0 },
		{ 0, 0, 4 },
		{ 117, 31, 0 },
		{ 0, 19, 0 },
		{ 361, 0, 27 },
		{ 361, 0, 55 },
		{ 361, 350, 101 },
		{ 361, 0, 30 },
		{ 361, 354, 101 },
		{ 361, 0, 15 },
		{ 361, 344, 101 },
		{ 361, 344, 101 },
		{ 361, 356, 101 },
		{ 361, 345, 101 },
		{ 361, 347, 101 },
		{ 361, 356, 101 },
		{ 361, 356, 101 },
		{ 361, 0, 8 },
		{ 361, 0, 42 },
		{ 361, 361, 101 },
		{ 361, 353, 101 },
		{ 361, 367, 101 },
		{ 361, 353, 101 },
		{ 361, 360, 101 },
		{ 361, 0, 22 },
		{ 361, 361, 101 },
		{ 361, 0, 18 },
		{ 361, 374, 101 },
		{ 361, 358, 101 },
		{ 361, 377, 101 },
		{ 361, 378, 101 },
		{ 361, 375, 101 },
		{ 361, 372, 101 },
		{ 361, 363, 101 },
		{ 361, 363, 101 },
		{ 361, 366, 101 },
		{ 361, 365, 101 },
		{ 361, 381, 101 },
		{ 361, 372, 101 },
		{ 361, 379, 101 },
		{ 361, 386, 101 },
		{ 361, 387, 101 },
		{ 361, 379, 101 },
		{ 361, 0, 13 },
		{ 361, 369, 101 },
		{ 361, 0, 59 },
		{ 361, -88, 101 },
		{ 361, 380, 101 },
		{ 361, 388, 101 },
		{ 361, 389, 101 },
		{ 361, 376, 101 },
		{ 361, 0, 38 },
		{ 361, 378, 101 },
		{ 361, 381, 101 },
		{ 361, 395, 101 },
		{ -58, 264, 4 },
		{ 361, 0, 25 },
		{ 361, 0, 50 },
		{ 361, 0, 28 },
		{ 361, 403, 21 },
		{ 361, 389, 101 },
		{ 361, 392, 101 },
		{ 361, 400, 101 },
		{ 361, 401, 101 },
		{ 361, 398, 101 },
		{ 361, 405, 101 },
		{ 361, 395, 101 },
		{ 361, 0, 60 },
		{ 361, 0, 17 },
		{ 361, 406, 101 },
		{ 361, 406, 101 },
		{ 361, 400, 101 },
		{ 361, 397, 101 },
		{ 361, 394, 101 },
		{ 361, 395, 101 },
		{ 361, 413, 101 },
		{ 361, 414, 101 },
		{ 361, 398, 101 },
		{ 361, 414, 101 },
		{ 361, 406, 101 },
		{ 361, 0, 19 },
		{ 361, 417, 101 },
		{ 361, 416, 101 },
		{ 361, 420, 101 },
		{ 361, 404, 101 },
		{ 361, 417, 101 },
		{ 361, 425, 101 },
		{ 361, 0, 11 },
		{ 361, 422, 101 },
		{ 361, 424, 101 },
		{ 361, 428, 101 },
		{ 361, 0, 12 },
		{ 361, 416, 101 },
		{ 361, 0, 67 },
		{ 361, 430, 101 },
		{ 361, 423, 101 },
		{ 361, 434, 101 },
		{ 361, 0, 9 },
		{ 361, 431, 101 },
		{ 361, 414, 101 },
		{ 361, 416, 101 },
		{ 361, 0, 51 },
		{ 361, 0, 16 },
		{ 361, 434, 101 },
		{ 361, 429, 101 },
		{ 361, 0, 40 },
		{ 361, 0, 34 },
		{ 361, 0, 43 },
		{ 361, 434, 101 },
		{ 361, 439, 101 },
		{ 361, 426, 101 },
		{ 361, 437, 101 },
		{ 361, 423, 101 },
		{ 361, 0, 52 },
		{ 361, 439, 101 },
		{ 361, 427, 101 },
		{ 361, 0, 41 },
		{ 361, 0, 10 },
		{ 361, 0, 45 },
		{ 361, 447, 33 },
		{ 361, 0, 54 },
		{ 361, 0, 46 },
		{ 361, 427, 101 },
		{ 361, 442, 101 },
		{ 361, 0, 65 },
		{ 361, 436, 101 },
		{ 361, 445, 101 },
		{ 361, 439, 101 },
		{ 361, 440, 101 },
		{ 361, 465, 101 },
		{ 361, 453, 101 },
		{ 361, 450, 101 },
		{ 361, 0, 36 },
		{ 361, 457, 101 },
		{ 361, 437, 101 },
		{ 361, 0, 61 },
		{ 361, 455, 101 },
		{ 361, 441, 101 },
		{ 361, 0, 47 },
		{ 361, 455, 101 },
		{ 361, 443, 101 },
		{ 361, 446, 101 },
		{ 361, 460, 101 },
		{ 361, 459, 101 },
		{ 361, 0, 32 },
		{ 361, 460, 101 },
		{ 361, 462, 101 },
		{ 361, 0, 23 },
		{ 361, 462, 101 },
		{ 361, 0, 68 },
		{ 361, 449, 101 },
		{ 361, 0, 26 },
		{ 361, 466, 101 },
		{ 361, 0, 58 },
		{ 361, 465, 101 },
		{ 361, 0, 29 },
		{ 361, 467, 101 },
		{ 361, 0, 39 },
		{ 361, 454, 101 },
		{ 361, 472, 101 },
		{ 361, 0, 35 },
		{ 361, 0, 66 },
		{ 361, 0, 20 },
		{ 361, 0, 53 },
		{ 361, 454, 101 },
		{ 361, 474, 101 },
		{ 361, 0, 62 },
		{ 361, 0, 48 },
		{ 361, 471, 101 },
		{ 361, 458, 101 },
		{ 361, 0, 56 },
		{ 361, 459, 101 },
		{ 361, 459, 101 },
		{ 361, 460, 101 },
		{ 361, 461, 101 },
		{ 361, 483, 101 },
		{ 361, 0, 64 },
		{ 361, 0, 57 },
		{ 361, 480, 101 },
		{ 361, 483, 101 },
		{ 361, 466, 101 },
		{ 361, 466, 101 },
		{ 0, 81, 63 }
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
#line 303 ".\\mylexer.l"


/////////////////////////////////////////////////////////////////////////////
// programs section

void lexing(string word, string lexeme) {out << word <<"\t\t"<< lexeme<<endl;}
int main(void)
{
	int n = 1;
	mylexer lexer;
	if (lexer.yycreate()) {
		lexer.yyin = &in;
		out<<"单词\t\t词素\t属性\n";
		n = lexer.yylex();
		}
	in.close();
	out.close();
	return n;
}


