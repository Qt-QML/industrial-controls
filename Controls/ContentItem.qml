import QtQuick 2.6

Item {
    id: content

    property int spacing: controlSize.spacing
    property int iconSize: controlSize.baseSize - controlSize.padding * 2

    property color textColor: customPalette.textColor
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
    implicitHeight: controlSize.baseSize

    ColoredIcon {
        id: icon
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: label.visible ? controlSize.padding - label.width / 2 : 0
        height: iconSize
        width: iconSize
        color: enabled ? iconColor : theme.disabledColor
        visible: iconSource != ""
    }

    Text {
        id: label
        anchors.right: parent.right
        width: content.width - (icon.visible ? content.spacing : 0)
        height: content.height
        elide: Text.ElideRight
        font.pixelSize: controlSize.fontSize
        color: enabled ? textColor : theme.disabledColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: text.length > 0
    }
}
