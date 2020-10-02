import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    property bool mirrored: false
    property int faderOffset: 0
    property int faderHeight: Controls.Theme.baseSize
    property color faderColor: Controls.Theme.colors.background

    implicitHeight: 0
    z: 1000

    Rectangle {
        width: parent.width
        height: parent.height + faderOffset
        y: mirrored ? 0 : -faderOffset
        color: faderColor
    }

    Rectangle {
        width: parent.width
        height: root.height + Math.min(faderHeight, Controls.Theme.baseSize)
        visible: height
        y: mirrored ? -height : root.height
        gradient: Gradient {
            GradientStop { color: faderColor; position: mirrored ? 1.0 : 0.0 }
            GradientStop { color: "transparent"; position: mirrored ? 0.0 : 1.0 }
        }
    }
}
