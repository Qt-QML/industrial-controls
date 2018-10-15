import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ProgressBar {
    id: control

    implicitWidth: controlSize.baseSize * 4
    implicitHeight: controlSize.baseSize

    background: BackgroundItem {}

    contentItem: Item {
        anchors.fill: parent
        clip: true
        anchors.margins: 1

        Rectangle {
            width: control.visualPosition * background.width
            height: parent.height + controlSize.rounding
            radius: controlSize.rounding
            color: customPalette.selectionColor

            Hatch {
                anchors.fill: parent
                color: customPalette.backgroundColor
                visible: !enabled
            }
        }
    }
}
