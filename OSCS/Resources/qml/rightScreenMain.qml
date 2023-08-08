import QtQuick 2.14
import QtQuick.Controls 2.14

Rectangle {
    id: applicationRoot
    property int selectedCamViews: 1
    color: "transparent"
    Loader {
        id: rightLoader
        anchors.fill: parent
        source: "qrc:/Resources/qml/RightScreenSplash.qml"
    }

    Connections {
        target: controllerAdapter
        function onUserLogin(success){
            if(success)
                rightLoader.setSource("qrc:/Resources/qml/RightScreenVideo.qml")
            else
                rightLoader.setSource("qrc:/Resources/qml/RightScreenSplash.qml")
        }
    }
}
