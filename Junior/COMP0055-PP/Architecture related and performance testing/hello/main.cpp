#include <iostream>
#include <windows.h>
#include <stdlib.h>
#include<ctime>
using namespace std ;
const int N = 10240;
const int NN=128;
double b[N][N] ,col_sum[N]={0.0},col_sum1[N]={0.0},a[N];
// matrix size
void init(int n) // generate a N*N matrix && N vector
{
    for(int i=0;i<N;i++)
    {
        for(int j=0;j<N;j++)
        {
             b[i][j]=i+j;
        }
        a[i]=i;
    }
}
int main()    //1 cache
{
    double head,tail,freq,head1,tail1,timess=0; // timers
    init(N);
    QueryPerformanceFrequency((LARGE_INTEGER *)&freq );
    QueryPerformanceCounter((LARGE_INTEGER *)&head);
    for (int i=0; i<NN; i++)
    {
        for (int j=0; j<NN; j++)
            col_sum[i] += (b[j][i]*a[j]);
    }
    QueryPerformanceCounter ((LARGE_INTEGER *)& tail) ;
    cout << "\nordCol:" <<(tail-head)*1000.0 / freq<< "ms" << endl;
    init(N);
    QueryPerformanceFrequency((LARGE_INTEGER *)&freq );
    QueryPerformanceCounter((LARGE_INTEGER *)&head);
    for (int i=0; i<NN; i++)
        for(int j=0; j<NN; j++)
            col_sum1[j] += (b[i][j]*a[i]);
    QueryPerformanceCounter ((LARGE_INTEGER *)& tail) ;
    cout << "\noptCol:" <<(tail-head)*1000.0 / freq<< "ms" << endl;
}
