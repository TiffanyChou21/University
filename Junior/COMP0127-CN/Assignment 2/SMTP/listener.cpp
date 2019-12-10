#include "stdafx.h"
#include "listener.h"
#include "smtpDlg.h"
#include <vector>

listener::listener()
{
}

listener::~listener()
{
}

void listener::OnAccept(int nErrorCode)
{
	// TODO: 在此添加专用代码和/或调用基类
	CsmtpDlg *dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
	dlg->m_log.AddString(L"*** 收到连接请求");
	responder *responderSocket = new responder();
	dlg->socket_array.Add(responderSocket);//每次新建一个Socket就往表里添加一个
	dlg->socket_num ++;//数目也增加
	responderSocket->num = dlg->socket_num;//编号对应
	if (Accept(*responderSocket))
	{
		dlg->m_log.AddString(L"*** 建立连接");
		responderSocket->AsyncSelect(FD_WRITE);//触发OnSend()函数
	}
	else
		delete responderSocket;
	CAsyncSocket::OnAccept(nErrorCode);
}
