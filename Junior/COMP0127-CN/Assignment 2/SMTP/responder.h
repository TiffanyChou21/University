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
	bool isEnd;      //data�Ƿ����
	bool isData;    //����or����
	int  smtp_count;//��ǰִ�е��ڼ���
	UINT length;    //���󳤶�
	CString data;   //data����
	char m_buffer[500000];//�������󻺳���
	int num;             //����socket
};

