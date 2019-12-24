import QtQuick 2.9

Item {
    id: root

    property Item previousItem
    property Item nextItem

    property bool up: false
    property bool down: false
    property int _lastCursorPosition: -1

    property alias input: input
    property alias sign: signItem.text

    signal decreaseValue()
    signal increaseValue()

    implicitHeight: input.contentHeight

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.IBeamCursor
        onClicked: input.forceActiveFocus();
    }

    Row {
        anchors.centerIn: parent

        NumericInput {
            id: input
            height: root.height
            overwriteMode: true
            selectionColor: highlighter.visible ? highlighter.color : Theme.colors.control
            selectedTextColor: highlighter.visible ? Theme.colors.selectedText : Theme.colors.text
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter

            onTextEdited: {
                if (cursorPosition < maximumLength) {
                    control.caution = true;
                } else {
                    updateValueFromControls();
                    if (nextItem && activeFocus) nextItem.forceActiveFocus();
                }
            }
            onActiveFocusChanged: {
                if (activeFocus) {
                    _focusedItem = root;
                    cursorPosition = 0;
                }
                else {
                    updateValueFromControls();
                }
            }
            onEditingFinished: {
                updateValueFromControls();
                if (nextItem && activeFocus) nextItem.forceActiveFocus();
            }
            onCursorPositionChanged: {
                if (cursorPosition == 2 && length == 5) {
                    if (_lastCursorPosition == 1) cursorPosition = 3;
                    else if (_lastCursorPosition == 3) cursorPosition = 1;
                }
                _lastCursorPosition = cursorPosition
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
