import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TextField {
    id: control

    property alias flat: background.flat
    property alias isValid: background.isValid
    property alias labelText: background.text

    implicitHeight: Math.max(background.textHeight + contentHeight + background.underline,
                             theme.baseSize)
    font.pixelSize: theme.mainFontSize
    color: control.enabled ? theme.onContainerColor : theme.disabledColor
    selectionColor: background.highlighterColor
    selectedTextColor: theme.onSelectionColor
    selectByMouse: true
    leftPadding: theme.padding
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
        id: placeholderLabel
        anchors.centerIn: parent
        visible: control.displayText.length == 0 && control.placeholderText.length > 0
        text: control.placeholderText
        font.pixelSize: theme.mainFontSize
        color: theme.onContainerColor
        opacity: 0.5
    }
}
