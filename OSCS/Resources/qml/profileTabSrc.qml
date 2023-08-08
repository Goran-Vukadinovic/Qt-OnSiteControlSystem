import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0
import Qt.labs.qmlmodels 1.0

Item {
    id: root
    property int columnCount: 7
    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        TableView {
            id: tableView
            clip: true
            interactive: true
            rowSpacing: 1
            columnSpacing: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            Rectangle {
                anchors.fill: parent
                color: "#828282"
                opacity: 0.5
            }
            model: TableModel {
                TableModelColumn { display: "index" }
                TableModelColumn { display: "sn" }
                TableModelColumn { display: "model" }
                TableModelColumn { display: "serial_number" }
                TableModelColumn { display: "name" }
                TableModelColumn { display: "set_as_primary" }
                TableModelColumn { display: "edit" }

                rows: [
                    /*{
                        index: 1,
                        sn: "12367788AE9633457546EF7DC8D2A5",
                        model: "LSA001-21MPA",
                        serial_number: "21MPA3",
                        name: "千度耐高温消防机器人",
                        set_as_primary: true,
                        edit: true
                    },
                    */
                ]
            }
            //selectionModel: ItemSelectionModel {}
            delegate: Rectangle {
                implicitWidth: tableView.width/columnCount
                implicitHeight: 50
                //required property bool selected
                //required property bool current
                border.width: 0//current ? 2 : 0
                color: "#FFFFFF" //selected ? "lightblue" : palette.base
                Text{
                    text: model.display ? model.display : ""
                    padding: 12
                    color: "#333333"
                    font.pixelSize: 10
                }
            }
            Connections {
                target: robotsManager
                function onRecvWSData(strData){
                    var data= JSON.parse(strData);
                    var bUpdated = false;
                    console.log("onDeviceConnected ProfileTab", data.SN);
                    var idx = -1;
                    for(var i = 0 ; i < tableView.model.rowCount ; i++)
                    {
                        if(tableView.model.getRow(i).sn === data.SN)
                        {
                            idx = i;
                            break;
                        }
                    }
                    console.log(idx);
                    if(idx < 0){
                        var robotData = {
                            index: tableView.rowCount ,
                            sn: data.SN,
                            model: data.RobotHW,
                            serial_number: data.RobotSW,
                            name: data.camera,
                            set_as_primary: true,
                            edit: true
                        };
                        tableView.model.appendRow(robotData);
                    }
                }
            }
        }
    }
    /*SelectionRectangle {
        target: tableView
    }*/
}
