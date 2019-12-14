%{
/****************************************************************************
post.y
ParserWizard generated YACC file.

Date: 2019年10月13日
3.修改 Yacc 程序，不进行表达式的计算，而是实现中缀表达式到后缀表达式 的转换。
****************************************************************************/
#include <ctype.h>
#include <stdio.h>
#include <iostream>
#include <cstring>
using namespace std;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
%include {
#ifndef YYSTYPE
#define YYSTYPE char*     // 上下文无关文法返回类型
#define yylval (*reinterpret_cast<YYSTYPE*>(yylvalptr))
#endif
#pragma warning(disable:4996)//避免strcpy报错
}

// parser name
%name post

// class definition
{
	// place any extra class members here
	// double tokenval;
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

// place any declarations here
 
%token ADD SUB MUL DIV
%token LP RP 

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)
lines	:	lines expr ';'	{ cout << $2 << endl; }
		|	lines ';'
		|   
 		;
expr	:	expr ADD expr	{ $$ = new char[50]; strcpy($$, $1);strcat($$," ");strcat($$, $3);strcat($$," ");strcat($$, "+ ");  }//中缀表达式变后缀表达式
		|	expr SUB expr	{ $$ = new char[50]; strcpy($$, $1);strcat($$," ");strcat($$, $3);strcat($$," ");strcat($$, "- "); }
		|	expr MUL expr	{ $$ = new char[50]; strcpy($$, $1);strcat($$," ");strcat($$, $3);strcat($$," ");strcat($$, "* "); }
		|	expr DIV expr	{ $$ = new char[50]; strcpy($$, $1);strcat($$," ");strcat($$, $3);strcat($$," ");strcat($$, "/ "); }
		|	LP expr RP	{ $$ = new char[50]; strcpy($$, $2); }
		|	SUB expr %prec UMINUS{$$ = new char[50]; strcpy($$, $2);strcat($$," ");strcat($$,"  -  ");}
        |	ID
		;
ID      :   CHAR
		|   ID CHAR{$$=new char[50];strcpy($$,$1);strcat($$,$2);}
		;
CHAR	:	'0'		{ $$ = new char[2];	strcpy($$, "0"); }
		|	'1'		{ $$ = new char[2];	strcpy($$, "1"); }
		|	'2'		{ $$ = new char[2];	strcpy($$, "2");}
		|	'3'		{ $$ = new char[2];	strcpy($$, "3"); }
		|	'4'		{ $$ = new char[2];	strcpy($$, "4"); }
		|	'5'		{ $$ = new char[2];	strcpy($$, "5"); }
		|	'6'		{ $$ = new char[2];	strcpy($$, "6"); }
		|	'7'		{ $$ = new char[2];	strcpy($$, "7"); }
		|	'8'		{ $$ = new char[2];	strcpy($$, "8"); }
		|	'9'		{ $$ = new char[2];	strcpy($$, "9"); }
		|	'_'		{ $$ = new char[2];	strcpy($$, "_"); }
		|   'a'     { $$ = new char[2];	strcpy($$, "a"); }
		|	'b'		{ $$ = new char[2];	strcpy($$, "b"); }
		|	'c'		{ $$ = new char[2];	strcpy($$, "c");}
		|	'd'		{ $$ = new char[2];	strcpy($$, "d"); }
		|	'e'		{ $$ = new char[2];	strcpy($$, "e"); }
		|	'f'		{ $$ = new char[2];	strcpy($$, "f"); }
		|	'g'		{ $$ = new char[2];	strcpy($$, "g"); }
		|	'h'		{ $$ = new char[2];	strcpy($$, "h"); }
		|	'i'		{ $$ = new char[2];	strcpy($$, "i"); }
		|	'j'		{ $$ = new char[2];	strcpy($$, "j"); }
		|	'k'		{ $$ = new char[2];	strcpy($$, "k"); }
		|   'l'     { $$ = new char[2];	strcpy($$, "l"); }
		|	'm'		{ $$ = new char[2];	strcpy($$, "m"); }
		|	'n'		{ $$ = new char[2];	strcpy($$, "n");}
		|	'o'		{ $$ = new char[2];	strcpy($$, "o"); }
		|	'p'		{ $$ = new char[2];	strcpy($$, "p"); }
		|	'q'		{ $$ = new char[2];	strcpy($$, "q"); }
		|	'r'		{ $$ = new char[2];	strcpy($$, "r"); }
		|	's'		{ $$ = new char[2];	strcpy($$, "s"); }
		|	't'		{ $$ = new char[2];	strcpy($$, "t"); }
		|	'u'		{ $$ = new char[2];	strcpy($$, "u"); }
		|	'v'		{ $$ = new char[2];	strcpy($$, "v"); }
		|   'w'     { $$ = new char[2];	strcpy($$, "w"); }
		|	'x'		{ $$ = new char[2];	strcpy($$, "x"); }
		|	'y'		{ $$ = new char[2];	strcpy($$, "y");}
		|	'z'		{ $$ = new char[2];	strcpy($$, "z"); }
		|	'A'		{ $$ = new char[2];	strcpy($$, "A"); }
		|	'B'		{ $$ = new char[2];	strcpy($$, "B"); }
		|	'C'		{ $$ = new char[2];	strcpy($$, "C"); }
		|	'D'		{ $$ = new char[2];	strcpy($$, "D"); }
		|	'E'		{ $$ = new char[2];	strcpy($$, "E"); }
		|	'F'		{ $$ = new char[2];	strcpy($$, "F"); }
		|	'G'		{ $$ = new char[2];	strcpy($$, "G"); }
		|   'H'     { $$ = new char[2];	strcpy($$, "H"); }
		|	'I'		{ $$ = new char[2];	strcpy($$, "I"); }
		|	'J'		{ $$ = new char[2];	strcpy($$, "J");}
		|	'K'		{ $$ = new char[2];	strcpy($$, "K"); }
		|	'L'		{ $$ = new char[2];	strcpy($$, "L"); }
		|	'M'		{ $$ = new char[2];	strcpy($$, "M"); }
		|	'N'		{ $$ = new char[2];	strcpy($$, "N"); }
		|	'O'		{ $$ = new char[2];	strcpy($$, "O"); }
		|	'P'		{ $$ = new char[2];	strcpy($$, "P"); }
		|	'Q'		{ $$ = new char[2];	strcpy($$, "Q"); }
		|	'R'		{ $$ = new char[2];	strcpy($$, "R"); }
		|   'S'     { $$ = new char[2];	strcpy($$, "S"); }
		|	'T'		{ $$ = new char[2];	strcpy($$, "T"); }
		|	'U'		{ $$ = new char[2];	strcpy($$, "U");}
		|	'V'		{ $$ = new char[2];	strcpy($$, "V"); }
		|	'W'		{ $$ = new char[2];	strcpy($$, "W"); }
		|	'X'		{ $$ = new char[2];	strcpy($$, "X"); }
		|	'Y'		{ $$ = new char[2];	strcpy($$, "Y"); }
		|	'Z'		{ $$ = new char[2];	strcpy($$, "Z"); }
		;
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
	char c;
	c = cin.get();
	while(true) {
		if(c== ' ' || c == '\t' || c == '\n') 
		{	c = cin.get();continue;}
		switch(c)
       {
         case '+':
              return ADD;
              break;
         case '-':
              return SUB;
              break;
         case '*':
              return MUL;
              break;
         case '/':
              return DIV;
              break;
         case '(':
              return LP;
              break;
         case ')':
              return RP;
              break;
         default:
			  {while (c==' '||c=='\t'||c=='\n')
				c=cin.get();
			   return c;break;
			  }    
        }
        
	}
}

int main(void)
{
	int n = 1;
	post parser;
	if (parser.yycreate()) {
		n = parser.yyparse();
	}
	return n;
}