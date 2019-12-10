#pragma once
#include "afxsock.h"
#include <vector>
class responder :  public CAsyncSocket
{
public:
	responder();
	~responder();
	virtual void OnReceive(int nErrorCode);
	virtual void OnSend(int nErrorCode);
	bool isEnd;      //data是否结束
	bool isData;    //命令or数据
	int  smtp_count;//当前执行到第几步
	UINT length;    //请求长度
	CString data;   //data内容
	char m_buffer[500000];//接收请求缓冲区
	int num;             //计数socket
};

