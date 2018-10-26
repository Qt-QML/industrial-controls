import QtQuick 2.6

BackgroundItem {
    id: control

    property bool inputed: true
    property bool caution: false
    property bool isValid: true
    property bool highlighted: false

    property alias textHeight: textMetrics.height
    property alias underline: highlighter.height
    property alias text: textItem.text
    property alias textColor: textItem.color
    property alias highlighterColor: highlighter.color

    bottomCroppig: radius
    implicitWidth: Math.max(theme.baseSize * 4, textItem.implicitWidth)

    TextMetrics {
        id: textMetrics
        font.pixelSize: theme.auxFontSize
        text: textItem.text
    }

    Hatch {
        anchors.fill: parent
        color: theme.surfaceColor
        visible: !enabled
    }

    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: theme.underline
        visible: control.enabled
        color:      {
            if (highlighted) {
                if (control.caution) return theme.neutralColor;
                if (!control.isValid) return theme.negativeColor;
                return theme.highlightColor;
            }

            return theme.controlColor;
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.leftPadding
        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        height: implicitHeight
        font.pixelSize: inputed ? theme.auxFontSize : theme.mainFontSize
        color: {
            if (!control.enabled) return theme.disabledColor;
            if (control.caution) return theme.neutralColor;
            if (!control.isValid) return theme.negativeColor;
            if (control.highlighted) return theme.highlightColor;

            return theme.onContainerColor;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: theme.animationTime } }
    }
}
