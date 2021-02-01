import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Widgets 1.0

TextField {
    id: control

    property color defaultColor: "#7d7d7d"

    property alias table: background.table
    property alias flat: background.flat
    property alias caution: background.caution
    property alias isValid: background.isValid
    property alias labelText: background.text

    signal editingFinished()

    implicitWidth: background.implicitWidth    
    implicitHeight: labelText.length > 0 ? Theme.baseSize * 1.25 : Theme.baseSize

    selectionColor: background.highlighterColor
    rightPadding: button.visible ? button.width + Theme.padding : Theme.padding

    topPadding: labelText.length > 0 ? (Theme.auxFontSize / 1.2 - Theme.border) : 0
    verticalAlignment: Text.AlignVCenter

    validator: RegExpValidator {regExp: /#(?:[0-9a-f]{3}){1,2}/ }

    function validate() {
        caution = (!acceptableInput && text.length) ? true : false;
        control.deselect();
    }

    onActiveFocusChanged: {
        validate();
    }

    onTextChanged: {
        button.color = control.text;
        colorPicker.currentColor = button.color;
    }

    onTextEdited: {
        editingFinished();
    }

    Button {
        id: button
        color: control.text.length > 0 ? control.text : control.defaultColor
        highlightColor: color
        hoverColor: "transparent"
        width: Theme.baseSize
        height: control.enabled ? control.height - Theme.border : control.height
        anchors.right: parent.right

        leftCropped: control.table ? 0 : radius
        bottomCropped: control.table ? 0 : radius
        radius: control.table ? 0 : Theme.rounding

        onClicked: {
            control.forceActiveFocus();
            colorPicker.currentColor = button.color;
            popup.visible = !popup.visible
        }
    }

    background: BackgroundInput {
        id: background
        hovered: control.hovered
        anchors.fill: parent
        inputed: displayText.length > 0 || placeholderText.length > 0 || control.activeFocus
        highlighted: control.activeFocus || popup.visible
        clip: true
    }

    Popup {
        id: popup
        y: control.height
        padding: Theme.padding * 2
        closePolicy: Popup.CloseOnPressOutsideParent

        onClosed: {
            editingFinished();
        }

        ColorPicker {
            id: colorPicker
            padding: 0
            backgroundColor: Theme.colors.raised

            onColorChange: {
                if (popup.visible) {
                    button.color = colorPicker.currentColor;
                    control.text = colorPicker.currentColor;
                }
            }
        }
    }
}
