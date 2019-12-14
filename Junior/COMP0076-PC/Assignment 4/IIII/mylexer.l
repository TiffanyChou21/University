%{
/****************************************************************************
mylexer.l
ParserWizard generated Lex file.

Author:Chenfei Zhou

ID:1712991

NKU CS

Date: 2019年10月22日
****************************************************************************/
#include <iostream>
#include <fstream>
#include <string>
#include <unordered_map>
#pragma warning(disable:4996)
using namespace std;

int num_lines=0;
void lexing(string word, string lexeme);

ifstream in("a.txt");
ofstream out("lex.txt");
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
// lexical analyser name
%name mylexer

// class definition
{
	// place any extra class members here
	  
	 int id_count=0;
	 unordered_map<string,int>idlist;
	
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

newline     \n
space  [ \t\f\v]+
digit [0-9]
octDigit 		[0-7]
hexDigit 		[0-9a-fA-F]
octal			(0)({octDigit}+)
hex				(0)[xX]({hexDigit}+)
ID	            [a-zA-Z_]([a-zA-Z_]|{digit})*
decimal	        (({digit}|[1-9]{digit}+)(((\.){digit}+)?))|(\.){digit}+
numberSci		(({digit}+((\.){digit}+)?)|((\.){digit}+))[eE]([+-]?){digit}+
number			{decimal}|{numberSci}
comment         \/\/.* 
block_comment   \/\*([^*"]*|".*"|\*+[^/])*\*\/
charval         '([^\n\\]|(\\.)|(\\{octDigit}{1,3})|(\\[xX]{hexDigit}{1,2}))'
stringval       \"(\\.|[^\\"\n])*\" 
//包含浮点和科学计数

IF					if
ELSE				else
WHILE				while
SIGNED				signed
THROW				throw
UNION				union
THIS				this
INT					int
CHAR				char
DOUBLE				double
FLOAT				float
LONG				long
SHORT				short
UNSIGNED			unsigned
CONST				const
GOTO				goto
VIRTUAL				virtual
FOR					for
BREAK				break
CONTINUE			continue
AUTO				auto
CLASS				class
OPERATOR			operator
CASE				case
DO					do
TYPEDEF				typedef
STATIC				static
FRIEND				friend
TEMPLATE			template
DEFAULT				default
NEW					new
VOID				void
REGISTER			register
EXTERN				extern
RETURN				return
ENUM				enum
INLINE				inline
TRY					try
SIZEOF				sizeof
SWITCH				switch
PRIVATE				private
PROTECTED			protected
ASM					asm
CATCH				catch
DELETE				delete
PUBLIC				public
VOLATILE			volatile
STRUCT				struct
BOOL				bool
CONST_CAST			const_cast
DYNAMIC_CAST		dynamic_cast
EXPLICIT	        explicit
TRUE	            true
FALSE				false
MUTABLE				mutable
NAMESPACE			namespace
REINTERPRET_CAST	reinterpret_cast
STATIC_CAST			static_cast
TYPEID				typeid
TYPENAME			typename
USING				using
WCHAR_T				wchar_T



LBRACE    \{
RBRACE    \}
LPAREN    \(
RPAREN    \)
LSQPAREN  \[
RSQPAREN  \]
SEMI      \;
COMMA     \,
PLUS	  \+
MINUS     \-
MUL       \*
DIV       \/
MOD       \%
ASSIGN    \=
ADDASS    \+\=
SUBASS    \-\=
MULASS	  \*\=
DIVASS    \/\=
MODASS	  \%\=
ANDASS    \&\=
XORASS	  \^\=
ORASS	  \|\=
SHRASS	  ">>="
SHLASS	  "<<="
		
EQ        \=\=
LE        \<\=
LT        \<
NE		  \!\=
GT        \>
GE        \>\=
AND       \&\&
OR		  \|\|
NOT		  \!
INC       \+\+
DEC       \-\-
BAND	  \&
BOR		  \|
NOR		  \^
BNOT	  \~
LSHIFT	  \<\<
RSHIFT	  \>\>


%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your Lex rules here

{newline}       {num_lines++;}
{space}         {/*skip*/}
{comment}		{/*do nothing*/}
{block_comment} {/*do nothing*/}

{charval}           {out<<"CHARVAL\t"<<yytext<<endl;}
{stringval}         {out<<"STRINGVAL\t"<<yytext<<endl;}
{IF}				{lexing("IF",yytext);}
{ELSE}				{lexing("ELSE",yytext);}
{WHILE}				{lexing("WHILE",yytext);}
{SIGNED}            {lexing("SIGNED",yytext);}
{THROW}				{lexing("THROW",yytext);}
{UNION}			    {lexing("UNION",yytext);}
{THIS}				{lexing("THIS",yytext);}
{INT}				{lexing("INT",yytext);}
{CHAR}				{lexing("CHAR",yytext);}
{DOUBLE}			{lexing("DOUBLE",yytext);}
{FLOAT}				{lexing("FLOAT",yytext);}
{LONG}				{lexing("LONG",yytext);}
{SHORT}				{lexing("SHORT",yytext);}
{UNSIGNED}	        {lexing("UNSIGNED",yytext);}
{CONST}				{lexing("CONST",yytext);}
{GOTO}   			{lexing("GOTO",yytext);}
{VIRTUAL}		    {lexing("VIRTUAL",yytext);}
{FOR}				{lexing("FOR",yytext);}
{BREAK}				{lexing("BREAK",yytext);}
{CONTINUE}			{lexing("CONTINUE",yytext);}
{AUTO}				{lexing("AUTO",yytext);}
{CLASS}				{lexing("CLASS",yytext);}
{OPERATOR}			{lexing("OPERATOR",yytext);}
{CASE}				{lexing("CASE",yytext);}
{DO}				{lexing("DO",yytext);}
{TYPEDEF}			{lexing("TYPEDEF",yytext);}
{STATIC}			{lexing("STATIC",yytext);}
{FRIEND}			{lexing("FRIEND",yytext);}
{TEMPLATE}			{lexing("TEMPLATE",yytext);}
{DEFAULT}			{lexing("DEFAULT",yytext);}
{NEW}				{lexing("NEW",yytext);}
{VOID}				{lexing("VOID",yytext);}
{REGISTER}			{lexing("REGISTER",yytext);}
{EXTERN}			{lexing("EXTERN",yytext);}
{RETURN}			{lexing("RETURN",yytext);}
{ENUM}				{lexing("ENUM",yytext);}
{INLINE}			{lexing("INLINE",yytext);}			
{TRY}				{lexing("TRY",yytext);}
{SIZEOF}			{lexing("SIZEOF",yytext);}	
{SWITCH}			{lexing("SWITCH",yytext);}
{PRIVATE}			{lexing("PRIVATE",yytext);}
{PROTECTED}			{lexing("PROTECTED",yytext);}
{ASM}				{lexing("ASM",yytext);}
{CATCH}				{lexing("CATCH",yytext);}
{DELETE}			{lexing("DELETE",yytext);}
{PUBLIC}			{lexing("PUBLIC",yytext);}
{VOLATILE}			{lexing("VOLATILE",yytext);}
{STRUCT}			{lexing("STRUCT",yytext);}
{BOOL}				{lexing("BOOL",yytext);}
{CONST_CAST}		{lexing("CONST_CAST",yytext);}
{DYNAMIC_CAST}		{lexing("DYNAMIC_CAST",yytext);}
{EXPLICIT}	        {lexing("EXPLICIT",yytext);}
{TRUE}	            {lexing("TRUE",yytext);}
{FALSE}				{lexing("FALSE",yytext);}
{MUTABLE}			{lexing("MUTABLE",yytext);}
{NAMESPACE}			{lexing("NAMESPACE",yytext);}
{REINTERPRET_CAST}  {lexing("REINTERPRET_CAST",yytext);}
{STATIC_CAST}		{lexing("STATIC_CAST",yytext);}	
{TYPEID}			{lexing("TYPEID",yytext);}
{TYPENAME}			{lexing("TYPENAME",yytext);}
{USING}				{lexing("USING",yytext);}
{WCHAR_T}			{lexing("WCHAR_T",yytext);}

{LBRACE}        {out<<"LBRACE\t\t"<<yytext<<endl;}
{RBRACE}        {out<<"RBRACE\t\t"<<yytext<<endl;}
{LPAREN}        {out<<"LPAREN\t\t"<<yytext<<endl;}
{RPAREN}        {out<<"RPAREN\t\t"<<yytext<<endl;}
{SEMI}          {out<<"SEMI\t\t"<<yytext<<endl;}
{COMMA}         {out<<"COMMA\t\t"<<yytext<<endl;}

{PLUS}          {out<<"PLUS\t\t"<<yytext<<endl;}
{MINUS}         {out<<"MINUS\t\t"<<yytext<<endl;}
{MUL}           {out<<"MUL\t\t"<<yytext<<endl;}
{DIV}           {out<<"DIV\t\t"<<yytext<<endl;}
{MOD}           {out<<"MOD\t\t"<<yytext<<endl;}
{INC}           {out<<"INC\t\t"<<yytext<<endl;}
{DEC}           {out<<"DEC\t\t"<<yytext<<endl;}
{BAND}          {out<<"BAND\t\t"<<yytext<<endl;}
{BOR}           {out<<"BOR\t\t"<<yytext<<endl;}
{NOR}           {out<<"NOR\t\t"<<yytext<<endl;}
{BNOT}          {out<<"BNOT\t\t"<<yytext<<endl;}
{LSHIFT}        {out<<"LSHIFT\t\t"<<yytext<<endl;}
{RSHIFT}        {out<<"RSHIFT\t\t"<<yytext<<endl;}

{ASSIGN}        {out<<"ASSIGN\t\t"<<yytext<<endl;}
{EQ}            {out<<"EQ\t\t"<<yytext<<endl;}
{LE}            {out<<"LE\t\t"<<yytext<<endl;}
{LT}            {out<<"LT\t\t"<<yytext<<endl;}
{GE}            {out<<"GE\t\t"<<yytext<<endl;}
{GT}            {out<<"GT\t\t"<<yytext<<endl;}
{NE}            {out<<"NE\t\t"<<yytext<<endl;}

{AND}           {out<<"AND\t\t"<<yytext<<endl;}
{OR}            {out<<"OR\t\t"<<yytext<<endl;}
{NOT}           {out<<"NOT\t\t"<<yytext<<endl;}

{number}       {out<<"NUMBER\t\t"<<yytext<<"\t"<<atof(yytext)<<endl;}
{octal}         {out<<"NUMBER\t\t"<<yytext<<"\t0"<<atof(yytext)<<endl;}
{hex}			{out<<"NUMBER\t\t"<<yytext<<"\t"<<yytext<<endl;}

{ID}            {if(idlist.find(yytext)==idlist.end())
				{
					idlist[yytext]=id_count;
					id_count++;
				}
				out<<"ID\t\t"<<yytext<<"\t"<<idlist[yytext]<<endl;}



%%

/////////////////////////////////////////////////////////////////////////////
// programs section

void lexing(string word, string lexeme) {out << word <<"\t\t"<< lexeme<<endl;}
int main(void)
{
	int n = 1;
	mylexer lexer;
	if (lexer.yycreate()) {
		lexer.yyin = &in;
		out<<"单词\t\t词素\t属性\n";
		n = lexer.yylex();
		}
	in.close();
	out.close();
	return n;
}

