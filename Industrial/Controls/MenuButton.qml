import QtQuick 2.6

Button {
    id: control

    property int currentIndex: -1

    property alias model: repeater.model
    property alias delegate: repeater.delegate
    property alias menuX: menu.x
    property alias menuY: menu.y

    signal triggered(var modelData)

    enabled: repeater.count
    onClicked: menu.visible ? menu.close() : menu.open()
    onEnabledChanged: if (!enabled && menu.visible) menu.close()

    Menu {
        id: menu
        y: control.height

        Repeater {
            id: repeater

            delegate: MenuItem {
                text: modelData
                selected: index == control.currentIndex
                onTriggered: control.triggered(modelData)
            }
        }
    }
}
