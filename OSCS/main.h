#ifndef MAIN_H
#define MAIN_H

#include <QtCore/QObject>
#include <QtQuick/QQuickView>


class ScreenManager : public QObject
{
    Q_OBJECT
public:
    explicit ScreenManager();
    ~ScreenManager();
    void initScreenTimer(int interval);

public slots:

signals:


public:

};
class MyEventFilterObject : public QObject
{
    Q_OBJECT

protected:
    bool eventFilter(QObject *obj, QEvent *event) override;
};




#endif // MAIN_H
