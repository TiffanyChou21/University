#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTextEdit>
#include <QPushButton>
#include <QUdpSocket>
#include <QMessageBox>
#include <QHostAddress>
#include <QDateTime>
#include <QString>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void sendMessage(QString msg,QHostAddress ip,int port);
    void dataReceived();

private:
    Ui::MainWindow *ui;
    QHostAddress client_host;
    int client_port;
    QUdpSocket *udpSocket;
};

#endif // MAINWINDOW_H
