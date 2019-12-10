////习题三B树及其图形化界面
#include<iostream>
#include <OpenGl/gl.h>
#include <GLUT/GLUT.h>
using namespace std;
const int MaxFloor=12;       //B🌲的最大阶数
int floor;     //🌲的阶数(一个格子里最多的个数+1)
int Max;   //floor-1(格子中最大关键字数目)
int Min;   //最小
class Node            //🌲结点类🌲🌲
{
public:
    int keys;          //关键字个数
    int keywords[MaxFloor];   //关键字们
    Node * parent;
    Node *child[MaxFloor];
};
class BTreeResult     //🌲查找结果类
{
public:
    Node * SearchNode;   //指向所找到的结点
    int No;         //关键字序号
    bool SearchTag;       //标记查找结果true有此关键字，false无
};
class BTree   //🌲类
{
private:
    Node* root;
public:
    int KeywordSearch(Node *curr,int keyword);
    BTreeResult TreeSearch(Node *curr,int keyword);
    void InsertKeyword(Node **curr,int i,int keyword,Node *currChild);
    void Apart(Node **curr,Node **nextcurr);
    void Root(Node **root,Node *curr,int keyword,Node *nextcurr);
    void Insert(Node **root,int keyword,Node *curr, int i);//插入
    void Print(Node *curr);
    void DeleteKeyword(Node *curr,int i);
    void Replace(Node *curr,int n);
    bool Find(int key,Node *curr,int &i);
    bool Delete(int key,Node *curr);
    void DeleteBTree(int keyword,Node **curr);//删除
    void Left(Node *curr,int i);
    void Right(Node *curr,int i);
    void Unite(Node *curr,int i);
    void Adjust(Node *curr,int i);

};
int BTree::KeywordSearch(Node *curr,int keyword)//结点查找,返回第几个
{
    int i=0;
    while(i<curr->keys&&curr->keywords[i+1]<=keyword)
    {
        i++;
    }
    return i;
}
BTreeResult BTree::TreeSearch(Node *curr,int keyword)//🌲查找
{
    Node *pcurr=NULL;
    int i=0;
    bool found=false;
    BTreeResult result;
    while (curr!=NULL&&found==false)
    {
        i=KeywordSearch(curr,keyword);
        if (i>0&&curr->keywords[i]==keyword)//查找到
            found=true;
        else
        {
            pcurr=curr;
            curr=curr->child[i];
        }
    }
    result.No=i;
    if (found==true)
    {
        result.SearchNode=curr;
        result.SearchTag=true;
    }
    else                            //查找失败,keyword插入在指针所指结点的i和i+1之间
    {
        result.SearchNode=pcurr;
        result.SearchTag=false;
    }
    return result;
}
void BTree::InsertKeyword(Node **curr,int order,int keyword,Node *currChild)//结点插入
{
    int j;
    for(j=(*curr)->keys;j>order;j--)
    {
        (*curr)->keywords[j+1]=(*curr)->keywords[j];
        (*curr)->child[j+1]=(*curr)->child[j];
    }
    (*curr)->keywords[order+1]=keyword;
    (*curr)->child[order+1]=currChild;  //插入key
    if (currChild!=NULL)
        currChild->parent=*curr;
    (*curr)->keys++;
}
void BTree::Apart(Node **curr,Node **nextcurr)//满之后分隔开
{//关键字个数，关键字，双亲节点，孩子节点
    int i,n=(floor+1)/2;     //一边的个数
    *nextcurr=new Node;
    (*nextcurr)->child[0]=(*curr)->child[n];
    for (i=n+1;i<=floor;i++)
    {
        (*nextcurr)->keywords[i-n]=(*curr)->keywords[i];
        (*nextcurr)->child[i-n]=(*curr)->child[i];
        if ((*curr)->child[i-n]!=NULL)
            (*nextcurr)->child[i-n]->parent=*nextcurr;
    }
    (*nextcurr)->keys=(*curr)->keys-n;
    (*nextcurr)->parent=(*curr)->parent;
    for (i=0;i<=(*curr)->keys-n;i++)            //修改双亲结点!!
        if ((*nextcurr)->child[i]!=NULL)
            (*nextcurr)->child[i]->parent=*nextcurr;
    (*curr)->keys=n-1;                        //关键字个数改变
}
void BTree::Root(Node **root,Node *curr,int keyword,Node *nextcurr)
//生成根节点
{
    *root=new Node;
    (*root)->keys=1;
    (*root)->child[0]=curr;
    (*root)->child[1]=nextcurr;
    (*root)->keywords[1]=keyword;
    if (curr!=NULL)
        curr->parent=*root;
    if (nextcurr!=NULL)
        nextcurr->parent=*root;
    (*root)->parent=NULL;
}
void BTree::Insert(Node **root,int keyword, Node *curr, int order)//插入
{
    Node *node;
    int n;
    bool needNewRoot,finished;
    if (curr==NULL)      //空树初始化
        Root(root,NULL,keyword,NULL);
    else
    {
        node=NULL;
        finished=needNewRoot=false;
        while (needNewRoot==false&&finished==false)
        {
            InsertKeyword(&curr,order,keyword,node);
            if (curr->keys<=Max)
                finished=true;
            else
            {                                //分裂
                n=(floor+1)/2;
                Apart(&curr,&node);
                keyword=curr->keywords[n];
                if (curr->parent)
                {
                    curr=curr->parent;
                    order=KeywordSearch(curr, keyword);  //在双亲节点里查找要插入的位置
                }
                else
                    needNewRoot=true;
            }
        }
        if (needNewRoot==true)
            Root(root,curr,keyword,node);
    }
}
void renderScene(void)
{
    glClear(GL_COLOR_BUFFER_BIT);   //清空颜色缓冲池
    glColor3f(1.0f, 0.0f, 0.0f);    //设置绘图颜色
    glRectf(-0.5f, -0.5f, 0.5f, 0.5f);  //绘制矩形
    glFlush();  //执行OpenGL指令列表中的指令
}
void BTree::Print(Node *curr) //打印🌲
{
    if(curr!=NULL)                           //非空
    {
        int step=0;                            //当前第几层，输出样式
        Node* p=curr;
        while(p->parent)
        {
            p=p->parent;
            step++;
        }
        while(step--)
            cout<<"     ";
        cout<<"[";
        int i;
        for( i=1;i<curr->keys;i++)
            cout<<curr->keywords[i]<<",";
        cout<<curr->keywords[i]<<"]"<<endl;
        for(i=0;i<=curr->keys;i++)            //递归输出孩子节点
            Print(curr->child[i]);
    }
}
void BTree::DeleteKeyword(Node *curr,int i)   //结点删除
{
    int j;
    for (j=i+1;j<=curr->keys;j++)
    {
        curr->keywords[j-1]=curr->keywords[j];
        curr->child[j-1]=curr->child[j];
    }
    curr->keys--;
}
void BTree::Replace(Node *curr,int i)     //替换
{
    Node *currChild;
    for (currChild=curr->child[i];currChild->child[0]!=NULL;currChild=currChild->child[0]);
    //找到用来替换的非叶子节点，，
    curr->keywords[i]=currChild->keywords[1];
}
bool BTree::Find(int keyword,Node *curr,int &i)   //节点查找函数
{
    if (keyword<curr->keywords[1])        //小于当前结点的最小关键字时返回false
    {
        i=0;
        return false;
    }
    else                        //查找keyword的位置
    {
        i=curr->keys;
        while (keyword<curr->keywords[i] && i>1)
            i--;
        return(keyword==curr->keywords[i]);
    }
}
bool BTree::Delete(int key,Node *curr)//🌲删除
{
    int position;         //关键字在节点上的位置
    bool found;
    if (curr==NULL)
        return false;
    else
    {
        if ((found=Find(key,curr,position))==1)
        {
            if (curr->child[0]!=NULL)                //非叶子结点
            {
                Replace(curr,position);
                Delete(curr->keywords[position],curr->child[position]);
            }
            else                                //叶子节点
                DeleteKeyword(curr,position);
        }
        else
            found=Delete(key,curr->child[position]);
        if (curr->child[position]!=NULL)
            if (curr->child[position]->keys<Min)            //删除后关键字个数小于Min
                Adjust(curr,position);      //树形变化后进行调整
        return found;
    }
}
void BTree::DeleteBTree(int keyword,Node **curr)    //删除
{
    Node *tmp;
    if (Delete(keyword,*curr)==0)
        cout<<"删除失败，未找到相应的关键字"<<endl;
    else if ((*curr)->keys==0)    //清除已删除
    {
        tmp=*curr;
        *curr=(*curr)->child[0];
        if(*curr)
            (*curr)->parent=NULL;
        delete tmp;
    }
}
void BTree::Left(Node *curr,int i)    //左移
{
    int j;
    Node *tmp;
    tmp=curr->child[i-1];
    tmp->keys++;
    tmp->keywords[tmp->keys]=curr->keywords[i];
    tmp->child[tmp->keys]=curr->child[i]->child[0];
    if(curr->child[i]->child[0])
        curr->child[i]->child[0]->parent=tmp;
    tmp=curr->child[i];
    curr->keywords[i]=tmp->keywords[1];
    tmp->child[0]=tmp->child[1];
    for (j=1;j<tmp->keys;j++)                //向前
    {
        tmp->keywords[j]=tmp->keywords[j+1];
        tmp->child[j]=tmp->child[j+1];
    }
    tmp->keys--;
}
void BTree::Right(Node *curr,int i)//右移
{
    int j;
    Node *tmp=curr->child[i];
    for (j=tmp->keys;j>0;j--)     //向后
    {
        tmp->keywords[j+1]=tmp->keywords[j];
        tmp->child[j+1]=tmp->child[j];
    }
    tmp->child[1]=tmp->child[0];
    tmp->keys++;
    tmp->keywords[1]=curr->keywords[i];
    tmp=curr->child[i-1];
    curr->keywords[i]=tmp->keywords[tmp->keys];
    curr->child[i]->child[0]=tmp->child[tmp->keys];
    if(tmp->child[tmp->keys])
        tmp->child[tmp->keys]->parent=curr->child[i]->child[0];
    tmp->keys--;
}
void BTree::Unite(Node *curr,int i)     //合并
{
    int j;
    Node *right=curr->child[i];//指向要删除的右孩子
    Node *left=curr->child[i-1];
    left->keys++;
    left->keywords[left->keys]=curr->keywords[i];
    left->child[left->keys]=right->child[0];
    if(right->child[0])//右孩子结点的第一个孩子结点不为空，将其父节点关联为left
        right->child[0]->parent=left;
    for (j=1;j<=right->keys;j++)
    {
        left->keys++;
        left->keywords[left->keys]=right->keywords[j];
        left->child[left->keys]=right->child[j];
        if(right->child[j])
            right->child[j]->parent=left;
    }
    for (j=i;j<curr->keys;j++)
    {
        curr->keywords[j]=curr->keywords[j+1];
        curr->child[j]=curr->child[j+1];
    }
    curr->keys--;
    delete right;
}
void BTree::Adjust(Node *curr,int i)//🌲形变化时进行调整
{
    if (i==0)
        if (curr->child[1]->keys>Min)
            Left(curr,1);
        else
            Unite(curr,1);
        else if (i==curr->keys)
            if (curr->child[i-1]->keys>Min)
                Right(curr,i);
            else
                Unite(curr,i);
            else if (curr->child[i-1]->keys>Min)
                Right(curr,i);
            else if (curr->child[i+1]->keys>Min)
                Left(curr,i+1);
            else
                Unite(curr,i);
}
int main(int argc, char** argv)
{
    BTree tree;
    Node *treeNode=NULL;
    BTreeResult result;                                        //搜索结果
    int keynum;                                           //初始化时的关键字个数

    cout<<"********************初始化B树*******************"<<endl;
    cout<<"第一行输入关键字的个数num及要建立的B树的阶数m:(空格隔开)"<<endl;
    cout<<"第二行输入所有的关键字，以逗号分隔："<<endl;
    cin>>keynum>>floor;
    int key[100];
    char c;
    for(int i=0;i<keynum;i++)
    {
        cin>>key[i];
        if(i<keynum-1) cin>>c;
    }
    Max=floor-1;
    Min=(floor-1)/2;
    cout<<"初始化"<<floor<<"阶B树："<<endl;
    for (int j=0;j<keynum;j++)                            //创建B🌲
    {
        result=tree.TreeSearch(treeNode,key[j]);
        if (result.SearchTag==false)
            tree.Insert(&treeNode,key[j],result.SearchNode,result.No);
    }
    tree.Print(treeNode);
    int operand;                                   //待操作数
    cout<<"************请按照范例输入进行插入删除操作************"<<endl;
    cout<<"插入关键字：I 76"<<endl;
    cout<<"删除关键字：D 50"<<endl;
    cout<<"插入多个关键字：MI 76,23,51#"<<endl;
    cout<<"删除多个关键字：MD 50,4,14#"<<endl;
    cout<<"退出：Q"<<endl;
    cout<<"************************************************"<<endl;
    while(1){
        cin>>c;
        if(c=='Q') break;
        switch(c){
            case 'I':{
                cin>>operand;
                result=tree.TreeSearch(treeNode,operand);
                if (result.SearchTag==false)
                        tree.Insert(&treeNode,operand,result.SearchNode,result.No);
                else
                    cout<<operand<<"插入失败，有重复的关键字！"<<endl;
                cout<<"插入后的B树："<<endl;
                tree.Print(treeNode);
                break;
            }
            case 'D':{
                cin>>operand;
                tree.DeleteBTree(operand,&treeNode);
                cout<<"删除后的B树："<<endl;
                tree.Print(treeNode);
                break;
            }
            case 'M':{
                cin>>c;
                switch (c) {
                    case 'I':{
                        while(1){
                        cin>>operand;
                        result=tree.TreeSearch(treeNode,operand);
                        if (result.SearchTag==0)
                            tree.Insert(&treeNode,operand,result.SearchNode,result.No);
                        else
                            cout<<operand<<"插入失败，有重复的关键字！"<<endl;
                        cin>>c;
                        if(c=='#') break;
                        }
                        cout<<"插入后的B树："<<endl;
                        tree.Print(treeNode);
                        break;
                    }
                    case 'D':{
                        while(1){
                            cin>>operand;
                            tree.DeleteBTree(operand,&treeNode);
                            cin>>c;
                            if(c=='#') break;
                        }
                        cout<<"删除后的B树："<<endl;
                        tree.Print(treeNode);
                        break;
                    }
                }
                c='a';      //重置c的值，避免前面的判断条件不符合
            }
        }
        cout<<"请按照范例输入进行插入删除操作！"<<endl;
    }
return 0;
}
