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
* myparser.h
* C++ header file generated from myparser.y.
* 
* Date: 12/19/19
* Time: 20:34:12
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
#line 29 ".\\myparser.y"

	// place any extra class members here

#line 69 "myparser.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME myparser
#endif

#line 44 ".\\myparser.y"

#ifndef YYSTYPE
#define YYSTYPE TreeNode*
#endif

#line 82 "myparser.h"
#define INT 257
#define CHAR 258
#define VOID 259
#define BOOL 260
#define FLOAT 261
#define DOUBLE 262
#define IF 263
#define ELSE 264
#define WHILE 265
#define FOR 266
#define RETURN 267
#define ASSIGN 268
#define ADD 269
#define SUB 270
#define MUL 271
#define DIV 272
#define MOD 273
#define INC 274
#define DEC 275
#define SHL 276
#define SHR 277
#define BAND 278
#define BOR 279
#define XOR 280
#define NOT 281
#define EQ 282
#define GT 283
#define LT 284
#define GE 285
#define LE 286
#define NE 287
#define AND 288
#define OR 289
#define OPPSITE 290
#define LB 291
#define RB 292
#define LP 293
#define RP 294
#define LSP 295
#define RSP 296
#define SEMI 297
#define COMMA 298
#define ID 299
#define NUMBER 300
#define MAIN 301
#define CIN 302
#define COUT 303
#define CHARVAL 304
#define ENDL 305
#endif
