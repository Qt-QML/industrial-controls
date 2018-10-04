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
        columns: 6

        Label {}

        Label {
            text: qsTr("Text")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Icon")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Text & icon")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled text")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: qsTr("Disabled icon")
            font.pixelSize: controlSize.secondaryFontSize
            Layout.alignment: Qt.AlignHCenter
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
            iconSource: "qrc:/ui/up.svg"
            text: qsTr("Up button")
            Layout.fillWidth: true
        }

        Button {
            text: qsTr("Disabled button")
            enabled: false
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/ok.svg"
            enabled: false
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Flat"); font.pixelSize: controlSize.secondaryFontSize }

        Button {
            text: qsTr("Flat button")
            flat: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/minus.svg"
            tipText: qsTr("Flat icon button")
            flat: true
        }

        Button {
            iconSource: "qrc:/ui/down.svg"
            text: qsTr("Down button")
            flat: true
            Layout.fillWidth: true
        }

        Button {
            text: qsTr("Disabled flat button")
            flat: true
            enabled: false
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/cancel.svg"
            flat: true
            enabled: false
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Checkable"); font.pixelSize: controlSize.secondaryFontSize }

        Button {
            text: qsTr("Checkable")
            checkable: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/refresh.svg"
            tipText: qsTr("Checkable icon")
            checkable: true
        }

        Button {
            iconSource: "qrc:/ui/left.svg"
            text: qsTr("Left button")
            checkable: true
            Layout.fillWidth: true
        }

        Button {
            text: qsTr("Disabled checkable")
            checkable: true
            enabled: false
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/dots.svg"
            checkable: true
            enabled: false
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Checkable & flat"); font.pixelSize: controlSize.secondaryFontSize }

        Button {
            text: qsTr("Checkable flat")
            checkable: true
            flat: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/restore.svg"
            tipText: qsTr("Checkable icon")
            checkable: true
            flat: true
        }

        Button {
            iconSource: "qrc:/ui/right.svg"
            text: qsTr("Right button")
            checkable: true
            flat: true
            Layout.fillWidth: true
        }

        Button {
            text: qsTr("Disabled checkable")
            checkable: true
            enabled: false
            flat: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/cancel.svg"
            checkable: true
            enabled: false
            flat: true
            Layout.alignment: Qt.AlignHCenter
        }

        Label { text: qsTr("Delay"); font.pixelSize: controlSize.secondaryFontSize }

        DelayButton {
            text: qsTr("Delay")
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/up.svg"
            tipText: qsTr("Delay icon button")
        }

        DelayButton {
            iconSource: "qrc:/ui/down.svg"
            text: qsTr("Delay down")
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/up.svg"
            text: qsTr("Delay up")
            enabled: false
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/dots.svg"
            Layout.alignment: Qt.AlignHCenter
            enabled: false
        }

        Label { text: qsTr("Delay & flat"); font.pixelSize: controlSize.secondaryFontSize }

        DelayButton {
            text: qsTr("Delay flat")
            flat: true
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/plus.svg"
            flat: true
            tipText: qsTr("Delay icon flat")
        }

        DelayButton {
            iconSource: "qrc:/ui/left.svg"
            text: qsTr("Delay left")
            flat: true
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/right.svg"
            text: qsTr("Delay right")
            flat: true
            enabled: false
            Layout.fillWidth: true
        }

        DelayButton {
            iconSource: "qrc:/ui/cancel.svg"
            flat: true
            enabled: false
            Layout.alignment: Qt.AlignHCenter
        }

        // TODO: confirm buttons

        Item { Layout.fillHeight: true }
    }
}
