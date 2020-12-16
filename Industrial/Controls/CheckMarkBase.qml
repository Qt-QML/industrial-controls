import QtQuick 2.6
import QtQuick.Layouts 1.3

BackgroundItem {
    id: root

    property bool down: false
    property bool checked: false

    property color indicatorColor: {
        if (!enabled) return flat ? Theme.colors.sunken : Theme.colors.background;
        if (flat) return Theme.colors.highlight
        if (down) return Theme.colors.highlightedText;
        if (checked) return Theme.colors.selectedText;
        return Theme.colors.controlText;
    }

    implicitWidth: Theme.checkmarkSize
    implicitHeight: Theme.checkmarkSize

    borderColor: {
        if (!enabled) return Theme.colors.disabled;
        if (!flat) return "transparent";
        if (down) return Theme.colors.highlight;
        if (checked) return Theme.colors.selection;
        return Theme.colors.controlBorder;
    }

    color: {
        if (!enabled) return flat ? "transparent" : Theme.colors.disabled;
        if (flat) return "transparent";
        if (down) return Theme.colors.highlight;
        if (checked) return Theme.colors.selection;
        return Theme.colors.controlBorder;
    }

    Hatch {
        anchors.fill: parent
        color: Theme.colors.background
        visible: !enabled
    }
}
