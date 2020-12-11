import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ScrollBar {
    id: control

    interactive: false
    implicitWidth: industrial.scrollSize
    implicitHeight: industrial.scrollSize

    background: Item { }

    contentItem: Rectangle {
        color: active && enabled ? industrial.colors.highlight : "transparent"
        radius: width / 2
    }
}
