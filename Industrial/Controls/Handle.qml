import QtQuick 2.6

Rectangle {
    implicitWidth: industrial.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? industrial.highlightColor : "transparent"
    color: {
        if (!control.enabled) return industrial.containerColor;
        if (control.pressed) return industrial.highlightColor;

        return industrial.buttonColor;
    }

    Rectangle {
        anchors.fill: parent
        color: industrial.onButtonColor
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow { source: parent }
}
