import QtQuick 2.6

import "helper.js" as Helper

SpinBox {
    id: control

    property real realValue: 0.0
    property real realFrom: 0
    property real realTo: 100
    property real precision: 0.01

    function validate() {
        control.value = control.valueFromText(input.text, control.locale);
        caution = false;
        input.text = Qt.binding(function() { return control.textFromValue(control.value,
                                                                          control.locale) });
    }

    onRealValueChanged: value = Math.round(realValue / precision)
    onValueModified: realValue = value * precision
    onActiveFocusChanged: validate()

    to: realTo / precision
    from: realFrom / precision
    isValid: !isNaN(realValue)

    Connections {
        target: up
        onPressedChanged: if (up.pressed && caution) validate()
    }

    Connections {
        target: down
        onPressedChanged: if (down.pressed && caution) validate()
    }

    validator: DoubleValidator {
        decimals: Helper.decimals(precision)
        notation: DoubleValidator.StandardNotation
        bottom: Math.min(realFrom, realTo)
        top: Math.max(realFrom, realTo)
    }

    contentItem: NumericInput {
        id: input
        Binding on text { value: control.textFromValue(control.value, control.locale) }
        onTextEdited: caution = true
        onEditingFinished: validate()
        height: control.height
        maximumLength: control.to.toString().length
        overwriteMode: true
        color: control.enabled ? control.color : theme.disabledColor
        selectionColor: background.highlighterColor
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
