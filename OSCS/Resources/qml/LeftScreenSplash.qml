import QtQuick 2.14

Rectangle {
    color: "black"
    Image {
        id: name
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Resources/images/leftSplash.png"
    }
}
