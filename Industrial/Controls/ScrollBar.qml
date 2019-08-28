import QtQuick 2.6
import QtQuick.Templates 2.2 as T


T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: Industrial.scrollSize
    implicitHeight: Industrial.scrollSize

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? Theme.colors.highlight : "transparent"
        radius: width / 2
    }
}
