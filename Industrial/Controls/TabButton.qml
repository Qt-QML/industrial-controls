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
    font.pixelSize: industrial.mainFontSize
    implicitWidth: Math.max(industrial.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: industrial.baseSize
    focusPolicy: Qt.NoFocus
    //hoverEnabled: true NOTE: QTBUG
    padding: industrial.padding

    background: BackgroundItem {
        id: backgroundItem
        bottomCropping: radius
        borderColor: control.activeFocus ? industrial.colors.highlight : "transparent"
        hovered: control.hovered
        color: control.checked ? industrial.colors.surface : "transparent"
    }

    contentItem: ContentItem {
        id: content
        text: control.text
        font: control.font
        textColor: industrial.colors.onContainer
    }
}
