import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtGraphicalEffects 1.0

T.ProgressBar {
    id: control

    property bool flat: false

    implicitWidth: Theme.baseSize * 4
    implicitHeight: Theme.baseSize

    background: Rectangle {
        radius: parent.height / 2
        color: !flat ? Theme.colors.sunken : "transparent"
        border.width: Theme.border
        border.color: flat ? Theme.colors.control : "transparent"

        Rectangle {
            id: mask
            visible: false
            anchors.fill: parent
            color: Theme.colors.negative
            radius: parent.height / 2
        }
    }

    contentItem: Item {
        id: indicator
        visible: false
        Rectangle {
            width: control.visualPosition * (background.width - parent.anchors.margins * 2)
            height: parent.height
            color:  !flat ? Theme.colors.selection : Theme.colors.control
        }
    }

    OpacityMask {
        anchors.fill: indicator
        source: indicator
        maskSource: mask
    }

    Hatch {
        anchors.fill: parent
        color: Theme.colors.background
        visible: !enabled
        z: 10
    }
}
