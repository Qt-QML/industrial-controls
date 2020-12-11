import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ProgressBar {
    id: control

    property bool round: false

    implicitWidth: industrial.baseSize * 4
    implicitHeight: industrial.baseSize

    background: BackgroundItem {}

    contentItem: Item {
        anchors.fill: parent
        clip: true
        anchors.margins: 1

        Rectangle {
            width: control.visualPosition * (background.width - parent.anchors.margins * 2)
            height: parent.height
            radius: control.round ? Math.min(width, height) / 2 : industrial.rounding
            color: industrial.colors.selection
        }
    }

    Hatch {
        anchors.fill: parent
        color: industrial.colors.surface
        visible: !enabled
        z: 10
    }
}
