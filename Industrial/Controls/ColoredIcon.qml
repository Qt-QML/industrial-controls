import QtQuick 2.6
import QtGraphicalEffects 1.0
import Industrial 1.0

Item {
    id: root

    property alias source: image.source
    property bool mirror: false
    property alias color: image.color

    rotation: mirror ? 180 : 0
    implicitWidth: image.implicitWidth
    implicitHeight: image.implicitHeight

    SvgItem {
        id: image
        anchors.fill: parent
    }
}

