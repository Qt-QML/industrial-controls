import QtQuick 2.6
import QtQuick.Layouts 1.0
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    property Component topItemDelegate
    property Component bottomItemDelegate

    Loader {
        id: topElement
        anchors.top: root.top
        anchors.bottom: handle.top
        anchors.left: root.left
        anchors.right: root.right
        sourceComponent: topItemDelegate
    }

    Item {
        id: handle
        height: Controls.Theme.sliderSize * 2
        width: parent.width

        Rectangle {
            anchors.fill: parent
            color: Controls.Theme.colors.raised
            radius: height / 2
        }

        Controls.ColoredIcon {
            id: icon
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 4
            width: height
            rotation: 90
            color: Controls.Theme.colors.text
            source: "qrc:/icons/dots.svg"
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.SizeVerCursor
            hoverEnabled: true
            drag.threshold: 0
            drag.target: handle
            drag.axis: Drag.YAxis
            drag.minimumY: 0
            drag.maximumY: root.height - handle.height
        }
    }

    Loader {
        anchors.top: handle.bottom
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        sourceComponent: bottomItemDelegate
    }
}
