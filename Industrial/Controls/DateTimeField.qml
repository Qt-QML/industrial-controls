import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0 as Controls
import Industrial.Widgets 1.0

Controls.TextField {
    id: control

    property var mode: ["date", "time", "dateTime"]
    property string dateMask: "dd.MM.yyyy"
    property string timeMask: "hh:mm"

    property alias table: background.table
    property alias flat: background.flat
    property alias caution: background.caution
    property alias isValid: background.isValid

    signal finished()

    implicitWidth: background.implicitWidth
    selectionColor: background.highlighterColor

    validator: RegExpValidator {regExp:
        switch (mode) {
            case "date":
                /(0[1-9]|[12][0-9]|3[01])[\.](0[1-9]|1[012])[\.](20[0-9]{2})/;
                break;
            case "time":
                /([01][0-9]|2[0-3])[\:]([0-5][0-9])/;
                break;
            case "dateTime":
                /(0[1-9]|[12][0-9]|3[01])[\.](0[1-9]|1[012])[\.](20[0-9]{2})[\ ]([01][0-9]|2[0-3])[\:]([0-5][0-9])/;
                break;
        }
    }

    function validate() {
        (!acceptableInput && text.length)? caution = true : caution = false;
        control.deselect();
    }

    function inputStringToDate(text) {
        if (acceptableInput) return Date.fromLocaleString(Qt.locale(), text, dateMask);
        return new Date();
    }

    function inputStringToTime(text) {
        if (acceptableInput) return text;
        return new Date().toLocaleString(Qt.locale(), timeMask);
    }

    function inputStringToDateTime(text) {
        if (acceptableInput) return [ Date.fromLocaleString(Qt.locale(), control.text.split(" ")[0], dateMask) , control.text.split(" ")[1]];
        var date = new Date();
        return [date, date.toLocaleString(Qt.locale(), timeMask)];
    }

    onActiveFocusChanged: {
        validate();
    }

    onFinished: {
        validate();
    }

    onEditingFinished: {
        validate();
    }

    Button {
        id: button
        iconSource: mode == "time" ? "qrc:/icons/clock.svg" : "qrc:/icons/calendar.svg"
        color: (control.focus && popup.visible) ? ((!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)) : "transparent"
        hoverColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.highlight)
        highlightColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)
        iconColor: {
            if (pressed || popup.visible) return Theme.colors.highlightedText;
            if (hovered) return Theme.colors.text;
            if (!enabled) return Theme.colors.disabled;
            if (!control.isValid) return Theme.colors.negative;
            if (control.caution) return Theme.colors.neutral;
            return Theme.colors.description;
        }
        width: Theme.baseSize
        height: parent.height - Theme.border
        anchors.right: parent.right

        leftCropped: control.table ? 0 : radius
        bottomCropped: control.table ? 0 : radius
        radius: control.table ? 0 : Theme.rounding

        onClicked: control.forceActiveFocus();

        onReleased: {
            popup.open();

            switch (mode) {
                case "date":
                    calendarPicker.selectedDate = inputStringToDate(control.text);
                    break;
                case "time":
                    //timePicker.selectedTime = inputStringToTime(control.text); //TODO отправлять параметры через selectedTime как в CalendarPicker
                    timePicker.hours = inputStringToTime(control.text).split(":")[0] * 1;
                    timePicker.minutes = inputStringToTime(control.text).split(":")[1] * 1;
                    break;
                case "dateTime":
                    calendarPicker.selectedDate =  inputStringToDateTime(control.text)[0];
                    //timePicker.selectedTime = inputStringToDateTime(control.text)[1]; //TODO отправлять параметры через selectedTime как в CalendarPicker
                    timePicker.hours = inputStringToDateTime(control.text)[1].split(":")[0] * 1;
                    timePicker.minutes = inputStringToDateTime(control.text)[1].split(":")[1] * 1;
                    break;
            }
        }
    }

    background: BackgroundInput {
        id: background
        hovered: control.hovered
        anchors.fill: parent
        inputed: displayText.length > 0 || placeholderText.length > 0 || control.activeFocus
        highlighted: control.activeFocus || popup.visible
        clip: true
    }

    Popup {
        id: popup
        y: control.height
        backgroundColor: Theme.colors.background
        width: row.width + Theme.padding * 2
        height: row.height + Theme.padding * 2
        padding: Theme.padding
        //visible: false

        Row {
            id: row
            spacing: Theme.padding

            CalendarPicker {
                id: calendarPicker
                round: true
                navigationBarVisible: true
                weekNumbersVisible: false
                visible: (mode == "date" || mode == "dateTime")
                //selectedDate: inputStringToDate()//TODO удалить
                onReleased: inputStringWrite()
            }

            TimePicker {
                id: timePicker
                anchors.verticalCenter: parent.verticalCenter
                visible: (mode == "time" || mode == "dateTime")
                onTimeChanged: inputStringWrite()
            }
        }
    }

    function inputStringWrite() {
        switch (control.mode) {
            case "date":
                control.text = calendarPicker.selectedDate.toLocaleDateString(dateMask);
                break;
            case "time":
                control.text = timePicker.selectedTime;
                break;
            case "dateTime":
                control.text = calendarPicker.selectedDate.toLocaleDateString(dateMask) + " " + timePicker.selectedTime;
                break;
        }
    }
}
