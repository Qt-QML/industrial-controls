import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Frame {
    id: root

    padding: Industrial.padding

    GridLayout {
        anchors.fill: parent
        anchors.margins: Industrial.padding
        rowSpacing: Industrial.spacing
        columnSpacing: Industrial.spacing
        columns: 4

        Label {}

        Label {
            text: qsTr("Enabled")
            font.pixelSize: Industrial.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Invalid")
            font.pixelSize: Industrial.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled")
            font.pixelSize: Industrial.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Text fields"); font.pixelSize: Industrial.auxFontSize }

        TextField {
            labelText: qsTr("Edit text here")
            Layout.fillWidth: true
        }

        TextField {
            labelText: qsTr("Invalid text edit")
            text: qsTr("Errored text")
            isValid: false
            Layout.fillWidth: true
        }

        TextField {
            labelText: qsTr("Blocked text edit")
            text: qsTr("Example text")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Passwords"); font.pixelSize: Industrial.auxFontSize }

        TextField {
            labelText: qsTr("Password")
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }

        TextField {
            labelText: qsTr("Password too short")
            echoMode: TextInput.PasswordEchoOnEdit
            isValid: false
            Layout.fillWidth: true
        }

        TextField {
            labelText: qsTr("Blocked text edit")
            text: qsTr("Example text")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Filter fields"); font.pixelSize: Industrial.auxFontSize }

        FilterField {
            placeholderText: qsTr("Filter here")
            Layout.fillWidth: true
        }

        FilterField {
            labelText: qsTr("Invalid filter")
            text: qsTr("Errored filter")
            isValid: false
            Layout.fillWidth: true
        }

        FilterField {
            labelText: qsTr("Blocked filter")
            text: qsTr("Example filter")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Combo boxes"); font.pixelSize: Industrial.auxFontSize }

        ComboBox {
            labelText: qsTr("Combobox")
            model: [ "", qsTr("This"), qsTr("Is"), qsTr("Example"), qsTr("Combo") ]
            Layout.fillWidth: true
        }

        ComboBox {
            labelText: qsTr("Invalid combobox")
            model: [
                { text: "Up", icon: "qrc:/icons/up.svg" },
                { text: "Down", icon: "qrc:/icons/down.svg" },
                { text: "Left", icon: "qrc:/icons/left.svg" },
                { text: "Right", icon: "qrc:/icons/right.svg" }
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

        Item { Layout.fillHeight: true }
    }
}
