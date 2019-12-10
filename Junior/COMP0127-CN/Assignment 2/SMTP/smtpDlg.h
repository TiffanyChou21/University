#pragma once
#include "afxwin.h"
#include "listener.h"
#include "afxcoll.h"
#include "mail.h"
#include "responder.h"

// CsmtpDlg �Ի���
class CsmtpDlg : public CDialogEx
{
// ����
public:
	CsmtpDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_SMTP_DIALOG };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	CListBox m_log;
	listener mylistener;
	CEdit m_content;
	CEdit m_text;
	CEdit m_info;
	CEdit m_mailnum;
	CEdit m_filename;
	CStatic m_image;

	CArray<mail*, mail*> mail_array;    //�ʼ�vector
	CArray<responder*, responder*>socket_array;//responder-vector����new socket
	int socket_num;//��ǰsocket��Ŀ
	int mail_num;                      //�ʼ���
	void showNowMail();
	
	afx_msg void OnClickedLeft();
	afx_msg void OnClickedRight();
};
