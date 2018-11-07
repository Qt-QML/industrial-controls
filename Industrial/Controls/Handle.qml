import QtQuick 2.6

Rectangle {
    implicitWidth: Theme.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? Theme.highlightColor : "transparent"
    color: {
        if (!control.enabled) return Theme.containerColor;
        if (control.pressed) return Theme.highlightColor;

        return Theme.buttonColor;
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.onButtonColor
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow {
        source: parent
        visible: enabled
    }
}
