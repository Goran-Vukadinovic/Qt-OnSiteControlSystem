import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0
import QtMultimedia 5.14
import '.'

Item {
    id: root
    property int toolBarsWidth: width * 0.15
    property int pageSpacing: 20
    ColumnLayout{
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 20
        RowLayout {
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 20

            Item {
                id: leftColumn
                implicitWidth:root.toolBarsWidth
                width: implicitWidth
                Layout.fillHeight:true

                DroneStatusColumn {
                    id: droneStatusColumn
                    width: parent.width
                    height: (parent.height - 2 * pageSpacing) * 0.3
                }

                JoyStickDrone {
                    id: joystick
                    x: 0
                    y: droneStatusColumn.height + pageSpacing
                    width: parent.width
                    height: (parent.height - 2 * pageSpacing) * 0.4
                    onJoystick_moved: function(x, y){
                        cameraManager.onCameraControl(x,y);
                    }
                    onJoystick_btn_pressed: function(btn){
                        if(btn === -1) return;
                        if(btn === 0) cameraManager.onCameraControl(0,1);
                        else if(btn === 1) cameraManager.onCameraControl(0,-1);
                        else if(btn === 2) cameraManager.onCameraControl(-1,0);
                        else if(btn === 3) cameraManager.onCameraControl(1,0);
                    }
                    onJoystick_btn_released: function(btn){
                        if(btn !== -1) cameraManager.onCameraControl(0,0);
                    }
                    onControl_pressed: function(btn){
                        if(btn === 0) cameraManager.onCameraZoom(true, 0);
                        else if(btn === 1) cameraManager.onCameraZoom(true, 1);
                    }
                    onControl_released: function(btn){
                        if(btn === 0) cameraManager.onCameraZoom(false, 0);
                        else if(btn === 1) cameraManager.onCameraZoom(false, 1);
                    }

                }

                DeploymentCommands {
                    id: spacer0
                    x: 0
                    y: joystick.y + joystick.height + pageSpacing
                    width: parent.width
                    height: (parent.height - 2 * pageSpacing) * 0.3
                }
            }

            Rectangle {
                id: rightColumn
                radius: 16
                Layout.fillHeight: true
                Layout.fillWidth: true
                border.color: "#FF0000"
                border.width: 2
                color: "#FF2222"
                Image {
                    objectName: "streamViewer"
                    id: image
                    anchors.fill: parent
                    source: "qrc:/Resources/images/Picture31.png"
                    fillMode: Image.Stretch                    
                }
                onXChanged: cameraManager.onCameraViewSizeChanged(this);
                onYChanged: cameraManager.onCameraViewSizeChanged(this);
                onWidthChanged: cameraManager.onCameraViewSizeChanged(this);
                onHeightChanged: cameraManager.onCameraViewSizeChanged(this);
            }
            Component.onCompleted: cameraManager.setCameraViewer(rightColumn);
            Component.onDestruction: cameraManager.resetCameraViewer(rightColumn);
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.maximumHeight: 20
            Layout.preferredHeight: 20
            Layout.minimumHeight: 20            
            border.color: "#333333"
            border.width: 1
            Text {
                anchors.leftMargin: 20
                id: txtStatus
                text: "this is status"
                anchors.fill: parent
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15
            }
            Connections {
                target: controllerAdapter
                function onSignal_status(st_val){
                    txtStatus.text = st_val;
                }
            }
            Connections {
                target: robotsManager
                function onSignal_status(st_val){
                    txtStatus.text = st_val;
                }
            }
            Connections {
                target: cameraManager
                function onSignal_status(st_val){
                    txtStatus.text = st_val;
                }
            }
        }
    }
}
