import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    property bool mirrored: false
    property real factor : 0.1

    implicitHeight: Controls.Theme.baseSize
    z: 1000

    Rectangle {
        anchors.fill: parent
        anchors.bottomMargin: mirrored ? -height * factor : 0
        anchors.topMargin: mirrored ? 0 : -height * factor

        gradient: Gradient {
            GradientStop { color: backgroundColor; position: mirrored ? 1.0 - factor : factor }
            GradientStop { color: "transparent"; position: mirrored ? 0.0 : 1.0 }
        }
    }
}
