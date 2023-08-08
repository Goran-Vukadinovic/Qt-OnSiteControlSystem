import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Rectangle {
    id: commandbtn
    opacity: 1
    color: "#F2F2F2"
    radius: 16
    anchors.margins: 20
    property int _cmdState: 0
    function cmd_STATE_MASK(idx){
        if((_cmdState & (1<<idx)) > 0) return true;
        else return false;
    }
    function reverseStateBit(idx){
        if(_cmdState & (0x01 << idx))  _cmdState &= ~(0x01 << idx);
        else _cmdState |= (0x01 << idx);
    }

        /*
#define emergency_stop              0   //急停            //Fn0
#define lighting_switch             1   //照明            //Fn1
#define warning_switch              2   //示警            //Fn2
#define camera_switch               3   //镜头切换          //Fn3
#define Air_detection_pump          4   //气探检测泵       //Fn4
#define sprinkler_switch            5   //喷淋            //Fn5
//#define Reserved                  6   //备用            //Fn6
#define Turret_WaterCannon_Switch   7   //炮塔/水炮控制切换 //Fn7
#define straight_go                 8   //直行            //Fn10
#define speed_switch                9   //速度切换          //Fn11
#define Parking_switch              10  //驻车            //Fn12
#define cool_down                   11  //冷却            //Fn13
#define DC_switch                   12  //直流            //Fn14
#define watercannon_swing           13  //水炮自摆          //Fn15
#define flowering                   14  //开花            //Fn16
#define watercannon_reset           15  //水炮复位          //Fn17
//#define Reserved                  16 - 31   //备用      //Fn20 - Fn37
         */

    ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: emergency_stop
            x: 1
            y: 10
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(0) ? qsTr("急停(ON)") : qsTr("急停(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                //reverseStateBit(0);
                robotsManager.onChangeCommandState(0)

            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: lighting_switch
            x: 1 + parent.width * 0.5
            y: 10
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                id:btnText1
                color: "#ffffff"
                text: cmd_STATE_MASK(1) ? qsTr("照明(ON)") : qsTr("照明(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(1)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: warning_switch
            x: 1
            y: 40
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(2) ? qsTr("示警(ON)") : qsTr("示警(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(2)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: camera_switch
            x: 1 + parent.width * 0.5
            y: 40
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(3) ? qsTr("镜头(ON)") : qsTr("镜头(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(3)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: air_detection_pump
            x: 1
            y: 70
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(4) ? qsTr("气探检(ON)") : qsTr("喷淋(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(4)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: sprinkler_switch
            x: 1 + parent.width * 0.5
            y: 70
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(5) ? qsTr("喷淋(ON)") : qsTr("喷淋(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(5)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: turret_watercannon_switch
            x: 1
            y: 100
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(7) ? qsTr("炮塔/水炮(ON)") : qsTr("炮塔/水炮(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(7)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: straight_go
            x: 1 + parent.width * 0.5
            y: 100
            width: parent.width * 0.48
            height: 20
            background: Rectangle {
                border.color: "#21be2b"
                border.width: 2
                color: parent.down ? "#aaaaaa" : "#333333"
                radius: 30
            }
            contentItem: Text {
                color: "#ffffff"
                text: cmd_STATE_MASK(8) ? qsTr("直行(ON)") : qsTr("直行(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(8)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        Connections{
            target: robotsManager
            function onSignal_ChangeCommandState(cmdCode){
                console.log(cmdCode);
                _cmdState = cmdCode;
            }
        }

}
