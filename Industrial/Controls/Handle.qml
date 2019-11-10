import QtQuick 2.6

Rectangle {
    implicitWidth: Theme.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? Theme.colors.highlight : control.flat ? Theme.colors.border : "transparent"
    color: {
        if (!control.enabled) return Theme.colors.sunken;
        if (control.pressed) return Theme.colors.highlight;

        return Theme.colors.control;
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.colors.hover
        radius: parent.radius
        visible: hovered
    }

    Shadow { source: parent }
}
