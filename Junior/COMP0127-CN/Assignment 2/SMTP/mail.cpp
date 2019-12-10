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
	CsmtpDlg* dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();//������ָ�����ٿ�dlg
	mailContent = data;
	//from
	int pos_name = data.Find(L"From:");//find���õ�����F��λ��,��0��ʼ
	if (pos_name == -1)
	{
		mailFrom = (L"���������ȡʧ��");
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
		mailTo = (L"�ռ������ȡʧ��");
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
		mailSubject = (L"�ʼ������ȡʧ��");
	}
	else
	{
		pos_subject += 8;
		int posSubjct = pos_subject;
		while (data.Mid(posSubjct, 2) != "\r\n" && data[posSubjct] != '\n')
			posSubjct++;
		mailSubject = data.Mid(pos_subject, posSubjct - pos_subject);
	}
	//����
	int pos_content = data.Find(L"Content-Type: text/plain;");
	if (pos_content == -1)
	{
		AfxMessageBox(L"δ�ҵ��ʼ�����,�����ʼ�");
	}
	else
	{
		int linenum = 0;           //�����м���
		while (linenum != 4)
		{
			if (data[pos_content++] == '\n')
				linenum++;
		}
		int posContent = pos_content;
		while (data.Mid(posContent, 6) != "------")
			posContent++;
		posContent -= 4;//����\r\n\r\n
		CString base64_text = data.Mid(pos_content, posContent - pos_content);
		base64_text.Remove('\r');//ɾ��������base64��\r\n
		base64_text.Remove('\n');
		int text_length = 0;
		mail_text = CString(Text_DecodeBase64(base64_text, text_length));
	}
	//ͼƬ
	int pos_image= data.Find(L"filename");
	if (pos_image == -1)	//���û�и����򷵻�
	{
		mail_filename = (L"�޸���");
	}
	else
	{
		CsmtpDlg* dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();
		CString  ImageContent; //��δ��������ȡ��image����
		CString  TxtContent;
		data.Remove('\r');//ͬ����
		data.Remove('\n');
		pos_image = data.Find(L"filename");//ɾ��\r\n��λ�������仯
		int pos_img1 = data.Find('"', pos_image + 7);//��������""�м�
		int pos_img2 = data.Find('"', pos_img1 + 1);
		mail_filename = data.Mid(pos_img1 + 1, pos_img2 - pos_img1 - 1);
		dlg->m_filename.SetWindowTextW(mail_filename);//��ʾ������
		dlg->UpdateData(false);//��������
		if (mail_filename.Right(3) == 'jpg' || mail_filename.Right(3) == 'png' || mail_filename.Right(3) == 'bmp')
		{
			int pos_pic = data.Find(L"------=", pos_img2 + 1);//ͬ����
		//��ȡͼƬ����
			ImageContent = data.Mid(pos_img2 + 1, pos_pic - pos_img2 - 1);
			std::vector<char> bytes;//ͼƬ���ֽ�����ʽ����base64�����浽bytes��
			Image_DecodeBase64(ImageContent, bytes);
			//�������������Զ������ֽ�����ʽ�����ļ����������CImage��ʾ
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
			posTxtContent -= 4;//����\r\n\r\n
			CString attached_txt = data.Mid(pos_img2+1, posTxtContent - pos_img2+3);
			attached_txt.Remove('\r');//ɾ��������base64��\r\n
			attached_txt.Remove('\n');
			int text_length = 0;
			mail_txt = "Attached��";
			mail_txt += CString(Text_DecodeBase64(attached_txt, text_length));

		}
	}


}

unsigned char* mail::Text_DecodeBase64(CString base64_code, int &code_length)
{
	unsigned char* base64 =(unsigned char*) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	CString src;//���6bit��Ӧ���ı�
	unsigned char *real_code;  //��Ž������ַ���
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
		//��һ��6bit+�ڶ���6bit��ǰ��λ
		real_code[j + 1] = ((src[i + 1] & 0x0F) << 4) + ((src[i + 2] & 0x3C) >> 2); 
		//�ڶ���6bit�ĺ���λ+������6bit��ǰ��λ
		real_code[j + 2] = ((src[i + 2] & 0x03) << 6) + src[i + 3];  
		//������6bit�ĺ���λ+���ĸ�6bit
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
	for (int i = 0, j = 0; i < length; i += 4, j += 3) {  //�ֽ���
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
	//�������ʾ    
	CRect Rect;
	dlg->m_image.GetClientRect(&Rect);
	dlg->m_image.GetDC()->FillSolidRect(Rect.left, Rect.top, Rect.Width(), Rect.Height(), RGB(240, 240, 240));
	//��ʾͼƬ
	if (!mail_image.IsNull()) {  //ȷ��λͼ��ǰ�Ƿ����ڼ���
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
		if (nRatioImage > nRatioDest) {    //�����ڿռ������ʾ
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
	CsmtpDlg *dlg = (CsmtpDlg*)AfxGetApp()->GetMainWnd();//������ָ�����ٿ�dlg

	dlg->m_content.SetWindowTextW(mailContent);
	CString info = L"From:" + mailFrom + "     Subject:" + mailSubject + "     To:" + mailTo;
	dlg->m_info.SetWindowTextW(info);
	mail_text += mail_txt;
	dlg->m_text.SetWindowTextW(mail_text);
	dlg->m_filename.SetWindowTextW(mail_filename);
	showImage();
}