import QtQuick 2.6

Rectangle {
    implicitWidth: Theme.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? Theme.colors.highlight : "transparent"
    color: {
        if (!control.enabled) return Theme.colors.sunken;
        if (control.pressed) return Theme.colors.highlight;

        return Theme.colors.button;
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.colors.buttonText
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow { source: parent }
}
