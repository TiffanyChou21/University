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
* parser.h
* C++ header file generated from parser.y.
* 
* Date: 11/14/19
* Time: 15:59:13
* 
* AYACC Version: 2.07
****************************************************************************/

#ifndef _PARSER_H
#define _PARSER_H

#include <yycpars.h>

#line 88 ".\\parser.y"

  class lexer;
 
#line 92 ".\\parser.y"

  #include "lexer.h"
 
#line 41 "parser.h"
/////////////////////////////////////////////////////////////////////////////
// parser

#ifndef YYEXPPARSER
#define YYEXPPARSER
#endif

class YYEXPPARSER YYFAR parser : public _YL yyfparser {
public:
	parser();
	virtual ~parser();

protected:
	void yytables();
	virtual void yyaction(int action);
#ifdef YYDEBUG
	void YYFAR* yyattribute1(int index) const;
	void yyinitdebug(void YYFAR** p, int count) const;
#endif

	// attribute functions
	virtual void yystacktoval(int index);
	virtual void yyvaltostack(int index);
	virtual void yylvaltoval();
	virtual void yyvaltolval();
	virtual void yylvaltostack(int index);

	virtual void YYFAR* yynewattribute(int count);
	virtual void yydeleteattribute(void YYFAR* attribute);
	virtual void yycopyattribute(void YYFAR* dest, const void YYFAR* src, int count);

public:
#line 99 ".\\parser.y"

	// place any extra class members here
public:
  lexer m_lexer;
public:
  void display(struct TreeNode*t);
 void shownode(struct TreeNode*t);

#line 83 "parser.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME parser
#endif

#line 108 ".\\parser.y"

#ifndef YYSTYPE
#define YYSTYPE TreeNode* //yylvalµƒ¿‡–Õ
#endif

#line 96 "parser.h"
#define IF 257
#define MAIN 258
#define FOR 259
#define WHILE 260
#define CIN 261
#define COUT 262
#define INT 263
#define CHAR 264
#define VOID 265
#define STRING 266
#define FLOAT 267
#define DOUBLE 268
#define BOOL 269
#define ID 270
#define NUMBER 271
#define CHARVAL 272
#define ADD 273
#define SUB 274
#define MUL 275
#define DIV 276
#define MOD 277
#define INC 278
#define DEC 279
#define GT 280
#define LT 281
#define GE 282
#define LE 283
#define NE 284
#define AND 285
#define OR 286
#define NOT 287
#define BNOT 288
#define BAND 289
#define BOR 290
#define XOR 291
#define ASSIGN 292
#define ADDASS 293
#define SUBASS 294
#define MULASS 295
#define DIVASS 296
#define MODASS 297
#define ANDASS 298
#define ORASS 299
#define XORASS 300
#define SHLASS 301
#define SHRASS 302
#define LB 303
#define RB 304
#define LSP 305
#define RSP 306
#define COMMA 307
#define SEMI 308
#define LP 309
#define RP 310
#define SHL 311
#define SHR 312
#define RETURN 313
#define EQ 314
#define ELSE 315
#endif
