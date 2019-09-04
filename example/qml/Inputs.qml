import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Frame {
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

        Label { text: qsTr("Spinboxes"); font.pixelSize: Theme.auxFontSize }

        SpinBox {
            id: spin
            labelText: qsTr("Spinbox")
            Layout.fillWidth: true
        }

        SpinBox {
            labelText: qsTr("Flat spinbox")
            flat: true
            Layout.fillWidth: true
        }

        SpinBox {
            value: spin.value
            labelText: qsTr("Disabled spinbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Real spinboxes"); font.pixelSize: Theme.auxFontSize }

        RealSpinBox {
            id: realSpin
            labelText: qsTr("Real spinbox")
            Layout.fillWidth: true
        }

        RealSpinBox {
            labelText: qsTr("Flat real spinbox")
            flat: true
            Layout.fillWidth: true
        }

        RealSpinBox {
            realValue: realSpin.realValue
            labelText: qsTr("Disabled real spinbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Coord spinboxes"); font.pixelSize: Theme.auxFontSize }

        CoordSpinBox {
            id: coordSpin
            labelText: qsTr("Coordinates")
            Layout.fillWidth: true
        }

        CoordSpinBox {
            labelText: qsTr("Flat coordinates")
            isLongitude: true
            flat: true
            Layout.fillWidth: true
        }

        CoordSpinBox {
            value: coordSpin.value
            labelText: qsTr("Disabled coordinates")
            enabled: false
            Layout.fillWidth: true
        }

        // TODO: altitude & distance pickers

        Item { Layout.fillHeight: true }
    }
}
