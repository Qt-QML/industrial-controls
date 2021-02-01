import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Rectangle {
    id: root

    property bool expanded: false

    property Item expandedItem: null
    property Item collapsedItem: null

    onExpandedItemChanged: {
        expandedItem.parent = root
        expandedItem.anchors.fill = root
    }

    onCollapsedItemChanged: {
        collapsedItem.parent = root
        collapsedItem.anchors.fill = root
    }

    color: Controls.Theme.colors.background

    states: [
        State {
            name: "expanded"
            PropertyChanges { target: root; implicitWidth: expandedItem.implicitWidth }
            PropertyChanges { target: root; implicitHeight: expandedItem.implicitHeight }
            PropertyChanges { target: expandedItem; visible: true }
            PropertyChanges { target: collapsedItem; visible: false }
        },
        State {
            name: "collapsed"
            PropertyChanges { target: root; implicitWidth: collapsedItem.implicitWidth }
            PropertyChanges { target: root; implicitHeight: collapsedItem.implicitHeight }
            PropertyChanges { target: collapsedItem; visible: true }
            PropertyChanges { target: expandedItem; visible: false }
        }
    ]
    state: expanded ? "expanded" : "collapsed"

    Behavior on implicitHeight {
        NumberAnimation {
            duration: Controls.Theme.animationTime
        }
    }
}
