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
* myparser.h
* C++ header file generated from myparser.y.
* 
* Date: 11/27/19
* Time: 18:44:56
* 
* AYACC Version: 2.07
****************************************************************************/

#ifndef _MYPARSER_H
#define _MYPARSER_H

#include <yycpars.h>

/////////////////////////////////////////////////////////////////////////////
// myparser

#ifndef YYEXPPARSER
#define YYEXPPARSER
#endif

class YYEXPPARSER YYFAR myparser : public _YL yyfparser {
public:
	myparser();
	virtual ~myparser();

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
#line 30 ".\\myparser.y"

	// place any extra class members here

#line 69 "myparser.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME myparser
#endif

#line 45 ".\\myparser.y"

#ifndef YYSTYPE
#define YYSTYPE treenode*
#endif

#line 82 "myparser.h"
#define INT 257
#define CHAR 258
#define VOID 259
#define BOOL 260
#define DOUBLE 261
#define MAIN 262
#define ID 263
#define ADD 264
#define SUB 265
#define MUL 266
#define DIV 267
#define MOD 268
#define INC 269
#define DEC 270
#define ASSIGN 271
#define LB 272
#define RB 273
#define LP 274
#define RP 275
#define LSB 276
#define RSB 277
#define SEMICOLON 278
#define COMMA 279
#define EQ 280
#define GT 281
#define LT 282
#define GE 283
#define LE 284
#define NE 285
#define BAND 286
#define BOR 287
#define BNOT 288
#define XOR 289
#define AND 290
#define OR 291
#define NOT 292
#define IF 293
#define ELSE 294
#define WHILE 295
#define DO 296
#define FOR 297
#define BREAK 298
#define RETURN 299
#define CIN 300
#define COUT 301
#define SHL 302
#define SHR 303
#define NUMBER 304
#define CONSTCHAR 305
#endif
