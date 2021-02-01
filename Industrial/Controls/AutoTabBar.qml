import QtQuick 2.6

Item {
    id: control

    default property alias contentData: tabBar.contentData
    property alias currentIndex: tabBar.currentIndex
    property alias spacing: tabBar.spacing
    property alias backgroundColor: background.color

    implicitWidth: Theme.baseSize * 6
    implicitHeight: Theme.baseSize
    clip: true

    Component.onCompleted: collapseTabBar()
    onWidthChanged: collapseTabBar()

    Rectangle {
        id: background
        color: Theme.colors.sunken
        anchors.fill: parent
    }

    TabBar {
        id: tabBar
        spacing: 1
        implicitWidth: parent.width - (menuButton.visible ? menuButton.width : 0)
        implicitHeight: parent.height
    }

    MenuButton {
        id: menuButton
        x: control.width - width
        height: parent.height
        width: height
        iconSource: menuVisible ? "/icons/up.svg" : "/icons/down.svg"
        iconColor: menuVisible || hovered || pressed ? Theme.colors.selectedText : Theme.colors.description
        tipText: qsTr("Collapsed tabs")
        checked: menuVisible ? true : false
        flat: true
        round: true
        visible: menuModel.count
        model: ListModel { id: menuModel }
        delegate: MenuItem {
            text: model.name
            enabled: model.enable
            selected: model.index === currentIndex
            onTriggered: control.currentIndex = index
        }
    }

    function collapseTabBar() {
        menuModel.clear()
        var width = tabBar.width
        for (var i = 0; i < tabBar.count; ++i) {
            tabBar.contentChildren[i].width = Math.max(Theme.baseSize * 3, tabBar.width / tabBar.count - spacing)
            if (width > tabBar.contentChildren[i].width + spacing) {
                width -= tabBar.contentChildren[i].width
            }
            else {
                for (var j = i; j < tabBar.count; ++j) {
                    menuModel.append({name: tabBar.contentChildren[j].text, index: j, enable: tabBar.contentChildren[j].enabled})
                    tabBar.contentChildren[j].width = 0 - spacing //this is a hack to remove spacing in listview
                    if (tabBar.currentIndex === j) {
                        menuButton.currentIndex = menuModel.count - 1
                    }
                    for (var x = 0; x < tabBar.count; ++x) {
                        if (tabBar.contentChildren[x].width > 0 ) {
                            tabBar.contentChildren[x].width = tabBar.width / (tabBar.count - menuModel.count) - spacing
                        }
                    }
                }
                break
            }
        }
    }
}
