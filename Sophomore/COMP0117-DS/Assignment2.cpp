//习题二哈夫曼树（QAQ终于弄完了）（由于本人运行系统为MacOS，所以可能该cpp不能很好的运行在Win上，请见谅）
#include<iostream>
#include<fstream>
#include<string>
#include<string>
#include<iomanip>
using namespace std;
class Letter{                           //字符及其权重
private:
    char character;
    int weight;
public:
    Letter(){}
    Letter( char & c,int w){character=c;weight=w;}
    int & num(){return weight;}
    char & let(){return character;}
};
class HuffmanNode                        //哈夫曼基类节点
{
public:
    virtual int weight()=0;
    virtual bool isLeaf()=0;                   //判断叶子，继续合并
    virtual HuffmanNode* left()=0;
    virtual HuffmanNode* right()=0;
    virtual void setLeft(HuffmanNode*)=0;
    virtual void setRight(HuffmanNode*)=0;
};
class LeafNode:public HuffmanNode              //叶节点
{
private:
    Letter * lett;
public:
    LeafNode(char& c,int w){lett=new Letter(c,w);}
    int weight (){return lett->num();}
    char cha(){return lett->let();}
    bool isLeaf(){return true;}
    HuffmanNode* left(){ return NULL;}
    HuffmanNode* right(){return NULL;}
    void setLeft(HuffmanNode*){}
    void setRight(HuffmanNode*){}
};
class BranchNode:public HuffmanNode{        //分支节点，叶节点weight和，小树根
private:
    HuffmanNode * leftc;
    HuffmanNode * rightc;
    int SumWeight;
public:
    BranchNode(HuffmanNode* l,HuffmanNode* r)
    {
        SumWeight=l->weight()+r->weight();
        leftc=l;
        rightc=r;
    }
    int weight(){return SumWeight;}
    bool isLeaf(){return false;}
    HuffmanNode* left(){return leftc;}
    HuffmanNode* right(){return rightc;}
    void setLeft(HuffmanNode *b){leftc=(HuffmanNode*)b;}
    void setRight(HuffmanNode*b){rightc=(HuffmanNode*)b;}
};
class HuffmanCode{             //哈夫曼编码
public:
    char letter;
    char * code;
    HuffmanCode(){code=new char[20];}
};
class HuffmanTree{               //哈夫曼树
private:
    HuffmanNode* root;           //树根
public:
    HuffmanTree(){}
    void addleaf(char &c,int w){root=new LeafNode(c,w);}
    HuffmanTree(HuffmanTree* l,HuffmanTree* r)    //合并左右子树
    {
        root=new BranchNode(l->Root(),r->Root());
    }
    HuffmanNode* Root(){return root;}
    int weight(){return root->weight();}
    void encode(HuffmanNode *subroot,HuffmanCode *HCode,int &HCCount,char*codes,int &count)
    {                            //编码！！！！！！！！！！
        if(subroot->isLeaf()){        //到达叶节点的时候跳出赋值！！！！！！
            codes[count]=NULL;
            strcpy(HCode[HCCount].code,codes);
            HCode[HCCount++].letter=((LeafNode*)subroot)->cha();//强制转换叶节点，需要先指向下一层
            return  ;
        }
        codes[count++]='0';                 //前序遍历
        encode(subroot->left(),HCode,HCCount,codes,count);
        count--;
        codes[count++]='1';
        encode(subroot->right(),HCode,HCCount,codes,count);
        count--;
    }
};
class node{
public:
    HuffmanTree SortNode;
    node *next;
};
class SortTree{             //          //升序排列节点们，便于encode生成哈夫曼树！！！！
    node *head;
    int count;         //
public:
    SortTree(){head=new node;head->next=NULL;count=0;}//初始化。。。
    SortTree(HuffmanTree*){}
    int Count(){return count;}
    bool insert(HuffmanTree *HTinsert)
    {
        node *temp=new node;   //中间值
        temp->SortNode=*HTinsert;
        node *recent;       //当前值
        for(recent=head;recent->next!=NULL&&(recent->next->SortNode.weight())<(HTinsert->weight());recent=recent->next);
        temp->next=recent->next;
        recent->next=temp;
        count++;
        return true;
    }
    bool remove(HuffmanTree *HTremove){//从最小的开始移除建大树
        *HTremove=head->next->SortNode;
        node* temp=head->next;
        head->next=temp->next;
        count--;
        delete temp;
        return true;
    }
};
void SelectChar(Letter*useful,int &count,ifstream &in)
{                                    //过滤掉ASCII以外的东西
    Letter *lett;
    lett=new Letter[128];
    for(int i=0;i<128;i++){
        lett[i].let()=char(i);
        lett[i].num()=0;
    }
    char ch;
    int wei;
    while(!in.eof()){
        in.get(ch);
        if(in.peek() == '\n') break;
        wei=int(ch);
        lett[wei].num()++;
    }
    in.close();
    for (int i=0;i<128;i++)
    {
        if(lett[i].num()!=0){
            useful[count++]=lett[i];
        }
    }
}
SortTree * BuildSort(Letter* useful,int &count)         //利用排好序的节点添枝加叶
{
    SortTree *sorted=new SortTree();
    HuffmanTree * HT=new HuffmanTree[count];
    for (int i=0;i<count;i++)
    {
        HT[i].addleaf(useful[i].let(),useful[i].num());
        sorted->insert(&HT[i]);
    }
    return sorted;
}
HuffmanTree* BuildHuffmanTree(SortTree* sorted){           //建大哈夫曼树
    HuffmanTree*t1,*t2,*t3;      //1,2分别为左子树右子树的小点，3是最后大树
    t1=new HuffmanTree;
    t2=new HuffmanTree;
    t3=new HuffmanTree;
    while(sorted->Count()>1){       //从最小的开始
        sorted->remove(t1);
        sorted->remove(t2);
        t3=new HuffmanTree(t1,t2);
        sorted->insert(t3);
    }
    return t3;
}
void HuffmanEncode(HuffmanTree *HT,HuffmanCode *Hcode,Letter* letter,ofstream &out)//编码
{
    int HCount=0;
    char *path=new char[20];
    int pathcount=0;
    HT->encode(HT->Root(),Hcode,HCount,path,pathcount);
    out<<left<<setw(10)<<"字符"<<left<<setw(20)<<"出现次数"<<left<<setw(15)<<"对应编码"<<endl;
    for(int i=0;i<HCount;i++)
    {
        for(int j=0;j<HCount;j++)
        {if(Hcode[j].letter==letter[i].let()){out<<setw(10)<<letter[i].let()<<setw(13)<<letter[i].num()<<setw(15)<<Hcode[j].code<<endl;
            }
        }
    }
    out.close();
}
void HuffmanCoding(ifstream &in,ofstream &out,HuffmanCode * Hcode,int& count)//将字母转化为二进制
{
    char ch;
    while(!in.eof()){
        in.get(ch);
        if(in.peek() == '\n') break;
        for(int i=0;i<count;i++){
            if(ch==Hcode[i].letter)
            {
                out<<Hcode[i].code;
                break;
            }
        }
    }
    out<<endl;
    in.close();
    out.close();
}
void HuffDecode(HuffmanTree *htree,ifstream &in,ofstream &out)//译码，输出编码及译码结果
{
    HuffmanNode *subroot=htree->Root();
    char ch;
    while(!in.eof()){
        in.get(ch);
        if(in.peek() == '\n') break;
        if(ch=='0') subroot=subroot->left();
        else subroot=subroot->right();
        if(subroot->isLeaf()){
            out<<((LeafNode*)subroot)->cha();
            subroot=htree->Root();
        }
    }
    out.close();
    in.close();
}
//写一个过滤非ASCII的函数总是不知名报错。(solved)
int main()
{
    ifstream input1("inputfile1.txt");
    ofstream output1("outputfile1.txt");
    Letter *letter=new Letter[128];
    int lettercount=0;
    SelectChar(letter,lettercount,input1);//过滤
    SortTree *usefullist=new SortTree;
    usefullist=BuildSort(letter,lettercount);       //小树叉
    HuffmanTree *BigHuffmanTree=new HuffmanTree;
    BigHuffmanTree=BuildHuffmanTree(usefullist);         //合成大树
    HuffmanCode *Hcode=new HuffmanCode[lettercount];
    HuffmanEncode(BigHuffmanTree,Hcode,letter,output1);     //输出文件1
    ofstream output3("outputfile3.txt");
    HuffmanCoding(input1,output3,Hcode,lettercount);//输出文件3（便于生成文件2的测试数据）
    ifstream input2("inputfile2.txt");
    ofstream output2("outputfile2.txt");
    HuffDecode(BigHuffmanTree,input2,output2);//输出文件2
    return 0;
}
