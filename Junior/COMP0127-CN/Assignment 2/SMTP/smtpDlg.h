#pragma once
#include "afxwin.h"
#include "listener.h"
#include "afxcoll.h"
#include "mail.h"
#include "responder.h"

// CsmtpDlg 对话框
class CsmtpDlg : public CDialogEx
{
// 构造
public:
	CsmtpDlg(CWnd* pParent = NULL);	// 标准构造函数

// 对话框数据
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_SMTP_DIALOG };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持


// 实现
protected:
	HICON m_hIcon;

	// 生成的消息映射函数
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

	CArray<mail*, mail*> mail_array;    //邮件vector
	CArray<responder*, responder*>socket_array;//responder-vector用于new socket
	int socket_num;//当前socket数目
	int mail_num;                      //邮件数
	void showNowMail();
	
	afx_msg void OnClickedLeft();
	afx_msg void OnClickedRight();
};
