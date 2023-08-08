import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Item {
    id: root
    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.7
    }

    ListModel {
        id: messagesModel
        ListElement {
            sample: "qrc:/Resources/images/info.png"
            title: qsTr("消息1")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息...")
        }
        ListElement {
            sample: "qrc:/Resources/images/warning.png"
            title: qsTr("消息2")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息...")
        }
        ListElement {
            sample: "qrc:/Resources/images/ok.png"
            title: qsTr("消息3")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息...")
        }
        ListElement {
            sample: "qrc:/Resources/images/info.png"
            title: qsTr("消息1")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息...")
        }
        ListElement {
            sample: "qrc:/Resources/images/warning.png"
            title: qsTr("消息2")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息...")
        }
        ListElement {
            sample: "qrc:/Resources/images/ok.png"
            title: qsTr("消息3")
            body: qsTr("消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息消息内容消息内容消息内容消息内容消息内容消息内容消息.内容消息内容消息...")
        }
    }

    Rectangle {
        width: parent.width * 0.5
        height: parent.height * 0.6
        anchors.centerIn: parent
        color: "#ffffff"
        radius: 16
        ColumnLayout {
            width: parent.width
            height: parent.height

            ListView {
                id: robotsList
                Layout.fillHeight: true
                Layout.fillWidth: true
                width: parent.width
                model: messagesModel
                focus: true
                clip: true
                spacing: 10
                delegate: Rectangle {
                    width: robotsList.width
                    height: robotsList.height / 4
                    color: "transparent"
                    border.color:  "transparent"
                    radius: 16
                    smooth: true
                    GridLayout {
                        anchors.fill: parent
                        anchors.margins: 20
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
                            Layout.fillWidth: true
                            font.bold: true
                            font.pointSize: 18
                        }

                        Rectangle {
                            width: 10
                            height: 10
                            color: "transparent"
                        }
                        Label {
                            text: body
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            font.pointSize: 14
                        }
                        rows: 2
                        columns: 2
                        Layout.preferredHeight: 75
                    }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.visible = false
    }
}
