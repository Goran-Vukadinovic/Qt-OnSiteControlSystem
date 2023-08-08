import QtQuick 2.14
import QtQuick.Controls 2.14

Rectangle {
    id: applicationRoot
    property int selectedCamViews: 1
    color: "transparent"
    Loader {
        id: leftLoader
        anchors.fill: parent
        source: "qrc:/Resources/qml/LeftScreenSplash.qml"
    }

    Connections {
        target: controllerAdapter
        function onUserLogin(success){
            if(success)
                leftLoader.setSource("qrc:/Resources/qml/LeftScreenVideo.qml")
            else
                leftLoader.setSource("qrc:/Resources/qml/LeftScreenSplash.qml")
        }
    }
}
