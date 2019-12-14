%{
/****************************************************************************
lexer.l
ParserWizard generated Lex file.

Zcf 1712991

Date: 2019年11月7日
****************************************************************************/
#include "parser.h"
#include<iostream>
#include <string>
#include <fstream>
#pragma warning(disable:4996)
ofstream outa("result-attachment.txt");
#define MAXCHILDREN 6
enum NodeType{Stmt,Expr,Decl};
enum Statement{If,While,For,Block,Input,Output,Fuc,Return,Expr_fuc,Fuc_asked};
enum Expression{Op,Const,Idk,Type};
enum Declaration{Var,FucVar};
enum TypeK{Int,Char,Void,Bool,Float,Double};
struct TreeNode
{
  struct TreeNode*child[MAXCHILDREN];
  struct TreeNode*sibling;
  NodeType nodetype; 
  Statement stmttype;
  Expression exprtype;
  Declaration dectype;
  TypeK type;
  union{
   int op;//！！token定义，返回int型操作符号的值
   int val;
   char* charvalue;
   char* symbol;
  }attr;
  int lineno;  //是递归的顺序并不是行号
};
extern int line;

void insert(const char*letter,char*lexeme,char*type);
int lookup(const char*letter,char*lexeme);
extern YYSTYPE yylval;
extern int line;
%}
%name lexer

// class definition
{
	// place any extra class members here
public:
	void insert(const char*letter,char*lexeme,char* type);
	int lookup(const char*letter,char*lexeme);
	char* tp=new char[6];
}

space [ \f\v\t]+
newline [\n]
digit [0-9]
id [_a-zA-Z][_a-zA-Z0-9]*
decimal (({digit}|[1-9]{digit}+)(((\.){digit}+)?))|(\.){digit}+
numberSci  (({digit}+((\.){digit}+)?)|((\.){digit}+))[eE]([+-]?){digit}+
number {decimal}|{numberSci}
charval         \'([^\n\\]|(\\.))\'
comment \/\/.*
block_comment \/\*([^*"]*|".*"|\*+[^/])*\*\/
%%

%{
	YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;
%}
{space}				{/*doing nothing*/}
{newline}           {line++;}
{comment}				{/*doing nothing*/}
{block_comment}				{/*doing nothing*/}
","				        {return COMMA;}
";"					    {return SEMI;}
"("					    {return LP;}
")"					    {return RP;}
"{"					    {return LB;}
"}"					    {return RB;}
"["					    {return LSP;}//数组时候使用 并没有写_(:з」∠)_
"]"				     	{return RSP;}

"if"					{return IF;}
"else"					{return ELSE;}
"while"					{return WHILE;}
"for"					{return FOR;}
"cin"					{return CIN;}
"cout"					{return COUT;}
"void"					{return VOID;}
"int"					{tp[0]='\0';strcpy(tp,yytext);return INT;}
"char"					{tp[0]='\0';strcpy(tp,yytext);return CHAR;}
"string"				{tp[0]='\0';strcpy(tp,yytext);return STRING;}
"float"					{tp[0]='\0';strcpy(tp,yytext);return FLOAT;}
"double"				{tp[0]='\0';strcpy(tp,yytext);return DOUBLE;}
"bool"					{tp[0]='\0';strcpy(tp,yytext);return BOOL;}
"main"                  {return MAIN;}
"return"                {return RETURN;}

"="				    	{return ASSIGN;}
"+="					{return ADDASS;}
"-="					{return SUBASS;}
"*="					{return MULASS;}
"/="					{return DIVASS;}
"%="					{return MODASS;}
"&="					{return ANDASS;}
"|="					{return ORASS;}
"^="					{return XORASS;}
"<<="					{return SHLASS;}
">>="					{return SHRASS;}


"+"				    	{return ADD;}
"-"				    	{return SUB;}
"*"				    	{return MUL;}
"/"				    	{return DIV;}
"%"				    	{return MOD;}
"++"				    {return INC;}
"--"				   	{return DEC;}

"~"						{return BNOT;}
"&"						{return BAND;}
"|"						{return BOR;}
"=="				   	{return EQ;}
">"				    	{return GT;}
"<"				    	{return LT;}
">="				   	{return GE;}
"<="				    {return LE;}
"!="				   	{return NE;}
"&&"				   	{return AND;}
"||"				   	{return OR;}
"!"				    	{return NOT;}
"<<"                    {return SHL;}
">>"                    {return SHR;}
{id}				    {
                         struct TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
                         for(int i=0;i<MAXCHILDREN;i++)
                          {
                           t->child[i]=NULL;
                          }
                          t->sibling=NULL;
                          t->nodetype=Expr;
                          t->exprtype=Idk;
                          t->attr.symbol=new char[yyleng+1];
                          strcpy(t->attr.symbol,yytext);
                          t->lineno=line++;
                          t->type=Void;
                          yylval=t;
                          insert("ID",yytext,tp);
                          return ID;
                         }
{number}    			    {
                         struct TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
                         for(int i=0;i<MAXCHILDREN;i++)
                          {
                           t->child[i]=NULL;
                          }
                          t->sibling=NULL;
                          t->nodetype=Expr;
                          t->exprtype=Const;
                          t->attr.val=atoi(yytext);
                          t->lineno=line++;
                          t->type=Void;
                          yylval=t;
                          return NUMBER;}
{charval}				{
						  struct TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
                          for(int i=0;i<MAXCHILDREN;i++)
                          {
                           t->child[i]=NULL;
                          }
                          t->sibling=NULL;
                          t->nodetype=Expr;
                          t->exprtype=Const; 
                          t->attr.charvalue=new char[yyleng+1];//去掉''
                          strcpy(t->attr.charvalue,yytext);
                          strncpy(t->attr.charvalue,t->attr.charvalue+1,yyleng);
                          for(int i=0;i<yyleng;i++)
                          {
							if(t->attr.charvalue[i]=='\'')
								t->attr.charvalue[i]='\0';
                          }
                          t->lineno=line++;
                          t->type=Void;
                          yylval=t;
                          return CHARVAL;
						}
%%
struct symbol1{
 char* letter;  //单词
 char* lexeme;   //词素 
 char* type;   //类型
 int value;    //第几个这样的
 struct symbol1 *m_next;//下一个symtable的字符
};
struct symbol1* symtable;//symtable中的第一个元素
int lexer::lookup(const char*letter,char*lexeme)
{
 struct symbol1 *st=symtable;
 int count=-1;
 for(;st;st=st->m_next)
 {
   if(strcmp(st->letter,letter)==0)   //有这个单词则计数++
   {
     count++;
     if(strcmp(st->lexeme,lexeme)==0)
     {
       return -2;   //说明已在符号表中
     }
   } 
 }
 return count;
}
void lexer::insert(const char*letter,char*lexeme,char* type)
{
    struct symbol1 *st;
    int count=lookup(letter,lexeme);
    if(count==-2)//已在则返回
    {
      return ;
    }
    //不在
    st=(struct symbol1*)malloc(sizeof(struct symbol1));
    st->m_next=symtable;
    st->letter=(char*)malloc(strlen(letter)+1);
    strcpy(st->letter,letter);
    st->lexeme=(char*)malloc(strlen(lexeme)+1);
    strcpy(st->lexeme,lexeme);
    st->value=count+1;
    st->type=type;
    cout<<"单词   "<<st->letter<<"\t\t"<<"词素   "<<st->lexeme<<"\t"<<"类型    "<<st->type<<"\t"<<"属性   "<<st->value<<endl;
    outa<<"单词   "<<st->letter<<"\t\t"<<"词素   "<<st->lexeme<<"\t"<<"类型    "<<st->type<<"\t"<<"属性   "<<st->value<<endl;
    symtable=st;   //symtable第一个变为st 
}