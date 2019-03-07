import QtQuick 2.6
import QtQuick.Layouts 1.3

Frame {
    id: control

    default property alias actions: row.children
    property alias text: textLabel.text

    backgroundColor: industrial.colors.neutral

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0

        Label {
            id: textLabel
            color: industrial.colors.onHighlight
            Layout.fillWidth: true
        }
    }
}
