import QtQuick 2.6

Button {
    id: control

    property alias model: repeater.model
    property alias delegate: repeater.delegate

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
                onTriggered: control.triggered(modelData)
            }
        }
    }
}
