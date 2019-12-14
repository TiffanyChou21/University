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
* expr.h
* C++ header file generated from expr.y.
* 
* Date: 10/14/19
* Time: 02:31:17
* 
* AYACC Version: 2.07
****************************************************************************/

#ifndef _EXPR_H
#define _EXPR_H

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
#line 24 ".\\expr.y"

	// place any extra class members here
	virtual int yygettoken();

#line 70 "expr.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME myparser
#endif

#line 40 ".\\expr.y"

#ifndef YYSTYPE 
#define YYSTYPE double
#define yylval (*reinterpret_cast<YYSTYPE*>(yylvalptr))
#endif

#line 84 "expr.h"
#define NUMBER 257
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define LP 262
#define RP 263
#define UMINUS 264
#endif
