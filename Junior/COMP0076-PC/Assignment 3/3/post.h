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
* post.h
* C++ header file generated from post.y.
* 
* Date: 10/15/19
* Time: 20:34:02
* 
* AYACC Version: 2.07
****************************************************************************/

#ifndef _POST_H
#define _POST_H

#include <yycpars.h>

#line 18 ".\\post.y"

#ifndef YYSTYPE
#define YYSTYPE char*     // 上下文无关文法返回类型
#define yylval (*reinterpret_cast<YYSTYPE*>(yylvalptr))
#endif
#pragma warning(disable:4996)//避免strcpy报错

#line 41 "post.h"
/////////////////////////////////////////////////////////////////////////////
// post

#ifndef YYEXPPARSER
#define YYEXPPARSER
#endif

class YYEXPPARSER YYFAR post : public _YL yyfparser {
public:
	post();
	virtual ~post();

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
#line 30 ".\\post.y"

	// place any extra class members here
	// double tokenval;
	virtual int yygettoken();

#line 80 "post.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME post
#endif

#define ADD 257
#define SUB 258
#define MUL 259
#define DIV 260
#define LP 261
#define RP 262
#define UMINUS 263
#endif
