import QtQuick 2.6

Rectangle {
    implicitWidth: theme.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? theme.highlightColor : "transparent"
    color: {
        if (!control.enabled) return theme.containerColor;
        if (control.pressed) return theme.highlightColor;

        return theme.buttonColor;
    }

    Rectangle {
        anchors.fill: parent
        color: theme.onButtonColor
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow {
        source: parent
        visible: enabled
    }
}
