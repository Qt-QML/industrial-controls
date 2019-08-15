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
        color: industrial.colors.surface
        radius: Palette.rounding
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
        width: Palette.baseSize * 0.5
        height: Palette.baseSize * 0.75
        iconSize: height - industrial.padding
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
        width: Palette.baseSize * 0.75
        height: width

        source: "qrc:/icons/menu_arrow.svg"
        color: {
            if (area.pressed) return Palette.selection;
            if (area.containsMouse) return Palette.highlight;
            return Palette.button
        }

        MouseArea {
            id: area
            anchors.centerIn: parent
            width: Palette.baseSize
            height: width
            hoverEnabled: true
            onPressed: deepIn()
        }
    }
}
