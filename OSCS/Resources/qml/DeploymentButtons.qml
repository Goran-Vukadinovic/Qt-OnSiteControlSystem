import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Item {
    id: root
    RowLayout {
        anchors.fill: parent
        spacing: (parent.width - (button1.width * 3))/2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Button {
            id: button1
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 80
            background: Rectangle {
                color: "transparent"
                radius: 10
                border.width: 2
                border.color: "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: "#333333"
                text: qsTr("完成部署")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                textFormat: Text.AutoText
            }
        }

        Button {
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 80
            background: Rectangle {
                color: "transparent"
                radius: 10
                border.width: 2
                border.color: "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: "#333333"
                text: qsTr("执行部署")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                textFormat: Text.AutoText
            }
        }

        Button {
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 80
            background: Rectangle {
                color: "transparent"
                radius: 10
                border.width: 2
                border.color: "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: "#333333"
                text: qsTr("取消部署")
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                textFormat: Text.AutoText
            }
        }
    }
}
