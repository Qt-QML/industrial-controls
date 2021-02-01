import QtQuick 2.6

Button {
    id: control

    property int currentIndex: -1
    property bool allCheckable: false
    property string textRole: "text"
    property string iconRole: "icon"
    property string checkableRole: "checkable"
    property string checkedRole: "checked"

    property alias model: repeater.model
    property alias delegate: repeater.delegate
    property alias closePolicy: menu.closePolicy
    property alias menuSize: menu.menuSize
    property alias menuX: menu.x
    property alias menuY: menu.y
    property alias menuVisible: menu.visible

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
                text: {
                    if (typeof modelData !== "undefined") {
                        return modelData[control.textRole] ? modelData[control.textRole] : modelData;
                    }
                    if (typeof model !== "undefined") {
                        return model[control.textRole] ? model[control.textRole] : model;
                    }
                    return "";
                }
                iconSource: {
                    if (typeof modelData !== "undefined") {
                        return modelData[control.iconRole] ? modelData[control.iconRole] : "";
                    }
                    if (typeof model !== "undefined") {
                        return model[control.iconRole] ? model[control.iconRole] : "";
                    }
                    return "";
                }
                checkable: {
                    if (typeof modelData !== "undefined") {
                        return modelData[control.checkableRole] ? modelData[control.checkableRole] : false;
                    }
                    if (typeof model !== "undefined") {
                        return model[control.checkableRole] ? model[control.checkableRole] : false;
                    }
                    return control.allCheckable;
                }
                checked: {
                    if (typeof modelData !== "undefined") {
                        return modelData[control.checkedRole] ? modelData[control.checkedRole] : false;
                    }
                    if (typeof model !== "undefined") {
                        return model[control.checkedRole] ? model[control.checkedRole] : false;
                    }
                    return false;
                }

                selected: index == control.currentIndex
                onTriggered: {
                    if (typeof modelData !== "undefined") {
                        control.triggered(modelData);
                        if (checkable)
                            control.checked(modelData, checked);
                    }
                    else if (typeof model !== "undefined") {
                        control.triggered(model);
                        if (checkable)
                            control.checked(model, checked);
                    }
                }
            }
        }
    }
}
