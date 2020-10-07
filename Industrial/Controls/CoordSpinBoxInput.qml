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





    property bool mouseDown: false
    property bool mouseSlide: true
    property int startX: 0
    property int oldX: 0

    function validate() {
        value = valueFromText(input.text, locale);
        input.focus = false;
        caution = false;
        input.text = Qt.binding(function() { return control.textFromValue(value, locale) });
    }

    onActiveFocusChanged: {
        //input.focus = false;
        mouseSlide = true;
        mouseArea.cursorShape = Qt.SplitHCursor;
        validate();
    }

    MouseArea{

        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.SplitHCursor;


        onPressed: {

            //mouse.accepted = true;

            console.log("0");
            if (!input.activeFocus) {
                mouseSlide = true;
                input.color = "#aaafff";
                //input.focus = false;
                input.forceActiveFocus();
                //console.log("1");
                //mouseDown = true;
                mouse.accepted = true;
            }
            if (input.activeFocus && mouseSlide) {
                mouseDown = true;
                mouse.accepted = true;
                //console.log("2");
            }
            else {
                input.color = "red";
                mouse.accepted = false;
                //console.log("3");
            }
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
                //console.log("4");
            }
        }

        onWheel: {
            if (!control.activeFocus) input.forceActiveFocus();
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

            /////////
            //onFinished: control.finished()
            validator: control.validator
            ////////

/*
            onTextEdited: {
                if (cursorPosition < maximumLength) {
                    control.caution = true;
                    console.log("11");
                } else {
                    updateValueFromControls();
                    if (nextItem && activeFocus) nextItem.forceActiveFocus();
                    console.log("11-11");
                }
            }
            onActiveFocusChanged: {
                if (activeFocus) {
                    _focusedItem = root;
                    //cursorPosition = 0;
                    console.log("22");
                }
                else {
                    updateValueFromControls();
                    console.log("22-22");
                }
            }
            onEditingFinished: {
                updateValueFromControls();
                if (nextItem && activeFocus) nextItem.forceActiveFocus();
                console.log("33");
            }/*
            onCursorPositionChanged: {
                if (cursorPosition == 2 && length == 5) {
                    if (_lastCursorPosition == 1) cursorPosition = 3;
                    else if (_lastCursorPosition == 3) cursorPosition = 1;
                }
                _lastCursorPosition = cursorPosition
                console.log("44");
            }*/

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
