import QtQuick 2.6

import "../Shaders" as Shaders

Item {
    id: control

    property bool highlighted: false
    property bool hovered: false
    property bool caution: false
    property bool isValid: true
    property bool shadow: false
    property int leftPadding: controlSize.padding
    property int croppig: radius
    readonly property int offset: radius + 1

    property alias radius: bg.radius
    property alias color: bg.color
    property alias highlighterColor: highlighter.color

    implicitHeight: controlSize.inputControlHeight

    Item {
        anchors.fill: parent
        clip: true

        Rectangle {
            id: bg
            color: customPalette.backgroundColor
            anchors.fill: parent
            radius: controlSize.rounding
            anchors.bottomMargin: -croppig

            Rectangle {
                anchors.fill: parent
                color: customPalette.textColor
                radius: parent.radius
                opacity: 0.1
                visible: hovered
            }
        }
    }

    Shaders.Hatch {
        anchors.fill: parent
        color: customPalette.sunkenColor
        visible: !enabled
    }


    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: controlSize.underline
        visible: control.highlighted && control.enabled
        color: {
            if (caution) return customPalette.cautionColor;
            if (!isValid) return customPalette.dangerColor;

            return customPalette.highlightColor;
        }
    }

    Shadow {
        visible: shadow
        source: parent
    }
}
