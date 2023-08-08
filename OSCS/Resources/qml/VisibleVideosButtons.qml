import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Item {
    id: root
    RowLayout {
        anchors.fill: parent
        spacing: (parent.width - (button1.width * 4))/3
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Button {
            id: button1
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            background: Rectangle {
                color: applicationRoot.selectedCamViews === 1 ? "#224CAE" : "#FFFFFF"
                radius: 10
                border.color: applicationRoot.selectedCamViews === 1 ? "#00000000" : "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: applicationRoot.selectedCamViews === 1 ? "#ffffff" : "#000000"
                text: qsTr("1")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                textFormat: Text.AutoText
            }
            onClicked: {
                applicationRoot.selectedCamViews = 1
            }
        }

        Button {
            id: button3
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            background: Rectangle {
                color: applicationRoot.selectedCamViews === 2 ? "#224CAE" : "#FFFFFF"
                radius: 10
                border.color: applicationRoot.selectedCamViews === 2 ? "#00000000" : "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: applicationRoot.selectedCamViews === 2 ? "#ffffff" : "#000000"
                text: qsTr("4")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                textFormat: Text.AutoText
            }
            onClicked: {
                applicationRoot.selectedCamViews = 2
            }
        }

        Button {
            id: button2
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            background: Rectangle {
                color: applicationRoot.selectedCamViews === 3 ? "#224CAE" : "#FFFFFF"
                radius: 10
                border.color: applicationRoot.selectedCamViews === 3 ? "#00000000" : "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: applicationRoot.selectedCamViews === 3 ? "#ffffff" : "#000000"
                text: qsTr("9")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                textFormat: Text.AutoText
            }
            onClicked: {
                applicationRoot.selectedCamViews = 3
            }
        }

        Button {
            id: button4
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            background: Rectangle {
                color: applicationRoot.selectedCamViews === 4 ? "#224CAE" : "#FFFFFF"
                radius: 10
                border.color: applicationRoot.selectedCamViews === 4 ? "#00000000" : "#333333"
                anchors.fill: parent
            }
            contentItem: Text {
                color: applicationRoot.selectedCamViews === 4 ? "#ffffff" : "#000000"
                text: qsTr("16")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Arial"
                font.weight: Font.Bold
                smooth: true
                font.styleName: "Bold"
                textFormat: Text.AutoText
            }
            onClicked: {
                applicationRoot.selectedCamViews = 4
            }
        }
    }
}
