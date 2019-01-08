import QtQuick 2.6

Rectangle {
    implicitWidth: industrial.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? industrial.colors.highlight : "transparent"
    color: {
        if (!control.enabled) return industrial.colors.container;
        if (control.pressed) return industrial.colors.highlight;

        return industrial.colors.button;
    }

    Rectangle {
        anchors.fill: parent
        color: industrial.colors.onButton
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow { source: parent }
}
