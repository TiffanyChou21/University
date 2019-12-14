%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2019年10月10日
 思考:加强版带赋值表达式
****************************************************************************/
#include <iostream>
#include <cctype>
#include <string>
#include <vector>
using namespace std;
struct Dict {
    string id;
    double value;
};
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
%include {
#ifndef YYSTYPE
#define YYSTYPE double     // 上下文无关文法返回类型
#endif
}

// parser name
%name think

// class definition
{
	// place any extra class members here
    virtual int yygettoken();
    int find(string str);
    bool isIDFirst(char c);
    YYSTYPE yylval;
    vector<Dict*> dict;
    string IdName;
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


%token NUMBER ID
%token ADD SUB MUL DIV
%token LP RP
%token ASSIGN EOL DISP

%left ADD SUB
%left MUL DIV
%right UMINUS



%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)
stmt : stmt assign_stmt EOL
{
    int pos = find(IdName);
    cout << dict[pos]->value << endl;
}
|    stmt expr EOL {cout << $2 << endl;}
|    stmt EOL
|    stmt ID EOL
{
    int pos = find(IdName);
    if(pos==-1)
    {
        Dict* newDict = new Dict;
        newDict->id = IdName;
        newDict->value = 0;
        dict.push_back(newDict);
        pos=find(IdName);
    }
    cout << dict[pos]->value<< endl;
}
|
;
assign_stmt:    ID ASSIGN expr
{
    //cout << "assign_succeed";
    int pos = find(IdName);
    if(pos == -1) {
        Dict* newDict = new Dict;
        newDict->id = IdName;
        newDict->value = $3;
        dict.push_back(newDict);
    }
    else
    dict[pos]->value = $3;
}
;
expr	:	expr ADD expr	{ $$ = $1 + $3; }
	|	expr SUB expr	{ $$ = $1 - $3; }
	|	expr MUL expr	{ $$ = $1 * $3; }
	|	expr DIV expr	{ $$ = $1 / $3; }
	|	LP expr RP	{ $$ = $2; }
	|	SUB expr %prec UMINUS	{ $$ = -$2; }
	|	NUMBER			{ $$ = yylval; }
	|    ID    {int pos = find(IdName);$$ = dict[pos]->value;}
	;
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int YYPARSERNAME::find(string str) {
    for(int i = 0; i < dict.size(); i++)
    if(dict[i]->id == str)
        return i;
    return -1;
}

bool YYPARSERNAME::isIDFirst(char c) {
	return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_';
}

int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
    char c;
    c = cin.get();
	while(1) {
        if(c == ' ' || c == '\t' || c == '\n') {
            c=cin.get();
            continue;
        }
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
            case '=':
            return ASSIGN;
            case ',':
            return ',';
            case ';':
            return EOL;
            default:
            break;
        }
		if(isdigit(c)) {
            yylval = c - '0';
            double fl = 0.0;
            while(1) {
                c = cin.get();
                if(c==' '||c=='\t'||c == '\n')
                continue;
                if(!isdigit(c)) {
                    break;
                }
                yylval = yylval * 10 + (c - '0');
            }
            if(c == '.') {
                while(1) {
                    c = cin.get();
                    double d = 10;
                    if(c==' '||c=='\t'||c == '\n')
                    continue;
                    if(!isdigit(c)) {
                        break;
                    }
                    fl = fl + (c-'0')/d;
                    d = d * 10;
                }
            }
            cin.unget();
            yylval = yylval + fl;
            return NUMBER;
		}
		else {
			char str[50];
			int i = 0;
			str[i++] = c;
			while(1) {
				c = getchar();
				if(!isIDFirst(c) && !isdigit(c)) {
					cin.unget();
					str[i] = '\0';
					break;
				}
				str[i++] = c;
			}
			if(str == "disp") {
				return DISP;
			}
			else if(isIDFirst(str[0])) {
				string test(str);
				IdName = test;
				return ID;
			}
				
		}
		return c;
	}
}



int main(void)
{
	int n = 1;
	think parser;
	if (parser.yycreate()) {
		n = parser.yyparse();
	}
	return n;
}
