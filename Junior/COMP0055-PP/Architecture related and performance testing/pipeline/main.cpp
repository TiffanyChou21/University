#include <iostream>
#include<windows.h>
#include<stdlib.h>
#include<ctime>
#define DO_THING(x) x;
#define DO_THING_2(x) DO_THING(x); DO_THING(x)
#define DO_THING_4(x) DO_THING_2(x); DO_THING_2(x)
#define DO_THING_8(x) DO_THING_4(x); DO_THING_4(x)
#define DO_THING_16(x) DO_THING_8(x); DO_THING_8(x)
#define N 4096
using namespace std;

int serial_cal(int a[])
{
    int sum=0;
    for(int i=0;i<N;i++)
        sum+=a[i];
    return sum;
}
int opt2_cal(int a[], int n)
    {
        while(n > 2)
        {
            n /= 2;
            int j = 0;
            for(int i = 0; j<n;i += 2)
                a[j++] = a[i] + a[i+1];
        }
        return a[0] + a[1] ;
    }
    int opt4_cal(int a[], int n)
    {
        while(n >= 8)
        {
            n /= 2;
            int j = 0;
            for(int i = 0; j<n;i += 8)
            {
                a[j++] = a[i] + a[i+1];
                a[j++] = a[i+2] + a[i+3];
                a[j++] = a[i+4] + a[i+5];
                a[j++] = a[i+6] + a[i+7];
            }
        }
        return a[0] + a[1] + a[2] + a[3];
    }




        int two_link_cal(int a[], int n)
        {
            int sum1=0,sum2=0;
            for(int i=0;i<n;i+=2){
                sum1+=a[i];sum2+=a[i+1];
            }
            return sum1+sum2;
        }
        int four_link_cal(int a[], int n)
        {
            int sum1=0,sum2=0,sum3=0,sum4=0;
            for(int i=0;i<n;i+=4){
                sum1+=a[i];sum2+=a[i+1];sum3+=a[i+2];sum4+=a[i+3];
            }
            return sum1+sum2+sum3+sum4;
        }

int recursive_cal(int num[], int starts, int ends)   //ord recursive
{
   if(starts == ends)  return num[ends];
   else{
       int mid = (starts+ends)/2;
       return recursive_cal(num, starts, mid)+recursive_cal(num, mid + 1, ends);
   }
}

int recursive_cal_unroll(int num[], int starts, int ends)   //opt recursive
{
   if(ends<starts) return 0;
   if(starts==ends) return num[starts];
   if(starts == ends-1)
       return num[starts]+num[ends];
   else
   {
       int mid = (ends+starts)/2;
       int qu=(starts+mid)/2;
       int qua=(mid+ends)/2;
       return recursive_cal_unroll(num,starts,qu)+recursive_cal_unroll(num,qu+1,mid)+recursive_cal_unroll(num,mid+1,qua)+recursive_cal_unroll(num,qua+1,ends);
   }
}
int sumt=0;      //template
template<int n>
class Loop{
public:
   static inline int Run(){
       int v=Loop <n-1>::Run();
       sumt+=v;
       return v+1;
   }
};
template<>
class Loop<0>{
public:
   static inline int Run(){return 0;}
};

int main()
{
    int num[N];
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
    double head, tail, freq;        // timers

    memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
    QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
    int sum1=serial_cal(num);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Serial calculation results: " << sum1 <<endl;
	cout << "Serial calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sum2 = recursive_cal(num, 0, N);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Recursive calculation results: " << sum2 <<endl;
	cout << "Recursive calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sum3 = recursive_cal_unroll(num, 0, N);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Recursive calculation Unrolled results: " << sum3 <<endl;
	cout << "Recursive calculation Unrolled costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sum4 = two_link_cal(num,N);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Two Link calculation results: " << sum4 <<endl;
	cout << "Two Link calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sum5 = four_link_cal(num,N);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Four Link calculation results: " << sum5 <<endl;
	cout << "Four Link calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sum6 = opt2_cal(num,N);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Link opt2 calculation results: " << sum6 <<endl;
	cout << "Link opt2 calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sum7 = opt4_cal(num,N);
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Link opt4 calculation results: " << sum7 <<endl;
	cout << "Link opt4 calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

    QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	Loop<N>::Run();
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Unrolled template calculation results: " << sumt <<endl;
	cout << "Unrolled template calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;

	memset(num,0,N);
    for(int i = 0;i<N;i++)
    {
        num[i] = i;
    }
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);	// similar to CLOCKS_PER_SEC
 	QueryPerformanceCounter((LARGE_INTEGER *)&head);	// start time
 	int sumd=0,i=0;
 	DO_THING_16(DO_THING_16(DO_THING_16(sumd+=num[i];i++)))
	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	cout << "Macro calculation results: " << sumd <<endl;
	cout << "Macro calculation costs: " << (tail - head) * 1000.0 / freq << "ms" << endl;
    return 0;
}
