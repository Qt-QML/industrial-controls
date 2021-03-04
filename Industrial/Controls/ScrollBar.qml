import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ScrollBar {
    id: control

    interactive: Theme.scrollInteractive
    implicitWidth: Theme.scrollSize
    implicitHeight: Theme.scrollSize

    background: Item {}

    contentItem: Rectangle {
        color: active && enabled ? Theme.colors.selection : Theme.colors.control
        radius: Theme.rounding
    }
}
