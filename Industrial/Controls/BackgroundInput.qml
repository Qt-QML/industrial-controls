import QtQuick 2.6

BackgroundItem {
    id: control

    property bool inputed: true
    property bool caution: false
    property bool isValid: true
    property bool highlighted: false
    property int textPadding: Theme.padding

    property alias textHeight: textMetrics.height
    property alias underline: highlighter.height
    property alias text: textItem.text
    property alias textColor: textItem.color
    property alias highlighterHeight: highlighter.height
    property alias highlighterColor: highlighter.color

    bottomCropping: radius
    implicitWidth: Math.max(Theme.baseSize * 4, textItem.implicitWidth)

    TextMetrics {
        id: textMetrics
        font.pixelSize: Theme.auxFontSize
        text: textItem.text
    }

    Hatch {
        anchors.fill: parent
        color: Theme.surfaceColor
        visible: !enabled
    }

    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: Theme.underline
        visible: control.enabled
        color: {
            if (highlighted) {
                if (control.caution) return Theme.neutralColor;
                if (!control.isValid) return Theme.negativeColor;
                return Theme.selectionColor;
            }

            return Theme.controlColor;
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.textPadding
        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        height: implicitHeight
        font.pixelSize: inputed ? Theme.auxFontSize : Theme.mainFontSize
        color: {
            if (!control.enabled) return Theme.disabledColor;
            if (control.caution) return Theme.neutralColor;
            if (!control.isValid) return Theme.negativeColor;
            if (control.highlighted) return Theme.highlightColor;

            return Theme.onContainerColor;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: Theme.animationTime } }
    }
}
