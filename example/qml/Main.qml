import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ApplicationWindow {
    id: main

    visible: true
    title: qsTr("Industrial demo")
    width: industrial.baseSize * 28
    height: industrial.baseSize * 12

    Loader {
        id: loader
        anchors.fill: parent
        anchors.margins: industrial.margins
        source: "Controls.qml"
    }

    Button {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: industrial.margins
        iconSource: "qrc:/icons/configure.svg"
        tipText: qsTr("Configure")
        flat: true
        round: true
        color: configurationPopup.visible ? industrial.colors.surface : "transparent"
        onClicked: configurationPopup.visible = !configurationPopup.visible

        Configuration {
            id: configurationPopup
            x: parent.width - width
            y: parent.height
        }
    }
}
