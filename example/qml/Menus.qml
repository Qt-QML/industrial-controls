import QtQuick 2.6
//import QtQuick.Controls 2.2
import QtQuick.Controls 2.4
import Industrial.Controls 1.0

Pane {
    id: root

    padding: Theme.padding

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

    ///*
    //
    //Example MenuItem
    //
    Menu {
        id: menu
        title: qsTr("Menu")

        MenuItem {
            text: qsTr("New...")
            onTriggered: console.log(text)
        }

        MenuItem {
            text: qsTr("Open...")
            onTriggered: console.log(text)
        }

        MenuItem {
            text: qsTr("Save")
            onTriggered: console.log(text)
        }

        MenuSeparator {}

        Menu {
            title: qsTr("Icons")

            MenuItem {
                text: qsTr("Info")
                iconSource: "qrc:/icons/info.svg"
                onTriggered: console.log(text)
            }

            MenuItem {
                text: qsTr("Configure")
                iconSource: "qrc:/icons/configure.svg"
                onTriggered: console.log(text)
            }

            MenuItem {
                text: qsTr("Plugins")
                iconSource: "qrc:/icons/plugins.svg"
                selected: true
                onTriggered: console.log(text)
            }

            MenuItem {
                text: qsTr("Calendar")
                iconSource: "qrc:/icons/calendar.svg"
                onTriggered: console.log(text)
            }
        }

        Menu {
            title: qsTr("Checkable")

            MenuItem {
                text: qsTr("Check")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }

            MenuItem {
                text: qsTr("Check")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }

            MenuItem {
                text: qsTr("Check")
                checkable: true
                selected: true
                onTriggered: console.log(text + " checked: " + checked)
            }

            MenuItem {
                text: qsTr("Check and some more text...")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }
        }

        MenuSeparator {}

        MenuItem {
            text: qsTr("Exit")
            enabled: false
            onTriggered: console.log(text)
        }
    }
    //*/

    /*
    //
    //Example MenuModel
    //
    ListModel{
        id: menuModel
        ListElement{
            text: "New..."
        }
        ListElement{
            text: "Open..."
        }
        ListElement{
            text: "Save"
            icon: "qrc:/icons/info.svg"
        }
        ListElement{
            text: "Check"
            checkable: true
        }
        ListElement{
            text: "Exit"
            //enable: false
        }
    }

    Menu {
        id: menu
        Repeater {
            model: menuModel
            MenuItem {
                text: model.text //modelData
                iconSource: model.icon !== undefined ? model.icon : ""
                checkable: model.checkable !== undefined ? model.checkable : false
                //enabled: model.enable !== undefined ? model.enable : true
            }
        }
    }
    */

    /*
    //
    //Example Action
    //
    Menu {
        id: menu
        Action {
            text: qsTr("New...")
            onTriggered: console.log(text)
        }
        Action {
            text: qsTr("Open...")
            onTriggered: console.log(text)
        }
        Action {
            text: qsTr("Save")
            onTriggered: console.log(text)
        }

        MenuSeparator { }

        Menu {
            title: qsTr("Icons")

            Action {
                text: qsTr("Info")
                icon.source: "qrc:/icons/info.svg"
                onTriggered: console.log(text)
            }

            Action {
                text: qsTr("Configure")
                icon.source: "qrc:/icons/configure.svg"
                onTriggered: console.log(text)
            }

            Action {
                text: qsTr("Plugins")
                icon.source: "qrc:/icons/plugins.svg"
                onTriggered: console.log(text)
            }

            Action {
                text: qsTr("Calendar")
                icon.source: "qrc:/icons/calendar.svg"
                onTriggered: console.log(text)
            }
        }

        Menu {
            title: qsTr("Checkable")

            Action {
                text: qsTr("Check")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }

            Action {
                text: qsTr("Check")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }

            Action {
                text: qsTr("Check")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }

            Action {
                text: qsTr("Check and some more text...")
                checkable: true
                onTriggered: console.log(text + " checked: " + checked)
            }
        }

        MenuSeparator {}

        Action {
            text: qsTr("Exit")
            enabled: false
            onTriggered: console.log(text)
        }
    }
    */
}
