import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Frame {
    id: root

    padding: theme.padding

    GridLayout {
        anchors.fill: parent
        anchors.margins: theme.padding
        rowSpacing: theme.spacing
        columnSpacing: theme.spacing
        columns: 4

        Label {}

        Label {
            text: qsTr("Enabled")
            font.pixelSize: theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Invalid")
            font.pixelSize: theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled")
            font.pixelSize: theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Spinboxes"); font.pixelSize: theme.auxFontSize }

        SpinBox {
            id: spin
            labelText: qsTr("Spinbox")
            Layout.fillWidth: true
        }

        SpinBox {
            labelText: qsTr("Invalid spinbox")
            isValid: false
            Layout.fillWidth: true
        }

        SpinBox {
            value: spin.value
            labelText: qsTr("Disabled spinbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Real spinboxes"); font.pixelSize: theme.auxFontSize }

        RealSpinBox {
            id: realSpin
            labelText: qsTr("Real spinbox")
            Layout.fillWidth: true
        }

        RealSpinBox {
            labelText: qsTr("Invalid real spinbox")
            isValid: false
            Layout.fillWidth: true
        }

        RealSpinBox {
            realValue: realSpin.realValue
            labelText: qsTr("Disabled real spinbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Coord spinboxes"); font.pixelSize: theme.auxFontSize }

        CoordSpinBox {
            id: coordSpin
            labelText: qsTr("Coordinates")
            Layout.fillWidth: true
        }

        CoordSpinBox {
            labelText: qsTr("Invalid coordinates")
            isValid: false
            Layout.fillWidth: true
        }

        CoordSpinBox {
            value: coordSpin.value
            labelText: qsTr("Disabled coordinates")
            isLongitude: true
            enabled: false
            Layout.fillWidth: true
        }

        // TODO: altitude & distance pickers

        Item { Layout.fillHeight: true }
    }
}
