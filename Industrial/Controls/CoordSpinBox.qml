import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Templates 2.2 as T

import "helper.js" as Helper

T.Control {
    id: control

    property bool isLongitude: false
    property bool isValid: !isNaN(value)
    property bool caution: false
    property int secondsPrecision: 2
    property int sign: 1
    property real value: 0
    property real from: 0
    property real to: isLongitude ? 180 : 90
    property color color: theme.onContainerColor

    property string suffix: sign < 0 ? (isLongitude ? qsTr("W") : qsTr("S")) :
                                       (isLongitude ? qsTr("E") : qsTr("N"))

    property alias backgroundColor: background.color
    property alias labelText: background.text

    readonly property bool _increaseEnabled: Math.abs(value) < to
    readonly property bool _decreaseEnabled: Math.abs(value) > from

    property Item focusedItem

    function updateValueFromControls() {
        var degs = Math.abs(dInput.input.text);
        var mins = Math.abs(mInput.input.text);
        var secs = Helper.stringToReal(sInput.input.text, locale.decimalPoint);
        var val = Helper.dmsToDegree(sign, degs, mins, Math.min(secs, 60));

        if (val > to) value = to;
        else if (val < -to) value = -to;
        else value = val;

        updateControlsFromValue();
    }

    function updateControlsFromValue() {
        if (!isNaN(value)) {
            var dms = Helper.degreesToDms(value, isLongitude, secondsPrecision);
            sign = dms.sign;
            dInput.input.text = Helper.pad(dms.deg, dInput.maximumLength);
            mInput.input.text = Helper.pad(dms.min, mInput.maximumLength);
            sInput.input.text = Helper.padReal(dms.sec, 2, secondsPrecision, locale.decimalPoint);
        }
        else {
            dInput.input.text = Helper.pad(0, dInput.maximumLength);
            mInput.input.text = Helper.pad(0, mInput.maximumLength);
            sInput.input.text = Helper.padReal(0, 2, secondsPrecision, locale.decimalPoint);
        }
        caution = false;
    }

    function changeValue(digit, add) {
        var dms = Helper.degreesToDms(value, isLongitude, secondsPrecision);

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

        value = Helper.dmsToDegree(dms.sign, dms.deg, dms.min, dms.sec);
    }

    Component.onCompleted: updateControlsFromValue()
    onValueChanged: updateControlsFromValue()

    clip: true
    implicitWidth: Math.max(row.implicitWidth, background.implicitWidth)
    implicitHeight: background.textHeight + Math.max(dInput.implicitHeight, sInput.implicitHeight)
    font.pixelSize: controlSize.fontSize

    background: BackgroundInput {
        id: background
        anchors.fill: parent
        anchors.leftMargin: down.width
        anchors.rightMargin: up.width
        radius: 0
        textColor: {
            if (highlighter.visible) return highlighter.color;

            if (!control.enabled) return theme.disabledColor;
            if (!control.isValid) return theme.negativeColor

            return theme.onContainerColor;
        }
    }

    contentItem: FocusScope {
        id: scope
        activeFocusOnTab: true
        anchors.fill: parent
        onActiveFocusChanged: {
            if (activeFocus) return;

            focusedItem = null;
        }

        RowLayout {
            id: row
            anchors.fill: parent
            spacing: 0

            Button {
                id: down
                flat: true
                color: theme.containerColor
                autoRepeat: true
                focusPolicy: Qt.NoFocus
                enabled: focusedItem && _decreaseEnabled
                hatched: !enabled && control.enabled
                rightCropped: true
                iconSource: "qrc:/icons/minus.svg"
                pressedImpl: _decreaseEnabled && focusedItem && focusedItem.down
                onClicked: {
                    if (!focusedItem) return;

                    updateValueFromControls();
                    focusedItem.decreaseValue();
                }
                Layout.fillHeight: true
            }

            CoordSpinBoxInput {
                id: dInput
                input.focus: true
                input.maximumLength: isLongitude ? 3 : 2
                input.validator: IntValidator { bottom: control.from; top: control.to }
                nextItem: mInput.input
                sign: "\u00B0"
                onIncreaseValue: if (_increaseEnabled) changeValue(0, 1)
                onDecreaseValue: if (_decreaseEnabled) changeValue(0, -1)
                Layout.preferredWidth: controlSize.baseSize * (isLongitude ? 1 : 0.75)
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            CoordSpinBoxInput {
                id: mInput
                input.maximumLength: 2
                input.validator: IntValidator { bottom: 0; top: 60 }
                previousItem: dInput.input
                nextItem: sInput.input
                sign: "\'"
                onIncreaseValue: if (_increaseEnabled) changeValue(1, 1)
                onDecreaseValue: if (_decreaseEnabled) changeValue(1, -1)
                Layout.preferredWidth: controlSize.baseSize * 0.75
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            CoordSpinBoxInput {
                id: sInput
                input.maximumLength: 3 + secondsPrecision
                input.validator: DoubleValidator { bottom: 0; top: 60 }
                previousItem: mInput.input
                sign: "\""
                onIncreaseValue: if (_increaseEnabled) changeValue(2, Math.pow(10, -secondsPrecision))
                onDecreaseValue: if (_decreaseEnabled) changeValue(2, -Math.pow(10, -secondsPrecision))
                Layout.preferredWidth: controlSize.baseSize * (0.75 + secondsPrecision / 5 * 2)
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: suffixButton
                flat: true
                font: control.font
                focusPolicy: Qt.NoFocus
                enabled: value != 0
                hatched: !enabled && control.enabled
                rightCropped: true
                leftCropped: true
                text: suffix
                onClicked: {
                    value = -value;
                    updateControlsFromValue();
                }
                Layout.fillHeight: true
            }

            Button {
                id: up
                color: theme.containerColor
                flat: true
                autoRepeat: true
                focusPolicy: Qt.NoFocus
                enabled: focusedItem && _increaseEnabled
                hatched: !enabled && control.enabled
                leftCropped: true
                iconSource: "qrc:/icons/plus.svg"
                pressedImpl: _increaseEnabled && focusedItem && focusedItem.up
                onClicked: {
                    if (!focusedItem) return;

                    updateValueFromControls();
                    focusedItem.increaseValue();
                }
                Layout.fillHeight: true
            }
        }
    }

    Rectangle {
        id: highlighter
        anchors.bottom: control.bottom
        width: focusedItem ? focusedItem.width : 0
        x: focusedItem ? focusedItem.x : 0
        visible: focusedItem
        height: controlSize.underline
        color: {
            if (caution) return theme.neutralColor;
            if (!isValid) return theme.negativeColor;

            return theme.highlightColor;
        }
        Behavior on x { NumberAnimation { duration: 150 } }
    }
}
