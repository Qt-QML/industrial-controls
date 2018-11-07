import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: Theme.baseSize / 6
    implicitHeight: Theme.baseSize / 6

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? Theme.selectionColor : "transparent"
        radius: width / 2
    }
}
