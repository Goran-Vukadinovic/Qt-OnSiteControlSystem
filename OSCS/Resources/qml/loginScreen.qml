import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
Rectangle {
    id: rectangle
    color: "#224cae"

    RowLayout {
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        spacing: 0

        Rectangle {
                color: 'transparent'
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 10
            }

        Rectangle {
            id: rectangle1
            width: 715
            height: 722
            color: "transparent"
            border.color: "white"
            border.width: 1.0
            radius: 15
            ColumnLayout{
                spacing: 0
                anchors.fill: parent
                Image {
                    id: image
                    source: "qrc:/Resources/images/login_logo.png"
                    fillMode: Image.PreserveAspectFit
                    width: 368
                    height: 107
                    Layout.alignment: Qt.AlignCenter
                }
                Label {
                    id: label
                    width: 80
                    height: 29
                    text: qsTr("账号")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pixelSize: 28
                    Layout.leftMargin:80
                }
                TextField {
                    id: txtId
                    Layout.minimumWidth: 568
                    Layout.minimumHeight: 46
                    text: qsTr("WX62785354")
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignLeft
                    leftPadding: 0
                    topPadding: 6
                    color: "white"
                    background: Rectangle {
                        anchors.bottom: parent.bottom
                        color: "white"
                        height: 1
                        width: parent.width
                    }
                    Layout.leftMargin:80
                }
                Label {
                    id: label1
                    width: 80
                    height: 29
                    text: qsTr("密码")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pixelSize: 28
                    Layout.leftMargin:80
                }
                TextField {
                    id: txtPwd
                    Layout.minimumWidth: 568
                    Layout.minimumHeight: 43
                    text: qsTr("Password")
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignLeft
                    topPadding: 6
                    leftPadding: 0
                    echoMode: TextInput.Password
                    color: "white"
                    Layout.leftMargin:80
                    background: Rectangle {
                        width: parent.width
                        height: 1
                        color: "#ffffff"
                        anchors.bottom: parent.bottom
                    }

                    Image {
                        id: image1
                        x: 539
                        y: 8
                        width: 29
                        height: 28
                        source: "qrc:/Resources/images/view.png"
                        fillMode: Image.PreserveAspectFit
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: console.log("user clicked view")
                        }
                    }
                }
                Slider {
                        id: captcha
                        Layout.leftMargin:80
                        Layout.minimumWidth: 568
                        Layout.minimumHeight: 48
                        live: true
                        value: 0
                        background: Rectangle {
                            x: captcha.leftPadding
                            y: captcha.topPadding + captcha.availableHeight / 2 - height / 2
                            implicitWidth: 200
                            implicitHeight: 48
                            width: captcha.availableWidth
                            height: implicitHeight
                            opacity: 0.1
                            color: "#ffffff"
                            radius: 10
                        }

                        Text {
                            anchors.fill: parent
                            color: "#ffffff"
                            text: qsTr("请按住滑块，拖动到最右端")
                            font.pixelSize: 20
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter
                            font.bold: true
                        }

                        handle: Rectangle {
                            x: captcha.leftPadding + captcha.visualPosition * (captcha.availableWidth - width)
                            y: captcha.topPadding + captcha.availableHeight / 2 - height / 2
                            implicitWidth: 56
                            implicitHeight: 56
                            color: captcha.pressed ? "#f0f0f0" : "#f6f6f6"
                            border.color: "transparent"
                            radius: 10
                            gradient: Gradient {
                                GradientStop {
                                    position: 0.0414
                                    color: "#558cec"
                                }

                                GradientStop {
                                    position: 0.9435
                                    color: "#6fcf97"
                                }
                            }
                            Text {
                                anchors.fill: parent
                                color: "#ffffff"
                                text: qsTr(">>")
                                elide: Text.ElideRight
                                font.pixelSize: 28
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.family: "Arial"
                                textFormat: Text.AutoText
                                font.styleName: "Bold"
                                baselineOffset: 33
                                font.bold: true
                                font.weight: Font.ExtraBold
                                smooth: true
                            }
                        }
                    }
                RowLayout{
                    Layout.leftMargin:40
                    spacing: 180
                    Button {
                        id: button2
                        Layout.minimumWidth: 138
                        Layout.minimumHeight: 51
                        Layout.leftMargin:80
                        background: Rectangle {
                            color: "#00000000"
                            radius: 30
                            border.color: "#ffffff"
                            border.width: 1
                            anchors.fill: parent
                        }
                        contentItem: Text {
                            color: "#ffffff"
                            text: qsTr("取消")
                            elide: Text.ElideRight
                            font.pixelSize: 28
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                        }
                    }
                    Button {
                        id: loginButton
                        Layout.minimumWidth: 138
                        Layout.minimumHeight: 51
                        background: Rectangle {
                            color: "#333333"
                            radius: 30
                            anchors.fill: parent
                        }
                        contentItem: Text {
                            color: "#ffffff"
                            text: qsTr("登录")
                            elide: Text.ElideRight
                            font.pixelSize: 28
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                        }
                        onClicked: {
                            console.log("login button clicked")
                            if(captcha.value == 1.0){
                                //controllerAdapter.userLogin(true)
                                controllerAdapter.onClickLoginButton(txtId.text, txtPwd.text);
                            }
                            else
                                console.log("user try to login while captcha is not resolved",captcha.value)
                        }
                    }
                }
            }
        }
        Rectangle {
                color: 'transparent'
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 10
            }

    }
}
