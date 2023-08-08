import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    id: applicationRoot
    property int selectedCamViews: 1
    Loader {
        id: centerLoader
        anchors.fill: parent
        source: "qrc:/Resources/qml/loginScreen.qml"
    }

    Connections {
        target: controllerAdapter
        function onUserLogin(success){
            if(success)
                centerLoader.setSource("qrc:/Resources/qml/operatorCenterScreen.qml")
        }
    }
}
