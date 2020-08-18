import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtGraphicalEffects 1.0

T.ProgressBar {
    id: control

    implicitWidth: Theme.baseSize * 4
    implicitHeight: Theme.baseSize

    background: BackgroundItem {
        id: mask
        visible: true
        radius: parent.height / 2
    }

    contentItem: Item {
        id: indicator
        visible: false
        Rectangle {
            width: control.visualPosition * (background.width - parent.anchors.margins * 2)
            height: parent.height
            color: Theme.colors.selection
        }
    }

    OpacityMask {
        anchors.fill: indicator
        source: indicator
        maskSource: mask
    }

    Hatch {
        anchors.fill: parent
        color: Theme.colors.raised
        visible: !enabled
        z: 10
    }
}
