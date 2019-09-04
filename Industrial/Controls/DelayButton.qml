import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.DelayButton {
    id: control

    property string tipText
    property bool flat: false
    property bool shadow: !flat
    property bool round: false

    property alias iconSource: content.iconSource
    property alias textColor: content.textColor
    property alias iconColor: content.iconColor
    property alias backgroundColor: backgroundItem.color

    onActivated: progress = 0

    font.pixelSize: Theme.mainFontSize
    implicitWidth: Math.max(Theme.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: Theme.baseSize
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    padding: Theme.padding
    delay: 1000

    background: BackgroundItem {
        id: backgroundItem
        anchors.fill: parent
        borderColor: control.activeFocus ? Theme.colors.highlight : "transparent"
        hovered: control.hovered
        radius: round ? Math.min(width, height) / 2 : Theme.rounding
        color: control.flat ? "transparent" : Theme.colors.control

        Shadow {
            visible: control.shadow && !control.flat
            source: parent
        }

        Hatch {
            anchors.fill: parent
            color: Theme.colors.raised
            visible: !enabled
        }
    }

    contentItem: Item {
        anchors.fill: parent

        ContentItem {
            id: content
            anchors.fill: parent
            anchors.margins: control.padding
            text: control.text
            font: control.font
            textColor: Theme.colors.controlText
        }

        Item {
            width: parent.width * control.progress
            height: parent.height
            clip: true

            Rectangle {
                radius: backgroundItem.radius
                anchors.fill: parent
                anchors.rightMargin: -backgroundItem.radius
                color: Theme.colors.selection
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
                    textColor: Theme.colors.selectedText
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
