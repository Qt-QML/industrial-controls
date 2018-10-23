import QtQuick 2.6

Rectangle {
    implicitWidth: controlSize.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    color: {
        if (!control.enabled) return theme.containerColor;
        if (control.pressed) return theme.highlightColor;
        if (control.activeFocus) return theme.selectionColor;

        return theme.buttonColor;
    }

    Rectangle {
        anchors.fill: parent
        color: customPalette.textColor
        radius: parent.radius
        opacity: 0.1
        visible: hovered
    }

    Shadow {
        source: parent
        visible: enabled
    }
}
