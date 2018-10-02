import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ApplicationWindow {
    visible: true
    title: qsTr("Industrial demo")
    width: controlSize.baseSize * 20
    height: controlSize.baseSize * 16

    ColumnLayout {
        id: mainColumn
        anchors.fill: parent
        anchors.margins: controlSize.margins
        spacing: controlSize.spacing

        TabBar {
            id: tabBar
            Layout.fillWidth: true

            TabButton { text: "Controls"; flat: true }
            TabButton { text: "Indicators"; flat: true }
        }

        StackLayout {
            currentIndex: tabBar.currentIndex
            Layout.fillWidth: true
            Layout.fillHeight: true

            Controls { anchors.fill: parent }
            Indicators { anchors.fill: parent }
        }
    }
}
