//作业二
//分配内存
#include <assert.h>
#include <iostream>
using namespace std;
struct Page{       //页面类
    struct Page *prev;
    struct Page *next;
    int index;
    bool used;  //0为空闲，1为占用

};
struct FirstNode{
    int size;
    struct Page *start;
};
#define MAX 1000


Page *company[MAX];//利用的空间依次为1,2,4,8,16,32,64,128,256,512,1024
FirstNode free_area[11];
Page *add;
void init(){     //初始化
    for( int i=0 ; i<11 ; ++i ){
        free_area[i].size = (int)(1<<i);
        free_area[i].start = NULL;
    }
    free_area[11-1].start = (Page*)malloc( free_area[11-1].size*sizeof(Page) );
    add = free_area[11-1].start;
    for( int i=0 ; i<MAX ; ++i ){
        company[i] = NULL;
    }
}
Page* PageAlloc( int size ){
    int pos = 0;
    while( pos<11 and ( free_area[pos].size<=size || free_area[pos].start==NULL ) ){
        ++pos;
    }
    if( pos>=11 ){    //分配失败
        return NULL;
    }
    //内存分配
    Page *tempNode = free_area[pos].start;
    Page *prev = free_area[pos].start->prev;
    Page *next = free_area[pos].start->next;
    if( tempNode==next ){
        free_area[pos].start = NULL;
    }
    else{
        (*prev).next = next;
        (*next).prev = prev;
        free_area[pos].start = next;
    }
    int tempIndex;
    for( int i=0 ; i<pos ; ++i ){
        if( free_area[i].size<size ){
            continue;
        }
        Page *tmp;
        tmp = tempNode + (int)(1<<i);
        (*tmp).next = tmp;
        (*tmp).prev = tmp;
        (*tmp).index = i;
        (*tmp).used = false;
        free_area[i].start = tmp;
        tempIndex = i;
    }
    (*tempNode).used = true;
    (*tempNode).index = tempIndex;
    return tempNode;
}
//检查页表中那个块可用
void check(){

    puts("可用空间：");
    int spaceID = 1;
    for( int i=0 ; i<11 ; ++i ){
        if( free_area[i].start!=NULL ){
            Page *temp = free_area[i].start;
            cout<<"第"<<spaceID++<<"块可用空间,大小为"<<(int)(1<<(*temp).index)<<",首地址为"<<temp<<endl;
            for( ; temp!=free_area[i].start ; ){
                cout<<"第"<<spaceID++<<"块可用空间,大小为"<<(int)(1<<(*temp).index)<<",首地址为"<<temp<<endl;
                temp = (*temp).next;
            }
        }
    }
}
int main()
{
    int size;
    init();
    int num = 0;
    assert( add!=NULL );
    (*add).prev = add;
    (*add).next = add;
    (*add).index = 11-1;
    (*add).used = false;
    while( true ){
        int select;
        cout<<"1.申请空间\n2.查询可用空间\n0.停止操作"<<endl;
        cin>>select;
        if( select==0 ){
            break;
        }
        if( select==1 ){
            cout<<"申请的空间大小：";
            cin>>size;
            company[num] = PageAlloc(size);
            if( not company[num] ){
                cout<<"内存不足，申请失败!"<<endl;
            }
            else{
                cout<<"您申请的第"<<num+1<<"块空间起始地址为："<<company[num]<<endl;
            }
            ++num;
            continue;
        }
        if( select==2 ){
            check();
            puts("");
            continue;
        }
    }
    return 0;
}

