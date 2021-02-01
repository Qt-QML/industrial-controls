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
            text: qsTr("Enabled")
            font.pixelSize: Theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Invalid")
            font.pixelSize: Theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled")
            font.pixelSize: Theme.auxFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Text fields"); font.pixelSize: Theme.auxFontSize }

        TextField {
            placeholderText: qsTr("Example text")
            Layout.fillWidth: true
        }

        TextField {
            text: qsTr("Errored text")
            isValid: false
            Layout.fillWidth: true
        }

        TextField {
            text: qsTr("Example text")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Passwords"); font.pixelSize: Theme.auxFontSize }

        PasswordField {
            labelText: qsTr("Password")
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }

        PasswordField {
            labelText: qsTr("Password too short")
            echoMode: TextInput.PasswordEchoOnEdit
            isValid: false
            Layout.fillWidth: true
        }

        PasswordField {
            labelText: qsTr("Blocked text edit")
            text: qsTr("Example text")
            enabled: false
            Layout.fillWidth: true
        }

        Label { text: qsTr("Filter fields"); font.pixelSize: Theme.auxFontSize }

        FilterField {
            labelText: qsTr("Filter here")
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

        Label { text: qsTr("Combo boxes"); font.pixelSize: Theme.auxFontSize }

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

        //--
        GridLayout {
            columnSpacing: Theme.spacing
            rowSpacing: 0
            columns: 2

            //
            Label {
                text: qsTr("Sample fields")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            TextField {
                table: true
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Placeholder")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            TextField {
                table: true
                placeholderText: qsTr("Placeholder")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Password")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            PasswordField {
                table: true
                echoMode: TextInput.Password
                text: qsTr("Password")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Filter fields")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            FilterField {
                table: true
                text: qsTr("Filter fields")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Combobox")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            ComboBox {
                table: true
                model: [ qsTr("This"), qsTr("Is"), qsTr("Example"), qsTr("Combobox") ]
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
        }
        //--


        //--
        GridLayout {
            columnSpacing: Theme.spacing
            rowSpacing: 0
            columns: 2

            //
            Label {
                text: qsTr("Sample fields")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            TextField {
                table: true
                flat: true
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Placeholder")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            TextField {
                table: true
                flat: true
                placeholderText: qsTr("Placeholder")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Password")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            PasswordField {
                table: true
                flat: true
                echoMode: TextInput.Password
                text: qsTr("Password")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Filter fields")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            FilterField {
                table: true
                flat: true
                text: qsTr("Filter fields")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Combobox")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            ComboBox {
                table: true
                flat: true
                model: [ qsTr("This"), qsTr("Is"), qsTr("Example"), qsTr("Combobox") ]
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
        }
        //--


        //--
        GridLayout {
            columnSpacing: Theme.spacing
            rowSpacing: 0
            columns: 2

            //
            Label {
                text: qsTr("Sample fields")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            TextField {
                table: true
                enabled: false
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Placeholder")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            TextField {
                table: true
                enabled: false
                placeholderText: qsTr("Placeholder")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Password")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            PasswordField {
                table: true
                enabled: false
                echoMode: TextInput.Password
                text: qsTr("Password")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Filter fields")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            FilterField {
                table: true
                enabled: false
                text: qsTr("Filter fields")
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
            //
            Label {
                text: qsTr("Combobox")
                font.pixelSize: Theme.auxFontSize
                color: Theme.colors.description
            }

            ComboBox {
                table: true
                enabled: false
                model: [ qsTr("This"), qsTr("Is"), qsTr("Example"), qsTr("Combobox") ]
                anchors.right: Layout.right
                Layout.fillWidth: true
            }
        }
        //--
    }
}
