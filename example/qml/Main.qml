import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ApplicationWindow {
    id: main

    visible: true
    title: qsTr("Industrial demo")
    width: Theme.baseSize * 28
    height: Theme.baseSize * 16

    Loader {
        id: loader
        anchors.fill: parent
        source: "Controls.qml"
    }

    Button {
        anchors.right: parent.right
        anchors.margins: Theme.margins
        iconSource: "qrc:/icons/configure.svg"
        tipText: qsTr("Configure")
        flat: true
        round: true
        color: configurationPopup.visible ? Theme.colors.raised : "transparent"
        onClicked: configurationPopup.visible = !configurationPopup.visible

        Configuration {
            id: configurationPopup
            x: parent.width - width
            y: parent.height
        }
    }
}
