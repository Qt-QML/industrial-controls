import QtQuick 2.6

import "helper.js" as Helper

SpinBox {
    id: control

    property real realValue: 0.0
    property real realFrom: 0
    property real realTo: 100
    property real precision: 0.01

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

    onActiveFocusChanged: validate()

    to: realTo / precision
    from: realFrom / precision
    isValid: !isNaN(realValue)

    validator: DoubleValidator {
        decimals: Helper.decimals(precision)
        notation: DoubleValidator.StandardNotation
        bottom: Math.min(realFrom, realTo)
        top: Math.max(realFrom, realTo)
    }

    contentItem: Item {
        anchors.centerIn: parent
        implicitHeight: input.contentHeight

        NumericInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: background.underline * 1.5 // FIXME: to theme
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
            Binding on text { value: control.textFromValue(control.value, control.locale) }
            onTextEdited: caution = true
            onEditingFinished: validate()
            selectionColor: background.highlighterColor
            selectedTextColor: control.activeFocus ? Theme.onSelectionColor : Theme.onContainerColor
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            validator: control.validator
        }
    }

    textFromValue: function(value, locale) {
        return (value * precision).toFixed(Helper.decimals(precision)).replace(".", locale.decimalPoint)
    }

    valueFromText: function(text, locale) {
        var val = parseFloat(text.replace(locale.decimalPoint, '.')) / precision;
        if (val < from) return from;
        if (val > to) return to;

        return val;
    }
}
