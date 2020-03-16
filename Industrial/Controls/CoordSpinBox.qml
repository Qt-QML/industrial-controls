import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Templates 2.2 as T
import Industrial.Controls 1.0 as Controls

T.Control {
    id: control

    property bool isLongitude: false
    property bool isValid: !isNaN(value)
    property bool round: false
    property bool editable: true
    property int secondsPrecision: 2
    property real value: 0
    property real from: 0
    property real to: isLongitude ? 180 : 90
    property color color: Theme.colors.text

    property string suffix: _sign < 0 ? (isLongitude ? qsTr("W") : qsTr("S")) :
                                       (isLongitude ? qsTr("E") : qsTr("N"))

    property alias caution: background.caution
    property alias backgroundColor: background.color
    property alias labelText: background.text
    property alias flat: background.flat
    readonly property bool focused: _focusedItem && _focusedItem.visible

    property int _sign: 1
    readonly property bool _increaseEnabled: Math.abs(value) < to
    readonly property bool _decreaseEnabled: Math.abs(value) > from

    property Item _focusedItem

    signal valueModified(real value)

    function stringToReal(str, decimalPoint) {
        if (decimalPoint !== ".") return parseFloat(str.replace(decimalPoint, "."));
        return parseFloat(str);
    }

    function realToString(num, decimalPoint) {
        var str = num.toString();
        if (decimalPoint !== ".") return str.replace(".", decimalPoint);
        return str;
    }

    function pad(num, size) {
        var str = num.toString();
        while (str.length < size) str = "0" + str;
        return str;
    }

    function padReal(num, sizeBefore, sizeAfter, decimalPoint) {
        var split = realToString(num, decimalPoint).split(decimalPoint, 2);

        return pad(split.length > 0 ? split[0] : 0, sizeBefore) + decimalPoint +
               pad(split.length > 1 ? split[1] : 0, sizeBefore);
    }

    function degreesToDms(degrees, lng, secondsPrecision) {
        var sign = degrees < 0 ? -1 : 1
        var abs = Math.abs(degrees);
        var deg = Math.floor(abs);
        var frac = (abs - deg) * 60;

        if (Math.ceil(frac) - frac <= Math.pow(10, -7)) frac = Math.ceil(frac);

        var min = Math.floor(frac);
        var sec = (frac - min) * 60;

        var degLimit = (lng ? 180 : 90);
        if (deg > degLimit) deg = degLimit;

        return {
            sign: sign,
            deg: deg,
            min: min,
            sec: sec.toFixed(secondsPrecision)
        }
    }

    function dmsToDegree(sign, deg, min, sec) {
        return sign * (deg + min / 60.0 + sec / 3600.0);
    }

    function updateValueFromControls() {
        var degs = Math.abs(dInput.input.text);
        var mins = Math.abs(mInput.input.text);
        var secs = stringToReal(sInput.input.text, locale.decimalPoint);
        if (isNaN(secs))
        {
            secs = 0;
        }

        var val = dmsToDegree(_sign, degs, mins, Math.min(secs, 60));

        if (Math.abs(value - val) >= Number.EPSILON)
        {
            if (val > to) value = to;
            else if (val < -to) value = -to;
            else value = val;

            updateControlsFromValue();
            valueModified(value);
        }
        else if (dInput.input.text === "" || mInput.input.text === "" || sInput.input.text === "")
        {
            updateControlsFromValue();
        }
    }

    function updateControlsFromValue() {
        if (!isNaN(value)) {
            var dms = degreesToDms(value, isLongitude, secondsPrecision);
            _sign = dms.sign;
            dInput.input.text = pad(dms.deg, dInput.maximumLength);
            mInput.input.text = pad(dms.min, mInput.maximumLength);
            sInput.input.text = padReal(dms.sec, 2, secondsPrecision, locale.decimalPoint);
        }
        else {
            dInput.input.text = pad(0, dInput.maximumLength);
            mInput.input.text = pad(0, mInput.maximumLength);
            sInput.input.text = padReal(0, 2, secondsPrecision, locale.decimalPoint);
        }
        caution = false;
    }

    function changeValue(digit, add) {
        var dms = degreesToDms(value, isLongitude, secondsPrecision);

        switch (digit) {
        case 0:
            dms.deg = +dms.deg + add;
            break;
        case 1:
            dms.min = +dms.min + add;
            break;
        case 2:
            dms.sec = +dms.sec + add;
            break;
        }

        var newValue = dmsToDegree(dms.sign, dms.deg, dms.min, dms.sec);
        var newSign = newValue < 0 ? -1 : 1
        if (dms.sign !== newSign) {
            value = 0;
        } else {
            value = newValue;
        }
        valueModified(value);
    }

    Component.onCompleted: updateControlsFromValue()
    onValueChanged: updateControlsFromValue()

    clip: true
    implicitWidth: Math.max(background.implicitWidth, row.height)
    implicitHeight: Math.max(background.textHeight +
                             Math.max(dInput.implicitHeight, sInput.implicitHeight) +
                             background.underline, Theme.baseSize)
    font.pixelSize: Theme.mainFontSize

    background: BackgroundInput {
        id: background
        anchors.fill: parent
        textPadding: Theme.baseSize + Theme.padding
        highlighterColor: Theme.colors.control
        isValid: control.isValid
    }

    contentItem: FocusScope {
        id: scope
        activeFocusOnTab: true
        anchors.fill: parent
        onActiveFocusChanged: {
            if (activeFocus) return;

            _focusedItem = null;
        }

        RowLayout {
            id: row
            anchors.fill: parent
            spacing: 0

            Button {
                id: downButton
                flat: true
                round: control.round
                color: background.color
                autoRepeat: true
                focusPolicy: Qt.NoFocus
                enabled: _focusedItem && _decreaseEnabled
                hatched: !enabled
                rightCropped: true
                bottomCropped: true
                iconSource: "qrc:/icons/minus.svg"
                pressedImpl: _decreaseEnabled && _focusedItem && _focusedItem.down
                onClicked: {
                    if (!_focusedItem) return;

                    updateValueFromControls();
                    _focusedItem.decreaseValue();
                }
                Layout.fillHeight: true
                Layout.bottomMargin: background.highlighterHeight
            }

            CoordSpinBoxInput {
                id: dInput
                implicitWidth: Theme.baseSize * (isLongitude ? 1 : 0.75)
                input.focus: true
                input.maximumLength: isLongitude ? 3 : 2
                input.validator: IntValidator { bottom: control.from; top: control.to }
                nextItem: mInput.input
                sign: "\u00B0"
                onIncreaseValue: if (_increaseEnabled) changeValue(0, 1)
                onDecreaseValue: if (_decreaseEnabled) changeValue(0, -1)
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            CoordSpinBoxInput {
                id: mInput
                implicitWidth: Theme.baseSize * 0.75
                input.maximumLength: 2
                input.validator: IntValidator { bottom: 0; top: 60 }
                previousItem: dInput.input
                nextItem: sInput.input
                sign: "\'"
                onIncreaseValue: if (_increaseEnabled) changeValue(1, 1)
                onDecreaseValue: if (_decreaseEnabled) changeValue(1, -1)
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            CoordSpinBoxInput {
                id: sInput
                implicitWidth: Theme.baseSize * (0.75 + secondsPrecision / 5 * 2)
                input.maximumLength: 3 + secondsPrecision
                input.validator: Controls.CustomDoubleValidator { bottom: 0; top: 60 }
                previousItem: mInput.input
                sign: "\""
                onIncreaseValue: if (_increaseEnabled) changeValue(2, Math.pow(10, -secondsPrecision))
                onDecreaseValue: if (_decreaseEnabled) changeValue(2, -Math.pow(10, -secondsPrecision))
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: suffixButton
                implicitWidth: Theme.baseSize
                flat: true
                font.bold: true
                focusPolicy: Qt.NoFocus
                enabled: value != 0
                hatched: !enabled && control.enabled
                rightCropped: true
                leftCropped: true
                text: suffix
                onClicked: {
                    value = -value;
                    updateControlsFromValue();
                    valueModified(value);
                }
                Layout.fillHeight: true
                Layout.bottomMargin: background.highlighterHeight
            }

            Button {
                id: upButton
                color: background.color
                flat: true
                round: control.round
                autoRepeat: true
                focusPolicy: Qt.NoFocus
                enabled: _focusedItem && _increaseEnabled
                hatched: !enabled
                leftCropped: true
                bottomCropped: true
                iconSource: "qrc:/icons/plus.svg"
                pressedImpl: _increaseEnabled && _focusedItem && _focusedItem.up
                onClicked: {
                    if (!_focusedItem) return;

                    updateValueFromControls();
                    _focusedItem.increaseValue();
                }
                Layout.fillHeight: true
                Layout.bottomMargin: background.highlighterHeight
            }
        }
    }

    Rectangle {
        anchors.bottom: control.bottom
        width: parent.width
        x: 0
        height: Theme.underline
        color: Theme.colors.border;
    }

    Rectangle {
        id: highlighter
        anchors.bottom: control.bottom
        width: _focusedItem ? _focusedItem.width : 0
        x: _focusedItem ? _focusedItem.x : 0
        visible: _focusedItem
        height: Theme.underline
        color: {
            if (caution) return Theme.colors.neutral;
            if (!isValid) return Theme.colors.negative;

            return Theme.colors.selection;
        }
        Behavior on x { NumberAnimation { duration: 150 } }
    }
}
