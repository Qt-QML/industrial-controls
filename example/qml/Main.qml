import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ApplicationWindow {
    id: main

    visible: true
    title: qsTr("Industrial demo")
    width: controlSize.baseSize * 24
    height: controlSize.baseSize * 18

    Loader {
        id: loader
        anchors.fill: parent
        anchors.margins: controlSize.margins
        source: "Controls.qml"
    }

    Button {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: controlSize.margins
        iconSource: "qrc:/ui/refresh.svg"
        tipText: qsTr("Refresh")
        flat: true
        onClicked: {
            loader.source = "";
            trimmer.trim();
            loader.source = "Controls.qml";
        }
    }
}
