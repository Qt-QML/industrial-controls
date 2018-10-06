import QtQuick 2.9
import QtQuick.Templates 2.2 as T

T.SpinBox {
    id: control

    property bool isValid: value >= from && value <= to
    property color color: customPalette.textColor

    property alias backgroundColor: background.color
    property alias labelText: background.text

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    leftPadding: controlSize.baseSize
    rightPadding: controlSize.baseSize
    font.pixelSize: controlSize.fontSize
    editable: true
    hoverEnabled: true
    opacity: enabled ? 1 : 0.33
    clip: true
    to: 100

    Connections {
        target: up
        onPressedChanged: if (!control.activeFocus) control.forceActiveFocus()
    }

    Connections {
        target: down
        onPressedChanged: if (!control.activeFocus) control.forceActiveFocus()
    }

    validator: IntValidator {
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    background: BackgroundInput {
        id: background
        anchors.fill: parent
        isValid: control.isValid
        leftPadding: controlSize.baseSize + controlSize.padding
        highlighted: control.activeFocus
    }

    contentItem: NumericInput {
        Binding on text { value: control.textFromValue(control.value, control.locale) }
        onTextEdited: control.value = control.valueFromText(text, control.locale)
        height: control.height
        maximumLength: control.to.toString().length
        clip: true
        font: control.font
        readOnly: !control.editable
        inputMethodHints: Qt.ImhDigitsOnly
        validator: control.validator
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
    }

    down.indicator: BackgroundItem {
        x: control.mirrored ? parent.width - width : 0
        width: controlSize.baseSize
        height: parent.height - controlSize.underline
        color: down.pressed && enabled ? customPalette.highlightColor : "transparent"
        hovered: down.hovered
        visible: control.enabled

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - customPalette.padding * 2
            source: "qrc:/ui/minus.svg"
            color: {
                if (!enabled) return customPalette.sunkenColor;
                if (down.pressed) return customPalette.selectedTextColor

                return customPalette.textColor;
            }
        }
    }

    up.indicator: BackgroundItem {
        x: control.mirrored ? 0 : parent.width - width
        width: controlSize.baseSize
        color: up.pressed && enabled ? customPalette.highlightColor : "transparent"
        hovered: up.hovered
        visible: control.enabled

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - customPalette.padding * 2
            source: "qrc:/ui/plus.svg"
            color: {
                if (!enabled) return customPalette.sunkenColor;
                if (up.pressed) return customPalette.selectedTextColor

                return customPalette.textColor;
            }
        }
    }
}
