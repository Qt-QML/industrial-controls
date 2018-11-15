import QtQuick 2.6

Item {
    id: content

    property int spacing: Theme.spacing
    property int iconSize: Theme.iconSize

    property color textColor: Theme.onSurfaceColor
    property color iconColor: textColor

    property alias iconSource: icon.source
    property alias font: label.font
    property alias text: label.text
    property alias horizontalAlignment: label.horizontalAlignment
    property alias verticalAlignment: label.verticalAlignment

    clip: true
    implicitWidth: {
        if (icon.visible) {
            return label.visible ? (icon.width + content.spacing + label.implicitWidth) : icon.width;
        }
        return label.implicitWidth
    }
    implicitHeight: label.contentHeight

    ColoredIcon {
        id: icon
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: label.visible ? Theme.padding - label.width / 2 : 0
        height: iconSize
        width: iconSize
        color: enabled ? iconColor : Theme.disabledColor
        visible: iconSource != ""
    }

    Text {
        id: label
        anchors.right: parent.right
        width: content.width - (icon.visible ? content.spacing : 0)
        height: content.height
        elide: Text.ElideRight
        font.pixelSize: Theme.mainFontSize
        color: enabled ? textColor : Theme.disabledColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: text.length > 0
    }
}
