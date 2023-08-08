
#ifndef CONTROLLERADAPTER_H
#define CONTROLLERADAPTER_H


#include <QObject>
#include <QWindow>
#include "define.h"

class ControllerAdapter : public QObject
{
    Q_OBJECT
public:
    explicit ControllerAdapter(QObject *parent = nullptr);

public slots:
    void onClickLoginButton(QString strId, QString strPwd);
    void onClickCmdButton(int cmdID, int param);
    void onClickTest();
    QString getVideoUrls(){return m_strVideoUrls;};
signals:
    void userLogin(const bool success);
    void deviceConnected(_stClientData info);
    void deviceDisconnected(_stClientData info);
    void signal_status(QString st_val);

public:
    void SetVideoUrls(QString* aryUrls, int nCount = 16);
private:
    QString m_strVideoUrls;
};

bool requestLogin(QString id, QString pwd, QString & errMsg);
void requestLogoff();

#endif // CONTROLLERADAPTER_H
