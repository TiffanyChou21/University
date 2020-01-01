%{
/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Zcf 1712991

Date: 2019年12月3日
****************************************************************************/

#include "myparser.h"
#include <iostream>
#include <string>
#include <cstring>
#include <stdlib.h>
#include "tree.h"

char idTable[100][100];
int idNum=0;
int Line=0;
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
delim [ \t\r\f\v]+
newline    [\n]
number	([0-9])+(\.([0-9])+((\E|\e)(\+|\-)?([0-9])+)?)?
id	[_a-zA-Z][_a-zA-Z0-9]*
comment	(\/\*([^*"]*|".*"|\*+[^/])*\**\*\/)|(\/\/.*\n)
charval	'[^'\n]'
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

%{
	// extract yylval for use later on in actions
	YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;
%}

// place your Lex rules here
{delim}		{/*do nothing*/}
{comment}	{/*do nothing*/}
{newline}   {Line++;}

"int"		{return INT;}
"char"		{return CHAR;}
"bool"		{return BOOL;}
"void"		{return VOID;}
"float"		{return FLOAT;}
"double"	{return DOUBLE;}
"if"		{return IF;}
"else"		{return ELSE;}
"while"		{return WHILE;}
"for"		{return FOR;}
"return"	{return RETURN;}
"main"		{return MAIN;}
"endl"      {return ENDL;}
"cin"		{return CIN;}
"cout"		{return COUT;}
"="			{return ASSIGN;}

"+"			{return ADD;}
"-"			{return SUB;}
"*"			{return MUL;}
"/"			{return DIV;}
"%"			{return MOD;}

"("			{return LP;}
")"			{return RP;}
"{"			{return LB;}
"}"			{return RB;}
"["         {return LSP;}
"]"         {return RSP;}

"++"		{return INC;}
"--"		{return DEC;}
"<<"		{return SHL;}
">>"		{return SHR;}
"&"         {return BAND;}
"|"         {return BOR;}
"^"         {return XOR;}
"~"         {return NOT;}

"=="		{return EQ;}
">"			{return GT;}
"<"			{return LT;}
">="		{return GE;}
"<="		{return LE;}
"!="		{return NE;}
"&&"		{return AND;}
"||"		{return OR;}
"!"			{return OPPSITE;}
";"			{return SEMI;}
","			{return COMMA;}

{id}		{	
				for(int i=0;i<idNum;i++)
				{
					if(strcmp(idTable[i],yytext)==0)
					{
						TreeNode* idNode=newExprNode(Id);
						idNode->attr.id=new char[yyleng+1];
						strcpy_s(idNode->attr.id,strlen(yytext)+1,yytext);
						yylval=idNode;
						return ID;
					}
				}
				strcpy_s(idTable[idNum++],strlen(yytext)+1,yytext);
				TreeNode* idNode=newExprNode(Id);
				idNode->attr.id=new char[yyleng+1];
				idNode->sibling = NULL;
                idNode->nodeType = Expr;
                idNode->type.exprType = Id;
                idNode->varType = Void;
				strcpy_s(idNode->attr.id,strlen(yytext)+1,yytext);
				yylval=idNode;
				return ID;
			}
{number}	{
				double value=0;
				int index=-1;
				double count=10;
				for(int i=0;i<yyleng;i++)
					if(yytext[i]=='.')
						index=i;
				if (index != -1)   //浮点
				{
					for (int i = 0; i < index; i++)
						value = value * 10 + yytext[i] - '0';
					for (int i = index + 1; i < yyleng; i++)
					{
						value += (yytext[i] - '0') / count;
						count = count * 10;
					}
				}
				else   //整数
				{
					//for (int i = 0; i < yyleng; i++)
						//value = value * 10 + yytext[i] - '0';
					value=atoi(yytext);
				}
				TreeNode* constNode=newExprNode(Const);
				constNode->attr.value=value;
				constNode->varType=Int;
				yylval=constNode;
				return NUMBER;
			}
{charval}      {TreeNode* constNode=newExprNode(Const);   //Save as ASCII
				constNode->attr.value=yytext[1];
				constNode->varType=Char;
				yylval=constNode;
				return CHARVAL;
			}
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

