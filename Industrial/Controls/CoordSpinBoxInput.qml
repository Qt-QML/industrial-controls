import QtQuick 2.9

Item {
    id: root

    property int startX: 0
    property int oldX: 0

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

    function validate() {
        control.caution = false;
        input.focus = false;
        mouseSlide = true;
        mouseArea.cursorShape = Qt.SplitHCursor;
    }

    Row {
        anchors.centerIn: parent

        NumericInput {
            id: input
            height: root.height
            overwriteMode: false
            selectionColor: highlighter.visible ? highlighterback.color : Theme.colors.control
            selectedTextColor: highlighter.visible ? Theme.colors.selectedText : Theme.colors.text

            topPadding: labelText.length > 0 ? (Theme.auxFontSize / 1.2 - Theme.border) : 0
            verticalAlignment: Text.AlignVCenter

            onTextEdited: {
                if (cursorPosition >= maximumLength) {
                    updateValueFromControls();
                    if (nextItem && activeFocus) {
                        nextItem.forceActiveFocus();
                        nextItem.selectAll();
                    }
                }
            }
            onActiveFocusChanged: {
                if (activeFocus) {
                    _focusedItem = root;
                    cursorPosition = 0;
                }
                else {
                    updateValueFromControls();
                    validate();
                }
            }
            onEditingFinished: {
                updateValueFromControls();
                if (nextItem && activeFocus) {
                    nextItem.forceActiveFocus();
                    nextItem.selectAll();
                }
                if (!nextItem) validate();
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
            topPadding: labelText.length > 0 ? (Theme.auxFontSize / 1.2 - Theme.border) : 0
            verticalAlignment: input.verticalAlignment
        }
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.SplitHCursor;

        onPressed: {
            if (!input.activeFocus) {
                control.mouseSlide = true;
                input.forceActiveFocus();
            }
            if (input.activeFocus && control.mouseSlide) {
                control.mouseDown = true;
            }
            else {
                mouse.accepted = false;
            }
            startX = mouse.x;
            oldX = startX;
        }

        onPositionChanged: {
            if (control.mouseDown && control.mouseSlide) {
                if ((mouse.x - oldX) > 0) increaseValue();
                else if ((mouse.x - oldX) < 0) decreaseValue();
                oldX = mouse.x;
            }
        }

        onReleased: {
            control.mouseDown = false;
            if (startX == mouse.x && control.mouseSlide) {
                control.mouseSlide = false;
                cursorShape = Qt.IBeamCursor;
                input.forceActiveFocus();
                input.selectAll();
            }
        }

        onWheel: {
            if (!control.activeFocus) input.forceActiveFocus();
            if (wheel.angleDelta.y > 0) increaseValue();
            else decreaseValue();
        }
    }
}
