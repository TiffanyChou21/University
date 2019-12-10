#pragma once
#include<vector>
class mail :public CObject    //此类用于对邮件的处理和保存
{
public:
	mail();
	~mail();

	CString mailFrom;		//邮件from
	CString mailSubject;    //邮件主题
	CString mailTo;         //邮件to
	CString mailContent;    //接收到的内容
	CString mail_text;		//邮件文本内容
	CString mail_filename;  //邮件附件名
	CImage mail_image;      //邮件附件图片
	CString mail_txt;       //邮件附件文本
	void	decodeAll(CString data);//初步解码
	unsigned char* Text_DecodeBase64(CString base64_code, int &code_length);//文本base64解码
	void Image_DecodeBase64(CString inpt, std::vector<char>& bytes);//图片base64解码
	void showMail();//显示邮件
	void showImage();//显示附件图
};

