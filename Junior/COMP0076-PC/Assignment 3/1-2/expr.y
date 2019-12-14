%{
/****************************************************************************
expr.y
ParserWizard generated YACC file.

Date: 2019年10月12日
1.将所有的词法分析功能均放在 yygettoken 函数内实现，为+、-、*、\、(、)每个运算符及整数分别定义一个单词类别，在 yygettoken 内实现代码，能识 别这些单词，并将单词类别返回给词法分析程序。
2.实现功能更强的词法分析程序，可识别并忽略空格、制表符、回车等空白符， 能识别多位十进制整数。
****************************************************************************/

#include <ctype.h>
#include <stdio.h>
#include <iostream>
using namespace std;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// parser name
%name myparser

// class definition
{
	// place any extra class members here
	virtual int yygettoken();
}

// constructor
{
	// place any extra initialisation code here
}

// destructor
{
	// place any extra cleanup code here
}

// attribute type
%include {
#ifndef YYSTYPE 
#define YYSTYPE double
#define yylval (*reinterpret_cast<YYSTYPE*>(yylvalptr))
#endif
}

// place any declarations here

%token NUMBER
%token ADD SUB MUL DIV
%token LP RP 

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)

//用;做结尾即可忽略回车
lines   :   lines expr ';' { cout << $2 << endl; }
        |   lines ';'
        |
      	;

expr    :   expr ADD expr{$$=$1+$3;}
        |   expr SUB expr{$$=$1-$3;}
        |   expr MUL expr{$$=$1*$3;}
        |   expr DIV expr{$$=$1/$3;}
        |   LP expr RP {$$=$2;}
        |   SUB expr %prec UMINUS { $$ = -$2; }
        |   NUMBER{$$=$1;}
        ;
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
	char c;
	c=cin.get();
	while(c==' '||c=='\t'||c=='\n')                 //识别空格，制表符并跳过
	   c=cin.get();
	switch(c)
	{
	  case '+':
	      return ADD;
	  case '-':
	      return SUB;
	  case '*':
	      return MUL;
	  case '/':
	      return DIV;
	  case'(':
	      return LP;
	  case ')':
	      return RP;
	  default:
	      if(isdigit(c))          //识别多位整数
	      { 
	          yylval=c-'0';    
	          c=cin.get();
	          while(1)
	          {
	            while(c==' '||c=='\t'||c=='\n')
	              c=cin.get();
	            if(isdigit(c))
	             yylval=yylval*10+(c-'0');
	            else
	             break;
	            c=cin.get();
	          }
	          cin.unget();                  //多读的不是数字的字符回流
	          return NUMBER;
	      }
	      else 
	      {
	          return c;
	      }
	}
}

int main(void)
{
	int n = 1;
	myparser parser;
	if (parser.yycreate()) {
		n = parser.yyparse();
	}
	return n;
}

