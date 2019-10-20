import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: content

    property color textColor: Theme.colors.textRaised
    property color iconColor: textColor

    property alias spacing: row.spacing
    property alias iconSize: icon.width
    property alias iconSource: icon.source
    property alias font: label.font
    property alias text: label.text
    property alias textSize: label.font.pixelSize
    property alias horizontalAlignment: label.horizontalAlignment
    property alias verticalAlignment: label.verticalAlignment

    implicitWidth: icon.implicitWidth + label.implicitWidth + row.spacing
    implicitHeight: icon.implicitHeight + label.implicitHeight + row.spacing

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: Theme.spacing

        ColoredIcon {
            id: icon
            implicitWidth: Theme.iconSize
            implicitHeight: Theme.iconSize
            color: enabled ? iconColor : Theme.colors.disabled
            visible: iconSource != ""
            //Layout.alignment: Qt.AlignCenter
            Layout.leftMargin: (content.height - width) / 2
        }

        Text {
            id: label
            elide: Text.ElideRight
            font.pixelSize: Theme.mainFontSize
            color: enabled ? textColor : Theme.colors.disabled
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: text.length > 0
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
    }
}
