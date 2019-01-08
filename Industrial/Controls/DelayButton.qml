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

    font.pixelSize: industrial.mainFontSize
    implicitWidth: Math.max(industrial.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: industrial.baseSize
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    padding: industrial.padding
    delay: 1000

    background: BackgroundItem {
        id: backgroundItem
        anchors.fill: parent
        borderColor: control.activeFocus ? industrial.colors.highlight : "transparent"
        hovered: control.hovered
        radius: round ? Math.min(width, height) / 2 : industrial.rounding
        color: control.flat ? "transparent" : industrial.colors.button

        Shadow {
            visible: control.shadow && !control.flat
            source: parent
        }

        Hatch {
            anchors.fill: parent
            color: industrial.colors.surface
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
            textColor: industrial.colors.onButton
        }

        Item {
            width: parent.width * control.progress
            height: parent.height
            clip: true

            Rectangle {
                radius: backgroundItem.radius
                anchors.fill: parent
                anchors.rightMargin: -backgroundItem.radius
                color: industrial.colors.selection
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
                    textColor: industrial.colors.onSelection
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
