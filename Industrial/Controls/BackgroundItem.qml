import QtQuick 2.6

import "../Shaders" as Shaders

Rectangle {
    id: control

    property bool inputed: true
    property bool highlighted: false
    property int leftPadding: controlSize.padding
    readonly property int offset: radius + 1

    property alias text: textItem.text
    property alias textColor: textItem.color

    implicitWidth: Math.max(controlSize.baseSize * 4, textItem.implicitWidth)
    implicitHeight: controlSize.inputControlHeight
    color: "transparent"

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: highlighted ? 2 : 1
        color: highlighted ? customPalette.highlightColor : customPalette.controlColor
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
        color: highlighted ? customPalette.highlightColor : customPalette.secondaryTextColor
        font.pixelSize: inputed ? controlSize.secondaryFontSize: controlSize.fontSize
    }
}
