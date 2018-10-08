import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ProgressBar {
    id: control

    property string text: control.visualPosition

    implicitWidth: controlSize.baseSize * 4
    implicitHeight: controlSize.baseSize
    opacity: enabled ? 1 : 0.33

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
        }

        Label {
            anchors.centerIn: parent
            text: control.text
        }
    }
}
