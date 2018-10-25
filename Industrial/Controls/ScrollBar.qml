import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: theme.baseSize / 6
    implicitHeight: theme.baseSize / 6

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? theme.selectionColor : "transparent"
        radius: width / 2
    }
}
