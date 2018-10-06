import QtQuick 2.6

import "../JS/Helper.js" as Helper

SpinBox {
    id: control

    property real realValue: 0.0
    property real realFrom: 0
    property real realTo: 100
    property real precision: 0.01

    to: realTo / precision
    from: realFrom / precision
    isValid: !isNaN(realValue)

    onRealValueChanged: value = Math.round(realValue / precision)
    onValueModified: realValue = value * precision

    validator: DoubleValidator {
        decimals: Helper.decimals(precision)
        notation: DoubleValidator.StandardNotation
        bottom: Math.min(realFrom, realTo)
        top: Math.max(realFrom, realTo)
    }

    contentItem: NumericInput {
        Binding on text { value: control.textFromValue(control.value, control.locale) }
        onEditingFinished: control.value = control.valueFromText(text, control.locale)
        height: control.height
        maximumLength: control.to.toString().length
        clip: true
        font: control.font
        readOnly: !control.editable
        inputMethodHints: Qt.ImhFormattedNumbersOnly
        validator: control.validator
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
    }

    textFromValue: function(value, locale) {
        return Number(value * precision).toLocaleString(locale, 'f', Helper.decimals(precision))
    }

    valueFromText: function(text, locale) {
        var val = Number.fromLocaleString(locale, text) / precision;
        if (val < from) return from;
        if (val > to) return to;

        return val;
    }
}
