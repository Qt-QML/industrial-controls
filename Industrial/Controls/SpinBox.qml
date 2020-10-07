import QtQuick 2.9
import QtQuick.Templates 2.2 as T

T.SpinBox {
    id: control

    property int stepSizeDefault: 1
    property int stepSizeShift: 10
    property int stepSizeControl: 100
    property bool mouseDown: false
    property bool mouseSlide: true
    property int startX: 0
    property int oldX: 0

    property bool isValid: text.length
    property color color: Theme.colors.text
    property bool round: false
    property string tipText

    property alias table: background.table
    property alias text: input.text
    property alias caution: background.caution
    property alias backgroundColor: background.color
    property alias labelText: background.text
    property alias flat: background.flat

    property QtObject _input: input

    signal finished()

    stepSize: stepSizeDefault
    implicitWidth: Theme.baseSize * 4
    implicitHeight: labelText.length > 0 ? Theme.baseSize * 1.25 : Theme.baseSize
    leftPadding: Theme.baseSize
    rightPadding: Theme.baseSize
    bottomPadding: labelText.length > 0 ? Theme.border * 4 : 0
    font.pixelSize: Theme.mainFontSize
    editable: true
    clip: true
    to: 10000

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
        hovered: control.hovered
        anchors.fill: parent
        highlighted: control.activeFocus
        isValid: control.isValid
        textPadding: Theme.baseSize + Theme.padding
        spin: true
    }

    function validate() {
        value = valueFromText(input.text, locale);
        caution = false;
        input.focus = false;
        input.text = Qt.binding(function() { return control.textFromValue(value, locale) });
    }

    onActiveFocusChanged: {
        mouseSlide = true;
        mouseArea.cursorShape = Qt.SplitHCursor;
        validate();
    }

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
            }
        }

        onReleased: {
            mouseDown = false;
            if (startX == mouse.x && mouseSlide) {
                mouseSlide = false;
                cursorShape = Qt.IBeamCursor;
                input.forceActiveFocus();
            }
        }

        onWheel: {
            if (!control.activeFocus) control.forceActiveFocus();
            if (wheel.angleDelta.y > 0) control.increase();
            else control.decrease();
        }
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Shift) stepSize = stepSizeShift;
        if (event.key === Qt.Key_Control) stepSize = stepSizeControl;
        else return;
        event.accepted = true;
    }
    Keys.onReleased: {
        if (event.key === Qt.Key_Shift) stepSize = stepSizeDefault;
        if (event.key === Qt.Key_Control) stepSize = stepSizeDefault;
        else return;
        event.accepted = true;
    }

    contentItem: Item {
        anchors.centerIn: parent
        implicitHeight: input.contentHeight

        NumericInput {
            id: input
            anchors.fill: parent
            anchors.bottomMargin: background.underline * 1.5
            verticalAlignment: labelText.length > 0 ? Text.AlignBottom : Text.AlignVCenter
            overwriteMode: false
            Binding on text {
                value: control.textFromValue(control.value, control.locale);
                when: !activeFocus || up.hovered || down.hovered
            }
            onTextEdited: {
                control.value = control.valueFromText(text, control.locale)
                control.valueModified()
            }
            onFinished: control.finished()
            maximumLength: control.to.toString().length + 1
            selectionColor: background.highlighterColor
            selectedTextColor: control.activeFocus ? Theme.colors.selectedText : Theme.colors.text
            validator: control.validator
        }
    }

    down.indicator: BackgroundItem {
        x: control.mirrored ? parent.width - width : 0
        width: Theme.baseSize
        height: parent.height - (table ? Theme.border : Theme.underline)
        radius: {
            if (round) return Math.min(width, height) / 2
            if (table) return 0
            return Theme.rounding
        }
        rightCropping: radius
        bottomCropping: round ? 0 : radius
        color: down.pressed && enabled ? Theme.colors.selection : "transparent"
        hovered: down.hovered

        ColoredIcon {
            width: Theme.iconSize
            height: width
            anchors.centerIn: parent
            source: {
                if (stepSize == stepSizeControl) return "qrc:/icons/left-3.svg"
                if (stepSize == stepSizeShift) return "qrc:/icons/left-2.svg"
                return "qrc:/icons/left.svg"
            }
            color: {
                if (down.pressed) return Theme.colors.highlightedText;
                if (down.hovered) return Theme.colors.text;
                if (!enabled) return Theme.colors.disabled;
                if (control.caution) return Theme.colors.neutral;
                if (!control.isValid) return Theme.colors.negative;
                return Theme.colors.description;
            }
        }
    }

    up.indicator: BackgroundItem {
        x: control.mirrored ? 0 : parent.width - width
        width: Theme.baseSize
        height: parent.height - (table ? Theme.border : Theme.underline)
        radius: {
            if (round) return Math.min(width, height) / 2
            if (table) return 0
            return Theme.rounding
        }
        leftCropping: radius
        bottomCropping: round ? 0 : radius
        color: up.pressed && enabled ? Theme.colors.selection : "transparent"
        hovered: up.hovered

        ColoredIcon {
            width: Theme.iconSize
            height: width
            anchors.centerIn: parent
            source: {
                if (stepSize == stepSizeControl) return "qrc:/icons/right-3.svg"
                if (stepSize == stepSizeShift) return "qrc:/icons/right-2.svg"
                return "qrc:/icons/right.svg"
            }
            color: {
                if (up.pressed) return Theme.colors.highlightedText;
                if (up.hovered) return Theme.colors.text;
                if (!enabled) return Theme.colors.disabled;
                if (control.caution) return Theme.colors.neutral;
                if (!control.isValid) return Theme.colors.negative;
                return Theme.colors.description;
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
