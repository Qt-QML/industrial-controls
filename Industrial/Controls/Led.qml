import QtQuick 2.6

import "../Controls" as Controls

Rectangle {
    id: root

    property alias glowRadius: shadow.glowRadius

    implicitWidth: Controls.Theme.baseSize * 0.25
    implicitHeight: width
    radius: width / 2

    Behavior on color { PropertyAnimation { duration: Controls.Theme.animationTime } }

    Controls.Shadow {
        id: shadow
        source: parent
        color: parent.color

        Behavior on glowRadius { PropertyAnimation { duration: Controls.Theme.animationTime } }
    }
}

