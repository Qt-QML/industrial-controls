import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Button { // TODO: clickable
    id: control

    property bool round: flat && Theme.flatRound
    property bool pressedImpl: false
    property bool leftCropped: false
    property bool rightCropped: false
    property bool hatched: !enabled && !flat
    property bool shadow: !flat
    property color color: control.flat ? "transparent" : Theme.buttonColor
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

    implicitWidth: Math.max(implicitHeight, content.implicitWidth + control.padding * 2)
    implicitHeight: Theme.baseSize
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    padding: Theme.padding
    font.pixelSize: Theme.mainFontSize

    background: BackgroundItem {
        id: backgroundItem
        hovered: control.hovered
        flat: control.flat
        radius: round ? Math.min(width, height) / 2 : Theme.rounding
        leftCroppig: leftCropped ? radius : 0
        rightCroppig: rightCropped ? radius : 0
        borderColor: control.activeFocus ? Theme.highlightColor : "transparent"
        color: {
            if (control.pressed || control.pressedImpl) return Theme.highlightColor;
            if (control.highlighted || control.checked) return Theme.selectionColor;
            return control.color;
        }

        Shadow {
            visible: control.shadow && !control.flat
            source: parent
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
            color: Theme.surfaceColor
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
            if (control.pressed || control.pressedImpl) return Theme.onHighlightColor;
            if (control.highlighted || control.checked) return Theme.onSelectionColor;
            return Theme.onButtonColor;
        }
    }

    ToolTip {
        visible: (control.hovered || control.down) && tipText
        text: tipText
        delay: 1000
    }
}
