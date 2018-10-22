import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ApplicationWindow {
    id: main

    visible: true
    title: qsTr("Industrial demo")
    width: controlSize.baseSize * 24
    height: controlSize.baseSize * 12

    Loader {
        id: loader
        anchors.fill: parent
        anchors.margins: controlSize.margins
        source: "Controls.qml"
    }
}
