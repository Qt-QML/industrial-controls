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





    //property control

    property bool mouseDown: false
    property bool mouseSlide: true
    property int startX: 0
    property int oldX: 0

    function validate() {
        value = valueFromText(input.text, locale);
        caution = false;
        input.text = Qt.binding(function() { return control.textFromValue(value, locale) });
    }

    onActiveFocusChanged: {
        mouseSlide = true;
        mouseArea.cursorShape = Qt.SplitHCursor;
        validate();
    }

    MouseArea{

        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.SplitHCursor;

        onPressed: {
            if (!control.activeFocus) {
                mouseSlide = true;
                input.color = "#aaafff";
                input.focus = false;
                control.forceActiveFocus();
            }
            if (control.activeFocus && mouseSlide) mouseDown = true;
            else mouse.accepted = false;
            startX = mouse.x;
            oldX = startX;
        }

        onPositionChanged: {
            if (mouseDown && mouseSlide) {
                if ((mouse.x - oldX) > 0) increaseValue();
                else decreaseValue();
                oldX = mouse.x;
                //console.log("x: ", mouse.x);
            }
        }

        onReleased: {
            mouseDown = false;
            if (startX == mouse.x && mouseSlide) {
                mouseSlide = false;
                input.color = "#fffaaa"
                cursorShape = Qt.IBeamCursor;
                input.forceActiveFocus();
                //input.selectAll();
            }
        }

        onWheel: {
            if (!control.activeFocus) forceActiveFocus();
            if (wheel.angleDelta.y > 0) increaseValue();
            else decreaseValue();
            //console.log(input.text);
        }
    }






    Row {
        anchors.centerIn: parent

        NumericInput {
            id: input
            height: root.height
            overwriteMode: false
            selectionColor: highlighter.visible ? highlighterback.color : Theme.colors.control
            selectedTextColor: highlighter.visible ? Theme.colors.selectedText : Theme.colors.text
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter

            bottomPadding: labelText.length > 0 ? Theme.border * 4 : 0


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
            bottomPadding: labelText.length > 0 ? Theme.border * 4 : 0
        }
    }
}
