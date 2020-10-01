import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

SpinBox {
    id: control

    property real realValue: 0.0
    property real realFrom: 0
    property real realTo: 100
    property real precision: 0.01

    _input: input

    function validate() {
        value = valueFromText(input.text, locale);
        caution = false;
        input.text = Qt.binding(function() { return control.textFromValue(value, locale) });
    }

    onRealValueChanged: value = Math.round(realValue / precision)
    onValueChanged: {
        if (caution) validate();
        realValue = value * precision;
    }

    //onActiveFocusChanged: validate()
    onActiveFocusChanged: {
        slideMode = true;
        mouseArea.cursorShape = Qt.SplitHCursor;
        validate();
    }

    to: realTo / precision
    from: realFrom / precision
    isValid: !isNaN(realValue)

    //TODO: getDecimals(num) одинаковые функции, а эта вроде не используется
    function decimals(num) {
        return (num.toString().split('.')[1] || []).length;
    }

    validator: Controls.CustomDoubleValidator {
        decimals: getDecimals(precision)
        notation: DoubleValidator.StandardNotation
        bottom: Math.min(realFrom, realTo)
        top: Math.max(realFrom, realTo)
    }



    property bool mouseDown: false
    property bool slideMode: true
    property int oldX: 0
    property int newX: 0

    MouseArea{

        id: mouseArea

        height: parent.height
        width: parent.width - down.indicator.width - up.indicator.width
        anchors.horizontalCenter: parent.horizontalCenter
        cursorShape: Qt.SplitHCursor;

        onPressed: {
            if (!control.activeFocus) {
                slideMode = true;
                input.color = "#aaafff"
                control.forceActiveFocus();
            }
            if (control.activeFocus && slideMode) {
                mouseDown = true;
            }
            oldX = mouse.x;
        }

        onPositionChanged: {
            if (mouseDown && slideMode) {
                console.log("x: ", mouse.x);
            }
        }
        onReleased: {
            mouseDown = false;
            newX = mouse.x;
            if (oldX == newX && slideMode) {
                slideMode = false;
                input.color = "#fffaaa"
                newX = 0;

                cursorShape = Qt.IBeamCursor;
                //mouse.accepted = false;
                input.forceActiveFocus();
                //input.selectAll();
            }
        }
    }




    contentItem: Item {
        anchors.centerIn: parent
        implicitHeight: input.contentHeight

        NumericInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: background.underline * 1.5 // FIXME: to theme
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
            overwriteMode: false
            Binding on text {
                value: control.textFromValue(control.value, control.locale)
                when: !activeFocus || up.hovered || down.hovered
            }
            onTextEdited: caution = true
            onEditingFinished: {
                control.validate();
                control.valueModified();
            }
            onFinished: control.finished()
            selectionColor: background.highlighterColor
            selectedTextColor: control.activeFocus ? Theme.colors.selectedText : Theme.colors.text
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            validator: control.validator
        }
    }

    textFromValue: function(value, locale) {
        return (value * precision).toFixed(getDecimals(precision)).replace(".", locale.decimalPoint)
    }

    valueFromText: function(text, locale) {
        var val = parseFloat(text.replace(locale.decimalPoint, '.')) / precision;
        if (val < from) return from;
        if (val > to) return to;

        return val;
    }

    function getDecimals(num) {
        return (num.toString().split('.')[1] || []).length;
    }
}
