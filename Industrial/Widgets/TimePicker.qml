import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Rectangle{
    id: control

    property string selectedTime: hours.text + ":" + minutes.text
    property int valueMinOld

    //TODO принимать параметры через selectedTime как в CalendarPicker
    property alias hours: hours.value //
    property alias minutes: minutes.value //

    signal timeChanged()

    width: row.width
    height: row.height
    color: Theme.colors.background

    Row {
        id: row

        height: Theme.baseSize * 4

        SpinBox {
            id: hours
            from: 0
            to: 23
            //value: selectedTime.split(":")[0] * 1 //TODO
            vertical: true
            wrap: true
            stepSizeShift: 1
            stepSizeControl: 1
            height: parent.height
            width: Theme.baseSize * 2
            font.pixelSize: Theme.baseSize

            textFromValue: function(value, locale) {
                var str = Number(value).toLocaleString(locale, 'f', 0);
                if (str.length < 2) return "0" + str;
                return str;
            }

            onValueModified: {
                selectedTime = hours.text + ":" + minutes.text;
                timeChanged();
            }
        }

        Label {
            text: ":"
            font.pixelSize: Theme.baseSize
            horizontalAlignment: Text.AlignHCenter
            height: parent.height
            width: Theme.baseSize / 2
        }

        SpinBox {
            id: minutes
            from: 0
            to: 59
            //value: selectedTime.split(":")[1] * 1 //TODO
            vertical: true
            wrap: true
            stepSizeShift: 5
            stepSizeControl: 10
            height: parent.height
            width: Theme.baseSize * 2
            font.pixelSize: Theme.baseSize

            textFromValue: function(value, locale) {
                var str = Number(value).toLocaleString(locale, 'f', 0);
                if (str.length < 2) return "0" + str;
                return str;
            }

            onValueModified: {
                if (value == to && valueMinOld == from) {
                    (hours.value == hours.from) ? hours.value = hours.to : hours.value--;
                }
                if (value == from && valueMinOld == to)  {
                    (hours.value == hours.to) ? hours.value = hours.from : hours.value++;
                }
                valueMinOld = value;

                selectedTime = hours.text + ":" + minutes.text;
                timeChanged();
            }
        }
    }
}
