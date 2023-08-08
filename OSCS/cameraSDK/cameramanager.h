#ifndef CAMERAMANAGER_H
#define CAMERAMANAGER_H

#include <QtCore/QObject>
#include <QWindow>
#include <QQuickItem>
#include "HCNetSDK.h"
#include <VLCQtQml/QmlPlayer.h>

typedef struct STRU_CHANNEL_INFO
{
    char    chChanName[40];     //通道名称
    int		iChanIndex;			//监控通道号 = 数组索引+startchan
    int		iPicResolution;				//图片分辨率
    int		iPicQuality;				//图片质量
    char	chAccessChanIP[16];     //ip接入通道的ip地址
    BOOL    bEnable;              //是否有效
    NET_DVR_DECODERCFG_V30  struDecodercfg;   //通道的解码器信息
    STRU_CHANNEL_INFO()
    {
        chChanName[0] = '\0';
        iChanIndex = -1;
        iPicResolution = 0;
        iPicQuality = 2;
        chAccessChanIP[0] = '\0';
        bEnable = FALSE;
    }
}CHANNEL_INFO, * pCHANNEL_INFO;

typedef struct STRU_DEVICE_INFO
{

    LONG    lLoginID;
    int		iDeviceChanNum;		    //设备的通道数
    int		iStartChan;				//设备开始通道号
    int 	iIPChanNum;				//最大数字通道个数
    int 	iIPStartChan;			//数字通道起始通道号
    int		iEnableChanNum;			//有效通道数
    BOOL    bIPRet;                 //是否支持ip接入

    CHANNEL_INFO struChanInfo[MAX_CHANNUM_V30];


    STRU_DEVICE_INFO()
    {
        lLoginID = -1;
        iDeviceChanNum = -1;
        iStartChan = 0;
        iIPChanNum = 0;
        iEnableChanNum = -1;
        bIPRet = FALSE;
    }
}LOCAL_DEVICE_INFO, * pLOCAL_DEVICE_INFO;

class CameraManager : public QObject
{
    Q_OBJECT
public:
    explicit CameraManager();
    ~CameraManager();

    BOOL readSetting();
    BOOL DoLogin();
    void DoGetDeviceResoureCfg();
    void StartPlay(int iChanIndex);
    void StopPlay();    
    bool PTZControlAll(LONG lRealHandle, DWORD dwPTZCommand, DWORD dwStop, int Speed);

public Q_SLOTS:
    void setCameraViewer(QQuickItem* viewer);
    void resetCameraViewer(QQuickItem* viewer);

    void onCameraViewSizeChanged(QQuickItem* viewer);
    void onCameraControl(float x, float y);
    void onCameraZoom(bool isStart, int mode);
    //void setVideoPlayerParam(VlcQmlPlayer *player);

private:
    QWindow* m_pCameraViewParent;
    QWindow* m_pCameraView;


public slots:

signals:
    void signal_status(QString st_val);

private:
    QString m_csDeviceIp;
    UINT m_nDevPort;
    QString m_csUser;
    QString m_csPWD;

    LOCAL_DEVICE_INFO m_struDeviceInfo;

    BOOL m_bIsLogin;
    BOOL m_bIsPlaying;
    LONG m_lPlayHandle;
    DWORD m_dwPrevCmd;

private:
    void ShowStatus(QString strStatus);

};


#endif // CAMERAMANAGER_H


