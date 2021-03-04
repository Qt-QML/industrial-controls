import QtQuick 2.6
import Industrial.Controls 1.0

Rectangle {
    id: root

    default property Item contentItem

    property Item draggedItemParent

    property bool dragEnabled: true

    property alias containsMouse: mouseArea.containsMouse
    property bool isDragActive: false

    signal moveItemRequested(int from, int to)

    signal entered()
    signal exited()
    signal clicked(var mouse)
    signal doubleClicked(var mouse)

    // Size of the area at the top and bottom of the list where drag-scrolling happens
    property int scrollEdgeSize: 6

    // Internal: set to -1 when drag-scrolling up and 1 when drag-scrolling down
    property int _scrollingDirection: 0
    property ListView _listView: ListView.view

    width: contentItem.width
    height: topPlaceholder.height + wrapperParent.height + bottomPlaceholder.height
    radius: Theme.rounding
    color: mouseArea.containsMouse ? Theme.colors.hover : "transparent"

    // Make contentItem a child of contentItemWrapper
    onContentItemChanged: {
        contentItem.parent = contentItemWrapper;
    }

    function cancelDND() {
        //TODO: если кто знает как, то вот тут было бы круто
        //вызвать отмену ДНД, и тогда все костыли с isDragActive
        //можно удалять
        //isDragActive - удалить целиком, везде, где используется
    }

    Rectangle {
        id: topPlaceholder
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: 0
        color: Theme.colors.highlight
    }

    Item {
        id: wrapperParent
        height: contentItem.height
        anchors {
            left: parent.left
            right: parent.right
            top: topPlaceholder.bottom
        }

        Item {
            id: contentItemWrapper
            anchors.fill: parent
            Drag.active: mouseArea.drag.active
            Drag.hotSpot {
                x: contentItem.width / 2
                y: contentItem.height / 2
            }

            onXChanged: {
                if (root.draggedItemParent && (x < 0 || x > root.draggedItemParent.width)) {
                    cancelDND()
                }
            }
            onYChanged: {
                if (root.draggedItemParent && (y < 0 || y > root.draggedItemParent.height)) {
                    cancelDND()
                }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                drag.target: root.dragEnabled ? parent : null
                drag.smoothed: false
                drag.minimumX: -1
                drag.maximumX: draggedItemParent.width - contentItem.width + 1
                drag.minimumY: -1
                drag.maximumY: draggedItemParent.height - contentItem.height + 1
                hoverEnabled: true
                onEntered: root.entered()
                onExited: root.exited()
                onReleased: if (drag.active) {
                                root.isDragActive = false
                                emitMoveItemRequested()
                            }
                onOnceClicked: {
                    root.clicked(mouse)
                }
                onDoubleClicked: {
                    root.doubleClicked(mouse)
                }
            }
        }
    }

    Rectangle {
        id: bottomPlaceholder
        anchors {
            left: parent.left
            right: parent.right
            top: wrapperParent.bottom
        }
        height: 0
        color: Theme.colors.hover
    }

    SmoothedAnimation {
        id: upAnimation
        target: _listView
        property: "contentY"
        to: 0
        running: _scrollingDirection == -1
    }

    SmoothedAnimation {
        id: downAnimation
        target: _listView
        property: "contentY"
        to: _listView.contentHeight - _listView.height
        running: _scrollingDirection == 1
    }

    Loader {
        id: topDropAreaLoader
        active: model.index === 0 && dragEnabled
        anchors {
            left: parent.left
            right: parent.right
            bottom: wrapperParent.verticalCenter
        }
        height: contentItem.height
        sourceComponent: Component {
            DropArea {
                property int dropIndex: 0
            }
        }
    }

    DropArea {
        id: bottomDropArea
        anchors {
            left: parent.left
            right: parent.right
            top: wrapperParent.verticalCenter
        }
        enabled: !mouseArea.drag.active && dragEnabled
        property bool isLast: model.index === _listView.count - 1
        height: isLast ? _listView.contentHeight - y : contentItem.height

        property int dropIndex: model.index + 1
    }

    states: [
        State {
            when: mouseArea.drag.active
            name: "dragging"

            ParentChange {
                target: contentItemWrapper
                parent: draggedItemParent
            }
            PropertyChanges {
                target: contentItemWrapper
                opacity: 0.9
                anchors.fill: undefined
                width: contentItem.width
                height: contentItem.height
            }
            PropertyChanges {
                target: wrapperParent
                height: 0
            }
            PropertyChanges {
                target: root
                isDragActive: true
                _scrollingDirection: {
                    var yCoord = _listView.mapFromItem(mouseArea, 0, mouseArea.mouseY).y;
                    if (yCoord < scrollEdgeSize) {
                        return -1;
                    } else if (yCoord > _listView.height - scrollEdgeSize) {
                        return 1;
                    } else {
                        return 0;
                    }
                }
            }
        },
        State {
            when: bottomDropArea.containsDrag
            name: "droppingBelow"
            PropertyChanges {
                target: bottomPlaceholder
                height: contentItem.height
            }
            PropertyChanges {
                target: bottomDropArea
                height: contentItem.height * 2
            }
            PropertyChanges {
                target: root
                isDragActive: false
            }
        },
        State {
            when: !!topDropAreaLoader.item && topDropAreaLoader.item.containsDrag
            name: "droppingAbove"
            PropertyChanges {
                target: topPlaceholder
                height: contentItem.height
            }
            PropertyChanges {
                target: topDropAreaLoader
                height: contentItem.height * 2
            }
            PropertyChanges {
                target: root
                isDragActive: false
            }
        }
    ]

    function emitMoveItemRequested() {
        var dropArea = contentItemWrapper.Drag.target;
        if (!dropArea) {
            return;
        }
        var dropIndex = dropArea.dropIndex;

        // If the target item is below us, then decrement dropIndex because the target item is going to move up when
        // our item leaves its place
        if (model.index < dropIndex) {
            dropIndex--;
        }
        if (model.index === dropIndex) {
            return;
        }
        root.moveItemRequested(model.index, dropIndex);

        // Scroll the ListView to ensure the dropped item is visible. This is required when dropping an item after the
        // last item of the view. Delay the scroll using a Timer because we have to wait until the view has moved the
        // item before we can scroll to it.
        makeDroppedItemVisibleTimer.start();
    }

    Timer {
        id: makeDroppedItemVisibleTimer
        interval: 0
        onTriggered: {
            _listView.positionViewAtIndex(model.index, ListView.Contain);
        }
    }
}
