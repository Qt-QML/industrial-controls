import QtQuick 2.6
import QtQuick.Layouts 1.3

Pane {
    id: control

    default property alias actions: row.children
    property alias text: textLabel.text
    property alias textColor: textLabel.color

    backgroundColor: industrial.colors.neutral
    padding: 0

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0

        Label {
            id: textLabel
            color: industrial.colors.onHighlight
            font.pixelSize: industrial.auxFontSize
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
    }
}
