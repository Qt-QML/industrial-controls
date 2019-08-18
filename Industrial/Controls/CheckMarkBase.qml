import QtQuick 2.6
import QtQuick.Layouts 1.3

BackgroundItem {
    id: root

    property bool down: false
    property bool checked: false

    property color indicatorColor: {
        if (!enabled) return Industrial.colors.disabled;
        if (down) return flat || !checked ? Industrial.colors.highlight : Industrial.colors.highlightText;

        return Industrial.colors.buttonText;
    }

    implicitWidth: Industrial.checkmarkSize
    implicitHeight: Industrial.checkmarkSize
    borderColor: flat ? Industrial.colors.control : "transparent"
    color: {
        if (flat) return "transparent";

        return checked ? down ? Industrial.colors.highlight :
                                Industrial.colors.selection :
                                Industrial.colors.sunken;
    }

    Hatch {
        anchors.fill: parent
        color: Industrial.colors.raised
        visible: !enabled
    }
}
