import QtQuick 2.6

BackgroundItem {
    id: control

    property bool inputed: true
    property bool caution: false
    property bool isValid: true
    property bool highlighted: false
    property int textPadding: Industrial.padding

    property alias textHeight: textMetrics.height
    property alias underline: highlighter.height
    property alias text: textItem.text
    property alias textColor: textItem.color
    property alias highlighterHeight: highlighter.height
    property alias highlighterColor: highlighter.color

    bottomCropping: radius
    implicitWidth: Math.max(Industrial.baseSize * 4, textItem.implicitWidth)

    TextMetrics {
        id: textMetrics
        font.pixelSize: Industrial.auxFontSize
        text: textItem.text
    }

    Hatch {
        anchors.fill: parent
        color: Industrial.colors.raised
        visible: !enabled
    }

    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: Industrial.underline
        visible: control.enabled
        color: {
            if (highlighted) {
                if (control.caution) return Industrial.colors.neutral;
                if (!control.isValid) return Industrial.colors.negative;
                return Industrial.colors.selection;
            }

            return Industrial.colors.control;
        }
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.textPadding
        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        height: implicitHeight
        font.pixelSize: inputed ? Industrial.auxFontSize : Industrial.mainFontSize
        color: {
            if (!control.enabled) return Industrial.colors.disabled;
            if (control.caution) return Industrial.colors.neutral;
            if (!control.isValid) return Industrial.colors.negative;
            if (control.highlighted) return Industrial.colors.highlight;

            return Industrial.colors.textSunken;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: Industrial.animationTime } }
    }
}
