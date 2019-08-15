import QtQuick 2.6
import QtQuick.Layouts 1.3

BackgroundItem {
    id: root

    property bool down: false
    property bool checked: false

    property color indicatorColor: {
        if (!enabled) return industrial.colors.disabled;
        if (down) return flat || !checked ? Palette.highlight : Palette.highlightText;

        return Palette.buttonText;
    }

    implicitWidth: industrial.checkmarkSize
    implicitHeight: industrial.checkmarkSize
    borderColor: flat ? industrial.colors.control : "transparent"
    color: {
        if (flat) return "transparent";

        return checked ? down ? Palette.highlight :
                                Palette.selection :
                                industrial.colors.container;
    }

    Hatch {
        anchors.fill: parent
        color: industrial.colors.surface
        visible: !enabled
    }
}
