#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <windows.h>
#include <pmmintrin.h>
#include <algorithm>
#include <pthread.h>
using namespace std;

const int N = 1000;       //problem size
const int thread_num = 4; //thread nums
bool debug=false;

float mat[N][N];
float test[N][N];
float cor[N][N];

typedef struct
{
	int	threadId;
} threadParm_t;

long long head, tail, freq;        // timers
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;  //信号量
pthread_mutex_t mutex_task = PTHREAD_MUTEX_INITIALIZER;
pthread_t threads[thread_num];   //threads
threadParm_t threadParm[thread_num];  //id
pthread_barrier_t barrier1;
pthread_barrier_t barrier2;


void init_mat(float test[][N])  //初始化
{
	srand((unsigned)time(NULL));
	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			test[i][j] = rand() / 100;
}

void reset_mat(float mat[][N], float test[][N])  //重置一致
{
	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			mat[i][j] = test[i][j];
}

void naive_lu(float mat[][N])      //朴素
{
	for (int k = 0; k < N; k++)
	{
		for (int j = k + 1; j < N; j++)
			mat[k][j] = mat[k][j] / mat[k][k];
		mat[k][k] = 1.0;
		for (int i = k + 1; i < N; i++)
		{
			for (int j = k + 1; j < N; j++)
				mat[i][j] = mat[i][j] - mat[i][k] * mat[k][j];
			mat[i][k] = 0;
		}
	}
}


void *row_pthread_lu(void *parm)   //pthread
{
	threadParm_t *p = (threadParm_t *)parm;
	int id = p->threadId;
    int start = id ;
	int end = id + 1;
	for (int k = 0; k < N; k++)
	{
	    if ((k + 1) % thread_num >= start && (k + 1) % thread_num < end)
        {
            for (int j = k + 1; j < N; j++)
                mat[k][j] = mat[k][j] / mat[k][k];
            mat[k][k] = 1.0;
        }
        pthread_barrier_wait(&barrier1);//前k行除法完成就可以消去
        for (int i = k + 1; i < N; i++)
        {
            if (i % thread_num>= start && i % thread_num < end)
            {
                for (int j = k + 1; j < N; j++)
                    mat[i][j] = mat[i][j] - mat[i][k] * mat[k][j];
                mat[i][k] = 0;
            }
        }
		pthread_barrier_wait(&barrier2);
	}
//	pthread_mutex_lock(&mutex);
//	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
//	cout << "Row pthread ID " << id << " cost : " << (tail - head) * 1000.0 / freq << "ms" << endl;
//	pthread_mutex_unlock(&mutex);
	pthread_exit(NULL);
}

void *row_pthread_sse_lu(void *parm)    //pthread+SSE
{
	threadParm_t *p = (threadParm_t *)parm;
	int id = p->threadId;
	int start = id ;
	int end = id + 1 ;
	__m128 t1, t2, t3;
	for (int k = 0; k < N; k++)
	{
		if ((k + 1) %thread_num>= start && (k + 1) % thread_num< end)
		{
			float temp1[4] = { mat[k][k], mat[k][k], mat[k][k], mat[k][k] };
			t1 = _mm_loadu_ps(temp1);
			int j = k + 1;
			for (j; j < N - 3; j += 4)
			{
				t2 = _mm_loadu_ps(mat[k] + j);
				t3 = _mm_div_ps(t2, t1);
				_mm_storeu_ps(mat[k] + j, t3);
			}
			for (j; j < N; j++)
				mat[k][j] = mat[k][j] / mat[k][k];
			mat[k][k] = 1.0;
		}
		pthread_barrier_wait(&barrier1);//前k行除法完成就可以消去
		for (int i = k + 1; i < N; i++)
		{
			if (i % thread_num>= start && i % thread_num < end)
			{
				float temp2[4] = { mat[i][k], mat[i][k], mat[i][k], mat[i][k] };
				t1 = _mm_loadu_ps(temp2);
				int j = k + 1;
				for (j; j < N - 3; j += 4)
				{
					t2 = _mm_loadu_ps(mat[i] + j);
					t3 = _mm_loadu_ps(mat[k] + j);
					t3 = _mm_mul_ps(t1, t3);
					t2 = _mm_sub_ps(t2, t3);
					_mm_storeu_ps(mat[i] + j, t2);
				}
				for (j; j < N; j++)
					mat[i][j] = mat[i][j] - mat[i][k] * mat[k][j];
				mat[i][k] = 0;
			}
		}
		pthread_barrier_wait(&barrier2);
	}
    //	pthread_mutex_lock(&mutex);
	//	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	//	cout << "pthread sse thread ID " << id << " cost: " << (tail - head) * 1000.0 / freq << "ms" << endl;
	//	pthread_mutex_unlock(&mutex);
	pthread_exit(NULL);
}

void *row_pthread_avx_lu(void *parm)     //pthread+AVX
{
	threadParm_t *p = (threadParm_t *)parm;
	int id = p->threadId;
	int start = id ;
	int end = id + 1 ;
	__m256 t1, t2, t3;
	for (int k = 0; k < N; k++)
	{
		if ((k + 1) % thread_num >= start && (k + 1) % thread_num < end)
		{
			float temp1[8] = { mat[k][k], mat[k][k], mat[k][k], mat[k][k], mat[k][k], mat[k][k], mat[k][k], mat[k][k] };
			t1 = _mm256_loadu_ps(temp1);
			int j = k + 1;
			for (j; j < N - 7; j += 8)
			{
				t2 = _mm256_loadu_ps(mat[k] + j);
				t3 = _mm256_div_ps(t2, t1);
				_mm256_storeu_ps(mat[k] + j, t3);
			}
			for (j; j < N; j++)
				mat[k][j] = mat[k][j] / mat[k][k];
			mat[k][k] = 1.0;
		}
		pthread_barrier_wait(&barrier1);//前k行除法完成就可以消去
		for (int i = k + 1; i < N; i++)
		{
			if (i % thread_num >= start && i % thread_num < end)
			{
				float temp2[8] = { mat[i][k], mat[i][k], mat[i][k], mat[i][k], mat[i][k], mat[i][k], mat[i][k], mat[i][k] };
				t1 = _mm256_loadu_ps(temp2);
				int j = k + 1;
				for (j; j < N - 7; j += 8)
				{
					t2 = _mm256_loadu_ps(mat[i] + j);
					t3 = _mm256_loadu_ps(mat[k] + j);
					t3 = _mm256_mul_ps(t1, t3);
					t2 = _mm256_sub_ps(t2, t3);
					_mm256_storeu_ps(mat[i] + j, t2);
				}
				for (j; j < N; j++)
					mat[i][j] = mat[i][j] - mat[i][k] * mat[k][j];
				mat[i][k] = 0;
			}
		}
		pthread_barrier_wait(&barrier2);
	}
	//	pthread_mutex_lock(&mutex);
	//	QueryPerformanceCounter((LARGE_INTEGER *)&tail);	// end time
	//	cout << "pthread avx thread ID " << id << " cost: " << (tail - head) * 1000.0 / freq << "ms" << endl;
	//	pthread_mutex_unlock(&mutex);
	pthread_exit(NULL);
}

void print_mat(float mat[][N])
{
    if (!debug)
        return;
	cout << endl;
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
			cout << mat[i][j] << " ";
		cout << endl;
	}
	cout << endl;
}

int main()
{
    int epoch = 1;
    long double timer;




    pthread_barrier_init(&barrier1, NULL, thread_num);
    pthread_barrier_init(&barrier2, NULL, thread_num);
	QueryPerformanceFrequency((LARGE_INTEGER *)&freq);
	init_mat(test);

	timer = 0;
    for (int i = 0; i < epoch; i++)
    {
        reset_mat(mat,test);
        QueryPerformanceCounter((LARGE_INTEGER *)&head);   // start time
        naive_lu(mat);
        QueryPerformanceCounter((LARGE_INTEGER *)&tail); // end time
        timer += (tail - head) * 1000.0 / freq;
    }
    cout << "naive LU cost: " << timer / epoch << "ms" << endl;
	reset_mat(cor,mat);//cor为标准答案比对
//	for(int i=0;i<N;i++)
//        for(int j=0;j<N;j++)
//            if(cor[i][j]!=mat[i][j])
//                cout<<"diff: "<<i<<" "<<j<<endl;
	print_mat(mat);

//    timer = 0;
//    for (int i = 0; i < epoch; i++)
//    {
//        reset_mat(mat,test);
//        QueryPerformanceCounter((LARGE_INTEGER *)&head);   // start time
//        for (long i = 0; i < thread_num; i++)
//        {
//            threadParm[i].threadId = i;
//            pthread_create(&threads[i], NULL, row_pthread_lu, (void *)&threadParm[i]);
//        }
//        for (long i = 0; i < thread_num; i++)
//            pthread_join(threads[i], NULL);
//        QueryPerformanceCounter((LARGE_INTEGER *)&tail); // end time
//        timer += (tail - head) * 1000.0 / freq;
//    }
//    cout << "Row pthread LU cost: " << timer / epoch << "ms" << endl;
//	for(int i=0;i<N;i++)
//        for(int j=0;j<N;j++)
//            if(cor[i][j]!=mat[i][j])
//                cout<<"diff: "<<i<<" "<<j<<endl;
	print_mat(mat);

//    timer = 0;
//    for (int i = 0; i < epoch; i++)
//    {
//        reset_mat(mat,test);
//        QueryPerformanceCounter((LARGE_INTEGER *)&head);   // start time
//        for (long i = 0; i < thread_num; i++)
//        {
//            threadParm[i].threadId = i;
//            pthread_create(&threads[i], NULL, row_pthread_sse_lu, (void *)&threadParm[i]);
//        }
//        for (long i = 0; i < thread_num; i++)
//            pthread_join(threads[i], NULL);
//        QueryPerformanceCounter((LARGE_INTEGER *)&tail); // end time
//        timer += (tail - head) * 1000.0 / freq;
//    }
//    cout << "Row SSE pthread LU cost: " << timer / epoch << "ms" << endl;
//	for(int i=0;i<N;i++)
//        for(int j=0;j<N;j++)
//            if(cor[i][j]!=mat[i][j])
//                cout<<"diff: "<<i<<" "<<j<<endl;
	print_mat(mat);

    timer = 0;
    for (int i = 0; i < epoch; i++)
    {
        reset_mat(mat,test);
        QueryPerformanceCounter((LARGE_INTEGER *)&head);   // start time
        for (long i = 0; i < thread_num; i++)
        {
            threadParm[i].threadId = i;
            pthread_create(&threads[i], NULL, row_pthread_avx_lu, (void *)&threadParm[i]);
        }
        for (long i = 0; i < thread_num; i++)
            pthread_join(threads[i], NULL);
        QueryPerformanceCounter((LARGE_INTEGER *)&tail); // end time
        timer += (tail - head) * 1000.0 / freq;
    }
    cout << "Row AVX pthread LU cost: " << timer / epoch << "ms" << endl;
//	for(int i=0;i<N;i++)
//        for(int j=0;j<N;j++)
//            if(cor[i][j]!=mat[i][j])
//                cout<<"diff: "<<i<<" "<<j<<endl;
	print_mat(mat);

	//销毁
	pthread_mutex_destroy(&mutex);
	pthread_barrier_destroy(&barrier1);
	pthread_barrier_destroy(&barrier2);
	return 0;
}
