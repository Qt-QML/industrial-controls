import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Frame {
    id: root

    padding: industrial.padding

    MouseArea {
         anchors.fill: parent
         acceptedButtons: Qt.RightButton
         onClicked: {
             menu.x = mouseX;
             menu.y = mouseY;
             menu.open();
         }

         Label {
             anchors.centerIn: parent
             text: qsTr("Click here to open menu")
         }
    }

    Menu {
        id: menu
        title: qsTr("Menu")

        MenuItem {
            text: qsTr("Info")
        }

        MenuItem {
            text: qsTr("Add")
            iconSource: "qrc:/icons/plus.svg"
        }

        MenuItem {
            text: qsTr("Remove")
            iconSource: "qrc:/icons/remove.svg"
            enabled: false
        }

        MenuItem {
            text: qsTr("Check")
            checkable: true
        }
    }
}
