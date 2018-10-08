import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Frame {
    id: root

    padding: controlSize.padding

    GridLayout {
        anchors.fill: parent
        anchors.margins: controlSize.padding
        rowSpacing: controlSize.spacing
        columnSpacing: controlSize.spacing
        columns: 3

        Label {}

        Label {
            text: qsTr("Enabled")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Checkboxes"); font.pixelSize: controlSize.secondaryFontSize }

        CheckBox {
            text: qsTr("Basic checkbox")
            Layout.fillWidth: true
        }

        CheckBox {
            text: qsTr("Disabled checkbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Radio buttons"); font.pixelSize: controlSize.secondaryFontSize }

        RadioButton {
            text: qsTr("Basic radio button")
            Layout.fillWidth: true
        }

        RadioButton {
            text: qsTr("Disabled radio button")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Switchs"); font.pixelSize: controlSize.secondaryFontSize }

        Switch {
            text: qsTr("Basic switch")
            Layout.fillWidth: true
        }

        Switch {
            text: qsTr("Disabled switch")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Sliders"); font.pixelSize: controlSize.secondaryFontSize }

        Slider {
            //text: qsTr("Slider")
            Layout.fillWidth: true
        }

        Slider {
            //text: qsTr("Disabled slider")
            value: 0.5
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Progress bar"); font.pixelSize: controlSize.secondaryFontSize }

        ProgressBar {
            value: 0.25
            Layout.fillWidth: true
        }

        ProgressBar {
            value: 75
            to: 100
            enabled: false
            Layout.fillWidth: true
        }

        Item { Layout.fillHeight: true }
    }
}

