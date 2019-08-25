import QtQuick 2.6
import "."

Label {
    id: control

    onLinkActivated: Qt.openUrlExternally(link)
    linkColor: Industrial.colors.link

    MouseArea {
        anchors.fill: control
        acceptedButtons: Qt.NoButton
        cursorShape: control.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
