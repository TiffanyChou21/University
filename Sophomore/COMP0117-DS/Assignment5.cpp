//习题四   金属融化的时间
//①区分液体中空（中空周围全是#）标记中空为*
//②广度遍历
//    2️⃣1️⃣有两个格子是液体就被融化为1
//    2️⃣2️⃣T=n的时候，两个格子液体或者是n-1时即可被标记为n
//③最后没有#即融化完，即T=n轮
#include<iostream>

using namespace std;
static int N, T;              //N*N的图，T时间下融化完
char **grid;                    //二维数组格子广度标记完成

void mark()         //①区分中空液体并标记为*
{
    for (int i = 0; i < N; i++)        //问题是如果有一个#即使没有成环它也会变成中空
        for (int j = 0; j < N; j++)      //应该是广度搜索而不是深度搜索
        {
            if (grid[i][j] == '_'&& i>0 && j>0 && i<N-1 && j<N-1)
            {
                int flag = 0;
                int a = i, b = i, c = j, d = j;   //上下左右
                while (a > -1)
                {
                    if (grid[a--][j] == '#')
                    {
                        flag++;
                        break;
                    }
                }
                while (b <N)
                {
                    if (grid[b++][j] == '#')
                    {
                        flag++;
                        break;
                    }
                }
                while (c>-1)
                {
                    if (grid[i][c--] == '#')
                    {
                        flag++;
                        break;
                    }
                }
                while (d<N)
                {
                    if (grid[i][d++] == '#')
                    {
                        flag++;
                        break;
                    }
                }
                if (flag == 4)
                    grid[i][j] = '*';
            }
        }
}
void flow()                       //液体流入中空判断及操作
{
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
        {
            if (grid[i][j] == '*'&&i>0 && j>0 && i<N - 1 && j<N - 1)
            {
                int a = i, b = i, c = j, d = j;  //上下左右
                if(grid[--a][j] == '_'||grid[++b][j] == '_'||grid[i][--c] == '_'||grid[i][++d] == '_') grid[i][j]='!';
            }//先行标记再逐一判断
        }
    while (1)
    {
        int k = 0;
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++)
            {
                if (grid[i][j] == '!')
                {
                    if (i>0 && grid[i - 1][j] == '*')
                    {
                        k++;
                        grid[i - 1][j] = '!';
                    }
                    if (i < N - 1 && grid[i + 1][j] == '*')
                    {
                        k++;
                        grid[i + 1][j] = '!';
                    }
                    if (j>0 && grid[i][j - 1] == '*')
                    {
                        k++;
                        grid[i][j - 1] = '!';
                    }
                    if (j < N - 1 && grid[i][j + 1] == '*')
                    {
                        k++;
                        grid[i][j + 1] = '!';
                    }
                }
            }
        if (k == 0)
            break;
    }
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            if (grid[i][j] == '!')
                grid[i][j] = '_';
}
void melt()               //②融化
{
    T = 0;
    while (1)
    {
        int y = 0;
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++)
                if (grid[i][j] == '#')
                    y++;
        if (y == 0)                             //③没有#时结束
            break;
        for (int m = 0; m < N; m++)
            for (int n = 0; n < N; n++)
            {
                if (grid[m][n] == '#')
                {
                    int flag = 0;
                    if (m>0 && grid[m - 1][n] == '_')
                        flag++;
                    if (m<N - 1 &&grid[m + 1][n] == '_')
                        flag++;
                    if (n>0 &&grid[m][n-1] == '_')
                        flag++;
                    if (n<N - 1 &&grid[m][n + 1] == '_')
                        flag++;
                    if (flag>1)
                        grid[m][n] = '0';        //防止下一次判断的时候直接给flow了
                }
            }
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++)
            {
                if (grid[i][j] == '0')
                    grid[i][j] = '_';
            }
        T++;
        cout << "下一单位时间" << endl;
        flow();

        for (int i = 0; i < N; i++)
        {
            for (int j = 0; j < N; j++)
                cout << grid[i][j];
            cout << endl;
        }
        cout << endl;
    }
    cout <<"所需时间T = "<<T<<endl;
}
int main()
{
    cout << "请输入N：" << endl;
    cin >> N;
    grid = new char*[N];
    for (int i = 0; i < N; i++)
        grid[i] = new char[N];
    cout << "请输入T=0时的排布：" << endl;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            cin >> grid[i][j];
    mark();
    flow();                //立刻flow一次是为了防止有的假中空被错误标记，以这种方式来让它变成原样
    cout<<"如图金属"<<endl;
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            cout << grid[i][j];
        cout << endl;
    }
    cout << endl;
    melt();
    return 0;
}
