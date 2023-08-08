import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    opacity: 1
    color: "#F2F2F2"
    radius: 16
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        Rectangle {
            width: parent.width
            height: 20
            color: "transparent"
            Image {
                fillMode: Image.PreserveAspectFit
                source: "qrc:/Resources/images/up-arrow.png"
                anchors.centerIn: parent
                height: 20
                width: 20
                sourceSize.width: width
                sourceSize.height: height
            }
            MouseArea {
                anchors.fill: parent
                onClicked: robotsList.decrementCurrentIndex()
            }
        }

        ListModel {
            id: robotsModel
            /*
            ListElement {
                sample: "qrc:/Resources/images/robot1.png"
                body: qsTr("千度耐高温消防机器人")
                sn:"dddddddddddd1"
                connected:true,
                lastData:""
            }
            */
        }

        ListView {
            id: robotsList
            Layout.fillHeight: true
            width: parent.width
            model: robotsModel
            focus: true
            clip: true
            spacing: 10
            delegate: Rectangle {
                width: robotsList.width
                height: robotImage.height + robotInfo.height + 40
                color: "transparent"
                border.color: index === robotsList.currentIndex ? "blue" : "transparent"
                border.width: 1.0
                radius: 16
                smooth: true
                Column {
                    anchors.fill: parent
                    Image {
                        id: robotImage
                        fillMode: Image.PreserveAspectFit
                        source: sample
                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter
                        width: parent.width
                        smooth: true
                        height: width
                        Colorize {
                            anchors.fill: parent
                            source: parent
                            lightness: connected ? 0 : -0.5
                        }
                    }

                    Text {
                        id: robotInfo
                        text: body
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width: parent.width
                        anchors.margins: 20
                        font.pixelSize: 16
                    }

                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: robotsList.currentIndex = index;
                }
            }
            onCurrentIndexChanged: {
                console.log("plantPicView index:"+currentIndex)
                robotsManager.onChangeSelectedDevice(currentIndex)
                robotsManager.changeCurrentRobotDevice(currentIndex, robotsModel.get(currentIndex).lastData)
            }
        }
        Rectangle {
            width: parent.width
            height: 20
            color: "transparent"
            Image {
                fillMode: Image.PreserveAspectFit
                source: "qrc:/Resources/images/down-arrow.png"
                anchors.centerIn: parent
                height: 20
                width: 20
                sourceSize.width: width
                sourceSize.height: height
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    robotsList.incrementCurrentIndex()
                    controllerAdapter.onClickTest();
                }
            }
        }
        Connections {
            target: controllerAdapter
            function onDeviceConnected(info){}
            function onDeviceDisconnected(info){}
        }
        Connections {
            target: robotsManager
            function onRecvWSData(strData){
                var data= JSON.parse(strData);
                var bUpdated = false;
                console.log("onDeviceConnected", data.SN);
                var ii = -1;
                for(var i = 0 ; i < robotsModel.count ; i++)
                {
                    if(robotsModel.get(i).sn === data.SN)
                    {
                        robotsModel.get(i).lastData = strData;
                        robotsModel.get(i).connected = true;
                        bUpdated = true;
                        ii = i;
                        break;
                    }
                }
                if(!bUpdated){
                    var robotData = {
                        sample: "qrc:/Resources/images/robot1.png",
                        body: qsTr(data.SN),
                        sn:data.SN,
                        connected:true,
                        lastData:strData
                    };
                    robotsModel.append(robotData);
                }
                else{
                    var idx = robotsList.currentIndex;
                    if(ii === idx){
                        robotsManager.changeCurrentRobotDevice(idx, robotsModel.get(idx).lastData)
                    }
                }
            }
            function onDeviceDisconnected(strSN){
                for(var i = 0 ; i < robotsModel.count ; i++)
                {
                    if(robotsModel.get(i).sn === strSN)
                    {
                        console.log("onDeviceDisconnected", strSN);
                        robotsModel.get(i).connected = false;
                        break;
                    }
                }
            }
        }
    }

}
