import QtQuick 2.6

Rectangle {
    implicitWidth: Industrial.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? Industrial.colors.highlight : "transparent"
    color: {
        if (!control.enabled) return Industrial.colors.sunken;
        if (control.pressed) return Industrial.colors.highlight;

        return Industrial.colors.button;
    }

    Rectangle {
        anchors.fill: parent
        color: Industrial.colors.buttonText
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow { source: parent }
}
