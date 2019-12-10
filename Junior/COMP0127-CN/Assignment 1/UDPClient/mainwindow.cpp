#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    port = ui->lineEdit_3->text().toInt();
    this->ip.setAddress(ui->lineEdit->text());
    QString strIPAddress = ip.toString();
//    ui->lineEdit_4->setText(strIPAddress);
//    QHostAddress address = QHostAddress(QHostAddress::LocalHost);
//    QString strIPAddress = address.toString();
//    ui->lineEdit_4->setText(strIPAddress);
    udpSocket = new QUdpSocket(this);
    udpSocket->bind(port);
    QTextCodec *codec = QTextCodec::codecForName("UTF-8");
    connect(udpSocket,SIGNAL(readyRead()),this,SLOT(messageGet()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::messageGet()
{
    while(udpSocket->hasPendingDatagrams())
    {
        QByteArray datagram;
        QHostAddress ip;//ip
        quint16 port;//端口号
        datagram.resize(udpSocket->pendingDatagramSize());
        udpSocket->readDatagram(datagram.data(), datagram.size(),&ip,&port);
        QString msg = datagram.data();
        QString str=QString::fromLocal8Bit(datagram);//此处和server对应使用fromLocal8Bit为了解决中文乱码问题
        ui->lineEdit_4->setText(str);
    }
}

void MainWindow::messageSend()
{
    QString strIPAddress = ip.toString();
    QString msg = ui->lineEdit_2->text();
    int length = 0;
    if( msg == "")
    {
        return;
    }
    if(strIPAddress=="192.168.64.1")
    {
        if((length = udpSocket->writeDatagram(msg.toLatin1(), msg.length(), QHostAddress::LocalHost,port )) != msg.length())
       {
            return;
       }
    }
    else if((length = udpSocket->writeDatagram(msg.toLatin1(), msg.length(), ip,port )) != msg.length())
    {
        return;
    }
    else return;
}

void MainWindow::on_pushButton_clicked()
{
    if(!this->ip.setAddress(ui->lineEdit->text()))
    {
        QMessageBox::critical(this, tr("错误"),tr("服务器地址填写错误"));
        return;
    }
    this->port = ui->lineEdit_3->text().toInt();
    this->messageSend();

}
