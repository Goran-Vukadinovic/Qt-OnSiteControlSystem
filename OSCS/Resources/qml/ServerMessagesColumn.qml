import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Rectangle {
    id: root
    opacity: 1
    color: "#F2F2F2"
    radius: 16
    signal showMessagesDialog()

    ListModel {
        id: messagesModel
        /*
        ListElement {
            sample: "qrc:/Resources/images/info.png"
            title: qsTr("消息1")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容")
        }
        ListElement {
            sample: "qrc:/Resources/images/warning.png"
            title: qsTr("消息2")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容")
        }
        ListElement {
            sample: "qrc:/Resources/images/ok.png"
            title: qsTr("消息3")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容")
        }
        ListElement {
            sample: "qrc:/Resources/images/info.png"
            title: qsTr("消息4")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容")
        }
        ListElement {
            sample: "qrc:/Resources/images/warning.png"
            title: qsTr("消息2")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容")
        }
        ListElement {
            sample: "qrc:/Resources/images/ok.png"
            title: qsTr("消息3")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容")
        }
        */
    }
    Connections{
        target: robotsManager
        function addModel(sensor){
            if(!sensor) return;
            for(var i = 0 ; i < sensor.length ; i++){
                var modelData = {
                    sample:"qrc:/Resources/images/info.png",
                    title:sensor[i].title,
                    body:sensor[i].value
                }
                messagesModel.append(modelData);
            }
        }

        function onChangeCurrentRobotDevice(nIdx, strData){
            messagesModel.clear();
            var data= JSON.parse(strData);
            var sensor1 = data.sensor1;
            var sensor2 = data.sensor2;
            addModel(sensor1);
            addModel(sensor2);
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        ListView {
            id: robotsList
            Layout.fillHeight: true
            width: parent.width
            model: messagesModel
            focus: true
            clip: true
            spacing: 10
            delegate: Rectangle {
                width: robotsList.width                
                height: gridlayout.height
                color: "transparent"
                border.color:  "transparent"
                radius: 16
                smooth: true
                GridLayout {
                    width: parent.width
                    id:gridlayout
                    rows: 2
                    columns: 2                    
                    Image {
                        source: sample
                        Layout.preferredWidth: 20
                        Layout.preferredHeight: 20
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        text: title
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter                        
                        font.bold: true
                        font.pointSize: 14
                    }

                    Rectangle {
                        width: 10
                        color: "transparent"
                    }
                    Label {
                        Layout.fillWidth: true
                        Layout.maximumWidth: parent.width - 15
                        text: body
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Label.WrapAnywhere
                        font.pointSize: 12
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.showMessagesDialog()
                }
            }
        }
    }
}
