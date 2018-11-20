import QtQuick 2.6
import QtQuick.Layouts 1.3

BackgroundItem {
    id: root

    property bool down: false
    property bool checked: false

    property color indicatorColor: {
        if (!enabled) return Theme.disabledColor;
        if (down) return flat || !checked ? Theme.highlightColor : Theme.onHighlightColor;

        return Theme.onButtonColor;
    }

    implicitWidth: Theme.checkmarkSize
    implicitHeight: Theme.checkmarkSize
    borderColor: flat ? Theme.controlColor : "transparent"
    color: {
        if (flat) return "transparent";

        return checked ? down ? Theme.highlightColor : Theme.selectionColor : Theme.containerColor;
    }

    Hatch {
        anchors.fill: parent
        color: Theme.surfaceColor
        visible: !enabled
    }
}
