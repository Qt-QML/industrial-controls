import QtQuick 2.6
import QtQuick.Layouts 1.0
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    property color backgroundColor: industrial.colors.surface
    property string emptyText: qsTr("No items")

    property alias model: list.model
    property alias header: list.header
    property alias delegate: list.delegate

    function toBeginning() { list.positionViewAtBeginning() }
    function toIndex(index) { list.positionViewAtIndex(index) }
    function toEnd() { list.positionViewAtEnd() }

    implicitWidth: list.contentWidth + industrial.shadowSize + 1
    implicitHeight: Math.max(list.contentHeight + industrial.shadowSize + 1, industrial.baseSize * 5)
    clip: true

    ListView {
        id: list
        anchors.fill: parent
        anchors.leftMargin: 1
        anchors.topMargin: 1
        anchors.rightMargin: industrial.shadowSize
        anchors.bottomMargin: industrial.shadowSize
        spacing: industrial.spacing
        headerPositioning: ListView.PullBackHeader
        flickableDirection: Flickable.AutoFlickIfNeeded
        boundsBehavior: Flickable.StopAtBounds

        Controls.ScrollBar.vertical: Controls.ScrollBar {
            visible: list.contentHeight > list.height
        }

        Controls.Label {
            anchors.centerIn: parent
            text: emptyText
            visible: list.count === 0
        }
    }

    Rectangle {
        x: 1
        width: parent.width - industrial.shadowSize - 1
        height: industrial.baseSize * 0.5
        anchors.top: parent.top
        visible: list.contentY > 0
        gradient: Gradient {
            GradientStop { color: "transparent"; position: 1.0 }
            GradientStop { color: backgroundColor; position: 0.0 }
        }
    }

    Rectangle {
        x: 1
        width: parent.width - industrial.shadowSize - 1
        height: industrial.baseSize * 0.5
        anchors.bottom: parent.bottom
        visible: list.contentY < (list.contentHeight - list.height)
        gradient: Gradient {
            GradientStop { color: "transparent"; position: 0.0 }
            GradientStop { color: backgroundColor; position: 1.0 }
        }
    }
}
