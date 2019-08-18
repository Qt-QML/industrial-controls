import QtQuick 2.6
import QtQuick.Controls 2.2 as T
import "."

T.TabBar { // TODO: replace with model-based bar
    id: control

    implicitWidth: Industrial.baseSize * count * 6
    implicitHeight: Industrial.baseSize

    background: Item {
        clip: true

        Rectangle {
            id: bg
            color: Industrial.colors.sunken
            anchors.fill: parent
            radius: Industrial.rounding
            anchors.bottomMargin: -radius
        }
    }
}
