import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    property color backgroundColor: Controls.Theme.colors.raised
    property string emptyText: qsTr("No items")

    property alias contentY: list.contentY
    property alias spacing: list.spacing
    property alias model: list.model
    property alias header: list.header
    property alias footer: list.footer
    property alias highlight: list.highlight
    property alias delegate: list.delegate
    property alias currentIndex: list.currentIndex

    function toBeginning() { list.positionViewAtBeginning() }
    function toIndex(index) { list.positionViewAtIndex(index) }
    function toEnd() { list.positionViewAtEnd() }

    implicitWidth: list.contentWidth + Controls.Theme.shadowSize + 1
    implicitHeight: Math.max(list.contentHeight + Controls.Theme.shadowSize + 1, Controls.Theme.baseSize * 5)
    clip: true

    ListView {
        id: list
        anchors.fill: parent
        anchors.leftMargin: 1
        anchors.topMargin: 1
        anchors.rightMargin: Controls.Theme.shadowSize
        anchors.bottomMargin: Controls.Theme.shadowSize
        spacing: Controls.Theme.spacing
        headerPositioning: ListView.OverlayHeader
        footerPositioning: ListView.OverlayFooter
        flickableDirection: Flickable.AutoFlickIfNeeded
        boundsBehavior: Flickable.StopAtBounds
        highlightResizeDuration: 0
        highlightMoveDuration: Controls.Theme.animationTime

        Controls.ScrollBar.vertical: Controls.ScrollBar {
            visible: list.contentHeight > list.height
        }

        header: ListFader {
            width: parent.width
            visible: list.contentY > 0
        }

        footer: ListFader {
            width: parent.width
            visible: list.contentY < (list.contentHeight - list.height)
            mirrored: true
        }

        Controls.Label {
            anchors.centerIn: parent
            text: emptyText
            visible: list.count === 0
        }
    }
}
