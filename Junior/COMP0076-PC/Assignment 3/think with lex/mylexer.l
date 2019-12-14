%{
/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Date: 2019年10月14日
****************************************************************************/
#include <iostream>
#include "think.h"
#include "token_table.h"
using namespace std;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// lexical analyser name
%name mylexer
neglect[ \t\n]+
id    [a-zA-Z_]([a-zA-Z_]|[0-9])*
number [0-9]+(\.[0-9]+)?


%%
%{
//this code will be added into yyaction function
    YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;
%}

{neglect} {/* do nothing */}
"+"         {return ADD;}
"-"         {return SUB;}
"*"         {return MUL;}
"/"         {return DIV;}
"("         {return LP;}
")"         {return RP;}
"="	        {return ASSIGN;}
";"        {return EOL;}
{id}        {
				int pos = token_table.find(yytext);
				if(pos == -1){
					pos = token_table.insert(yytext);
				}
				yylval = pos;//return the position
				return ID;
			}
{number}    {yylval = atof(yytext);//字符串转数
			 return NUMBER;}
%%
