import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Button { // TODO: clickable
    id: control

    property bool round: false
    property bool pressedImpl: false
    property string tipText

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias textColor: content.textColor
    property alias radius: backgroundItem.radius
    property alias hasMenu: menuIndicator.visible
    property alias menuOpened: menuIndicator.opened
    property alias contentWidth: content.width
    property alias backgroundColor: backgroundItem.color

    font.pixelSize: controlSize.fontSize
    implicitWidth: Math.max(controlSize.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: controlSize.baseSize
    hoverEnabled: true
    padding: controlSize.padding

    background: BackgroundItem {
        id: backgroundItem
        highlighted: control.activeFocus && !control.round
        hovered: control.hovered
        shadow: !control.flat
        radius: round ? Math.min(width, height) / 2 : controlSize.rounding
        croppig: round ? 0 : radius
        color: {
            if (control.pressed || control.pressedImpl) return customPalette.highlightColor;
            if (control.highlighted || control.checked) return customPalette.selectionColor;
            return control.flat ? "transparent" : customPalette.buttonColor;
        }

        MenuIndicator {
            id: menuIndicator
            x: parent.width - width
            y: parent.height - height
            visible: false
            focused: control.activeFocus
        }
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: parent
        anchors.margins: control.padding
        text: control.text
        font: control.font
        textColor: control.pressed || control.pressedImpl ? customPalette.selectedTextColor : customPalette.textColor
    }

    ToolTip {
        visible: (control.hovered || control.down) && tipText
        text: tipText
        delay: 1000
    }
}
