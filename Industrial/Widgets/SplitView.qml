import QtQuick 2.6
import QtQuick.Layouts 1.0
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    implicitHeight: topItemMinHeight + bottomItemMinHeight + Controls.Theme.sliderSize * 2
    property Component topItemDelegate
    property Component bottomItemDelegate
    property real topItemMinHeight: topElement.item.implicitHeight
    property real bottomItemMinHeight: bottomElement.item.implicitHeight
    property alias handleColor: handleRectangle.color

    onTopItemMinHeightChanged: {
        if(topItemMinHeight > handle.y && topItemMinHeight < root.height - handle.height - bottomItemMinHeight) {
            handle.y = topItemMinHeight
        }
    }

    onBottomItemMinHeightChanged: {
        if(root.height - handle.height - bottomItemMinHeight > 0 && root.height - handle.height - bottomItemMinHeight < handle.y) {
            handle.y = root.height - handle.height - bottomItemMinHeight;
        }
    }

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
        y: topItemMinHeight

        Rectangle {
            id: handleRectangle
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
            color: Controls.Theme.colors.description
            source: "qrc:/icons/dots.svg"
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.SizeVerCursor
            hoverEnabled: true
            drag.threshold: 0
            drag.target: handle
            drag.axis: Drag.YAxis
            drag.minimumY: topItemMinHeight
            drag.maximumY: root.height - handle.height - bottomItemMinHeight
        }
    }

    Loader {
        id: bottomElement
        anchors.top: handle.bottom
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        sourceComponent: bottomItemDelegate
    }
}
