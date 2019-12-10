#include "stdafx.h"
#include "mail.h"
#include "smtpDlg.h"
#include "smtp.h"

#include <fstream>
#include <sstream>
#include <string>

mail::mail()
{
}

mail::~mail()
{
}

void mail::decodeAll(CString data)
{
	CsmtpDlg* dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();//主窗口指针对象操控dlg
	mailContent = data;
	//from
	int pos_name = data.Find(L"From:");//find串得到的是F的位置,从0开始
	if (pos_name == -1)
	{
		mailFrom = (L"发件邮箱获取失败");
	}
	else
	{
		pos_name += 5;
		int posName = data.Find('<', pos_name + 5);
		mailFrom = data.Mid(pos_name+2, posName - pos_name-4);
	}
	//to
	int pos_to = data.Find(L"To:");
	if (pos_to == -1)
	{
		mailTo = (L"收件邮箱获取失败");
	}
	else
	{
		pos_to = data.Find('<', pos_to);
		int posTo = data.Find('>', pos_to);
		mailTo = data.Mid(pos_to+1, posTo - pos_to - 1);
	}
	//subject
	int pos_subject = data.Find(L"Subject:");
	if (pos_subject == -1)
	{
		mailSubject = (L"邮件主题获取失败");
	}
	else
	{
		pos_subject += 8;
		int posSubjct = pos_subject;
		while (data.Mid(posSubjct, 2) != "\r\n" && data[posSubjct] != '\n')
			posSubjct++;
		mailSubject = data.Mid(pos_subject, posSubjct - pos_subject);
	}
	//正文
	int pos_content = data.Find(L"Content-Type: text/plain;");
	if (pos_content == -1)
	{
		AfxMessageBox(L"未找到邮件正文,请检查邮件");
	}
	else
	{
		int linenum = 0;           //后面有几行
		while (linenum != 4)
		{
			if (data[pos_content++] == '\n')
				linenum++;
		}
		int posContent = pos_content;
		while (data.Mid(posContent, 6) != "------")
			posContent++;
		posContent -= 4;//跳过\r\n\r\n
		CString base64_text = data.Mid(pos_content, posContent - pos_content);
		base64_text.Remove('\r');//删掉不属于base64的\r\n
		base64_text.Remove('\n');
		int text_length = 0;
		mail_text = CString(Text_DecodeBase64(base64_text, text_length));
	}
	//图片
	int pos_image= data.Find(L"filename");
	if (pos_image == -1)	//如果没有附件则返回
	{
		mail_filename = (L"无附件");
	}
	else
	{
		CsmtpDlg* dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
		CString  ImageContent; //存未解析的提取的image内容
		CString  TxtContent;
		data.Remove('\r');//同正文
		data.Remove('\n');
		pos_image = data.Find(L"filename");//删除\r\n后位置有所变化
		int pos_img1 = data.Find('"', pos_image + 7);//附件名在""中间
		int pos_img2 = data.Find('"', pos_img1 + 1);
		mail_filename = data.Mid(pos_img1 + 1, pos_img2 - pos_img1 - 1);
		dlg->m_filename.SetWindowTextW(mail_filename);//显示附件名
		dlg->UpdateData(false);//更新数据
		if (mail_filename.Right(3) == 'jpg' || mail_filename.Right(3) == 'png' || mail_filename.Right(3) == 'bmp')
		{
			int pos_pic = data.Find(L"------=", pos_img2 + 1);//同正文
		//获取图片内容
			ImageContent = data.Mid(pos_img2 + 1, pos_pic - pos_img2 - 1);
			std::vector<char> bytes;//图片用字节流形式储存base64解码后存到bytes中
			Image_DecodeBase64(ImageContent, bytes);
			//将解码后的内容以二进制字节流形式赋给文件名方便后续CImage显示
			std::fstream
				of(mail_filename, std::ios_base::out | std::ios_base::binary);
			of.write(static_cast<const char*>(&bytes[0]), bytes.size());
			of.close();
		}
		else
		{
			int posTxtContent = pos_img2;
			while (data.Mid(posTxtContent, 6) != "------")
				posTxtContent++;
			posTxtContent -= 4;//跳过\r\n\r\n
			CString attached_txt = data.Mid(pos_img2+1, posTxtContent - pos_img2+3);
			attached_txt.Remove('\r');//删掉不属于base64的\r\n
			attached_txt.Remove('\n');
			int text_length = 0;
			mail_txt = "Attached：";
			mail_txt += CString(Text_DecodeBase64(attached_txt, text_length));

		}
	}


}

unsigned char* mail::Text_DecodeBase64(CString base64_code, int &code_length)
{
	unsigned char* base64 =(unsigned char*) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	CString src;//存放6bit对应的文本
	unsigned char *real_code;  //存放解码后的字符串
	int length = base64_code.GetLength();
	unsigned char* p;
	src.GetBufferSetLength(length);
	for (int i = 0; i < length; i++)
		src.SetAt(i, base64_code[i]);
	while (length > 0 && src[length - 1] == '=')
	{
		src.SetAt(length - 1, 0);
		length--;
	}
	for (int i = 0; i < length; i++)
	{
		p = (unsigned char*)strchr((const char*)base64, (int)src[i]);
		if (!p) break;
		src.SetAt(i, p - (unsigned char*)base64);
	}
	real_code = new unsigned char[length * 3 / 4 + 1];
	memset(real_code, 0, length * 3 / 4 + 1);
	for (int i = 0, j = 0; i < length; i += 4, j += 3) {
		real_code[j] = (src[i] << 2) + ((src[i + 1] & 0x30) >> 4);  
		//第一个6bit+第二个6bit的前两位
		real_code[j + 1] = ((src[i + 1] & 0x0F) << 4) + ((src[i + 2] & 0x3C) >> 2); 
		//第二个6bit的后四位+第三个6bit的前四位
		real_code[j + 2] = ((src[i + 2] & 0x03) << 6) + src[i + 3];  
		//第三个6bit的后两位+第四个6bit
	}
	code_length = length * 3 / 4 + 1;
	return real_code;
}

void mail::Image_DecodeBase64(CString base64_code, std::vector<char>& bytes) {
	unsigned char* base64 = (unsigned char*)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	unsigned char* p;
	int length = base64_code.GetLength();
	CString src;
	src.GetBufferSetLength(length);

	for (int i = 0; i < length; i++)
		src.SetAt(i, base64_code[i]);
	while (length > 0 && src[length - 1] == '=') {
		src.SetAt(length - 1, 0);
		length--;
	}
	for (int i = 0; i < length; i++) {
		p = (unsigned char*)strchr((const char*)base64, (int)src[i]);
		if (!p)break;
		src.SetAt(i, p - (unsigned char*)base64);
	}
	for (int i = 0, j = 0; i < length; i += 4, j += 3) {  //字节流
		byte threeByte[3];
		threeByte[0] = (src[i] << 2) + ((src[i + 1] & 0x30) >> 4);
		threeByte[1] = ((src[i + 1] & 0x0F) << 4) + ((src[i + 2] & 0x3C) >> 2);
		threeByte[2] = ((src[i + 2] & 0x03) << 6) + src[i + 3];
		for (auto j = 0; j < 3; j++) {
			bytes.push_back(threeByte[j]);
		}
	}
	return;
}

void mail::showImage()
{
	CsmtpDlg* dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
	//清空再显示    
	CRect Rect;
	dlg->m_image.GetClientRect(&Rect);
	dlg->m_image.GetDC()->FillSolidRect(Rect.left, Rect.top, Rect.Width(), Rect.Height(), RGB(240, 240, 240));
	//显示图片
	if (!mail_image.IsNull()) {  //确定位图当前是否正在加载
		mail_image.Detach();
	}

	mail_image.Load(mail_filename);
	if (!mail_image.IsNull()) {
		SetStretchBltMode(dlg->m_image.GetDC()->GetSafeHdc(), HALFTONE);
		CRect dest;
		dlg->m_image.GetClientRect(&dest);

		float nRatioImage = mail_image.GetWidth() / static_cast<float>(mail_image.GetHeight());
		float nRatioDest = dest.Width() / static_cast<float>(dest.Height());
		CRect rectDraw = dest;
		if (nRatioImage > nRatioDest) {    //设置在空间居中显示
			rectDraw.SetRect((dest.Width() / 2) - (rectDraw.right / 2), (dest.Height() / 2) - ((rectDraw.right / nRatioImage) / 2), (dest.Width() / 2) + (rectDraw.right / 2), (dest.Height() / 2) + ((rectDraw.right / nRatioImage) / 2));
		}
		else if (nRatioImage < nRatioDest) {
			rectDraw.SetRect((dest.Width() / 2) - ((rectDraw.bottom * nRatioImage) / 2), (dest.Height() / 2) - (rectDraw.bottom / 2), (dest.Width() / 2) + ((rectDraw.bottom * nRatioImage) / 2), (dest.Height() / 2) + (rectDraw.bottom / 2));
		}
		mail_image.Draw(dlg->m_image.GetDC()->GetSafeHdc(), rectDraw);
	}
}
void mail::showMail()
{
	CsmtpDlg *dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();//主窗口指针对象操控dlg

	dlg->m_content.SetWindowTextW(mailContent);
	CString info = L"From:" + mailFrom + "     Subject:" + mailSubject + "     To:" + mailTo;
	dlg->m_info.SetWindowTextW(info);
	mail_text += mail_txt;
	dlg->m_text.SetWindowTextW(mail_text);
	dlg->m_filename.SetWindowTextW(mail_filename);
	showImage();
}