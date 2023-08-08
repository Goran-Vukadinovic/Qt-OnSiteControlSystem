#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QtCore/QObject>

QT_FORWARD_DECLARE_CLASS(QNetworkSession)
QT_FORWARD_DECLARE_CLASS(QTcpServer)
QT_FORWARD_DECLARE_CLASS(QTcpSocket)

class TcpServer : public QObject
{
    Q_OBJECT
public:
    explicit TcpServer(quint16 port, bool debug = false);
    ~TcpServer();

private slots:
    void onNewConnection();
    void readyRead();
    void disconnected();

signals:
    void siganl_tcpReceiveData(QTcpSocket* client, QByteArray buff);
    void siganl_tcpClientConnect(QTcpSocket* client);
    void siganl_tcpClientDisconnect(QTcpSocket* client);


private:    
    QTcpServer* qtcpServer = nullptr;
    quint16 m_port;
    QList<QTcpSocket *> m_clients;
    bool m_debug;
};

#endif //TCPSERVER_H
