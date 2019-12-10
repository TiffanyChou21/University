#pragma once
#include "afxsock.h"
class listener : public CAsyncSocket
{
public:
	listener();
	~listener();
	virtual void OnAccept(int nErrorCode);
};

