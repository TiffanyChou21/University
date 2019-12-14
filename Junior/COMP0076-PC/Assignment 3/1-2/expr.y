%{
/****************************************************************************
expr.y
ParserWizard generated YACC file.

Date: 2019��10��12��
1.�����еĴʷ��������ܾ����� yygettoken ������ʵ�֣�Ϊ+��-��*��\��(��)ÿ��������������ֱ���һ����������� yygettoken ��ʵ�ִ��룬��ʶ ����Щ���ʣ�����������𷵻ظ��ʷ���������
2.ʵ�ֹ��ܸ�ǿ�Ĵʷ��������򣬿�ʶ�𲢺��Կո��Ʊ�����س��ȿհ׷��� ��ʶ���λʮ����������
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

//��;����β���ɺ��Իس�
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
	while(c==' '||c=='\t'||c=='\n')                 //ʶ��ո��Ʊ��������
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
	      if(isdigit(c))          //ʶ���λ����
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
	          cin.unget();                  //����Ĳ������ֵ��ַ�����
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

