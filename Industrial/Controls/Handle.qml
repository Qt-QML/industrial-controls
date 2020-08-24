import QtQuick 2.6

Rectangle {
    implicitWidth: Theme.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    border.color: control.activeFocus ? Theme.colors.highlight : "transparent"
    color: {
        if (!control.enabled) return Theme.colors.control;
        if (control.checked) return Theme.colors.highlight;
        if (control.pressed) return Theme.colors.highlight;
        return Theme.colors.control;
    }

    Rectangle {
        id: hover
        anchors.fill: parent
        //color: Theme.colors.hover
        color: Theme.colors.highlight
        opacity: 0.20
        radius: parent.radius
        visible: hovered
    }

    Shadow {
        source: parent
        visible: {
            if (!control.enabled) return false;
            if (control.flat) return false;
            return true;
        }
    }
}
