import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.TabBar { // TODO: replace with model-based bar
    id: control

    implicitWidth: controlSize.baseSize * count * 6
    implicitHeight: controlSize.baseSize

    background: Item {
        clip: true

        Rectangle {
            id: bg
            color: theme.containerColor
            anchors.fill: parent
            radius: controlSize.rounding
            anchors.bottomMargin: -radius
        }
    }
}
