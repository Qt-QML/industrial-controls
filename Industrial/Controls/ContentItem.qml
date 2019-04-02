import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: content

    property color textColor: industrial.colors.onSurface
    property color iconColor: textColor

    property alias spacing: row.spacing
    property alias iconSize: icon.width
    property alias iconSource: icon.source
    property alias font: label.font
    property alias text: label.text
    property alias textSize: label.font.pixelSize
    property alias horizontalAlignment: label.horizontalAlignment
    property alias verticalAlignment: label.verticalAlignment

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: industrial.spacing

        ColoredIcon {
            id: icon
            implicitWidth: industrial.iconSize
            implicitHeight: industrial.iconSize
            color: enabled ? iconColor : industrial.colors.disabled
            visible: iconSource != ""
            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: label
            elide: Text.ElideRight
            font.pixelSize: industrial.mainFontSize
            color: enabled ? textColor : industrial.colors.disabled
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: text.length > 0
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
    }
}
