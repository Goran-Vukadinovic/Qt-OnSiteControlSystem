#ifndef WEBSERVER_H
#define WEBSERVER_H

#include <QtCore/QObject>
#include <QtCore/QList>
#include <QtCore/QByteArray>

QT_FORWARD_DECLARE_CLASS(QWebSocketServer)
QT_FORWARD_DECLARE_CLASS(QWebSocket)

class WebServer : public QObject
{
    Q_OBJECT
public:
    explicit WebServer(quint16 port, bool debug = false);
    ~WebServer();

Q_SIGNALS:
    void closed();

private Q_SLOTS:
    void onNewConnection();
    void receiveTextData(QString message);
    void receiveBinaryData(QByteArray message);
    void socketDisconnected();
signals:
    void signal_RecvWSNewMessage(QWebSocket* client, QString strMsg);
    void signal_DisconnectedDevice(QWebSocket* client);
private:
    QWebSocketServer *m_pWebSocketServer;
    QList<QWebSocket *> m_clients;
    bool m_debug;
};

#endif //WEBSERVER_H
