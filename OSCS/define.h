#ifndef DEFINE_H
#define DEFINE_H

#include <QtCore>

#define MAX_SENSOR_DATA_CNT         10
struct _stClientData
{
    Q_GADGET
public:
    QString strTitle;
    QString strValue;
    QString strFgColor;
    Q_PROPERTY(QString title MEMBER strTitle)
    Q_PROPERTY(QString value MEMBER strValue)
    Q_PROPERTY(QString fgcolor MEMBER strFgColor)
};
Q_DECLARE_METATYPE(_stClientData);
#endif // DEFINE_H
