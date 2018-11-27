import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: Theme.scrollSize
    implicitHeight: Theme.scrollSize

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? Theme.highlightColor : "transparent"
        radius: width / 2
    }
}
