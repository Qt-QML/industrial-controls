import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TextField {
    id: control

    property alias isValid: background.isValid
    property alias labelText: background.text

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    font.pixelSize: controlSize.fontSize
    color: control.enabled ? customPalette.textColor : customPalette.sunkenColor
    selectionColor: control.isValid ? customPalette.selectionColor : customPalette.dangerColor
    selectedTextColor: customPalette.selectedTextColor
    selectByMouse: true
    leftPadding: controlSize.padding
    bottomPadding: background.offset
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignBottom
    background: BackgroundInput {
        id: background
        anchors.fill: parent
        inputed: displayText.length > 0 || placeholderText.length > 0 || control.activeFocus
        highlighted: control.activeFocus
        clip: true
    }

    Label {
        anchors.centerIn: parent
        visible: control.displayText.length == 0 && control.placeholderText.length > 0
        text: control.placeholderText
        font.pixelSize: controlSize.fontSize
        color: customPalette.secondaryTextColor
        opacity: 0.5
    }
}
