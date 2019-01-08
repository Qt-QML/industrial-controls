import QtQuick 2.6

Item {
    id: content

    property int spacing: industrial.spacing

    property color textColor: industrial.colors.onSurface
    property color iconColor: textColor

    property alias iconSize: icon.width
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
        anchors.horizontalCenterOffset: label.visible ? industrial.padding - label.width / 2 : 0
        width: industrial.iconSize
        color: enabled ? iconColor : industrial.colors.disabled
        visible: iconSource != ""
    }

    Text {
        id: label
        anchors.right: parent.right
        width: content.width - (icon.visible ? content.spacing : 0)
        height: content.height
        elide: Text.ElideRight
        font.pixelSize: industrial.mainFontSize
        color: enabled ? textColor : industrial.colors.disabled
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: text.length > 0
    }
}
