import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import "."

T.Slider {
    id: control

    property bool flat: false
    property real visualValue: from + position * (to - from)

    property alias text: textItem.text

    implicitWidth: Industrial.baseSize * 6
    implicitHeight: handle.height + topPadding
    topPadding: textItem.visible ? textItem.contentHeight : 0
    focusPolicy: Qt.NoFocus
    hoverEnabled: true

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: Industrial.baseSize * 6
        width: control.availableWidth
        height: Industrial.fillSize
        radius: height / 2
        color: flat ? Industrial.colors.control : Industrial.colors.sunken

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: Industrial.colors.selection
            radius: height / 2
        }

        Hatch {
            anchors.fill: parent
            color: Industrial.colors.raised
            visible: !enabled
        }
    }

    handle: Handle {
        id: handle
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 2
            height: width
            radius: width / 2
            color: Industrial.colors.highlight
            opacity: 0.5
            visible: control.pressed
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.top: parent.top
        visible: text.length
        font.pixelSize: Industrial.auxFontSize
        color: {
            if (!control.enabled) return Industrial.colors.disabled;
            if (control.activeFocus) return Industrial.colors.selection;

            return Industrial.colors.textRaised;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: Industrial.animationTime } }
    }

    ToolTip {
        parent: handle
        visible: hovered || pressed
        text: visualValue.toFixed(0)
    }
}
