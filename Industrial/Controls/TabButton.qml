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
    font.pixelSize: Industrial.mainFontSize
    implicitWidth: Math.max(Industrial.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: Industrial.baseSize
    focusPolicy: Qt.NoFocus
    //hoverEnabled: true NOTE: QTBUG
    padding: Industrial.padding

    background: BackgroundItem {
        id: backgroundItem
        bottomCropping: radius
        borderColor: control.activeFocus ? Industrial.colors.highlight : "transparent"
        hovered: control.hovered
        color: control.checked ? Industrial.colors.raised : "transparent"
    }

    contentItem: ContentItem {
        id: content
        text: control.text
        font: control.font
        textColor: Industrial.colors.textSunken
    }
}
