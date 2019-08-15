import QtQuick 2.6
import QtQuick.Controls 2.2 as T
import "."

T.TabBar { // TODO: replace with model-based bar
    id: control

    implicitWidth: Palette.baseSize * count * 6
    implicitHeight: Palette.baseSize

    background: Item {
        clip: true

        Rectangle {
            id: bg
            color: industrial.colors.container
            anchors.fill: parent
            radius: Palette.rounding
            anchors.bottomMargin: -radius
        }
    }
}
