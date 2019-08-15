import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import "."

T.SpinBox {
    id: control

    property bool isValid: value >= from && value <= to
    property color color: industrial.colors.onContainer
    property bool round: false

    property alias caution: background.caution
    property alias backgroundColor: background.color
    property alias labelText: background.text
    property alias flat: background.flat

    implicitWidth: background.implicitWidth + Palette.baseSize * 2
    implicitHeight: Math.max(background.textHeight + contentItem.implicitHeight +
                             background.underline, Palette.baseSize)
    leftPadding: Palette.baseSize
    rightPadding: Palette.baseSize
    font.pixelSize: industrial.mainFontSize
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
        anchors.fill: parent
        highlighted: control.activeFocus
        isValid: control.isValid
        textPadding: Palette.baseSize + industrial.padding
    }

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        propagateComposedEvents: true
        onWheel: {
            if(wheel.angleDelta.y>0) control.increase();
            else control.decrease();
        }
    }

    contentItem: Item {
        anchors.centerIn: parent
        implicitHeight: input.contentHeight

        NumericInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: background.underline * 1.5
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
            Binding on text { value: control.textFromValue(control.value, control.locale) }
            onTextEdited: {
                control.value = control.valueFromText(text, control.locale);
                control.valueModified();
            }
            maximumLength: control.to.toString().length + 1
            selectionColor: background.highlighterColor
            selectedTextColor: control.activeFocus ? Palette.selectionText : industrial.colors.onContainer
            validator: control.validator
        }
    }

    down.indicator: BackgroundItem {
        x: control.mirrored ? parent.width - width : 0
        width: Palette.baseSize
        height: parent.height - background.highlighterHeight
        radius: round ? Math.min(width, height) / 2 : Palette.rounding
        rightCropping: radius
        bottomCropping: round ? 0 : radius
        color: down.pressed && enabled ? Palette.highlight : background.color
        hovered: down.hovered

        Hatch {
            anchors.fill: parent
            color: industrial.colors.surface
            visible: !enabled
        }

        ColoredIcon {
            anchors.centerIn: parent
            source: "qrc:/icons/minus.svg"
            color: {
                if (!enabled) return industrial.colors.disabled;
                if (down.pressed) return Palette.highlightText;

                return Palette.buttonText;
            }
        }
    }

    up.indicator: BackgroundItem {
        x: control.mirrored ? 0 : parent.width - width
        width: Palette.baseSize
        height: parent.height - background.highlighterHeight
        radius: round ? Math.min(width, height) / 2 : Palette.rounding
        leftCropping: radius
        bottomCropping: round ? 0 : radius
        color: up.pressed && enabled ? Palette.highlight : background.color
        hovered: up.hovered

        Hatch {
            anchors.fill: parent
            color: industrial.colors.surface
            visible: !enabled
        }

        ColoredIcon {
            anchors.centerIn: parent
            source: "qrc:/icons/plus.svg"
            color: {
                if (!enabled) return industrial.colors.disabled;
                if (up.pressed) return Palette.highlightText;

                return Palette.buttonText;
            }
        }
    }

    textFromValue: function(value, locale) {
        return (value).toString()
    }

    valueFromText: function(text, locale) {
        var val = parseInt(text);
        if (val < from) return from;
        if (val > to) return to;

        return val;
    }
}
