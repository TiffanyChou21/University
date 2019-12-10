
// smtpDlg.cpp : ʵ���ļ�
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


// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// �Ի�������
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_ABOUTBOX };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
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


// CsmtpDlg �Ի���



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


// CsmtpDlg ��Ϣ�������

BOOL CsmtpDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// ��������...���˵�����ӵ�ϵͳ�˵��С�

	// IDM_ABOUTBOX ������ϵͳ���Χ�ڡ�
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

	// ���ô˶Ի����ͼ�ꡣ  ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��
	// TODO: �ڴ���Ӷ���ĳ�ʼ������
	//�����ݳ�ʼ��
	mail_num = 0;//��ʼ�ʼ�Ϊ��һ�⣬�±�Ϊ0
	socket_num = 0;
	if (!mail_array.IsEmpty())
		showNowMail();
	
	m_log.AddString(L"*** SMTP������׼����\n");
	m_log.AddString(L"$$$$$$$$$$$$$$$$$$$$$$$\n");

	if (mylistener.m_hSocket == INVALID_SOCKET)
	{
		//���������׽���,����FD_ACCEPT�¼�,Ĭ�϶˿�25
		//FD_ACCEPT֪ͨ�����׽��ֵ�ǰ������������Խ���    OnAccept(int nErrorCode); 
		BOOL bFlag = mylistener.Create(25, SOCK_STREAM, FD_ACCEPT,NULL);    
		//����ʧ�ܵ������󾯸�
		if (!bFlag)
		{
			AfxMessageBox(L"Socket����ʧ��!");
			mylistener.Close();
			PostQuitMessage(0);

			return TRUE;
		}
		if (!mylistener.Listen())  
		{
			int nErrorCode = mylistener.GetLastError();    //��������Ϣ  
			if (nErrorCode != WSAEWOULDBLOCK)             //��������߳�����  
			{
				AfxMessageBox(L"Socket����!");
				mylistener.Close();
				PostQuitMessage(0);
				return TRUE;
			}
		}
	}
	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
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

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ  ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CsmtpDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ����������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
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
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	if (mail_num > 0 && mail_num < mail_array.GetSize())
	{
		mail_num--;
		showNowMail();
	}
	else
	{
		AfxMessageBox(L"����һ���ʼ�");
	}
}


void CsmtpDlg::OnClickedRight()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	if (mail_num >= 0 &&mail_num<mail_array.GetSize()-1)
	{
		mail_num++;
		showNowMail();
	}
	else
	{
		AfxMessageBox(L"����һ���ʼ�");
	}
}
