#include "stdafx.h"
#include "responder.h"
#include "smtpDlg.h"
#include "mail.h"

responder::responder()
{
	isEnd = false;
	isData = false;
	smtp_count = 0;
	length = 0;
	CString data;//data内容
	char m_buffer[500000];//接收请求缓冲区
}

responder::~responder()
{
}

void responder::OnSend(int nErrorCode)
{
	CsmtpDlg* dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
	if(smtp_count==0)
	{
		char* ready = "220 ready\r\n";
		Send(ready, strlen(ready));     //响应220ready
		dlg->m_log.AddString(L"S:220 Simple Mail Server Ready For Mail Service");
		AsyncSelect(FD_READ);//触发OnReceive()函数
	}
	else if (smtp_count == 1)
	{
		char* replyStr = "250 hello\r\n";
		Send(replyStr, strlen(replyStr));//响应客户端
		dlg->m_log.AddString(L"S:250 OK 127.0.0.1");
		AsyncSelect(FD_READ);    
	}
	else if (smtp_count == 2)
	{
		char* replyStr = "250 mail from\r\n";
		Send(replyStr, strlen(replyStr));
		dlg->m_log.AddString(L"S:250 Sender OK");
		AsyncSelect(FD_READ);
	}
	else if (smtp_count == 3)
	{
		char* replyStr = "250 receiver\r\n";
		Send(replyStr, strlen(replyStr));
		dlg->m_log.AddString(L"S:250 Receiver OK");
		AsyncSelect(FD_READ);
	}
	else if (smtp_count == 4)
	{
		isData = true; //可以开始接收正文
		char* replyStr = "354 data\r\n";
		Send(replyStr, strlen(replyStr));
		dlg->m_log.AddString(L"S:354 Go Ahead!End With <CRLF>.<CRLF>");;
		AsyncSelect(FD_READ);
		return;
	}
	else if (smtp_count == 5)
	{
		char* replyStr = "250 data\r\n";
		Send(replyStr, strlen(replyStr));//服务器响应250，表示请求的命令成功完成
		dlg->m_log.AddString(L"S:250  Message accepted for delivery!");
		isData = false;
		AsyncSelect(FD_READ);
	}
	else if (smtp_count == 6)
	{
		char reply[100] = "221 succeed\r\n";
		Send(reply, strlen(reply));
		dlg->m_log.AddString(L"S:221 Quit! Goodbye!");
		smtp_count = 0;
		//dlg->socket_array.RemoveAt(this->num-1);
		this->Close();//关闭socket
		//AsyncSelect(FD_READ);
	}
	CAsyncSocket::OnSend(nErrorCode);
}

void responder::OnReceive(int nErrorCode)
{
	CsmtpDlg *dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
	memset(m_buffer, 0, sizeof(m_buffer));          //清零接受多封邮件
	length = Receive(m_buffer, sizeof(m_buffer), 0);
	CString receiveStr(m_buffer);             
	while (isData && !isEnd)//是数据且未结束说明缓冲不够
	{
		data += receiveStr;
		if (receiveStr.Right(5) != "\r\n.\r\n")
			return;
		else
			isEnd = true;    

	}
	//消息接收情况
	if (receiveStr.Left(4) == "HELO" || receiveStr.Left(4) == "EHLO")
	{
		dlg->m_log.AddString(L"C:" + receiveStr);
		smtp_count++;
		AsyncSelect(FD_WRITE);//触发OnSend()传送信息
	}
	else if (receiveStr.Left(10) == "MAIL FROM:")
	{
		dlg->m_log.AddString(L"C:" + receiveStr);
		smtp_count++;
		AsyncSelect(FD_WRITE);
	}
	else if (receiveStr.Left(8) == "RCPT TO:")
	{
		dlg->m_log.AddString(L"C:" + receiveStr);
		smtp_count++;
		AsyncSelect(FD_WRITE);
	}
	else if (receiveStr.Left(4) == "DATA")
	{
		dlg->m_log.AddString(L"C:" + receiveStr);
		smtp_count++;
		AsyncSelect(FD_WRITE);
	}
	else if (isData&&isEnd)
	{
		mail *nowMail = new mail();    //新建mail并加入array
		nowMail->decodeAll(data);
		dlg->mail_array.Add(nowMail);
		dlg->mail_num = dlg->mail_array.GetSize() - 1;   //计数
		dlg->showNowMail();
		smtp_count++;
		AsyncSelect(FD_WRITE);
	}
	else if (receiveStr.Left(4) == "QUIT")
	{
		dlg->m_log.AddString(L"C:" + receiveStr);
		smtp_count++;
		AsyncSelect(FD_WRITE);
	}
	CAsyncSocket::OnReceive(nErrorCode);
}

