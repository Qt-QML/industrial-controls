import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import "."

T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: Industrial.scrollSize
    implicitHeight: Industrial.scrollSize

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? Industrial.colors.highlight : "transparent"
        radius: width / 2
    }
}
