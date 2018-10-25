import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ProgressBar {
    id: control

    implicitWidth: theme.baseSize * 4
    implicitHeight: theme.baseSize

    background: BackgroundItem {}

    contentItem: Item {
        anchors.fill: parent
        clip: true
        anchors.margins: 1

        Rectangle {
            width: control.visualPosition * (background.width - parent.anchors.margins * 2)
            height: parent.height + theme.rounding
            radius: theme.rounding
            color: theme.selectionColor

            Hatch {
                anchors.fill: parent
                color: theme.containerColor
                visible: !enabled
            }
        }
    }
}
