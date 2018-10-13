import QtQuick 2.9

Item {
    id: root

    property Item previousItem
    property Item nextItem

    property bool up: false
    property bool down: false

    property alias input: input
    property alias sign: signItem.text

    signal decreaseValue()
    signal increaseValue()

    Row {
        anchors.centerIn: parent

        NumericInput {
            id: input
            height: root.height
            inputMethodHints: Qt.ImhDigitsOnly
            font: control.font
            color: control.enabled ? control.color : customPalette.sunkenColor
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter

            onTextEdited: control.caution = true
            onActiveFocusChanged: {
                if (activeFocus) focusedItem = root
                else updateValueFromControls();

            }
            onEditingFinished: {
                updateValueFromControls();
                if (nextItem && activeFocus) nextItem.forceActiveFocus();
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Left && previousItem && cursorPosition === 0) {
                    previousItem.forceActiveFocus();
                }
                else if (event.key === Qt.Key_Right && nextItem && cursorPosition === length) {
                    nextItem.forceActiveFocus();
                }
                else if (event.key === Qt.Key_Tab && nextItem ) {
                    nextItem.forceActiveFocus();
                }
                else if (event.key === Qt.Key_Backtab && previousItem ) {
                    previousItem.forceActiveFocus();
                }
                else if (event.key === Qt.Key_Up) {
                    up = true;
                    increaseValue();
                }
                else if (event.key === Qt.Key_Down) {
                    down = true;
                    decreaseValue();
                }
                else return;

                event.accepted = true;
            }

            Keys.onReleased: {
                if (event.key === Qt.Key_Up) up = false;
                else if (event.key === Qt.Key_Down) down = false;
                else return;

                event.accepted = true;
            }
        }

        Label {
            id: signItem
            height: root.height
            font: input.font
            color: input.color
            verticalAlignment: input.verticalAlignment
        }
    }
}
