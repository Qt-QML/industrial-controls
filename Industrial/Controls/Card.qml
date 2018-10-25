import QtQuick 2.6

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
        color: theme.surfaceColor
        radius: theme.rounding
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
        width: theme.baseSize * 0.5
        height: theme.baseSize * 0.75
        iconSize: height - theme.padding
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
        width: theme.baseSize * 0.75
        height: width

        source: "qrc:/icons/menu_arrow.svg"
        color: {
            if (area.pressed) return theme.selectionColor;
            if (area.containsMouse) return theme.highlightColor;
            return theme.buttonColor
        }

        MouseArea {
            id: area
            anchors.centerIn: parent
            width: theme.baseSize
            height: width
            hoverEnabled: true
            onPressed: deepIn()
        }
    }
}
