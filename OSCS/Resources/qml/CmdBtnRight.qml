import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0

Rectangle {
    id: commandbtnright
    opacity: 1
    color: "#F2F2F2"
    radius: 16
    anchors.margins: 20
    property int _cmdState: 0
    function cmd_STATE_MASK(idx){
        if((_cmdState & (1<<idx)) > 0) return true;
        else return false;
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
            id: speed_switch
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
                text: cmd_STATE_MASK(9) ? qsTr("速度(ON)") : qsTr("速度(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(9)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id:  parking_switch
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
                color: "#ffffff"
                text: cmd_STATE_MASK(10) ? qsTr("驻车(ON)") : qsTr("驻车(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(10)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: cool_down
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
                text: cmd_STATE_MASK(11) ? qsTr("冷却(ON)") : qsTr("冷却(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(11)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: dc_switch
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
                text: cmd_STATE_MASK(12) ? qsTr("直流(ON)") : qsTr("直流(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(12)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: watercannon_swing
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
                text: cmd_STATE_MASK(13) ? qsTr("水炮自摆(ON)") : qsTr("水炮自摆(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(13)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: flowering_switch
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
                text: cmd_STATE_MASK(14) ? qsTr("开花(ON)") : qsTr("开花(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(14)
            }
        }
        ///////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////
        Button {
            id: watercannon_reset
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
                text: cmd_STATE_MASK(15) ? qsTr("水炮复位(ON)") : qsTr("水炮复位(OFF)")
                elide: Text.ElideRight
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
            onClicked: {
                robotsManager.onChangeCommandState(15)
            }
        }
        ///////////////////////////////////////////////////////////////////////////////
        Connections{
            target: robotsManager
            function onSignal_ChangeCommandState(cmdCode){
                console.log(cmdCode);
                _cmdState = cmdCode;
            }
        }
}
