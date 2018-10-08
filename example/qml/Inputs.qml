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
        columns: 4

        Label {}

        Label {
            text: qsTr("Enabled")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Invalid")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Spinboxes"); font.pixelSize: controlSize.secondaryFontSize }

        SpinBox {
            Layout.fillWidth: true
        }

        SpinBox {
            labelText: qsTr("Invalid spinbox")
            isValid: false
            Layout.fillWidth: true
        }

        SpinBox {
            labelText: qsTr("Disabled spinbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Real spinboxes"); font.pixelSize: controlSize.secondaryFontSize }

        RealSpinBox {
            labelText: qsTr("Real spinbox")
            Layout.fillWidth: true
        }

        RealSpinBox {
            labelText: qsTr("Invalid real spinbox")
            isValid: false
            Layout.fillWidth: true
        }

        RealSpinBox {
            labelText: qsTr("Disabled real spinbox")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Coord spinboxes"); font.pixelSize: controlSize.secondaryFontSize }

        CoordSpinBox {
            labelText: qsTr("Coordinates")
            Layout.fillWidth: true
        }

        CoordSpinBox {
            labelText: qsTr("Invalid coordinates")
            isValid: false
            Layout.fillWidth: true
        }

        CoordSpinBox {
            labelText: qsTr("Disabled coordinates")
            isLongitude: true
            enabled: false
            Layout.fillWidth: true
        }

        // TODO: altitude & distance pickers

        Item { Layout.fillHeight: true }
    }
}
