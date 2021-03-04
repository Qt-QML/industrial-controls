import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Popup {
    id: control

    property color backgroundColor: Theme.colors.raised

    padding: Theme.padding * 2
    clip: false

    background: Rectangle {
        color: backgroundColor
        radius: Theme.baseSize / 8

        Shadow {
            source: parent
            glowRadius: Theme.shadowSize * 4
            anchors.verticalCenterOffset: Theme.baseSize / 8
        }
    }
}
