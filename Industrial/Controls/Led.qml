import QtQuick 2.6

import "../Controls" as Controls

Rectangle {
    id: root

    property alias glowRadius: shadow.glowRadius

    implicitWidth: Theme.baseSize * 0.25
    implicitHeight: width
    radius: width / 2
    opacity: 0.75

    Behavior on color { PropertyAnimation { duration: Theme.animationTime } }

    Controls.Shadow {
        id: shadow
        source: parent
        color: parent.color

        Behavior on glowRadius { PropertyAnimation { duration: Theme.animationTime } }
    }
}

