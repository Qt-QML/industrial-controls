import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: controlSize.baseSize / 6
    implicitHeight: controlSize.baseSize / 6

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? customPalette.selectionColor : "transparent"
        radius: width / 2
    }
}
