import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Rectangle {
    id: listRoot

    property string emptyText: qsTr("No items")
    property int offset: 2

    property alias list: list
    property alias contentY: list.contentY
    property alias spacing: list.spacing
    property alias model: list.model
    property alias header: list.header
    property alias footer: list.footer
    property alias highlight: list.highlight
    property alias delegate: list.delegate
    property alias currentIndex: list.currentIndex
    property alias count: list.count

    function toBeginning() { list.positionViewAtBeginning() }
    function toIndex(index) { list.positionViewAtIndex(index) }
    function toEnd() { list.positionViewAtEnd() }

    implicitWidth: list.contentWidth
    implicitHeight: Math.max(list.contentHeight, Controls.Theme.baseSize * 5)
    color: Controls.Theme.colors.background
    radius: Controls.Theme.rounding
    clip: true

    ListView {
        id: list
        anchors.fill: parent
        spacing: offset
        headerPositioning: ListView.OverlayHeader
        footerPositioning: ListView.OverlayFooter
        flickableDirection: Flickable.AutoFlickIfNeeded
        boundsBehavior: Flickable.StopAtBounds
        highlightResizeDuration: 0
        currentIndex: -1
        highlightMoveDuration: Controls.Theme.animationTime

        Controls.ScrollBar.vertical: Controls.ScrollBar {
            visible: list.contentHeight > list.height
        }

        header: ListFader {
            width: parent.width
            faderOffset: offset
            faderHeight: list.contentY
        }

        footer: ListFader {
            width: parent.width
            faderOffset: offset
            faderHeight: (list.contentHeight - list.height) - list.contentY
            mirrored: true
        }

        Controls.Label {
            anchors.centerIn: parent
            text: emptyText
            visible: list.count === 0
        }
    }
}
