%{
/****************************************************************************
think.y
ParserWizard generated YACC file.

Date: 2019年10月14日
思考:加强版带赋值表达式
****************************************************************************/
#pragma warning(disable:4996)//避免strcpy报错
#include "mylexer.h"
#include "token_table.h"
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// parser name
%name think
// class definition
{
	// place any extra class members here
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
%include {
#ifndef YYSTYPE
#define YYSTYPE double
#endif
}

%token NUMBER ID
%token ADD SUB MUL DIV
%token LP RP EOL
%token ASSIGN

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines	:	lines expr EOL	{ cout<<$2<<endl; }
		|	lines EOL
		|   
		;

expr	:	expr ADD expr	{ $$ = $1 + $3; }
		|	expr SUB expr	{ $$ = $1 - $3; }
		|	expr MUL expr	{ $$ = $1 * $3; }
		|	expr DIV expr	{ $$ = $1 / $3; }
		|	LP expr RP	{ $$ = $2; }
		|	'-' expr %prec UMINUS	{ $$ = -$2; }
		|	NUMBER {$$=$1;}
		|   ID {$$ = token_table.get($1);}//get value from sym_table
		|   ID ASSIGN expr {token_table.set($1, $3); $$=$3; }//modify the value
		;  
%%



int main(int argc, char *argv[])
{
	int n = 1;
	mylexer lexer;
	think parser;
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			n = parser.yyparse();
		}
	}
	getchar();
	return n;
}

 