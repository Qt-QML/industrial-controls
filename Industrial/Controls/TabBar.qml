import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.TabBar { // TODO: replace with model-based bar
    id: control

    implicitWidth: theme.baseSize * count * 6
    implicitHeight: theme.baseSize

    background: Item {
        clip: true

        Rectangle {
            id: bg
            color: theme.containerColor
            anchors.fill: parent
            radius: theme.rounding
            anchors.bottomMargin: -radius
        }
    }
}
