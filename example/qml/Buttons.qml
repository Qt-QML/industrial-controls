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
        columns: 5

        Label {}

        Label {
            text: qsTr("Text")
            font.pixelSize: controlSize.secondaryFontSize
        }

        Label {
            text: qsTr("Icon")
            font.pixelSize: controlSize.secondaryFontSize
        }

        Label {
            text: qsTr("Flat text")
            font.pixelSize: controlSize.secondaryFontSize
        }

        Label {
            text: qsTr("Flat icon")
            font.pixelSize: controlSize.secondaryFontSize
        }

        Label { text: qsTr("Common"); font.pixelSize: controlSize.secondaryFontSize }

        Button {
            text: qsTr("Common button")
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/plus.svg"
            tipText: qsTr("Icon button")
        }

        Button {
            text: qsTr("Flat button")
            flat: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/plus.svg"
            flat: true
            tipText: qsTr("Flat icon button")
        }

        Label { text: qsTr("Checkable"); font.pixelSize: controlSize.secondaryFontSize }

        Button {
            text: qsTr("Checkable button")
            Layout.fillWidth: true
            checkable: true
        }

        Button {
            iconSource: "qrc:/ui/minus.svg"
            checkable: true
            tipText: qsTr("Checkable icon button")
        }

        Button {
            text: qsTr("Flat checkable button")
            flat: true
            checkable: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/cancel.svg"
            flat: true
            checkable: true
            tipText: qsTr("Flat checkable icon button")
        }

        Label { text: qsTr("Delay"); font.pixelSize: controlSize.secondaryFontSize }

        DelayButton {
            text: qsTr("Delay button")
            Layout.fillWidth: true
            checkable: true
        }

        DelayButton {
            iconSource: "qrc:/ui/minus.svg"
            checkable: true
            tipText: qsTr("Delay icon button")
        }

        DelayButton {
            text: qsTr("Flat delay button")
            flat: true
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/up.svg"
            flat: true
            tipText: qsTr("Flat delay icon button")
        }

        // TODO: confirm buttom

        Item { Layout.fillHeight: true }
    }
}
