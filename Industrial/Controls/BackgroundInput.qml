import QtQuick 2.6

BackgroundItem {
    id: control

    property bool inputed: true

    property alias textHeight: textItem.height
    property alias text: textItem.text
    property alias textColor: textItem.color

    implicitWidth: Math.max(controlSize.baseSize * 4, textItem.implicitWidth)

    Hatch {
        anchors.fill: parent
        color: customPalette.raisedColor
        visible: !enabled
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.leftPadding
        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        height: implicitHeight
        font.pixelSize: inputed ? controlSize.secondaryFontSize: controlSize.fontSize
        color: {
            if (!control.enabled) return customPalette.sunkenColor;
            if (control.caution) return customPalette.cautionColor;
            if (!control.isValid) return customPalette.dangerColor
            if (control.highlighted) return customPalette.highlightColor;

            return customPalette.secondaryTextColor;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: controlSize.animationTime } }
    }
}
