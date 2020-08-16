#include <iostream>
#include <pthread.h>
#include <signal.h>
#include <stdlib.h>
#include<windows.h>
using namespace std;

#define RN 5 // reader num

pthread_mutex_t wmutex = PTHREAD_MUTEX_INITIALIZER; //临界资源互斥
pthread_mutex_t rmutex = PTHREAD_MUTEX_INITIALIZER; //保护读互斥
pthread_mutex_t rwmutex = PTHREAD_MUTEX_INITIALIZER;//读写互斥

int readers = 0;

void* reader(void *arg)
{
    int id = *(int *)arg;
    while (1)
    {
         Sleep(3);
         pthread_mutex_lock(&rwmutex);
         pthread_mutex_lock(&rmutex);//一次一个线程修改readers
         readers++;
         if(readers == 1)
             pthread_mutex_lock(&wmutex);
         pthread_mutex_unlock(&rmutex);
         pthread_mutex_unlock(&rwmutex);
         printf("reader %d is reading, current read count[%d]\n", id, readers);
         Sleep(3);
         pthread_mutex_lock(&rmutex);
         readers--;
         if(readers == 0)
             pthread_mutex_unlock(&wmutex);
         pthread_mutex_unlock(&rmutex);
         printf("reader %d is leaving, current read count[%d]\n", id, readers);
    }
    printf("-----reader %d has done ----, current read count[%d]\n", id, readers);
}

void *writer(void *arg)
{
     while(1)
     {
         Sleep(3);
         pthread_mutex_lock(&rwmutex);
         pthread_mutex_lock(&wmutex);
         printf("\twriter is writing\n");
         pthread_mutex_unlock(&rwmutex);//尽快释放供读者使用，减少同步开销
         pthread_mutex_unlock(&wmutex);
     }
     printf("-----writer has done -----\n");
}

int main(int argc, const char *argv[])
{
     int err;
     pthread_t tid[RN], writerTid;
     for(int i=0; i < RN; ++i){
         err = pthread_create(&tid[i], NULL, reader, &i);
         if (err != 0)
         {
             printf("can't create process for reader");
         }
     }

     err = pthread_create(&writerTid, NULL, writer, (void *)NULL);
     if (err != 0)
     {
          printf("can't create process for writer");
     }

     while(1);
     return 0;
}
