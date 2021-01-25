import QtQuick 2.6
import QtQuick.Layouts 1.3

Item {
    id: content

    property color textColor: Theme.colors.text
    property color iconColor: textColor

    property alias spacing: row.spacing
    property alias iconSize: icon.width
    property alias iconSource: icon.source
    property alias font: label.font
    property alias text: label.text
    property alias textSize: label.font.pixelSize
    property alias horizontalAlignment: label.horizontalAlignment
    property alias verticalAlignment: label.verticalAlignment

    implicitWidth: {
        if (icon.visible) {
            if (label.visible)
                return icon.implicitWidth + label.implicitWidth + row.spacing;
            return icon.implicitWidth;
        }
        else if (label.visible) {
            return label.implicitWidth + 1;
        }
        return 0;
    }
    implicitHeight: Math.max(icon.implicitHeight, label.implicitHeight)

    RowLayout {
        id: row
        anchors.centerIn: parent
        width: parent.width
        spacing: Theme.spacing

        ColoredIcon {
            id: icon
            implicitWidth: Theme.iconSize
            implicitHeight: Theme.iconSize
            color: enabled ? iconColor : Theme.colors.disabled
            visible: iconSource != ""
            Layout.leftMargin: text.length > 0 ? (Math.min(content.height, content.width) - width) / 2 : (content.width - width) / 2
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
        }
    }
}
