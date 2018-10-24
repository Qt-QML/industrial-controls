import QtQuick 2.6
import Industrial 1.0

BackgroundItem {
    id: control

    property bool inputed: true
    property bool caution: false
    property bool isValid: true

    property alias textHeight: textItem.height
    property alias text: textItem.text
    property alias textColor: textItem.color

    implicitWidth: Math.max(controlSize.baseSize * 4, textItem.implicitWidth)
    highlighterColor: {
        if (control.caution) return theme.neutralColor;
        if (!control.isValid) return theme.negativeColor;
        if (control.highlighted) return theme.highlightColor;

        return theme.controlColor;
    }

    Hatch {
        anchors.fill: parent
        color: theme.surfaceColor
        visible: !enabled
    }

    Text {
        id: textItem
        anchors.left: parent.left
        anchors.leftMargin: control.leftPadding
        anchors.verticalCenter: inputed ? undefined : parent.verticalCenter
        anchors.top: inputed ? parent.top : undefined
        height: implicitHeight
        font.pixelSize: inputed ? controlSize.secondaryFontSize: controlSize.fontSize
        color: {
            if (!control.enabled) return theme.disabledColor;
            if (control.caution) return theme.neutralColor;
            if (!control.isValid) return theme.negativeColor;
            if (control.highlighted) return theme.highlightColor;

            return theme.onContainerColor;
        }
        Behavior on font.pixelSize { PropertyAnimation { duration: controlSize.animationTime } }
    }
}
