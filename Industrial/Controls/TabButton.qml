import QtQuick 2.6
import QtQuick.Templates 2.2 as T

import "../Shaders" as Shaders

T.TabButton {
    id: control

    property bool flat: false

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias textColor: content.textColor
    property alias backgroundColor: backgroundItem.color

    font.pixelSize: controlSize.fontSize
    implicitWidth: content.implicitWidth
    implicitHeight: controlSize.baseSize
    clip: true

    background: Rectangle {
        id: backgroundItem
        anchors.fill: parent
        radius: 3
        color: control.checked ? customPalette.raisedColor : "transparent";

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 2
            color: customPalette.highlightColor
            visible: control.activeFocus
        }

        Shaders.Hatch {
            anchors.fill: parent
            color: customPalette.sunkenColor
            visible: !control.enabled
        }
    }

    contentItem: ContentItem {
        id: content
        text: control.text
        font: control.font
        textColor: customPalette.textColor
    }
}
