//选做二布线图
#include <iostream>
#define SIZE 6
#define DIRECTION 4 //试探方向，只能上下左右
#define MAX 100
using namespace std;
typedef struct point
{
    int x;
    int y;
}Quene;
Quene queue[MAX];//以队列方式储存输出
int head=0,tail=0;
int board[SIZE+1][SIZE+1] = {0}; //电路板
int X[DIRECTION],Y[DIRECTION];//代表四个方向
int length;//路径长度，输出路径
Quene start,finish;
Quene path[SIZE * SIZE];//路径对应各个坐标点
bool isEmpty()   //队列是否为空
{
    if( head == tail )
        return true;
    return false;
}
bool isFull()    //队列是否满
{
    if( ( tail%MAX + 1 ) == head )
        return true;
    return false;
}
bool enquene( int x, int y )   //入队
{
    if(isFull())
        return false;
    queue[tail].x = x;
    queue[tail].y = y;
    tail = (tail + 1) % MAX;
    return true;
}
int dequene()      //出队
{
    int returnHead;
    if( isEmpty() )
        return  -1;
    returnHead = head;
    head = ( head + 1 ) % MAX;
    return returnHead;
}
void InitXY(int ax,int ay,int bx,int by)
{
    if(ay==by)
    {
        X[0] = 1; Y[0] = 0;
        X[1] =-1; Y[1] = 0;
        X[2] = 0; Y[2] = 1;
        X[3] = 0; Y[3] =-1;
    }
    else if(ax==bx)
    {
        X[0] = 0; Y[0] = 1;
        X[1] =0; Y[1] = -1;
        X[2] = 1; Y[2] =0;
        X[3] = -1; Y[3] =0;
    }
    else if(by>=ay&&bx>=ax)
    {
        X[0] = 0; Y[0] = 1;
        X[1] =-1; Y[1] = 0;
        X[2] = 1; Y[2] = 0;
        X[3] = 0; Y[3] =-1;}
    else if(ay>=by&&ax>=bx){
        X[0] = 0; Y[0] = -1;
        X[1] =-1; Y[1] = 0;
        X[2] = 1; Y[2] = 0;
        X[3] = 0; Y[3] =1;
    }
    else if(by>=ay&&bx<=ax)
    {
            X[0] = 0; Y[0] = -1;
            X[1] =1; Y[1] = 0;
            X[2] =-1; Y[2] = 0;
            X[3] = 0; Y[3] =1;
    }
    else if(by<=ay&&bx>=ax)
    {
        X[0] = 0; Y[0] =-1;
        X[1] =1; Y[1] = 0;
        X[2] =-1; Y[2] = 0;
        X[3] = 0; Y[3] =1;
    }
}
void InitBoard(int ax,int ay,int bx,int by)
{   //设置蓝色不可布线点位
    board[2][3]=-1;board[3][3]=-1;board[4][3]=-1;board[5][1]=-1;board[5][2]=-1;board[5][3]=-1;
    start.x = ax;
    start.y = ay;
    finish.x = bx;
    finish.y = by;
}
bool isEnd( int x, int y )     //是否到达b点
{
    if(finish.x == x && finish.y == y)
        return true;
    return false;
}
bool isStart(int x, int y)      //是否为a点
{
    if(x == start.x && y == start.y)
        return true;
    return false;
}
bool isPath(int x, int y )     //是否在路径上
{
    int i;
    bool flag = false;
    for( i = 1; i < length; i++)
        if(x == path[i].x && y == path[i].y)
        {flag = true;break;}
    return flag;
}
void Print1()    //输出初始电路板
{
    int x, y;

    cout<<" +";
    for (x = 1; x < SIZE + 1; x ++)
        cout<<"---+";
    cout<<endl;
    for (x = 1; x < SIZE + 1; x ++)
    {
        cout<<" |";
        for ( y = 1; y < SIZE + 1; y ++ )
        {
            if( isStart(x, y) )
                printf("%2c %c",'a','|');
            else if( isEnd(x, y) )
                printf("%2c %c",'b','|');
            else if(board[x][y] == 0)
                printf("   %c",'|');
            else
                printf("%2c %c",'X','|');
        }
        cout<<endl;
        cout<<" +";
        for (y = 1; y < SIZE + 1; y ++ )
            cout<<"---+";
        cout<<endl;
    }
}
void Print2()     //输出布线图
{
    int x, y;
    cout<<" +";
    for (x = 1; x < SIZE + 1; x ++)
        cout<<"---+";
    cout<<endl;
    for (x = 1; x < SIZE + 1; x ++)
    {
        cout<<" |";
        for ( y = 1; y < SIZE + 1; y ++ )
        {
            if( isStart(x, y) )
                printf("%2c %c",'a','|');
            else if( isEnd(x, y) )
                printf("%2c %c",'b','|');
            else if( board[x][y] == -1)
                printf("%2c %c",'X','|');
            else if( isPath( x, y ) )
            {printf("%2d %c",board[x][y],'|');}
            else
                printf("   %c",'|');
        }
        cout<<endl;
        cout<<" +";
        for (y = 1; y < SIZE + 1; y ++ )
            cout<<"---+";
        cout<<endl;
    }
}
bool FindPath()        //找出可行的路径 -1是不能走的蓝墙，0是可走的点，1是走过了的路径
{
    int i,j,qH;
    Quene current,next;
    current.x = start.x;
    current.y = start.y;
    do
    {   //需要一个大的围墙，以防起点终点在角落的时候下一步跑出去！！(solved)
        for( i=0; i < DIRECTION; i++ )
        {
            next.x = current.x + X[i];
            next.y = current.y + Y[i];
            if(next.x==0||next.y==0||next.x==7||next.y==7) continue;
            if( board[next.x][next.y] == 0 && !isStart(next.x,next.y))
            {
                board[next.x][next.y] = board[current.x][current.y] + 1;//给第i步赋值以便输出
                current.x=next.x;current.y=next.y;
                if(isEnd(next.x, next.y))  break;//找到终点
                if( !enquene(next.x, next.y) ) return false;//过长报错
            }
        }
        if(isEnd(next.x, next.y)) break;//到终点再跳一次跳出
        if( isEmpty() ) return false;//队列为空，找不到路径
        qH = dequene();
        if(qH != -1) current = queue[qH];//队列非空
    }while(!isEmpty() && !isEnd(current.x, current.y));
    if(isEmpty()) return true;
    //倒退回去找路径
    length = board[finish.x][finish.y];
    current = finish;
    for( i = length - 1; i > 0; i --)
    {
        for( j = 0; j < DIRECTION; j++ )
        {
            next.x = current.x + X[j];
            next.y = current.y + Y[j];
            if(board[next.x][next.y] == i) break;
        }
        path[i] = next;
        current = path[i];
    }
    return true;
}

int  main()
{
    int ax,ay,bx,by;
    cin>>ax>>ay>>bx>>by;
    InitXY(ax,ay,bx,by);
    InitBoard(ax,ay,bx,by);
    cout<<"初始电路板"<<endl;
    Print1();
    if(!FindPath())
        cout<<"找不到路径"<<endl;
    else
    {
        cout<<"布线路径"<<endl;
        Print2();
    }

}
