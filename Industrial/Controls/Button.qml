import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Button { // TODO: clickable
    id: control

    property bool round: flat
    property bool pressedImpl: false
    property bool leftCropped: false
    property bool rightCropped: false
    property bool hatched: !enabled && !flat
    property color color: control.flat ? "transparent" : theme.buttonColor
    property string tipText

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias iconSize: content.iconSize
    property alias textColor: content.textColor
    property alias radius: backgroundItem.radius
    property alias hasMenu: menuIndicator.visible
    property alias menuOpened: menuIndicator.opened
    property alias contentWidth: content.width
    property alias backgroundColor: backgroundItem.color

    font.pixelSize: theme.mainFontSize
    implicitWidth: Math.max(theme.baseSize, content.implicitWidth + control.padding * 2)
    implicitHeight: theme.baseSize
    hoverEnabled: true
    padding: theme.padding

    background: BackgroundItem {
        id: backgroundItem
        highlighted: control.activeFocus && !control.round
        hovered: control.hovered
        shadow: !control.flat
        radius: round ? Math.min(width, height) / 2 : theme.rounding
        leftCroppig: leftCropped ? radius : 0
        rightCroppig: rightCropped ? radius : 0
        bottomCroppig: round ? 0 : radius
        color: {
            if (control.pressed || control.pressedImpl) return theme.highlightColor;
            if (control.highlighted || control.checked) return theme.selectionColor;
            return control.color;
        }

        MenuIndicator {
            id: menuIndicator
            x: parent.width - width
            y: parent.height - height
            visible: false
            focused: control.activeFocus
        }

        Hatch {
            anchors.fill: parent
            color: theme.surfaceColor
            visible: control.hatched
        }
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: parent
        anchors.margins: control.padding
        text: control.text
        font: control.font
        textColor: {
            if (control.pressed || control.pressedImpl) return theme.onHighlightColor;
            if (control.highlighted || control.checked) return theme.onSelectionColor;
            return theme.onButtonColor;
        }
    }

    ToolTip {
        visible: (control.hovered || control.down) && tipText
        text: tipText
        delay: 1000
    }
}
