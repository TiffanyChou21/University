//习题五（2）
//电路板的排序问题？？
//考虑K的奇偶性及一行中0的个数的奇偶性。最终变为排序问题（其实不排序也能做，不过那样计算机要算死胖死）所以算法
//1️⃣统计一行中0的个数
//2️⃣根据K的奇偶，将0⬆️那个序列分为奇偶并排序然后只选与K一致奇偶的部分
//3️⃣再用这个既得数据进行模拟电路照射翻转，最后得到每种可能再比较即可最大
#include<iostream>
static int N,M,K;
int even[100];//偶数0
int even1[100];
int odd[100];//奇数0
int odd1[100];
int sum[100];//最终每种照射列数翻转得到的导通路径的数目
int ling[100];//用来记录奇数或者偶数中0个数
int m=0,n=0,k=0;
using namespace std;
void Print(int **a)     //输出当前电路板状态
{
    for(int i=0;i<N;i++){
        for(int j=0;j<M;j++){
            cout<<a[i][j];
        }
        cout<<endl;
    }
    cout<<endl;
}
void Zero(int **a,int *l)      //记录当前行中0的个数
{
    for(int i=0;i<N;i++){
        int k=0;
        for(int j=0;j<M;j++)
            if(a[i][j]==0)
                k++;
        l[i]=k;
    }
}
void Merge(int *a,int *b, int start, int l1, int l2)   //合并
{
    int i,j;
    for(i=l1+1,j=start; start<=l1 && i <=l2 ; ++j)      //一部分
    {
        if(a[i] < a[start])
            b[j] = a[i++];
        else
            b[j] = a[start++];
    }
    while(start <= l1)
        b[j++] = a[start++];
    while(i <= l2)
        b[j++] = a[i++];
}

void MergeSort(int *a, int *b, int length)       //归并排序
{
    int mid = 1;
    int *p = a,*temp ;
    while(mid < length)
    {
        int d = mid;
        mid = 2 * d ;
        int i = 0;
        while(i+ mid <length)
        {
            Merge(p, b,  i, i+ d-1, i+ mid-1 );//等长
            i = i+ mid;
        }
        if(i + d < length){
            Merge(p, b,  i, i+ d -1, length -1);
        }
        temp = p; p = b; b = temp;//保证下一次排序的正确
    }
}
void Split(int *l)                     //奇偶划分并排序含有0的个数
{
    for(int i=0;i<N;i++)
    {
        if(l[i]%2==0)
        {
            even[m]=l[i];
            m++;
        }
        else
        {
            odd[n]=l[i];
            n++;
        }
    }
    MergeSort(even,even1,m-1);
    MergeSort(odd,odd1,n-1);
}
void Judge(int *l)              //找出排序以后可以可能被照射翻转为通路的条数（即l中<=K的值）
{
    Split(l);
    if(K%2==0)                 //K是偶数时
    {
        for(int i=0;i<m;i++)
        {
            if(K>=even1[i])
            {
                ling[k]=even1[i];
            }
            k++;
        }
        k--;
    }
    else{                           //奇数
        for(int i=0;i<n;i++)
        {
            if(K>=odd1[i])
            {
                ling[k]=odd1[i];
            }
            k++;
        }
        k--;
    }
}
void Shine(int**a,int**b,int *l)                //模拟照射翻转
{
    Judge(l);
    int route=0,add=0;   //单种情况的路径数，总共符合要求的情况数
    int max=0;
    if(K<ling[0]){cout<<"照射"<<K<<"次后导通行数为0";}
    else{
        for(int i=k;i>=0;i--)
        {
            for(int j=N-1;j>=0;j--)
            {
                if(l[j]==ling[i])    //当0总数与奇偶0相同时
                {
                    l[j]++;
                    for(int x=0;x<N;x++)//防止a变化影响后序
                    {
                        for(int y=0;y<M;y++)
                        {
                            b[x][y]=a[x][y];
                        }
                    }
                    for(int x=0;x<M;x++)     //按列取反翻转模拟
                    {
                        if(b[j][x]==0)
                            //注意此处不止有比0个数大的可以正确，只要是奇数或者是偶数都可以无穷次翻转同一列
                        {
                            for(int g=0;g<N;g++)
                            {
                                if(b[g][x]==0){
                                    b[g][x]=1;
                                }
                                else
                                    b[g][x]=0;
                            }
                        }
                    }
                    Print(b);      //输出当前翻转后的电路板验证
                    bool t=true;
                    for(int x=0;x<N;x++)//只验证符合奇偶排序结果的几个得出最终结论
                    {
                        for(int y=0;y<M;y++)
                        {
                            if(b[x][y]==0)      //不导通
                                t=0;
                        }
                        if(t)      //导通
                        {
                            route++;
                        }
                        t=true;
                    }
                    sum[add]=route;
                    add++;
                    route=0;
                }
            }
        }
        for(int x=0;x<add;x++)  //计算最大导通
        {
            if(sum[x]>=max)
                max=sum[x];
        }
        cout<<"照射"<<K<<"次后最大导通行数为"<<max<<endl;
    }
}
int main(){
    int **a,**b,*l;
    cout<<"请输入电路板的行数N"<<endl;
    cin>>N;
    cout<<"请输入电路板的列数M"<<endl;
    cin>>M;
    cout<<"请输入激光照射次数K"<<endl;
    cin>>K;
    a=new int*[N];
    b=new int*[N];
    l=new int[N];
    for(int i=0;i<N;i++){
        a[i]=new int[M];
        b[i]=new int[M];
    }
    cout<<"请输入电路板布局："<<endl;
    for(int i=0;i<N;i++){
        for(int j=0;j<M;j++){
            cin>>a[i][j];
        }
    }
    Zero(a,l);
    Shine(a,b,l);
}
