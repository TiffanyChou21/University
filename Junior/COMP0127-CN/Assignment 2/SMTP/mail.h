#pragma once
#include<vector>
class mail :public CObject    //�������ڶ��ʼ��Ĵ���ͱ���
{
public:
	mail();
	~mail();

	CString mailFrom;		//�ʼ�from
	CString mailSubject;    //�ʼ�����
	CString mailTo;         //�ʼ�to
	CString mailContent;    //���յ�������
	CString mail_text;		//�ʼ��ı�����
	CString mail_filename;  //�ʼ�������
	CImage mail_image;      //�ʼ�����ͼƬ
	CString mail_txt;       //�ʼ������ı�
	void	decodeAll(CString data);//��������
	unsigned char* Text_DecodeBase64(CString base64_code, int &code_length);//�ı�base64����
	void Image_DecodeBase64(CString inpt, std::vector<char>& bytes);//ͼƬbase64����
	void showMail();//��ʾ�ʼ�
	void showImage();//��ʾ����ͼ
};

