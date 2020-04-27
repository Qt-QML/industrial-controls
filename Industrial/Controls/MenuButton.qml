import QtQuick 2.6
import QtQuick.Templates 2.2 as T

Button {
    id: control

    property alias model: repeater.model

    signal triggered(var modelData)

    onClicked: menu.isOpen ? menu.close() : menu.open()

    Menu {
        id: menu
        y: control.height

        Repeater {
            id: repeater

            MenuItem {
                text: modelData
                onTriggered: control.triggered(modelData)
            }
        }
    }
}
