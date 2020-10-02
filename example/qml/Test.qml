import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0
import Industrial.Widgets 1.0

Pane {
    id: root

    FileBrowser {
        id: fileBrowser

        anchors.centerIn: parent
        Layout.alignment: Qt.AlignCenter

        defaultSuffix: ".suffix"
        folder: ".."
        nameFilters: ["Filter 1 (*.txt)", "Filter 2 (*.cpp *.json)", "Any (*)"]

        onAccepted: acceptedList.model = fileBrowser.fileUrls
        onRejected: acceptedList.model = null
    }

    ColumnLayout {
        visible: !fileBrowser.visible
        anchors.fill: parent

        CheckBox {
            text: "Select folder"
            checked: fileBrowser.selectFolder
            onCheckedChanged: fileBrowser.selectFolder = checked
        }

        CheckBox {
            text: "Select existing"
            checked: fileBrowser.selectExisting
            onCheckedChanged: fileBrowser.selectExisting = checked
        }

        CheckBox {
            text: "Select multiple"
            checked: fileBrowser.selectMultiple
            onCheckedChanged: fileBrowser.selectMultiple = checked
        }

        Button {
            text: qsTr("Open file dialog")
            onClicked: fileBrowser.visible = true
        }

        Label {
            text: qsTr("Selected files")
        }

        ListWrapper {
            id: acceptedList
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: null
            delegate: Label {
                text: modelData
            }
        }
    }
}
