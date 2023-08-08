import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0
import QtMultimedia 5.14
import '.'

Item {
    id: root
    property int toolBarsWidth: width * 0.1
    property int pageSpacing: 20
    RowLayout {
        anchors.fill: parent
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20
        spacing: 20

        Item {
            id: leftColumn
            implicitWidth:root.toolBarsWidth
            width: implicitWidth
            Layout.fillHeight:true

            ServerStatusColumn {
                id: messagesColumn
                width: parent.width
                height: parent.height * 0.3
            }

            Rectangle {
                id: spacer0
                x: 0
                y: parent.height * 0.3 + 5
                width: parent.width
                height: 20
                opacity: 1
                color: "#F2F2F2"
                radius: 16
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    Text {
                        text: qsTr("控制使能")
                        font.pixelSize: 16
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: "transparent"
                    }
                    Switch {
                        id: control
                        checked: true
                        background: Rectangle {
                            anchors.fill: parent
                            visible: false
                        }
                        indicator: Rectangle {
                            implicitWidth: 48
                            implicitHeight: 13
                            x: control.width - width - control.rightPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: control.checked ? "#224CAE" : "transparent"
                            border.color: "#cccccc"

                            Rectangle {
                                x: control.checked ? parent.width - width : 0
                                y: (parent.height - height) / 2
                                width: 26
                                height: 26
                                radius: 13
                                color: "#558CEC"
                            }
                        }
                    }
                }
            }

            /////////////////////////////////////////////////
            CmdBtn {
                x: parent.x + 5
                y: parent.height * 0.35 + 5
                width: parent.width
                height: parent.height * 0.15
            }
            /////////////////////////////////////////////////

            JoyStick {
                x: 0
                y: parent.height * 0.55 + 5
                width: parent.width
                height: parent.height * 0.43
                onJoystick_moved:function(x, y){
                    console.log(x, y);
                }
                onControl_released: function(btn){
                    if(btn === 0) robotsManager.onChangeCommandState(8)
                    else if(btn === 1) robotsManager.onChangeCommandState(10)
                    else if(btn === 2) robotsManager.onChangeCommandState(11)
                    else robotsManager.onChangeCommandState(9)
                }
            }
        }

        Rectangle {
            id: centerColumn
            color: "#000000"
            radius: 16
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image {
                id: image
                anchors.fill: parent
                source: "qrc:/Resources/images/Picture21.png"
                fillMode: Image.Stretch
            }
        }

        Item {
            id: rightColumn
            implicitWidth:root.toolBarsWidth
            width: implicitWidth
            Layout.fillHeight:true

            SensorInfoColumn {
                id: messagesColumn1
                width: parent.width
                height: parent.height * 0.35
            }

            Rectangle {
                id: spacer
                x: 0
                y: messagesColumn1.height + pageSpacing
                width: parent.width
                height: (parent.height * 0.086) - (2 * pageSpacing)
                color: "transparent"
            }

            /////////////////////////////////////////////////
            CmdBtnRight {
                x: 0
                y: parent.height * 0.35 + 5
                width: parent.width
                height: parent.height * 0.15
            }
            /////////////////////////////////////////////////
            AlphabetJoyStick {// desigin is not unstable. this contain two controller
                x: 0
                y: parent.height * 0.55 + 5
                width: parent.width
                height: parent.height * 0.42
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
