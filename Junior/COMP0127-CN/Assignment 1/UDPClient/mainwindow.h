#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QLabel>
#include <QLineEdit>
#include <QPushButton>
#include <QUdpSocket>
#include <QTimer>
#include <QHostAddress>
#include <QDebug>
#include <QMessageBox>
#include <QTextCodec>

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
    void messageSend();
    void messageGet();
    void on_pushButton_clicked();

private:
    Ui::MainWindow *ui;
    QHostAddress ip;
    int port;
    QUdpSocket *udpSocket;
};

#endif // MAINWINDOW_H
