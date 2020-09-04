import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TextField {
    id: control

    property alias table: background.table // табличный вид
    property alias flat: background.flat // плоский вид
    property alias backgroundColor: background.color
    property alias isValid: background.isValid
    property alias labelText: background.text
    property alias labelFontPixelSize: background.fontPixelSize

    implicitWidth: background.implicitWidth
    //implicitHeight: Theme.baseSize * 1.25
    implicitHeight: labelText.length > 0 ? Theme.baseSize * 1.25 : Theme.baseSize
    font.pixelSize: Theme.mainFontSize
    color: control.enabled ? Theme.colors.text : Theme.colors.disabled
    selectionColor: background.highlighterColor
    selectedTextColor: Theme.colors.selectedText
    selectByMouse: true
    leftPadding: Theme.padding
    rightPadding: Theme.padding
    bottomPadding: labelText.length > 0 ? Theme.border * 4 : 0
    //topPadding: Theme.border
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter

    validator: RegExpValidator {
        regExp: /^[A-zЁёА-я0-9 !@#$&()\\-`.+,/\"]*$/
    }

    background: BackgroundInput {
        id: background
        hovered: control.hovered //to hover
        anchors.fill: parent
        inputed: displayText.length > 0 || placeholderText.length > 0 || control.activeFocus
        highlighted: control.activeFocus
        clip: true
    }

    Label {
        id: placeholderLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        visible: control.displayText.length == 0 && control.placeholderText.length > 0
        text: control.placeholderText
        font.pixelSize: Theme.mainFontSize
        color: control.enabled ? Theme.colors.description : Theme.colors.disabled
        opacity: control.activeFocus ? 0.5 : 1
        leftPadding: Theme.padding
        rightPadding: Theme.padding
        //bottomPadding: Theme.border
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter

    }
}
