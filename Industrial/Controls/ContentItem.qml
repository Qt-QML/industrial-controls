import QtQuick 2.6

Item {
    id: content

    property color textColor: customPalette.textColor
    property color iconColor: textColor

    property alias iconSource: icon.source
    property alias font: label.font
    property alias text: label.text
    property alias horizontalAlignment: label.horizontalAlignment
    property alias verticalAlignment: label.verticalAlignment

    property int spacing: controlSize.spacing

    clip: true
    implicitWidth: {
        if (icon.visible) {
            return label.visible ? (icon.width + spacing + label.implicitWidth) : icon.width;
        }
        return label.implicitWidth
    }
    implicitHeight: controlSize.baseSize

    ColoredIcon {
        id: icon
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        height: content.height
        width: height
        color: enabled ? iconColor : customPalette.sunkenColor
        visible: iconSource != ""
    }

    Text {
        id: label
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: controlSize.fontSize
        width: content.width - (icon.visible ? content.spacing + icon.width : 0)
        color: enabled ? textColor : customPalette.sunkenColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: text.length > 0
    }
}
