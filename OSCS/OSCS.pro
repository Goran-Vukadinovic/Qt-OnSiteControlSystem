QT       += core qml quick network concurrent websockets widgets

CONFIG += c++17 static

TARGET = oscs
TEMPLATE = app

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    cameraSDK/cameramanager.cpp \
    controlleradapter.cpp \
    joystick/Joystick.c \
    joystick/joysticmanager.cpp \
    joystick/listop.c \
    main.cpp \
    robotdevice.cpp \
    robotsmanager.cpp \
    server/cmdpacket.cpp \
    server/tcpserver.cpp \
    server/webserver.cpp

HEADERS += \
    cameraSDK/HCNetSDK.h \
    cameraSDK/cameramanager.h \
    controlleradapter.h \
    define.h \
    joystick/joystickmanager.h \
    joystick/listop.h \
    main.h \
    robotdevice.h \
    robotsmanager.h \
    server/cmdpacket.h \
    server/tcpserver.h \
    server/webserver.h

TRANSLATIONS += \
    OSCS_zh_CN.ts
CONFIG += lrelease
CONFIG += embed_translations

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    resources.qrc

DISTFILES += \
    Draft.txt

contains(QT_ARCH, i386){
    message("32bit build")
} else {
    message("64bit build")
}

INCLUDEPATH += $$PWD/../VLC-Qt_1.1.0/include
win32 {   
    contains(QT_ARCH, i386){
        ## Windows x86 (32bit) specific build here
        LIBS += -L$$PWD/../VLC-Qt_1.1.0/win32/ -lVLCQtCore -lVLCQtQml
    } else {
        ## Windows x64 (64bit) specific build here
        LIBS += -L$$PWD/../VLC-Qt_1.1.0/win64/ -lVLCQtCore -lVLCQtQml
    }
}

unix {
    LIBS += -L$$PWD/../VLC-Qt_1.1.0/linux64/ -lVLCQtCore -lVLCQtQml
}



INCLUDEPATH += $$PWD/../CameraSDK
DEPENDPATH += $$PWD/../CameraSDK

win32 {
    contains(QT_ARCH, i386){
        ## Windows x86 (32bit) specific build here
        LIBS += -L$$PWD/../CameraSDK/win32/ -lHCNetSDK
    } else {        
        ## Windows x64 (64bit) specific build here
        LIBS += -L$$PWD/../CameraSDK/win64/ -lHCNetSDK
    }
}

unix {
    LIBS += -L$$PWD/../CameraSDK/linux64/ -lhcnetsdk
    QML_IMPORT_PATH += /usr/local/qml
}

