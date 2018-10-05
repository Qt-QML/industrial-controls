import QtQuick 2.6

BackgroundItem {
    id: control

    property bool inputed: true

    property alias text: textItem.text
    property alias textColor: textItem.color

    implicitWidth: Math.max(controlSize.baseSize * 4, textItem.implicitWidth)

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.leftPadding
        height: parent.height
        verticalAlignment: inputed ? Text.AlignTop : Text.AlignVCenter
        font.pixelSize: inputed ? controlSize.secondaryFontSize: controlSize.fontSize
        color: {
            if (!control.enabled) return customPalette.sunkenColor;
            if (!control.isValid) return customPalette.selectedTextColor
            if (control.highlighted) return customPalette.highlightColor;

            return customPalette.secondaryTextColor;
        }
    }
}
