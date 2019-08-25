import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Item {
    id: control

    signal deepIn()

    property alias deepEnabled: deepButton.visible
    property alias menuEnabled: menuButton.enabled
    property alias menuItems: menu.contentChildren
    property alias backgroundColor: background.color
    readonly property alias margin: menuButton.width

    Rectangle {
        id: background
        anchors.fill: control
        color: Controls.Industrial.colors.raised
        radius: Controls.Industrial.rounding
        z: -1

        Shadow {
            source: parent
        }
    }

    Button {
        id: menuButton
        anchors.top: parent.top
        anchors.right: parent.right
        iconSource: "qrc:/icons/dots.svg"
        flat: true
        enabled: menu.contentModel.count > 0
        width: Controls.Industrial.baseSize * 0.5
        height: Controls.Industrial.baseSize * 0.75
        iconSize: height - Controls.Industrial.padding
        padding: 0
        onClicked: menu.open()

        Menu {
            id: menu
            y: parent.height
        }
    }

    ColoredIcon {
        id: deepButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: Controls.Industrial.baseSize * 0.75
        height: width

        source: "qrc:/icons/menu_arrow.svg"
        color: {
            if (area.pressed) return Controls.Industrial.colors.selection;
            if (area.containsMouse) return Controls.Industrial.colors.highlight;
            return Controls.Industrial.colors.button
        }

        MouseArea {
            id: area
            anchors.centerIn: parent
            width: Controls.Industrial.baseSize
            height: width
            hoverEnabled: true
            onPressed: deepIn()
        }
    }
}
