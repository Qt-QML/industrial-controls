import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.TabBar { // TODO: replace with model-based bar
    id: control

    implicitWidth: industrial.baseSize * count * 6
    implicitHeight: industrial.baseSize

    background: Item {
        clip: true

        Rectangle {
            id: bg
            color: industrial.containerColor
            anchors.fill: parent
            radius: industrial.rounding
            anchors.bottomMargin: -radius
        }
    }
}
