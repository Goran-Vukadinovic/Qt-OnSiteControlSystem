import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Item {
    id: root

    TabBar {
        id: bar
        width: parent.width * 0.3
        TabButton {
            id : videoTab
            contentItem: Rectangle {
                anchors.fill: parent
                anchors.margins: 10
                color: "transparent"
                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Image {
                        source: videoTab.checked ? "qrc:/Resources/images/cam-active.png" : "qrc:/Resources/images/cam-inactive.png"
                        Layout.fillHeight: true
                        width: 10
                        fillMode: Image.PreserveAspectFit
                        anchors.margins: 10
                        verticalAlignment: Image.AlignVCenter
                        horizontalAlignment: Image.AlignHCenter
                        Layout.maximumWidth: 20
                        Layout.maximumHeight: 20
                    }
                    Text {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text: qsTr("预览")
                        opacity: enabled ? 1.0 : 0.3
                        color: videoTab.checked ? "#333333" : "#828282"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        font.pixelSize: 22
                    }
                }
            }

            background: Rectangle {
                implicitWidth: 300
                implicitHeight: 2
                height: 2
                width: parent.width * 0.7
                opacity: enabled ? 1 : 0.3
                border.color: "transparent"
                color: "#224CAE"
                radius: 1
                visible: videoTab.checked
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        TabButton {
            id: settingTab
            contentItem: Rectangle {
                anchors.fill: parent
                anchors.margins: 10
                color: "transparent"
                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Image {
                        source: settingTab.checked ? "qrc:/Resources/images/gear-active.png" : "qrc:/Resources/images/gear-inactive.png"
                        Layout.fillHeight: true
                        width: 10
                        fillMode: Image.PreserveAspectFit
                        anchors.margins: 10
                        verticalAlignment: Image.AlignVCenter
                        horizontalAlignment: Image.AlignHCenter
                        Layout.maximumWidth: 20
                        Layout.maximumHeight: 20
                    }
                    Text {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text: qsTr("配置")
                        opacity: enabled ? 1.0 : 0.3
                        color: settingTab.checked ? "#333333" : "#828282"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        font.pixelSize: 22
                    }
                }
            }

            background: Rectangle {
                implicitWidth: 300
                implicitHeight: 2
                height: 2
                width: parent.width * 0.7
                opacity: enabled ? 1 : 0.3
                border.color: "transparent"
                color: "#224CAE"
                radius: 1
                visible: settingTab.checked
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        TabButton {
            id: profileTab
            contentItem: Text {
                text: qsTr("系统")
                opacity: enabled ? 1.0 : 0.3
                color: profileTab.checked ? "#333333" : "#828282"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.pixelSize: 22
            }
            /*contentItem: Rectangle {
                anchors.fill: parent
                anchors.margins: 10
                color: "transparent"
                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Image {
                        source: profileTab.checked ? "qrc:/Resources/images/person-active.png" : "qrc:/Resources/images/person-inactive.png"
                        Layout.fillHeight: true
                        width: 10
                        fillMode: Image.PreserveAspectFit
                        anchors.margins: 10
                        verticalAlignment: Image.AlignVCenter
                        horizontalAlignment: Image.AlignHCenter
                        Layout.maximumWidth: 20
                        Layout.maximumHeight: 20
                    }
                    Text {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text: qsTr("系统")
                        opacity: enabled ? 1.0 : 0.3
                        color: profileTab.checked ? "#333333" : "#828282"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        font.pixelSize: 22
                    }
                }
            }*/

            background: Rectangle {
                implicitWidth: 300
                implicitHeight: 2
                height: 2
                width: parent.width * 0.7
                opacity: enabled ? 1 : 0.3
                border.color: "transparent"
                color: "#224CAE"
                radius: 1
                visible: profileTab.checked
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        onCurrentIndexChanged:{
            switch(currentIndex) {
            case 0:
                centerPageLoader.setSource("qrc:/Resources/qml/videoTabSrc.qml")
                break;
            case 1:
                centerPageLoader.setSource("qrc:/Resources/qml/profileTabSrc.qml")
                break;
            case 2:
                centerPageLoader.setSource("qrc:/Resources/qml/settingTabSrc.qml")
                break;
            default:
                break;
            }
        }
    }

    Rectangle {
        width: parent.width
        anchors.top: bar.bottom
        height: 1
        color: "#828282"
        opacity: 0.5
    }

    Loader {
        id: centerPageLoader
        width: parent.width
        height: parent.height - bar.height
        x: 0
        y: bar.height
        source: "qrc:/Resources/qml/videoTabSrc.qml"
    }
}
