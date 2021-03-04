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
        input.focus = false;
        mouseSlide = true;
        mouseArea.cursorShape = Qt.SplitHCursor;
    }

    onRealValueChanged: {
        if (isNaN(realValue)) {
            input.text = qsTr("N/D")
        } else {
            value = Math.round(realValue / precision)
        }
    }

    onValueChanged: {
        if (caution) validate();
        realValue = value * precision;
    }

    to: realTo / precision
    from: realFrom / precision
    isValid: !isNaN(realValue)

    validator: Controls.CustomDoubleValidator {
        decimals: getDecimals(precision)
        notation: DoubleValidator.StandardNotation
        bottom: Math.min(realFrom, realTo)
        top: Math.max(realFrom, realTo)
    }

    onActiveFocusChanged: {
        validate();
    }

    //FIXME: повторяющийся код из SpinBox
    MouseArea{
        id: mouseArea
        height: parent.height
        width: parent.width - down.indicator.width - up.indicator.width
        anchors.horizontalCenter: parent.horizontalCenter
        cursorShape: Qt.SplitHCursor;

        onPressed: {
            if (!control.activeFocus) {
                mouseSlide = true;
                control.forceActiveFocus();
            }
            if (control.activeFocus && mouseSlide) {
                mouseDown = true;
            }
            else {
                mouse.accepted = false;
            }
            startX = mouse.x;
            oldX = startX;
        }

        onPositionChanged: {
            if (mouseDown && mouseSlide) {
                if ((mouse.x - oldX) > 0) control.increase();
                else if ((mouse.x - oldX) < 0) control.decrease();
                oldX = mouse.x;
                control.valueModified();
            }
        }

        onReleased: {
            mouseDown = false;
            if (startX == mouse.x && mouseSlide) {
                mouseSlide = false;
                cursorShape = Qt.IBeamCursor;
                input.forceActiveFocus();
                input.selectAll();
            }
        }

        onWheel: {
            if (!control.activeFocus) control.forceActiveFocus();
            if (wheel.angleDelta.y > 0) control.increase();
            else control.decrease();
            control.valueModified();
        }
    }

    contentItem: Item {
        anchors.centerIn: parent
        implicitHeight: input.contentHeight

        NumericInput {
            id: input
            anchors.fill: parent
            topPadding: labelText.length > 0 ? (Theme.auxFontSize / 1.2 - Theme.border) : 0
            verticalAlignment: Text.AlignVCenter
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
