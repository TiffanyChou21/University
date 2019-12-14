#include <iostream>
#include <map>//map不支持double&&我不太清楚yylval在YYSTYPE中怎么转换，所以换用vector检索
#include <vector>
#include "think.h"
#include "mylexer.h"
using namespace std;

struct Dict
{
	string id;
	double value;
};
class TokenTable
{
private:
	vector<Dict> dict;
public:
	int find(const string& Id){
		for (int i = 0; i < dict.size(); ++i)
		{
			if(dict[i].id.compare(Id) == 0){
				return i;
			}
		}
		return -1;//not found
	}

	int insert(const string& Id){
		Dict dic;
		dic.id = Id;
		dic.value = 0.0;
		dict.push_back(dic);
		return dict.size()-1;
	}
	void set(int pos, double val){
		dict[pos].value = val;
	}
	double get(int pos){
		return dict[pos].value;
	}
};
extern TokenTable token_table;