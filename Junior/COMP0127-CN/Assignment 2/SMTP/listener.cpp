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
	// TODO: �ڴ����ר�ô����/����û���
	CsmtpDlg *dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
	dlg->m_log.AddString(L"*** �յ���������");
	responder *responderSocket = new responder();
	dlg->socket_array.Add(responderSocket);//ÿ���½�һ��Socket�����������һ��
	dlg->socket_num ++;//��ĿҲ����
	responderSocket->num = dlg->socket_num;//��Ŷ�Ӧ
	if (Accept(*responderSocket))
	{
		dlg->m_log.AddString(L"*** ��������");
		responderSocket->AsyncSelect(FD_WRITE);//����OnSend()����
	}
	else
		delete responderSocket;
	CAsyncSocket::OnAccept(nErrorCode);
}
