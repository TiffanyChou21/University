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
* think.h
* C++ header file generated from think.y.
* 
* Date: 10/15/19
* Time: 09:46:52
* 
* AYACC Version: 2.07
****************************************************************************/

#ifndef _THINK_H
#define _THINK_H

#include <yycpars.h>

#line 22 ".\\think.y"

#ifndef YYSTYPE
#define YYSTYPE double     // 上下文无关文法返回类型
#endif

#line 39 "think.h"
/////////////////////////////////////////////////////////////////////////////
// think

#ifndef YYEXPPARSER
#define YYEXPPARSER
#endif

class YYEXPPARSER YYFAR think : public _YL yyfparser {
public:
	think();
	virtual ~think();

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
#line 32 ".\\think.y"

	// place any extra class members here
    virtual int yygettoken();
    int find(string str);
    bool isIDFirst(char c);
    YYSTYPE yylval;
    vector<Dict*> dict;
    string IdName;

#line 82 "think.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME think
#endif

#define NUMBER 257
#define ID 258
#define ADD 259
#define SUB 260
#define MUL 261
#define DIV 262
#define LP 263
#define RP 264
#define ASSIGN 265
#define EOL 266
#define DISP 267
#define UMINUS 268
#endif
