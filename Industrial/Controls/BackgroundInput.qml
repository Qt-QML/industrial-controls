import QtQuick 2.6

BackgroundItem {
    id: control

    property bool inputed: true
    property bool caution: false
    property bool isValid: true
    property bool highlighted: false
    property int textPadding: industrial.padding

    property alias textHeight: textMetrics.height
    property alias underline: highlighter.height
    property alias text: textItem.text
    property alias textColor: textItem.color
    property alias highlighterHeight: highlighter.height
    property alias highlighterColor: highlighter.color

    bottomCropping: radius
    implicitWidth: Math.max(industrial.baseSize * 4, textItem.implicitWidth)

    TextMetrics {
        id: textMetrics
        font.pixelSize: industrial.auxFontSize
        text: textItem.text
    }

    Hatch {
        anchors.fill: parent
        color: industrial.colors.surface
        visible: !enabled
    }

    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: industrial.underline
        visible: control.enabled
        color: {
            if (highlighted) {
                if (control.caution) return Palette.neutral;
                if (!control.isValid) return Palette.negative;
                return Palette.selection;
            }

            return industrial.colors.control;
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.textPadding
        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        height: implicitHeight
        font.pixelSize: inputed ? industrial.auxFontSize : industrial.mainFontSize
        color: {
            if (!control.enabled) return industrial.colors.disabled;
            if (control.caution) return Palette.neutral;
            if (!control.isValid) return Palette.negative;
            if (control.highlighted) return Palette.highlight;

            return industrial.colors.onContainer;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: industrial.animationTime } }
    }
}
