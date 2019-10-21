import QtQuick 2.6
import QtGraphicalEffects 1.0


Item {
    id: root

    property alias source: image.source
    property alias mirror: image.mirror
    property alias color: overlay.color

    implicitWidth: image.implicitWidth
    implicitHeight: image.implicitHeight

    Image {
        id: image
        anchors.fill: parent
        sourceSize.width: width
        sourceSize.height: height
        visible: false
    }

    ColorOverlay {
        id: overlay
        anchors.fill: parent
        source: image
        visible: image.status == Image.Ready
    }
}

