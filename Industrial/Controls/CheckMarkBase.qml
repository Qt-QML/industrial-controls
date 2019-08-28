import QtQuick 2.6
import QtQuick.Layouts 1.3

BackgroundItem {
    id: root

    property bool down: false
    property bool checked: false

    property color indicatorColor: {
        if (!enabled) return Theme.colors.disabled;
        if (down) return flat || !checked ? Theme.colors.highlight : Theme.colors.highlightText;

        return Theme.colors.buttonText;
    }

    implicitWidth: Theme.checkmarkSize
    implicitHeight: Theme.checkmarkSize
    borderColor: flat ? Theme.colors.control : "transparent"
    color: {
        if (flat) return "transparent";

        return checked ? down ? Theme.colors.highlight :
                                Theme.colors.selection :
                                Theme.colors.sunken;
    }

    Hatch {
        anchors.fill: parent
        color: Theme.colors.raised
        visible: !enabled
    }
}
