import QtQuick 2.6
import QtQuick.Controls 2.2 as T

import "../Shaders" as Shaders

T.DelayButton {
    id: control

    property string tipText
    property bool flat: false

    property alias iconSource: content.iconSource
    property alias textColor: content.textColor
    property alias iconColor: content.iconColor
    property alias backgroundColor: backgroundItem.color

    onActivated: progress = 0

    font.pixelSize: controlSize.fontSize
    implicitWidth: Math.max(controlSize.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: controlSize.baseSize
    hoverEnabled: true
    padding: controlSize.padding
    delay: 1000

    background: Rectangle {
        id: backgroundItem
        anchors.fill: parent
        radius: controlSize.rounding
        color: control.flat ? "transparent" : customPalette.buttonColor

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: backgroundItem.radius
            color: control.activeFocus ? customPalette.highlightColor : backgroundItem.color
        }

        ContentItem {
            id: content
            anchors.fill: parent
            anchors.margins: control.padding
            text: control.text
            font: control.font
            textColor: customPalette.textColor
        }

        Rectangle {
            radius: parent.radius
            height: parent.height
            width: parent.width * control.progress
            color: customPalette.highlightColor
            clip: true

            Item {
                x: (backgroundItem.width - width) / 2
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height
                width: content.width + control.padding * 2

                ContentItem {
                    id: invertedContent
                    anchors.fill: parent
                    anchors.margins: control.padding
                    text: control.text
                    font: control.font
                    iconSource: control.iconSource
                    textColor: customPalette.selectedTextColor
                }
            }
        }

        Rectangle {
            anchors.fill: parent
            color: customPalette.textColor
            radius: parent.radius
            opacity: 0.1
            visible: control.hovered
        }

        Shaders.Hatch {
            anchors.fill: parent
            color: customPalette.sunkenColor
            visible: !control.enabled && !control.flat
        }

        Shadow {
            visible: !control.flat
            source: parent
        }
    }

    contentItem: Item {}

    ToolTip {
        visible: control.hovered && tipText
        text: tipText
        delay: 1000
    }
}
