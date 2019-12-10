//习题五（1）
//选择五种排序算法分别实现，随机生成1万个数据保存在文件中，使用你所实现的五个排序算法，分别对这个文件进行排序，统计排序过程中各算法的比较次数及数据交换次数。列表输出。
#include <iostream>
#include <iomanip>
#include <ctime>    //加入了排序所需时间的显示，以此保证排序算法的正确性🥰也比较好玩
#include <cmath>
#include <fstream>
#define MAX 65535          //‼️‼️‼️可在此更改最大最小值，为方便检查以及美观，全部设定为小于65535的正数
#define MIN 0
int rnum[10001]={0};
int onum[10001]={0};
int comm=0,swapm=0;
int comq=0,swapq=0;
clock_t start1,end1;
clock_t start2,end2;
clock_t start3,end3;
clock_t start4,end4;
clock_t start5,end5;
using namespace std;
void RandNum(ostream &out)         //生成随机数，并输出到文件
{
    srand(time(0));
    for(int i = 0; i < 10000; ++i)
    {
        int data = rand()% (MAX - MIN + 1) + MIN;
        rnum[i]=data;
        out << data <<" ";
    }
}
void BubbleSort(int a[],int b[],int n,ostream &out)                 //冒泡排序
{
    int temp,com=0,swap=0;
    for(int i=0;i<n;i++)
    {
        b[i]=a[i];
    }
    for(int i=1;i<n;i++)
    {
        for(int j=n-1;j>=i;j--)
        {
            if(b[j]<b[j-1])
            {
                temp=b[j-1];
                b[j-1]=b[j];
                b[j]=temp;
                swap++;
            }
            com++;
        }
    }
    for(int i=0;i<n;i++)
    {
        out<< b[i]<<" ";
    }
    cout<<"冒泡排序的比较次数和交换次数为："<<endl<<com<<"   "<<swap<<endl;
}
void SelectSort(int a[],int b[],int n,ostream &out)                 //选择排序
{
    int temp,min,com=0,swap=0;
    for(int i=0;i<n;i++)
    {
        b[i]=a[i];
    }
    for(int i=0;i<n;i++)
    {
        min=i;
        for(int j=i+1;j<n;j++)
        {
            if(b[j]<b[min])
            {
                min=j;
            }
            com++;
        }
        if(min!=i)       //交换
        {
            temp=b[i];
            b[i]=b[min];
            b[min]=temp;
            swap++;
        }
    }
    for(int i=0;i<n;i++)
    {
        out<< b[i]<<" ";
    }
    cout<<"选择排序的比较次数和交换次数为："<<endl<<com<<"   "<<swap<<endl;
}
void InsertSort(int a[],int b[],int n,ostream &out)                 //插入排序
{
    int i,j,temp,com=0,swap=0;
    for(i=0;i<n;i++)
    {
        b[i]=a[i];
    }
    for(i=1;i<n;i++)
    {
        temp = b[i];
        for(j=i ; j>0 && temp < b[j-1] ; j--)//与temp比较
        {
            b[j]=b[j-1];
            com++;
        }
        b[j]=temp;
        swap++;
    }
    for(int i=0;i<n;i++)
    {
        out<< b[i]<<" ";
    }
    cout<<"插入排序的比较次数和交换次数为："<<endl<<com<<"   "<<swap<<endl;
}
int Merge(int a[],int l,int m,int h)
{
    int b[MAX];
    int x=l,y=m+1,z=l;
    while(x<=m&&y<=h)
    {
        comm++;
        if(a[x]<=a[y])
        {
            b[z]=a[x];
            x++;
        }
        else
        {
            b[z]=a[y];
            y++;
            swapm++;
        }
        z++;
    }
    if(x==m+1)
    {
        for(int m=z;m<=h;m++)
        {
            b[m]=a[y];
            y++;
        }
    }
    else
    {
        for(int n=z;n<=h;n++)
        {
            b[n]=a[x];
            x++;
            swapm++;
        }
    }
    for(int count=l;count<=h;count++)
        a[count]=b[count];
    return comm;
}
void MergeSort(int a[],int l,int h)
{
    int add;
    if(l<h)
    {   comm++;
        int mid=(l+h)/2;
        MergeSort(a,l,mid);
        MergeSort(a,mid+1,h);
        add=Merge(a,l,mid,h);
    }
}
int Partition(int a[], int l, int h)//快排划分
{
    int temp = 0;
    int pivot = a[h];
    int tag = l-1;
    for (int j=l; j<h; j++)
    {
        if (a[j] <= pivot)
        {
            tag++;
            temp = a[j];
            a[j] = a[tag];
            a[tag] = temp;
            swapq++;
        }
        comq++;
    }
    a[h] = a[tag+1];
    a[tag+1] = pivot;
    return tag+1;
}
void QuickSort(int a[], int l, int h)    //快速排序
{
    if (l<h)
    {
        int pivot = Partition(a, l, h);
        QuickSort(a, l, pivot-1);
        QuickSort(a, pivot+1, h);
    }
}
void Print(ostream &out)
{
    for(int i=0;i<10000;i++)
    {
        out<<onum[i]<<" ";
    }
}
int main()
{
    int t;
    ofstream outfile1,outBubble,outSelect,outInsert,outMerge,outQuick;
    outfile1.open("random.txt",ios::out);
    RandNum(outfile1);
    outfile1.close();
    outBubble.open("BubbleSort.txt",ios::out);          //冒泡1✅✅
    start1=clock();
    BubbleSort(rnum,onum,10000,outBubble);
    end1=clock();
    t=(double)(end1-start1)/CLK_TCK*1000;
    cout<<"时间为 "<<t<<"ms"<<endl;
    outBubble.close();
    outSelect.open("SelectSort.txt",ios::out);              //选择2✅✅
    start2=clock();
    SelectSort(rnum, onum, 10000, outSelect);
    end2=clock();
    t=(double)(end2-start2)/CLK_TCK*1000;
    cout<<"时间为 "<<t<<"ms"<<endl;
    outSelect.close();
    outInsert.open("InsertSort.txt",ios::out);           //插入3✅✅
    start3=clock();
    InsertSort(rnum, onum, 10000, outInsert);
    end3=clock();
    t=(double)(end3-start3)/CLK_TCK*1000;
    cout<<"时间为 "<<t<<"ms"<<endl;
    outInsert.close();
    outMerge.open("MergeSort.txt",ios::out);             //归并4✅✅
    for(int i=0;i<10000;i++)
    {
        onum[i]=rnum[i];
    }
    start4=clock();
    MergeSort(onum, 0, 9999);
    end4=clock();
    Print(outMerge);
    cout<<"归并排序的比较次数和交换次数为："<<endl<<comm<<"     "<<swapm<<endl;
    t=(double)(end4-start4)/CLK_TCK*1000;
    cout<<"时间为 "<<t<<"ms"<<endl;
    outMerge.close();
    outQuick.open("QuickSort.txt",ios::out);             //快排5✅
    for(int i=0;i<10000;i++)
    {
        onum[i]=rnum[i];
    }
    start5=clock();
    QuickSort(onum, 0, 9999);
    end5=clock();
    Print(outQuick);
    cout<<"快速排序的比较次数和交换次数为："<<endl<<comq<<"     "<<swapq<<endl;
    t=(double)(end5-start5)/CLK_TCK*1000;
    cout<<"时间为 "<<t<<"ms"<<endl;
    return 0;
