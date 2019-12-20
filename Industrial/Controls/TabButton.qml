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
    font.pixelSize: Theme.mainFontSize
    implicitWidth: Math.max(Theme.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: Theme.baseSize
    focusPolicy: Qt.NoFocus
    //hoverEnabled: true NOTE: QTBUG
    padding: Theme.padding

    background: BackgroundItem {
        id: backgroundItem
        bottomCropping: radius
        borderColor: control.activeFocus ? Theme.colors.highlight : "transparent"
        hovered: !control.checked && control.hovered
        color: control.checked ? Theme.colors.raised : "transparent"
    }

    contentItem: ContentItem {
        id: content
        text: control.text
        font: control.font
        textColor: Theme.colors.text
    }
}
