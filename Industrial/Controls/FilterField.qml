import QtQuick 2.6

TextField {
    id: control

    clip: true

    Button {
        id: button
        anchors.right: parent.right
        height: parent.height - Theme.underline
        leftCropped: true
        //rightCropped: table ? true : false
        bottomCropped: true
        iconSource: "qrc:/icons/erase.svg"
        iconColor: {
            if (button.pressed) return Theme.colors.highlightedText;
            if (button.hovered) return Theme.colors.text;
            if (!control.enabled) return Theme.colors.disabled;
            if (control.caution) return Theme.colors.neutral;
            if (!control.isValid) return Theme.colors.negative;
            return Theme.colors.description;
        }
        color: "transparent"
        hoverColor: {
            if (control.caution) return Theme.colors.neutral;
            if (!control.isValid) return Theme.colors.negative;
            return Theme.colors.highlight;
        }
        highlightColor: {
            if (control.caution) return Theme.colors.neutral;
            if (!control.isValid) return Theme.colors.negative;
            return Theme.colors.selection;
        }
        tipText: qsTr("Clear filter")
        radius: table ? 0 : Theme.rounding
        visible: control.text.length > 0 && control.enabled
        onClicked: control.clear()
    }
}
