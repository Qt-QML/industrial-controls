import QtQuick 2.6
import QtQuick.Layouts 1.3

Pane {
    id: control

    default property alias actions: row.children
    property alias text: textLabel.text
    property alias textColor: textLabel.color

    signal clicked()

    implicitWidth: row.implicitWidth + padding * 2
    implicitHeight: row.implicitHeight + padding * 2
    backgroundColor: Theme.colors.neutral
    padding: Theme.padding

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0

        Label {
            id: textLabel
            color: Theme.colors.highlightedText
            font.pixelSize: Theme.auxFontSize
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: control.clicked()
    }
}
