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
        color: {
            if (!control.enabled) return "transparent";
            if (flat) return "transparent";
            return Theme.colors.sunken;
        }
        border.width: Theme.border
        border.color: {
            if (!control.enabled) return Theme.colors.disabled;
            if (flat) return Theme.colors.controlBorder;
            return "transparent";
        }

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
            color: {
                if (!control.enabled) return Theme.colors.disabled;
                return Theme.colors.selection;
            }
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
