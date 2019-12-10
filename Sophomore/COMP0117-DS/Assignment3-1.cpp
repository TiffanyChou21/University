//选做一迷宫
#include<iostream>
using namespace std;

const int m=12;        //具体N*N的值        //需手动输入！！！！！！！！
bool first=true;
int direction[8][2]={{0,1},{1,0},{-1,0},
    {0,-1},{1,1},{-1,-1},{-1, 1},{1, -1}};//八个方向（主要还是正方向，斜着走容易报错）
struct position{int x,y;};//当前位置
char maze[m+1][m+1];    //迷宫本身
position stack[m*m+1];    //退格
int top;//栈顶
int main()
{
    int i,x,y,ok,sx,sy;//ok表示下一步能走,sxsy是起始位置
    position p;
    for(x=1;x<=m;x++)          //输入迷宫
    {
        for(y=1;y<=m;y++)
        {
            cin>>maze[x][y];
        }
    }
    cin>>sx>>sy;
    do{
        p=stack[top];
        if(first)
        {
            maze[sx][sy]='#';
            p.x=sx;p.y=sy;
            first=false;
        }
        ok=0;i=0;
        while((ok==0)&&(i<8))
        {
            x=p.x+direction[i][0];
            y=p.y+direction[i][1];
            if(y==m && maze[x][y]=='0')//如果有出口就跳出；break总是出错QAQ
            {
                maze[x][y]='#';
                goto result;
            }
            if(maze[x][y]=='0')//试探成功就走
            {
                p.x=x;p.y=y;
                stack[++top]=p;
                maze[x][y]='#';
                ok=1;
                for(x=1;x<=m;x++)     //输出当前走法
                {
                    for(y=1;y<=m;y++)
                    {
                        printf("%c ",maze[x][y]);
                        if(y==m) cout<<endl;
                    }
                }
                cout<<endl;
            }
            i++;
        }
        if(i==8)
        {
            maze[p.x][p.y]='.';     //表示八个方向都无路可走，”.“相当于”0“，除开'.'应当就是最佳路径
            top--;
        }
    }while((top>0)&&((p.x!=m)||(p.y!=m)));//倒回起点以及到达最大可到对角线处即出————无路径
result:
    for(x=1;x<=m;x++)
    {
        for(y=1;y<=m;y++)
        {
            printf("%c ",maze[x][y]);
            if(y==m) cout<<endl;
        }
    }
    if(top==0) cout<<"无路径"<<endl;
    else cout<<"有路径"<<endl;
    return 0;
}
