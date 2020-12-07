import QtQuick 2.6

Button {
    id: control

    property int currentIndex: -1
    property string textRole: "text"
    property string iconRole: "icon"
    property string checkableRole: "checkable"
    property string checkedRole: "checked"

    property alias model: repeater.model
    property alias delegate: repeater.delegate
    property alias menuSize: menu.menuSize
    property alias menuX: menu.x
    property alias menuY: menu.y

    signal triggered(var modelData)
    signal checked(var modelData, bool checked)

    enabled: repeater.count
    onClicked: menu.visible ? menu.close() : menu.open()
    onEnabledChanged: if (!enabled && menu.visible) menu.close()

    Menu {
        id: menu
        y: control.height

        Repeater {
            id: repeater

            delegate: MenuItem {
                text: modelData[control.textRole] ? modelData[control.textRole] : modelData
                iconSource: modelData[control.iconRole] ? modelData[control.iconRole] : ""
                checkable: modelData[control.checkableRole] ? modelData[control.checkableRole] : false
                checked: modelData[control.checkedRole] ? modelData[control.checkedRole] : false
                selected: index == control.currentIndex
                onTriggered: control.triggered(modelData)
                onCheckedChanged: control.checked(modelData, checked)
            }
        }
    }
}
