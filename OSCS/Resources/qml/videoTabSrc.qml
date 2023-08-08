import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0
import QtMultimedia 5.14
import VLCQt 1.1
import '.'

Item {
    id: root
    property int toolBarsWidth: width * 0.1    
    //property var urlModel: ["rtmp://localhost/live/test", "rtmp://10.10.17.253/live/test", "rtmp://10.10.17.253/live/test1"]
    property var urlModel: controllerAdapter.getVideoUrls().split(" ");
    RowLayout {
        anchors.fill: parent
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20
        spacing: 20

        AvailableRobotsColumn {
            id: leftColumn
            implicitWidth:root.toolBarsWidth
            width: implicitWidth
            Layout.fillHeight:true
        }

        Rectangle {            
            id: centerColumn
            color: "#000000"
            radius: 16
            Layout.fillHeight: true
            Layout.fillWidth: true
            Grid{
                id: grid
                anchors.margins: 16
                columns: applicationRoot.selectedCamViews
                rows:  applicationRoot.selectedCamViews
                anchors.fill: parent
                Repeater {
                    model: applicationRoot.selectedCamViews                    
                    Repeater {                        
                        property int rowIdx: index
                        model: applicationRoot.selectedCamViews
                        VlcVideoOutput {
                            id: video                            
                            width : grid.width/applicationRoot.selectedCamViews
                            height : grid.height/applicationRoot.selectedCamViews
                            source: VlcPlayer {
                                url: rowIdx * applicationRoot.selectedCamViews + index < urlModel.length ? urlModel[rowIdx * applicationRoot.selectedCamViews + index] : ""
                                //Component.onCompleted: cameraManager.setVideoPlayerParam(this);
                                Component.onCompleted: console.log(urlModel)
                                onUrlChanged:console.log("url", url)
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    /*if(video.playbackState == MediaPlayer.PlayingState)
                                        video.pause()
                                    else
                                        video.play()*/
                                }
                            }
                        }
                    }
                }
            }
        }

        RobotsStatusColumn {
            id: rightColumn
            implicitWidth:root.toolBarsWidth
            width: implicitWidth
            Layout.fillHeight:true
            onShowMessagesDialog: infoDialog.visible = true
        }
    }

    ServerMessagesDialog {
        id: infoDialog
        anchors.fill: parent
        visible: false
    }
}
