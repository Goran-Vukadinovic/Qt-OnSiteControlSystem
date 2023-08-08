#ifndef ROBOTDEVICE_H
#define ROBOTDEVICE_H
#include <QtCore>
#include <QWebSocket>
#include <QTcpSocket>
#include "./server/cmdpacket.h"
#include "define.h"


class RobotDevice : public QObject
{
    Q_OBJECT
public:
    RobotDevice(QString strSN);

    void SetWebSocket(QWebSocket* pWS);
    void SetControlSocket(QTcpSocket* pCS);

    QWebSocket* GetWebSocket();
    QTcpSocket* GetControlSocket();

    QString GetSN(){return m_strSN;};
    void SetRobotWebsocketState(QString strData);
    QString GetRobotWebsocketState();
    void SetRobotControlState(_CmdPacketBody cmdState);
    _CmdPacketBody GetRobotControlState();
    void onChangeCommandState(int cmd);

private:
    QString m_strSN;
    int     m_nVID;
    int     m_nPID;
    QString m_nMID;
    QString m_strRobotHW;
    QString m_strRobotSW;
    QString m_strMonitorHW;
    QString m_strMonitorSW;

    QString m_aryCameraNames[4];
    QString m_strRealtimeInfo;
    QString m_strRealtimeWarnning;
    QString m_strRealtimeException;

    QWebSocket* m_webSocket;
    QTcpSocket* m_controlSocket;

    QString m_strRobotState;
    _CmdPacketBody m_RobotCmdState;



};

#endif // ROBOTDEVICE_H
