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

        Label { text: qsTr("Switch"); font.pixelSize: controlSize.secondaryFontSize }

        Switch {
            text: qsTr("Basic switch")
            Layout.fillWidth: true
        }

        Switch {
            text: qsTr("Disabled switch")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Slider"); font.pixelSize: controlSize.secondaryFontSize }

        Slider {
            //text: qsTr("Basic slider")
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        Label { text: qsTr("Disabled Slider"); font.pixelSize: controlSize.secondaryFontSize }

        Slider {
            //text: qsTr("Disabled slider")
            value: 0.5
            enabled: false
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        Item { Layout.fillHeight: true }
    }
}

