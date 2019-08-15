import QtQuick 2.6

Rectangle {
    implicitWidth: industrial.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? Palette.highlight : "transparent"
    color: {
        if (!control.enabled) return industrial.colors.container;
        if (control.pressed) return Palette.highlight;

        return Palette.button;
    }

    Rectangle {
        anchors.fill: parent
        color: Palette.buttonText
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow { source: parent }
}
