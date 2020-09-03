import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Pane {
    id: root

    padding: Theme.padding

    GridLayout {
        anchors.fill: parent
        anchors.margins: Theme.padding
        rowSpacing: Theme.spacing
        columnSpacing: Theme.spacing
        columns: 4

        Label {}

        Label {
            text: qsTr("Basic")
            font.pixelSize: Theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Flat")
            font.pixelSize: Theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled")
            font.pixelSize: Theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Checkboxes"); font.pixelSize: Theme.auxFontSize }

        CheckBox {
            id: _checkbox
            text: qsTr("Basic checkbox")
            Layout.fillWidth: true
        }

        CheckBox {
            text: qsTr("Flat checkbox")
            flat: true
            Layout.fillWidth: true
        }

        CheckBox {
            text: qsTr("Disabled checkbox")
            checked: _checkbox.checked
            enabled: false
            //flat: true
            Layout.fillWidth: true
        }

        Label { text: qsTr("Radio buttons"); font.pixelSize: Theme.auxFontSize }

        RadioButton {
            text: qsTr("Basic radio button")
            Layout.fillWidth: true
        }

        RadioButton {
            text: qsTr("Flat radio button")
            flat: true
            Layout.fillWidth: true
        }

        RadioButton {
            text: qsTr("Disabled radio button")
            enabled: false
            checked: true
            //flat: true
            Layout.fillWidth: true
        }

        Label { text: qsTr("Switchs"); font.pixelSize: Theme.auxFontSize }

        Switch {
            id: _switch
            text: qsTr("Basic switch")
            Layout.fillWidth: true
        }

        Switch {
            text: qsTr("Flat switch")
            flat: true
            Layout.fillWidth: true
        }

        Switch {
            text: qsTr("Disabled switch")
            enabled: false
            checked: _switch.checked
            flat: true
            Layout.fillWidth: true
        }

        Label { text: qsTr("Sliders"); font.pixelSize: Theme.auxFontSize }

        Slider {
            id: _slider
            text: qsTr("Slider")
            to: 100
            value: 50
            Layout.fillWidth: true
        }

        Slider {
            text: qsTr("Flat slider")
            value: to - _slider.value
            to: 100
            flat: true
            Layout.fillWidth: true
        }

        Slider {
            text: qsTr("Disabled slider")
            value: to - _slider.value
            to: 100
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Progress bar"); font.pixelSize: Theme.auxFontSize }

        ProgressBar {
            value: _slider.value * 0.01
            Layout.fillWidth: true
        }

        ProgressBar {
            value: to - _slider.value
            to: 100
            flat: true
            Layout.fillWidth: true
        }

        ProgressBar {
            value: to - _slider.value
            to: 100
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Click bar"); font.pixelSize: Theme.auxFontSize }

        ClickBar {
            id: _clickbar
            from: 1
            value: 50
            to: 100
            Layout.fillWidth: true
            //rotation: 90
        }

        ClickBar {
            from: 1
            value: to - _clickbar.value
            to: 100
            Layout.fillWidth: true
            flat: true
            //rotation: 90
        }

        ClickBar {
            from: 1
            value: to - _clickbar.value
            to: 100
            Layout.fillWidth: true
            enabled: false
            //rotation: 90
        }
    }
}

