import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: content

    property color textColor: Industrial.colors.textRaised
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
        spacing: Industrial.spacing

        ColoredIcon {
            id: icon
            implicitWidth: Industrial.iconSize
            implicitHeight: Industrial.iconSize
            color: enabled ? iconColor : Industrial.colors.disabled
            visible: iconSource != ""
            //Layout.alignment: Qt.AlignCenter
            Layout.leftMargin: (content.height - width) / 2
        }

        Text {
            id: label
            elide: Text.ElideRight
            font.pixelSize: Industrial.mainFontSize
            color: enabled ? textColor : Industrial.colors.disabled
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: text.length > 0
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
    }
}
