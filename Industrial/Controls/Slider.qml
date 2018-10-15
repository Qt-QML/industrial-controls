import QtQuick 2.6
import QtQuick.Templates 2.2 as T

import "../Shaders" as Shaders

T.Slider {
    id: control

    property real visualValue: from + position * (to - from)

    height: controlSize.baseSize
    hoverEnabled: true

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: controlSize.baseSize * 6
        width: control.availableWidth
        height: controlSize.underline
        radius: height / 2
        color: customPalette.backgroundColor

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: customPalette.selectionColor
            radius: height / 2

            Shaders.Hatch {
                source: parent
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
            color: customPalette.highlightColor
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
