import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Button { // TODO: clickable
    id: control

    property bool round: false
    property bool pressedImpl: false
    property bool topCropped: false
    property bool bottomCropped: false
    property bool leftCropped: false
    property bool rightCropped: false
    property bool hatched: !enabled && !flat
    property bool shadow: !flat
    property color color: control.flat ? "transparent" : industrial.colors.button
    property color highlightColor: industrial.colors.highlight
    property color selectionColor: industrial.colors.selection
    property string tipText

    property alias iconSource: content.iconSource
    property alias iconColor: content.iconColor
    property alias iconSize: content.iconSize
    property alias textColor: content.textColor
    property alias radius: backgroundItem.radius
    property alias contentWidth: content.width
    property alias backgroundColor: backgroundItem.color

    implicitWidth: Math.max(implicitHeight, content.implicitWidth + control.padding * 2)
    implicitHeight: industrial.baseSize
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    padding: industrial.padding
    font.pixelSize: industrial.mainFontSize

    background: BackgroundItem {
        id: backgroundItem
        hovered: control.hovered
        flat: control.flat
        radius: round ? Math.min(width, height) / 2 : industrial.rounding
        topCropping: topCropped ? radius : 0
        bottomCropping: bottomCropped ? radius : 0
        leftCropping: leftCropped ? radius : 0
        rightCropping: rightCropped ? radius : 0
        borderColor: control.activeFocus ? industrial.colors.highlight : "transparent"
        color: {
            if (control.pressed || control.pressedImpl) return control.highlightColor;
            if (control.highlighted || control.checked) return control.selectionColor;
            return control.color;
        }

        Shadow {
            visible: control.shadow && !control.flat
            source: parent
        }

        Hatch {
            anchors.fill: parent
            color: industrial.colors.surface
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
            if (control.pressed || control.pressedImpl) return industrial.colors.onHighlight;
            if (control.highlighted || control.checked) return industrial.colors.onSelection;
            return industrial.colors.onButton;
        }
    }

    ToolTip {
        visible: (control.hovered || control.down) && tipText
        text: tipText
        delay: 1000
    }
}
