import QtQuick 2.6
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
    opacity: enabled ? 1 : 0.33
    to: 100

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
        color: {
            if (!control.enabled) return customPalette.sunkenColor;
            if (!control.isValid) return customPalette.selectedTextColor

            return control.color;
        }
        maximumLength: control.to.toString().length
        clip: true
        font: control.font
        readOnly: !control.editable
        inputMethodHints: Qt.ImhDigitsOnly
        validator: control.validator
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
        bottomPadding: background.offset
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width : 0
        width: controlSize.baseSize
        height: parent.height - background.radius
        radius: 3
        color: down.pressed ? customPalette.highlightColor : "transparent"
        opacity: enabled ? 1 : 0.33

        Rectangle {
            anchors.fill: parent
            color: customPalette.textColor
            radius: parent.radius
            opacity: 0.1
            visible: down.hovered
        }

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - customPalette.padding * 2
            source: "qrc:/ui/minus.svg"
            color: {
                if (!enabled) return customPalette.sunkenColor;
                if (!control.isValid || down.pressed) return customPalette.selectedTextColor

                return customPalette.textColor;
            }
        }
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        width: controlSize.baseSize
        height: parent.height - background.radius
        radius: 3
        color: up.pressed ? customPalette.highlightColor : "transparent"
        opacity: enabled ? 1 : 0.33

        Rectangle {
            anchors.fill: parent
            color: customPalette.textColor
            radius: parent.radius
            opacity: 0.1
            visible: up.hovered
        }

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - customPalette.padding * 2
            source: "qrc:/ui/plus.svg"
            color: {
                if (!enabled) return customPalette.sunkenColor;
                if (!control.isValid || up.pressed) return customPalette.selectedTextColor

                return customPalette.textColor;
            }
        }
    }
}
