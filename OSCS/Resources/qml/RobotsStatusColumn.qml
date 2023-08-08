import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.0
import '.'
Item {
    id: root
    property int pageSpacing: 20
    signal showMessagesDialog()
    ServerMessagesColumn {
        id: messagesColumn
        width: parent.width
        height: parent.height * 0.457
        onShowMessagesDialog: root.showMessagesDialog()
    }

    ServerStatusColumn {
        id: statusColumn
        x: 0
        y: messagesColumn.height + pageSpacing
        width: parent.width
        height: parent.height * 0.457
    }

    VisibleVideosButtons {
        x: 0
        y: statusColumn.y + statusColumn.height + pageSpacing
        width: parent.width
        height: (parent.height * 0.086) - (2 * pageSpacing)
    }
}
