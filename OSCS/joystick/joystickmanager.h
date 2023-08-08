#ifndef JOYSTICK_H
#define JOYSTICK_H

#include <QtCore/QObject>

typedef struct _axes_t {
    int x;
    int y;
} AXES_T;

class JoystickManager : public QObject
{
    Q_OBJECT
public:
    explicit JoystickManager(int interval);
    ~JoystickManager();

    unsigned int getJoystickBtnState();

public slots:
    void GetKeyInputState();

signals:
    void signal_buttonstate(int nCmd);


public:
    bool m_KeyInputInterval;

    unsigned int m_oldJoystickBtnState;
    AXES_T m_oldJoystickAxes_1;
    AXES_T m_oldJoystickAxes_2;

    unsigned int m_JoystickBtnState;
    AXES_T m_JoystickAxes_1;
    AXES_T m_JoystickAxes_2;
    int m_number_of_axes;
    int m_number_of_btns;
};


#endif // JOYSTICK_H


