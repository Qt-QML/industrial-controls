import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Item {
    id: control

    signal deepIn()

    property alias deepEnabled: deepButton.visible
    property alias menuEnabled: menuButton.enabled
    property alias menu: menu
    property alias menuItems: menu.contentChildren
    property alias backgroundColor: background.color
    readonly property alias margin: menuButton.width

    Rectangle {
        id: background
        anchors.fill: control
        color: Controls.Theme.colors.raised
        radius: Controls.Theme.rounding
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
        width: Controls.Theme.baseSize * 0.5
        height: Controls.Theme.baseSize * 0.75
        iconSize: height - Controls.Theme.padding
        padding: 0
        onClicked: menu.open()

        Menu {
            id: menu
            y: parent.height

            function addEntry(text, iconSource) {
                var item = menuItem.createObject(null, { text: text, iconSource: iconSource });
                menu.addItem(item);
                menuButton.enabled = true;
                return item;
            }

            Component {
                id: menuItem
                MenuItem {}
            }
        }
    }

    ColoredIcon {
        id: deepButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: Controls.Theme.baseSize * 0.75
        height: width

        source: "qrc:/icons/menu_arrow.svg"
        color: {
            if (area.pressed) return Controls.Theme.colors.selection;
            if (area.containsMouse) return Controls.Theme.colors.highlight;
            return Controls.Theme.colors.control
        }

        MouseArea {
            id: area
            anchors.centerIn: parent
            width: Controls.Theme.baseSize
            height: width
            hoverEnabled: true
            onPressed: deepIn()
        }
    }
}
