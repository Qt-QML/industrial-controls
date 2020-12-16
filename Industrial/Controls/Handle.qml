import QtQuick 2.6

Rectangle {
    property bool hoverEnabled: true
    property bool shadowEnabled: true

    implicitWidth: Theme.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    color: {
        if (!control.enabled) return Theme.colors.disabled;
        if (control.checked) return Theme.colors.highlight;
        if (control.pressed) return Theme.colors.highlight;
        return Theme.colors.controlBorder;
    }

    Rectangle {
        id: hover
        anchors.fill: parent
        color: Theme.colors.highlight
        opacity: 0.20
        radius: parent.radius
        visible: hoverEnabled ? hovered : false
    }

    Shadow {
        source: parent
        visible: {
            if (!control.enabled) return false;
            if (control.flat) return false;
            if (!shadowEnabled) return false;
            return true;
        }
    }
}
