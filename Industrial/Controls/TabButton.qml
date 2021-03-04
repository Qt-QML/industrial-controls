import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.TabButton {
    id: control

    property bool flat: false
    property color backgroundColor: Theme.colors.background

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias textColor: content.textColor

    // TODO: flat
    font.pixelSize: Theme.auxFontSize
    font.weight: Font.Medium
    font.capitalization: Font.AllUppercase
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
        color: control.checked ? backgroundColor : "transparent"
    }

    contentItem: ContentItem {
        id: content
        text: control.text
        font: control.font
        textColor: control.checked ? Theme.colors.text :
                                     (control.hovered ? Theme.colors.text : Theme.colors.description)
    }
}
