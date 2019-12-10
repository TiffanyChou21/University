#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    client_port = 8888;
    udpSocket = new QUdpSocket(this);
    connect(udpSocket, SIGNAL(readyRead()), this, SLOT(dataReceived()));
    bool result = udpSocket->bind(client_port);
    if(!result)
    {
        QMessageBox::information(this, tr("error"), tr("udp socket create error!"));
        return;
     }

}

MainWindow::~MainWindow()
{
    delete ui;
}
void MainWindow::sendMessage(QString msg,QHostAddress ip,int port)
{
    udpSocket->writeDatagram(msg.toLocal8Bit(),msg.length(),ip,port);//不适用tolatin1是为了解决中文乱码，网上的codec都没用
}
void MainWindow::dataReceived()
{
    while(udpSocket->hasPendingDatagrams())
    {
        QByteArray datagram;
        QHostAddress ip;//ip
        quint16 port;//端口号
        QDateTime datetime=QDateTime::currentDateTime();
        datagram.resize(udpSocket->pendingDatagramSize());

        udpSocket->readDatagram(datagram.data(), datagram.size(),&ip,&port);
        QString msg = datagram.data();
        if(msg.toUpper()=="DATE")
        {
            ui->textEdit->insertPlainText(datetime.toString("yy/MM/dd hh:mm:ss:")+"收到IP="+ip.toString().mid(7,ip.toString().size())+":"+QString::number(port)+"请求【"+msg+"】，响应【"+datetime.toString("yy/MM/dd")+"】\n");
            this->sendMessage(datetime.toString("yy/MM/dd"),ip,port);
        }
        else if(msg.toUpper()=="TIME")
        {
            ui->textEdit->insertPlainText(datetime.toString("yy/MM/dd hh:mm:ss:")+"收到IP="+ip.toString().mid(7,ip.toString().size())+":"+QString::number(port)+"请求【"+msg+"】，响应【"+datetime.toString("hh:mm:ss")+"】\n");
            this->sendMessage(datetime.toString("hh:mm:ss"),ip,port);
        }
        else
        {
            ui->textEdit->insertPlainText(datetime.toString("yy/MM/dd hh:mm:ss:")+"收到IP="+ip.toString().mid(7,ip.toString().size())+":"+QString::number(port)+"请求【"+msg+"】，响应【错误请求】\n");
            this->sendMessage("错误请求            ",ip,port);
        }
    }
}
