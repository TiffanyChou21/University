%{
/****************************************************************************
parser.y
ParserWizard generated YACC file.

Zcf 1712991

Date: 2019年11月7日
****************************************************************************/
#include<iostream>
#include<string>
#include<fstream>
#include <iomanip>
ofstream out("result.txt");
#pragma warning(disable:4996)
using namespace std;
#define MAXCHILDREN 6
enum NodeType{Stmt,Expr,Decl};
enum Statement{If,While,For,Block,Input,Output,Fuc,Return,Expr_fuc,Fuc_asked,Emp};
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
   int op;//！！由于是token定义，返回int型操作符号的值
   int val;
   char* symbol;
   char* charvalue;
  }attr;
  int lineno;//是递归的顺序并不是行号
};
int NUM=0;      //输出节点的计数
int line=0;   //计数\n
TreeNode*root;
TreeNode*newDeclNode(Declaration dectype)      //新decl节点 变量 函数
{
  TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
  if(t==NULL)
    cout<<"Out of memory error at line "<<line<<endl;
  else{
  for(int i=0;i<MAXCHILDREN;i++)
    t->child[i]=NULL;
  t->sibling=NULL;
  t->nodetype=Decl;
  t->dectype=dectype;
  t->lineno=line++;}
  return t;
}
TreeNode*newExprNode(Expression exprtype)    //新表达式节点op const id type
{
  TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
  if(t==NULL)
    cout<<"Out of memory error at line "<<line<<endl;
  else{
  for(int i=0;i<MAXCHILDREN;i++)
    t->child[i]=NULL;
  t->sibling=NULL;
  t->nodetype=Expr;
  t->exprtype=exprtype;
  t->lineno=line++;
  t->type=Void;}
  return t;
}
TreeNode*newStmtNode(Statement stmttype)   //新结构体节点...
{
  TreeNode*t=(TreeNode*)malloc(sizeof(TreeNode));
  if(t==NULL)
    cout<<"Out of memory error at line "<<line<<endl;
  else{
  for(int i=0;i<MAXCHILDREN;i++)
    t->child[i]=NULL;
  t->sibling=NULL;
  t->nodetype=Stmt;
  t->stmttype=stmttype;
  t->lineno=line++;}
  return t;
}

%}
%include{
  class lexer;
 }
 
 %include{
  #include "lexer.h"
 }
// parser name
%name parser

// class definition
{
	// place any extra class members here
public:
  lexer m_lexer;
public:
  void display(struct TreeNode*t);
 void shownode(struct TreeNode*t);
}

%include {
#ifndef YYSTYPE
#define YYSTYPE TreeNode* //yylval的类型
#endif
}

// place any declarations here
%token IF MAIN FOR WHILE CIN COUT
%token INT CHAR VOID STRING FLOAT DOUBLE BOOL
%token ID NUMBER CHARVAL
%token ADD SUB MUL DIV MOD INC DEC
%token GT LT GE LE NE AND OR NOT BNOT BAND BOR XOR ASSIGN ADDASS SUBASS MULASS DIVASS MODASS ANDASS ORASS XORASS SHLASS SHRASS
%token LB RB LSP RSP COMMA SEMI LP RP SHL SHR
%token RETURN

%left COMMA
%right ASSIGN
%left EQ NE
%left LT LE GT GE
%left ADD SUB
%left MUL DIV MOD
%left   INC DEC
%left	LP RP LSP RSP LB RB SHL SHR
%right ELSE
%%

start   :MAIN LP RP block  { $$=$4;root=$4;display(root);}
        ;
block   :LB stmts RB   {$$=newStmtNode(Block);$$->child[0]=$2;}
        ;
stmts   :stmt stmts    {$$=$1;$$->sibling=$2;}
        |stmt          {$$=$1;}
        ;
stmt    :expr_stmt     {$$=$1;}
        |var_stmt      {$$=$1;}//声明变量stmt
        |if_stmt       {$$=$1;}
        |while_stmt    {$$=$1;}
        |for_stmt      {$$=$1;}
        |block         {$$=$1;}   //{}
        |input_stmt    {$$=$1;}
        |output_stmt   {$$=$1;}
        |fuc_stmt      {$$=$1;}   //功能不全
        |fuc_asked_stmt{$$=$1;}
        |return_stmt   {$$=$1;}
        |SEMI          {$$=newStmtNode(Emp);}
        ;
var_stmt     :type_var id_list SEMI    {$$=newDeclNode(Var);$$->child[0]=$1;$$->child[1]=$2;}//变量声明
             ;
fuc_var      :fuc1_var COMMA fuc_var    {$$=$1;$$->sibling=$3;}
             |fuc1_var                  {$$=$1;}              
             ; 
fuc1_var     :type_var ID              {$$=newDeclNode(FucVar);$$->child[0]=$1;$$->child[1]=$2;}
             ;     
expr_stmt    :expr SEMI				   {$$=$1;}             
             ;
type_var     :INT                      {$$=newExprNode(Type);$$->type=Int;}
             |CHAR                     {$$=newExprNode(Type);$$->type=Char;}
             |VOID                     {$$=newExprNode(Type);$$->type=Void;}
             |FLOAT					   {$$=newExprNode(Type);$$->type=Float;}
             |DOUBLE				   {$$=newExprNode(Type);$$->type=Double;}
			 |BOOL					   {$$=newExprNode(Type);$$->type=Bool;}				
             ;
id_list      :expr COMMA id_list       {$$=$1;$$->sibling=$3;}
             |expr
             ;
expr         :expr ASSIGN expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ASSIGN;}
             |expr ADDASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ADDASS;}
             |expr SUBASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=SUBASS;}
             |expr MULASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=MULASS;}
             |expr DIVASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=DIVASS;}
             |expr MODASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=MODASS;}
             |expr ANDASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ANDASS;}
             |expr ORASS expr          {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=ORASS;}
             |expr XORASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=XORASS;}
             |expr SHLASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=SHLASS;}
             |expr SHRASS expr         {$$=newExprNode(Op);$$->child[0]=$1;$$->child[1]=$3;$$->attr.op=SHRASS;}
             |or_expr                  {$$=$1;}  
             ;
or_expr      :or_expr OR and_expr      {$$=newExprNode(Op);$$->attr.op=OR;$$->child[0]=$1;$$->child[1]=$3;}
             |and_expr                 {$$=$1;}
             ;
and_expr     :and_expr AND bor_expr    {$$=newExprNode(Op);$$->attr.op=AND;$$->child[0]=$1;$$->child[1]=$3;}
             |bor_expr                 {$$=$1;}
             ;
bor_expr     :bor_expr BOR xor_expr    {$$=newExprNode(Op);$$->attr.op=BOR;$$->child[0]=$1;$$->child[1]=$3;}
             |xor_expr                 {$$=$1;}
             ;
xor_expr     :xor_expr XOR band_expr   {$$=newExprNode(Op);$$->attr.op=XOR;$$->child[0]=$1;$$->child[1]=$3;}
             |band_expr                {$$=$1;}
             ;             
band_expr    :band_expr BAND eq_expr   {$$=newExprNode(Op);$$->attr.op=BAND;$$->child[0]=$1;$$->child[1]=$3;}
			 |eq_expr				   {$$=$1;}
			 ;
      
eq_expr      :eq_expr EQ rala_expr     {$$=newExprNode(Op);$$->attr.op=EQ;$$->child[0]=$1;$$->child[1]=$3;}
             |eq_expr NE rala_expr     {$$=newExprNode(Op);$$->attr.op=NE;$$->child[0]=$1;$$->child[1]=$3;}
             |rala_expr
             ;
rala_expr    :rala_expr GE sh_expr     {$$=newExprNode(Op);$$->attr.op=GE;$$->child[0]=$1;$$->child[1]=$3;}   
             |rala_expr LE sh_expr     {$$=newExprNode(Op);$$->attr.op=LE;$$->child[0]=$1;$$->child[1]=$3;}
             |rala_expr GT sh_expr     {$$=newExprNode(Op);$$->attr.op=GT;$$->child[0]=$1;$$->child[1]=$3;}
             |rala_expr LT sh_expr     {$$=newExprNode(Op);$$->attr.op=LT;$$->child[0]=$1;$$->child[1]=$3;}                
             |sh_expr			       {$$=$1;}
             ;
sh_expr      :sh_expr SHL as_expr      {$$=newExprNode(Op);$$->attr.op=SHL;$$->child[0]=$1;$$->child[1]=$3;}
             |sh_expr SHR as_expr      {$$=newExprNode(Op);$$->attr.op=SHR;$$->child[0]=$1;$$->child[1]=$3;}
             |as_expr
             ;
as_expr      :as_expr ADD md_expr      {$$=newExprNode(Op);$$->attr.op=ADD;$$->child[0]=$1;$$->child[1]=$3;}
             |as_expr SUB md_expr      {$$=newExprNode(Op);$$->attr.op=SUB;$$->child[0]=$1;$$->child[1]=$3;}
			 |md_expr                  {$$=$1;}
			 ;
md_expr      :md_expr MUL term         {$$=newExprNode(Op);$$->attr.op=MUL;$$->child[0]=$1;$$->child[1]=$3;}
             |md_expr DIV term         {$$=newExprNode(Op);$$->attr.op=DIV;$$->child[0]=$1;$$->child[1]=$3;}
             |term                     {$$=$1;}
             ;
term         :LP expr RP               {$$=$2;}
			 |ID					   {$$=$1;}
			 |NUMBER				   {$$=$1;}
			 |CHARVAL				   {$$=$1;}
			 |NOT term                 {$$=newExprNode(Op);$$->attr.op=NOT;$$->child[0]=$2;}
			 |BNOT term                {$$=newExprNode(Op);$$->attr.op=BNOT;$$->child[0]=$2;}
			 ;
//if
if_stmt      :IF LP expr RP stmt       {$$=newStmtNode(If);$$->child[0]=$3;$$->child[1]=$5;}
             |IF LP expr RP stmt ELSE stmt {$$=newStmtNode(If);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;}
             ;
//for
for_stmt     :FOR LP expr SEMI expr SEMI expr RP stmt {$$=newStmtNode(For);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;$$->child[3]=$9;}
	         |FOR LP SEMI expr SEMI expr RP stmt      {$$=newStmtNode(For);$$->child[0]=$4;$$->child[1]=$6;$$->child[2]=$8;}  
             |FOR LP expr SEMI SEMI expr RP stmt      {$$=newStmtNode(For);$$->child[0]=$3;$$->child[1]=$6;$$->child[2]=$8;}  
             |FOR LP expr SEMI expr SEMI RP stmt      {$$=newStmtNode(For);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$8;}  
             |FOR LP SEMI SEMI expr RP stmt			  {$$=newStmtNode(For);$$->child[0]=$5;$$->child[1]=$7;} 
             |FOR LP SEMI expr SEMI RP stmt			  {$$=newStmtNode(For);$$->child[0]=$4;$$->child[1]=$7;}
             |FOR LP expr SEMI SEMI RP stmt			  {$$=newStmtNode(For);$$->child[0]=$3;$$->child[1]=$7;}
             |FOR LP SEMI SEMI RP stmt				  {$$=newStmtNode(For);$$->child[0]=$6;}
             ;
//while
while_stmt   :WHILE LP expr RP stmt                   {$$=newStmtNode(While);$$->child[0]=$3;$$->child[1]=$5;}
             ;
//cin cout
input_stmt   :CIN SHR ID SEMI                         {$$=newStmtNode(Input);$$->child[0]=$3;}
             ; 
output_stmt  :COUT SHL ID SEMI						  {$$=newStmtNode(Output);$$->child[0]=$3;}
             ;
//函数有小问题
fuc_stmt     :type_var ID LP fuc_var  RP block        {$$=newStmtNode(Fuc);$$->child[0]=$1;$$->child[1]=$2;$$->child[2]=$4;$$->child[3]=$6;}
             ;
fuc_asked_stmt:type_var ID ASSIGN fuc_asked1_stmt     {$$=newStmtNode(Fuc);$$->child[0]=$1;$$->child[1]=$2;$$->child[2]=$4;}
              |fuc_asked1_stmt                        {$$=$1;}
              ;
fuc_asked1_stmt:ID LP expr_fuc RP SEMI                {$$=newStmtNode(Fuc_asked);$$->child[0]=$1;$$->child[1]=$3;}
               ;
expr_fuc      :expr COMMA expr                        {$$=newStmtNode(Expr_fuc);$$->child[0]=$1;$$->child[1]=$3;}
              |expr                                   {$$=newStmtNode(Expr_fuc);$$->child[0]=$1;}
              ; 
//return
return_stmt  :RETURN term							  {$$=newStmtNode(Return);$$->child[0]=$2;}
             ;                        
%%
void parser::display(struct TreeNode* root) //从根display
{
 struct TreeNode *temp=(TreeNode*)malloc(sizeof(TreeNode));
 for(int i=0;i<MAXCHILDREN;i++)
 {
   if(root->child[i]!=NULL)
     display(root->child[i]);//从孩子节点开始向上
 }
 shownode(root);    //叶节点
 temp=root->sibling;   //找兄弟节点
 if(temp!=NULL)     //如果有兄弟节点
 {
   display(temp);    //display
 }
 return;
}
void parser::shownode(struct TreeNode* node)
{
  struct TreeNode* temp=(struct TreeNode*)malloc(sizeof(TreeNode));
  if(node->stmttype==10)
	return ;
  node->lineno=NUM++;
  cout<<node->lineno<<":";//输出行号
  out<<node->lineno<<":";
  switch(node->nodetype)
  {
   case Stmt:
   {  //排序必须和上面enum一致
     string names[11]={"if statement,",  "while statement," , "for statement," , "compound statement,","input statement,","output statement,","fnction statement","return statement","expression fuction" ,"function asked",""};
     cout<<names[node->stmttype]<<"\t\t\t";
     out<<names[node->stmttype]<<"\t\t\t";
     break;
   }
   case Expr:
   {
     string names[4]={"Expr," , "Const Declaration,", "ID Declaration,","Type Specifier," };
     string types[6]={"integer, ","char, ","void, ","bool, ","float, ","double, "};
     cout<<names[node->exprtype]<<'\t';
     out<<names[node->exprtype]<<'\t';
     switch(node->exprtype)
     {
      case Op:
      {
        switch(node->attr.op)
        {
          case ADD:
          {
            cout<<'\t'<<"op:+\t\t";
            out<<'\t'<<"op:+\t\t";
            break;
          }
          case SUB:
          {
            cout<<'\t'<<"op:-\t\t";
            out<<'\t'<<"op:-\t\t";
            break;
          }
          case MUL:
          {
            cout<<'\t'<<"op:*\t\t";
            out<<'\t'<<"op:*\t\t";
            break;
          }
          case DIV:
          {
            cout<<'\t'<<"op:/\t\t";
            out<<'\t'<<"op:/\t\t";
            break;
          }
          case MOD:
          {
            cout<<'\t'<<"op:%\t\t";
            out<<'\t'<<"op:%\t\t";
            break;
          }
          case INC:
          {
            cout<<'\t'<<"op:++\t\t";
            out<<'\t'<<"op:++\t\t";
            break;
          }
          case DEC:
          {
            cout<<'\t'<<"op:--\t\t";
            out<<'\t'<<"op:--\t\t";
            break;
          }
          case LT:
          {
            cout<<'\t'<<"op:<\t\t";
            out<<'\t'<<"op:<\t\t";
            break;
          }
          case GT:
          {
            cout<<'\t'<<"op:>\t\t";
            out<<'\t'<<"op:>\t\t";
            break;
          }
          case LE:
          {
            cout<<'\t'<<"op:<=\t\t";
            out<<'\t'<<"op:<=\t\t";
            break;
          }
          case GE:
          {
            cout<<'\t'<<"op:>=\t\t";
            out<<'\t'<<"op:>=\t\t";
            break;
          }
          case EQ:
          {
            cout<<'\t'<<"op:==\t\t";
            out<<'\t'<<"op:==\t\t";
            break;
          }
          case ASSIGN:
          {
            cout<<'\t'<<"op:=\t\t";
            out<<'\t'<<"op:=\t\t";
            break;
          }
          case ADDASS:
          {
			cout<<'\t'<<"op:+=\t\t";
			out<<'\t'<<"op:+=\t\t";
			break;			
          }
          case SUBASS:
          {
			cout<<'\t'<<"op:-=\t\t";
			out<<'\t'<<"op:-=\t\t";
			break;			
          }
          case MULASS:
          {
			cout<<'\t'<<"op:*=\t\t";
			out<<'\t'<<"op:*=\t\t";
			break;			
          }
          case DIVASS:
          {
			cout<<'\t'<<"op:/=\t\t";
			out<<'\t'<<"op:/=\t\t";
			break;			
          }
          case MODASS:
          {
			cout<<'\t'<<"op:%=\t\t";
			out<<'\t'<<"op:%=\t\t";
			break;			
          }
          case ANDASS:
          {
			cout<<'\t'<<"op:&=\t\t";
			out<<'\t'<<"op:&=\t\t";
			break;			
          }
          case ORASS:
          {
			cout<<'\t'<<"op:|=\t\t";
			out<<'\t'<<"op:|=\t\t";
			break;			
          }
          case XORASS:
          {
			cout<<'\t'<<"op:^=\t\t";
			out<<'\t'<<"op:^=\t\t";
			break;			
          }
          case SHLASS:
          {
			cout<<'\t'<<"op:<<=\t\t";
			out<<'\t'<<"op:<<=\t\t";
			break;			
          }
          case SHRASS:
          {
			cout<<'\t'<<"op:>>=\t\t";
			out<<'\t'<<"op:>>=\t\t";
			break;			
          }
          case NE:
          {
            cout<<'\t'<<"op:!=\t\t";
            out<<'\t'<<"op:!=\t\t";
            break;
          }
          case SHL:
          {
            cout<<'\t'<<"op:<<\t\t";
            out<<'\t'<<"op:<<\t\t";
            break;
          }
           case SHR:
          {
            cout<<'\t'<<"op:>>\t\t";
            out<<'\t'<<"op:>>\t\t";
            break;
          }
          case NOT:
          {
            cout<<'\t'<<"op:!\t\t";
            out<<'\t'<<"op:!\t\t";
            break;
          }
          case OR:
          {
            cout<<'\t'<<"op:||\t\t";
            out<<'\t'<<"op:||\t\t";
            break;
          }
          case AND:
          {
            cout<<'\t'<<"op:&&\t\t";
            out<<'\t'<<"op:&&\t\t";
            break;
          }
          case BAND:
          {
            cout<<'\t'<<"op:&\t\t";
            out<<'\t'<<"op:&\t\t";
            break;
          }
          case BOR:
          {
            cout<<'\t'<<"op:|\t\t";
            out<<'\t'<<"op:|\t\t";
            break;
          }
          case XOR:
          {
            cout<<'\t'<<"op:^\t\t";
            out<<'\t'<<"op:^\t\t";
            break;
          }
          case BNOT:
          {
            cout<<'\t'<<"op:~\t\t";
            out<<'\t'<<"op:~\t\t";
            break;
          }
        }
          break;
       }
        case Const:
        {
		  if(node->attr.val>10000000)//判断输出number还是charval
			{cout<<"value:"<<node->attr.charvalue<<"\t\t";  
			out<<"value:"<<node->attr.charvalue<<"\t\t";}
		  else
			{cout<<"value:"<<node->attr.val<<"\t\t";
			out<<"value:"<<node->attr.val<<"\t\t";}
          break;
        }
        case Idk:
        {
          cout<<"symbol:"<<node->attr.symbol<<'\t';
          out<<"symbol:"<<node->attr.symbol<<'\t';
          break;
        }
        case Type:
        {
          cout<<types[node->type]<<"\t";
          out<<types[node->type]<<"\t";
          break;
        }
      }
      break;
     }
     case Decl:
     {
       string names[2]={"Var Declaration, ", "Fuc Declaration"};
       cout<<names[node->dectype]<<"\t\t\t";
       out<<names[node->dectype]<<"\t\t\t";
       break;
     }
   } 
   cout<<"children:";
   out<<"children:";
   for(int i=0;i<MAXCHILDREN;i++)
   {
     if(node->child[i]!=NULL)
     {
       cout<<node->child[i]->lineno<<" "; //和上面一样先找孩子如果有兄弟则显示兄弟！
       out<<node->child[i]->lineno<<" ";
       temp=node->child[i]->sibling;      //最开始给找成自己的sibling了所以显示总是有问题
       while(temp!=NULL)
       {
        cout<<temp->lineno<<" ";
        out<<temp->lineno<<" ";
        temp=temp->sibling; 
       }
     }
   }
   cout<<endl;
   out<<endl;
   return;
}
int main(void)
{
	int n = 1;
	lexer lexer;
	parser parser;
	ifstream in("a.txt"); 
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			lexer.yyin=&in;
			cout<<"Symbol Table:"<<endl;
			n = parser.yyparse();
		}
	}
	in.close();
	out.close();
	return n;
}

