import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TextField {
    id: control

    property alias isValid: background.isValid
    property alias labelText: background.text

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    font.pixelSize: controlSize.fontSize
    selectionColor: customPalette.selectionColor
    selectedTextColor: customPalette.selectedTextColor
    selectByMouse: true
    leftPadding: controlSize.padding
    bottomPadding: background.offset
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignBottom
    opacity: enabled ? 1 : 0.33
    color: {
        if (!control.enabled) return customPalette.sunkenColor;
        if (!control.isValid) return customPalette.selectedTextColor

        return customPalette.textColor;
    }

    background: BackgroundInput {
        id: background
        anchors.fill: parent
        inputed: displayText.length > 0 || control.activeFocus
        highlighted: control.activeFocus
    }
}
