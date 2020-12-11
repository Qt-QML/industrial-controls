import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Slider {
    id: control

    property bool flat: false
    property real visualValue: from + position * (to - from)

    property alias text: textItem.text

    implicitWidth: industrial.baseSize * 6
    implicitHeight: handle.height + topPadding
    topPadding: textItem.visible ? textItem.contentHeight : 0
    focusPolicy: Qt.NoFocus
    hoverEnabled: true

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: industrial.baseSize * 6
        width: control.availableWidth
        height: industrial.fillSize
        radius: height / 2
        color: flat ? industrial.colors.control : industrial.colors.container

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: industrial.colors.selection
            radius: height / 2
        }

        Hatch {
            anchors.fill: parent
            color: industrial.colors.surface
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
            color: industrial.colors.highlight
            opacity: 0.5
            visible: control.pressed
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.top: parent.top
        visible: text.length
        font.pixelSize: industrial.auxFontSize
        color: {
            if (!control.enabled) return industrial.colors.disabled;
            if (control.activeFocus) return industrial.colors.selection;

            return industrial.colors.onSurface;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: industrial.animationTime } }
    }

    ToolTip {
        parent: handle
        visible: hovered || pressed
        text: visualValue.toFixed(0)
    }
}
