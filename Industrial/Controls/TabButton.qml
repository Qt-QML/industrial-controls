import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TabButton {
    id: control

    property bool flat: false

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias textColor: content.textColor
    property alias backgroundColor: backgroundItem.color

    // TODO: flat
    font.pixelSize: theme.mainFontSize
    implicitWidth: Math.max(theme.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: theme.baseSize
    hoverEnabled: true
    padding: theme.padding

    background: BackgroundItem {
        id: backgroundItem
        highlighted: control.activeFocus
        hovered: control.hovered
        color: control.checked ? theme.surfaceColor : "transparent";
    }

    contentItem: ContentItem {
        id: content
        text: control.text
        font: control.font
        textColor: theme.onContainerColor
    }
}
