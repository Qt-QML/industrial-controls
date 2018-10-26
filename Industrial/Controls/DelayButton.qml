import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.DelayButton {
    id: control

    property string tipText
    property bool flat: false
    property bool round: flat

    property alias iconSource: content.iconSource
    property alias textColor: content.textColor
    property alias iconColor: content.iconColor
    property alias backgroundColor: backgroundItem.color

    onActivated: progress = 0

    font.pixelSize: theme.mainFontSize
    implicitWidth: Math.max(theme.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: theme.baseSize
    hoverEnabled: true
    padding: theme.padding
    delay: 1000

    background: BackgroundItem {
        id: backgroundItem
        anchors.fill: parent
        highlighted: control.activeFocus
        hovered: control.hovered
        shadow: !control.flat
        radius: round ? Math.min(width, height) / 2 : theme.rounding
        color: control.flat ? "transparent" : theme.buttonColor

        Hatch {
            anchors.fill: parent
            color: theme.surfaceColor
            visible: !enabled
        }
    }

    contentItem: Item {
        anchors.fill: parent

        ContentItem {
            id: content
            anchors.fill: parent
            implicitHeight: parent.height
            anchors.margins: control.padding
            text: control.text
            font: control.font
            textColor: theme.onButtonColor
        }

        Item {
            width: parent.width * control.progress
            height: parent.height
            clip: true

            Rectangle {
                radius: backgroundItem.radius
                anchors.fill: parent
                anchors.rightMargin: -backgroundItem.radius
                anchors.bottomMargin: -backgroundItem.radius
                color: theme.highlightColor
                clip: true
            }

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
                    textColor: theme.onSelectionColor
                }
            }
        }
    }

    ToolTip {
        visible: control.hovered && tipText
        text: tipText
        delay: 1000
    }
}
