import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0 as Controls
import Industrial.Widgets 1.0

Controls.TextField {
    id: control

    property color defaultColor: "#7d7d7d"

    property alias table: background.table
    property alias flat: background.flat
    property alias caution: background.caution
    property alias isValid: background.isValid

    signal editingFinished()

    implicitWidth: background.implicitWidth
    selectionColor: background.highlighterColor

    validator: RegExpValidator {regExp: /#(?:[0-9a-f]{3}){1,2}/ }

    function validate() {
        (!acceptableInput && text.length) ? caution = true : caution = false;
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
        height: control.height - (table ? Theme.border : Theme.underline)
        anchors.right: parent.right

        leftCropped: control.table ? 0 : radius
        bottomCropped: control.table ? 0 : radius
        radius: control.table ? 0 : Theme.rounding

        onClicked: control.forceActiveFocus();

        onReleased: {
            colorPicker.currentColor = button.color;
            popup.open();
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
