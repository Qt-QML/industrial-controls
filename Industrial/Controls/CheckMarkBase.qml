import QtQuick 2.6
import QtQuick.Layouts 1.3

BackgroundItem {
    id: root

    property bool down: false
    property bool checked: false

    property color indicatorColor: {
        if (!enabled) return industrial.disabledColor;
        if (down) return flat || !checked ? industrial.highlightColor : industrial.onHighlightColor;

        return industrial.onButtonColor;
    }

    implicitWidth: industrial.checkmarkSize
    implicitHeight: industrial.checkmarkSize
    borderColor: flat ? industrial.controlColor : "transparent"
    color: {
        if (flat) return "transparent";

        return checked ? down ? industrial.highlightColor : industrial.selectionColor : industrial.containerColor;
    }

    Hatch {
        anchors.fill: parent
        color: industrial.surfaceColor
        visible: !enabled
    }
}
