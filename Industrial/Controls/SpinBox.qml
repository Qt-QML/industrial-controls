import QtQuick 2.9
import QtQuick.Templates 2.2 as T

T.SpinBox {
    id: control

    property bool isValid: value >= from && value <= to
    property color color: theme.onContainerColor

    property alias caution: background.caution
    property alias backgroundColor: background.color
    property alias labelText: background.text

    implicitWidth: background.implicitWidth + controlSize.baseSize * 2
    implicitHeight: background.implicitHeight
    leftPadding: controlSize.baseSize
    rightPadding: controlSize.baseSize
    font.pixelSize: controlSize.fontSize
    editable: true
    hoverEnabled: true
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
        x: controlSize.baseSize
        width: control.width - controlSize.baseSize * 2
        height: control.height
        radius: 0
        highlighted: control.activeFocus
        isValid: control.isValid
    }

    contentItem: NumericInput {
        Binding on text { value: control.textFromValue(control.value, control.locale) }
        onTextEdited: control.value = control.valueFromText(text, control.locale)
        height: control.height
        maximumLength: control.to.toString().length
        color: control.enabled ? control.color : theme.disabledColor
        selectionColor: background.highlighterColor
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
        height: parent.height
        rightCroppig: radius
        color: down.pressed && enabled ? theme.highlightColor : theme.containerColor
        hovered: down.hovered
        visible: control.enabled

        Hatch {
            anchors.fill: parent
            color: theme.surfaceColor
            visible: !enabled
        }

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - controlSize.padding * 2
            source: "qrc:/icons/minus.svg"
            color: {
                if (!enabled) return theme.disabledColor;
                if (down.pressed) return theme.onSelectionColor

                return theme.onButtonColor;
            }
        }
    }

    up.indicator: BackgroundItem {
        x: control.mirrored ? 0 : parent.width - width
        width: controlSize.baseSize
        height: parent.height
        leftCroppig: radius
        color: up.pressed && enabled ? theme.highlightColor : theme.containerColor
        hovered: up.hovered
        visible: control.enabled

        Hatch {
            anchors.fill: parent
            color: theme.surfaceColor
            visible: !enabled
        }

        ColoredIcon {
            anchors.centerIn: parent
            width: parent.width - controlSize.padding * 2
            source: "qrc:/icons/plus.svg"
            color: {
                if (!enabled) return theme.disabledColor;
                if (up.pressed) return theme.onSelectionColor

                return theme.onButtonColor;
            }
        }
    }
}
