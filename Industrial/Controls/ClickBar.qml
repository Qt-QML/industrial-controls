import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtGraphicalEffects 1.0

T.Slider {
    id: control

    property bool flat: false
    property bool toolTipVisible: true
    property int digits: 0
    property real visualValue: from + position * (to - from)
    property alias text: textItem.text

    implicitWidth: Theme.baseSize * 6
    implicitHeight: Theme.baseSize
    focusPolicy: Qt.NoFocus
    hoverEnabled: true

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

            Rectangle {
                id: hover
                anchors.fill: parent
                color: Theme.colors.highlight
                opacity: 0.90
                radius: parent.radius
                visible: hovered
            }
        }
    }

    OpacityMask {
        anchors.fill: indicator
        source: indicator
        maskSource: mask
    }

    ColoredIcon {
        id: minus
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: Theme.margins
        width: Theme.iconSize
        height: width
        color: {
            if (!control.enabled) return Theme.colors.disabled;
            return Theme.colors.controlText;
        }
        source: "qrc:/icons/minus.svg"
    }

    ColoredIcon {
        id: plus
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: Theme.margins
        width: Theme.iconSize
        height: width
        color: {
            if (!control.enabled) return Theme.colors.disabled;
            return Theme.colors.controlText;
        }
        source: "qrc:/icons/plus.svg"
    }

    Hatch {
        anchors.fill: parent
        color: Theme.colors.background
        visible: !enabled
    }

    Text {
        id: textItem
        anchors.centerIn: parent
        font.pixelSize: Theme.auxFontSize
        color: {
            if (!control.enabled) return Theme.colors.disabled;
            if (control.activeFocus) return Theme.colors.selection;
            return Theme.colors.text;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: Theme.animationTime } }
    }

    ToolTip {
        parent: handle
        visible: toolTipVisible && (hovered || pressed)
        text: visualValue.toFixed(digits)
    }
}

