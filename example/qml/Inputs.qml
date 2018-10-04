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

        Label { text: qsTr("Text field"); font.pixelSize: controlSize.secondaryFontSize }

        TextField {
            labelText: qsTr("Text edit")
            text: qsTr("Example text")
            Layout.fillWidth: true
        }

        TextField {
            labelText: qsTr("Invalid text edit")
            text: qsTr("Errored text")
            isValid: false
            Layout.fillWidth: true
        }

        TextField {
            labelText: qsTr("Blocked Text edit")
            text: qsTr("Example text")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Comboboxes"); font.pixelSize: controlSize.secondaryFontSize }

        ComboBox {
            labelText: qsTr("Combobox")
            model: [ qsTr("This"), qsTr("Is"), qsTr("Example"), qsTr("Combo") ]
            Layout.fillWidth: true
        }

        ComboBox {
            labelText: qsTr("Invalid combobox")
            model: [
                { text: "Up", icon: "qrc:/ui/up.svg" },
                { text: "Down", icon: "qrc:/ui/down.svg" },
                { text: "Left", icon: "qrc:/ui/left.svg" },
                { text: "Right", icon: "qrc:/ui/right.svg" }
            ]
            isValid: false
            Layout.fillWidth: true
        }

        ComboBox {
            labelText: qsTr("Disabled combobox")
            model: [ qsTr("Disabled") ]
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Spinboxes"); font.pixelSize: controlSize.secondaryFontSize }

        SpinBox {
            labelText: qsTr("Spinbox")
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

//        Label { text: qsTr("Coord spinboxes"); font.pixelSize: controlSize.secondaryFontSize }

//        CoordSpinBox {
//            labelText: qsTr("Coord spinbox")
//            Layout.fillWidth: true
//        }

//        CoordSpinBox {
//            labelText: qsTr("Invalid coord spinbox")
//            isValid: false
//            Layout.fillWidth: true
//        }

//        CoordSpinBox {
//            labelText: qsTr("Disabled coord spinbox")
//            isLongitude: true
//            enabled: false
//            Layout.fillWidth: true
//        }

        Item { Layout.fillHeight: true }
    }
}
