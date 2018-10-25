import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Slider {
    id: control

    property real visualValue: from + position * (to - from)

    height: theme.baseSize
    hoverEnabled: true

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: theme.baseSize * 6
        width: control.availableWidth
        height: theme.underline
        radius: height / 2
        color: theme.containerColor

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: theme.selectionColor
            radius: height / 2

            Hatch {
                anchors.fill: parent
                color: theme.containerColor
                visible: !enabled
            }
        }
    }

    handle: Handle {
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 2
            height: width
            radius: width / 2
            color: theme.highlightColor
            opacity: 0.5
            visible: control.pressed
        }
    }

    ToolTip {
        parent: handle
        visible: hovered || pressed
        text: visualValue.toFixed(0)
    }
}
