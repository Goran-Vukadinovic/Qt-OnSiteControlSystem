import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Item {
    id: root

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30
        ColumnLayout {
            Label {
                id: label
                color: "#828282"
                text: qsTr("账号")
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 29
                Layout.preferredWidth: 80
            }

            TextField {
                id: textInput
                color: "#828282"
                text: qsTr("62785354")
                font.pixelSize: 28
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                leftPadding: 0
                background: Rectangle {
                    width: parent.width
                    height: 1
                    color: "transparent"
                    anchors.bottom: parent.bottom
                }
                Layout.preferredHeight: 46
                topPadding: 6
                Layout.preferredWidth: 600
            }
        }

        ColumnLayout {
            Label {
                id: label1
                color: "#828282"
                text: qsTr("密码")
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 29
                Layout.preferredWidth: 80
            }

            TextField {
                id: textInput1
                color: "#333333"
                text: qsTr("************")
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                leftPadding: 0
                Image {
                    id: image1
                    anchors.right: parent.right
                    width: 29
                    height: 29
                    source: "qrc:/Resources/images/edit.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: console.log("user clicked edit 1")
                    }
                }
                background: Rectangle {
                    width: parent.width
                    height: 1
                    color: "#828282"
                    opacity: 0.5
                    anchors.bottom: parent.bottom
                }
                Layout.preferredHeight: 43
                topPadding: 6
                echoMode: TextInput.Password
                Layout.preferredWidth: 600
            }
        }

        ColumnLayout {
            Label {
                id: label2
                color: "#828282"
                text: qsTr("名称")
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 29
                Layout.preferredWidth: 80
            }

            TextField {
                id: textInput2
                color: "#333333"
                text: qsTr("蒋长洲")
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                leftPadding: 0
                Image {
                    anchors.right: parent.right
                    width: 29
                    height: 29
                    source: "qrc:/Resources/images/edit.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: console.log("user clicked edit 2")
                    }
                }
                background: Rectangle {
                    width: parent.width
                    height: 1
                    color: "#828282"
                    opacity: 0.5
                    anchors.bottom: parent.bottom
                }
                Layout.preferredHeight: 43
                topPadding: 6
                Layout.preferredWidth: 600
            }
        }

        ColumnLayout {
            Label {
                id: label3
                color: "#828282"
                text: qsTr("SN序列号")
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 29
                Layout.preferredWidth: 80
            }

            TextField {
                id: textInput3
                color: "#333333"
                text: qsTr("647B16825DA3C2352136E63DBFF75E34")
                font.pixelSize: 28
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                leftPadding: 0
                background: Rectangle {
                    width: parent.width
                    height: 1
                    color: "#828282"
                    opacity: 0.5
                    anchors.bottom: parent.bottom
                }
                Layout.preferredHeight: 46
                topPadding: 6
                Layout.preferredWidth: 600
            }
        }
    }
}
