
// smtpDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "smtp.h"
#include "smtpDlg.h"
#include "afxdialogex.h"
#include "listener.h"
#include "mail.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// 对话框数据
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_ABOUTBOX };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

// 实现
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(IDD_ABOUTBOX)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CsmtpDlg 对话框



CsmtpDlg::CsmtpDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(IDD_SMTP_DIALOG, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CsmtpDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LOG, m_log);
	//  DDX_Control(pDX, IDC_CONTENT, mcon);
	DDX_Control(pDX, IDC_EDIT1, m_content);
	DDX_Control(pDX, IDC_PIC, m_image);
	DDX_Control(pDX, IDC_info, m_info);
	DDX_Control(pDX, IDC_mailnum, m_mailnum);
	DDX_Control(pDX, IDC_CONTENT, m_text);
	DDX_Control(pDX, IDC_EDIT2, m_filename);
}

BEGIN_MESSAGE_MAP(CsmtpDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_left, &CsmtpDlg::OnClickedLeft)
	ON_BN_CLICKED(IDC_right, &CsmtpDlg::OnClickedRight)
END_MESSAGE_MAP()


// CsmtpDlg 消息处理程序

BOOL CsmtpDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// 将“关于...”菜单项添加到系统菜单中。

	// IDM_ABOUTBOX 必须在系统命令范围内。
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// 设置此对话框的图标。  当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标
	// TODO: 在此添加额外的初始化代码
	//各数据初始化
	mail_num = 0;//初始邮件为第一封，下标为0
	socket_num = 0;
	if (!mail_array.IsEmpty())
		showNowMail();
	
	m_log.AddString(L"*** SMTP服务器准备好\n");
	m_log.AddString(L"$$$$$$$$$$$$$$$$$$$$$$$\n");

	if (mylistener.m_hSocket == INVALID_SOCKET)
	{
		//创建监听套接字,激发FD_ACCEPT事件,默认端口25
		//FD_ACCEPT通知侦听套接字当前有连接请求可以接受    OnAccept(int nErrorCode); 
		BOOL bFlag = mylistener.Create(25, SOCK_STREAM, FD_ACCEPT,NULL);    
		//创建失败弹出错误警告
		if (!bFlag)
		{
			AfxMessageBox(L"Socket创建失败!");
			mylistener.Close();
			PostQuitMessage(0);

			return TRUE;
		}
		if (!mylistener.Listen())  
		{
			int nErrorCode = mylistener.GetLastError();    //检测错误信息  
			if (nErrorCode != WSAEWOULDBLOCK)             //如果不是线程阻塞  
			{
				AfxMessageBox(L"Socket错误!");
				mylistener.Close();
				PostQuitMessage(0);
				return TRUE;
			}
		}
	}
	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}
void CsmtpDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。  对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CsmtpDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作区矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标
//显示。
HCURSOR CsmtpDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}



void CsmtpDlg::showNowMail()
{
	if(mail_num>=0&&mail_array.GetSize()>mail_num)
		mail_array.GetAt(mail_num)->showMail();
	CString page;
	page.Format(L"%d/%d", mail_num+1, mail_array.GetSize());
	m_mailnum.SetWindowTextW(page);
}

void CsmtpDlg::OnClickedLeft()
{
	// TODO: 在此添加控件通知处理程序代码
	if (mail_num > 0 && mail_num < mail_array.GetSize())
	{
		mail_num--;
		showNowMail();
	}
	else
	{
		AfxMessageBox(L"无上一封邮件");
	}
}


void CsmtpDlg::OnClickedRight()
{
	// TODO: 在此添加控件通知处理程序代码
	if (mail_num >= 0 &&mail_num<mail_array.GetSize()-1)
	{
		mail_num++;
		showNowMail();
	}
	else
	{
		AfxMessageBox(L"无下一封邮件");
	}
}
