import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Rectangle {
    opacity: 1
    color: "#F2F2F2"
    radius: 16

    ListModel {
        id: messagesModel
        ListElement {
            title: qsTr("环境温度")
            body: qsTr("928℃")
        }
        ListElement {
            title: qsTr("环境湿度")
            body: qsTr("35%RH")
        }
        ListElement {
            title: qsTr("环境压强")
            body: qsTr("0.1MPa")
        }
        ListElement {
            title: qsTr("PM10")
            body: qsTr("36")
        }
        ListElement {
            title: qsTr("氧气浓度")
            body: qsTr("36ppm")
        }
        ListElement {
            title: qsTr("氢气浓度")
            body: qsTr("36ppm")
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
                height: robotsList.height / 10
                color: "transparent"
                border.color:  "transparent"
                radius: 16
                smooth: true
                RowLayout {
                    anchors.fill: parent
                    Text {
                        text: title
                        font.pixelSize: 16
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: "transparent"
                    }
                    Text {
                        text: body
                        font.pixelSize: 16
                    }
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#828282"
                    opacity: 0.5
                    anchors.bottom: parent.bottom
                }
            }
        }
    }
}
