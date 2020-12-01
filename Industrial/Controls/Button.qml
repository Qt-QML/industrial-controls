import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Button {
    id: control

    property bool round: false
    property bool pressedImpl: false
    property bool topCropped: false
    property bool bottomCropped: false
    property bool leftCropped: false
    property bool rightCropped: false
    property bool hatched: !enabled && !flat
    property bool toolTipAlwaysVisible: false
    property color color: Theme.colors.control
    property color highlightColor: Theme.colors.highlight
    property color selectionColor: Theme.colors.selection
    property string tipText

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias iconSize: content.iconSize
    property alias textSize: content.textSize
    property alias textColor: content.textColor
    property alias contentWidth: content.width
    property alias horizontalAlignment: content.horizontalAlignment
    property alias radius: backgroundItem.radius
    property alias backgroundOpacity: backgroundItem.opacity
    property alias hoverColor: backgroundItem.hoverColor
    property alias toolTipX: toolTip.x
    property alias toolTipY: toolTip.y
    property alias toolTipWidth: toolTip.width

    implicitWidth: Math.max(implicitHeight, content.implicitWidth + control.padding * 2)
    implicitHeight: Theme.baseSize
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    padding: text.length > 0 ? Theme.padding : 0
    font.pixelSize: Theme.mainFontSize

    background: BackgroundItem {
        id: backgroundItem
        hovered: control.hovered
        flat: control.flat
        radius: round ? Math.min(width, height) / 2 : Theme.rounding
        topCropping: topCropped ? radius : 0
        bottomCropping: bottomCropped ? radius : 0
        leftCropping: leftCropped ? radius : 0
        rightCropping: rightCropped ? radius : 0
        borderColor: control.activeFocus ? Theme.colors.highlight : "transparent"
        color: {
            if (control.pressed || control.pressedImpl) return control.highlightColor;
            if (control.highlighted || control.checked) return control.selectionColor;
            return control.flat ? "transparent" : control.color;
        }

        Hatch {
            anchors.fill: parent
            color: Theme.colors.background
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
            if (control.pressed || control.pressedImpl) return Theme.colors.highlightedText;
            if (control.highlighted || control.checked) return Theme.colors.selectedText;
            return Theme.colors.controlText;
        }
    }

    ToolTip {
        id: toolTip
        visible: (toolTipAlwaysVisible || (control.hovered || control.down)) && tipText
        text: tipText
        delay: 0
    }
}
