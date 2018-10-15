import QtQuick 2.6

Rectangle {
    implicitWidth: controlSize.handleSize
    implicitHeight: implicitWidth
    radius: width / 2
    color: {
        if (!control.enabled) return customPalette.sunkenColor;
        if (control.pressed) return customPalette.highlightColor;
        if (control.activeFocus) return customPalette.selectionColor;

        return customPalette.buttonColor;
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
