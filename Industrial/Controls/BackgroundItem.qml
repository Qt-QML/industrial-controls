import QtQuick 2.6

import "../Shaders" as Shaders

Rectangle {
    id: control

    property bool inputed: true
    property bool highlighted: false
    property bool isValid: true
    property int leftPadding: controlSize.padding
    readonly property int offset: radius + 1

    property alias text: textItem.text
    property alias textColor: textItem.color

    implicitWidth: Math.max(controlSize.baseSize * 4, textItem.implicitWidth)
    implicitHeight: controlSize.inputControlHeight
    color: isValid ? "transparent" : customPalette.dangerColor

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: control.highlighted ? 2 : 1
        color: control.highlighted ? customPalette.highlightColor : customPalette.controlColor
        visible: enabled
    }

    Shaders.Hatch {
        anchors.fill: parent
        color: customPalette.sunkenColor
        visible: !enabled
    }

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
