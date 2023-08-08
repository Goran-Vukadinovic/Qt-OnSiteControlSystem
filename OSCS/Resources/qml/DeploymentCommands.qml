import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Rectangle {
    opacity: 1
    color: "#F2F2F2"
    radius: 16

    ListModel {
        id: deploymentModel
        ListElement {
            body: qsTr("移动至A点；")
        }
        ListElement {
            body: qsTr("移动至B点；")
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        RowLayout {
            width: parent.width
            height: 30
            spacing: 5
            Text {
                text: qsTr("作战部署")
                font.pixelSize: 16
                font.bold: true
            }
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "transparent"
            }
            Image {
                id: name
                source: "qrc:/Resources/images/add.png"
                height: 30
                width: 30
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("deployment command added")
                }
            }
            Text {
                text: qsTr("添加移动点")
                font.pixelSize: 16
                color: "#224CAE"
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("deployment command added")
                }
            }
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#828282"
            opacity: 0.5
        }

        ListView {
            id: robotsList
            Layout.fillHeight: true
            width: parent.width
            model: deploymentModel
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
                Text {
                    anchors.fill: parent
                    text: index+ '. ' + body
                    font.pixelSize: 16
                }
            }
        }
        Rectangle {
            width: parent.width
            height: 1
            color: "#828282"
            opacity: 0.5
        }

        DeploymentButtons {
            width: parent.width
            height: 30
        }
    }
}
