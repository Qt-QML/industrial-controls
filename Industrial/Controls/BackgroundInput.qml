import QtQuick 2.6

BackgroundItem {
    id: control

    property bool hovered: true
    property bool inputed: true
    property bool table: false
    property bool spin: false
    property bool caution: false
    property bool isValid: true
    property bool highlighted: false
    property int textPadding: Theme.padding

    property alias textHeight: textMetrics.height
    property alias underline: highlighter.height
    property alias text: textItem.text
    property alias textColor: textItem.color
    property alias textWidth: textItem.width //FIXME

    property alias labelLeftPadding: textItem.leftPadding
    property alias labelRightPadding: textItem.rightPadding

    property alias fontPixelSize: textItem.fontPixelSizeWhenInputed

    property alias highlighterHeight: highlighter.height
    property alias highlighterColor: highlighter.color

    radius: table ? 0 : Theme.rounding
    bottomCropping: table ? 0 : radius
    borderColor: {
        if (table) {
            if (!control.isValid || !control.isValid && highlighted) return Theme.colors.negative;
            if (control.caution || control.caution && highlighted) return Theme.colors.neutral;
            if (highlighted) return Theme.colors.selection;
            return "transparent"
        }
        if (flat) {
            return "transparent" //todo
        }
        return "transparent"
    }

    implicitWidth: Theme.baseSize * 4

    TextMetrics {
        id: textMetrics
        font.pixelSize: textItem.fontPixelSizeWhenInputed
        text: textItem.text
    }

    Hatch {
        anchors.fill: parent
        color: Theme.colors.background
        visible: !enabled
    }

    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: Theme.border
        visible: control.enabled || table
        color: {
            if (!control.enabled) return Theme.colors.background;
            if (!control.isValid || !control.isValid && highlighted) return Theme.colors.negative;
            if (control.caution || control.caution && highlighted) return Theme.colors.neutral;
            if (highlighted) return Theme.colors.selection;
            if (table && flat) return Theme.colors.controlBorder;
            if (table) return Theme.colors.background;
            return Theme.colors.controlBorder;
        }
    }

    Text {
        id: textItem
        property real fontPixelSizeWhenInputed: Theme.auxFontSize / 1.2
        height: implicitHeight
        width: control.width
        leftPadding: control.parent.leftPadding ? control.parent.leftPadding : control.textPadding
        rightPadding: control.parent.rightPadding ? control.parent.rightPadding : control.textPadding

        horizontalAlignment: spin ? Text.AlignHCenter : Text.AlignLeft

        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        bottomPadding: inputed ? undefined : Theme.border
        topPadding: inputed ? Theme.border : undefined

        font.pixelSize: inputed ? fontPixelSizeWhenInputed : Theme.mainFontSize
        elide: Text.ElideRight

        color: {
            if (!control.enabled) return Theme.colors.disabled;
            if (control.caution) return Theme.colors.neutral;
            if (!control.isValid) return Theme.colors.negative;
            if (control.highlighted) return Theme.colors.selection;
            return Theme.colors.description;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: Theme.animationTime } }
    }
}
