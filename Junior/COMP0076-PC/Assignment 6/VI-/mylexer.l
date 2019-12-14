%{
/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Zcf 1712991

Date: 2019Äê11ÔÂ23ÈÕ
****************************************************************************/
#include "myparser.h"
#include "tree.h"
#include<iostream>
#pragma warning(disable:4996)

using namespace std;
extern IDtable SymTable[1000];
treenode *node;
extern mytree m1;
extern int symNum;
extern int Line;
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// lexical analyser name
%name mylexer

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
comment	("/*"([^*"]*|".*"|\*+[^/])*\**"*/")|("//".*)
delim [\t\r\f\v]+
newline  [\n]
digit [0-9]
NUMBER {digit}+(\.{digit}+)?(E[+-]?{digit}+)?
ID     [_a-zA-Z][_a-zA-Z0-9]*
CONSTCHAR  \'([^\n\\]|(\\.))\'
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

%{
	// extract yylval for use later on in actions
	YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;
%}

// place your Lex rules here
{comment}	{/*doing nothing*/}
{delim}     {/*doing nothing*/}
{newline}   {Line++;}
"main" {return MAIN;}
"int"  {return INT;}
"char" {return CHAR;}
"void" {return VOID;}
"bool" {return BOOL;}
"double"  {return DOUBLE;}
"cin"  {return CIN;}
"cout" {return COUT;}
if   {return IF;}
else {return ELSE;}
while {return WHILE;}
do   {return DO;}
for  {return FOR;}
break {return BREAK;}
return {return RETURN;}

"+"  {return ADD;}
"-"  {return SUB;}
"*"  {return MUL;}
"/"  {return DIV;}
"%"  {return MOD;}
"++" {return INC;}
"--" {return DEC;}

"="  {return ASSIGN;}

"{"  {return LB;}
"}"  {return RB;}
"("  {return LP;}
")"  {return RP;}
"["	 {return LSB;}
"]"  {return RSB;}
";"  {return SEMICOLON;}
","  {return COMMA;}

"==" {return EQ;}
">"  {return GT;}
"<"  {return LT;}
">=" {return GE;}
"<=" {return LE;}
"!=" {return NE;}

"~"    {return BNOT;}
"&"    {return BAND;}
"|"    {return BOR;}
"&&"   {return AND;}
"||"   {return OR;}
"!"    {return NOT;}
"^"    {return XOR;}
"<<"   {return SHL;}
">>"   {return SHR;}




{CONSTCHAR}  {   node=new treenode;
                   yylval=node;
                   yylval->constchar=yytext[1];
				   /*yylval->charval=new char[yyleng+1];
				   strcpy(yylval->charval,yytext);
				   strncpy(yylval->charval,yylval->charval+1,yyleng);
				   for(int i=0;i<yyleng;i++)
				   {
						if(yylval->charval[i]=='\'')
							yylval->charval[i]='\0';
				   }*/
                   return CONSTCHAR;
                   }
 
{ID}      {
               node=new treenode;
               int address;
               if(m1.addSymbol(yytext)==-1)  address=symNum-1;
               else address=m1.addSymbol(yytext);
               SymTable[address].type="";
               yylval=node;
               yylval->IDaddr=address; 
               return ID;
               }
{NUMBER}    {
             node=new treenode;
             yylval=node;
             yylval->val=atoi(yytext);
             return NUMBER;
            }
.            {}
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

