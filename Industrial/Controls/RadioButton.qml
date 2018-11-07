import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.RadioButton {
    id: control

    property alias horizontalAlignment: label.horizontalAlignment

    font.pixelSize: Theme.mainFontSize
    height: Theme.baseSize
    focusPolicy: Qt.NoFocus
    leftPadding: 0
    spacing: Theme.spacing
    implicitWidth: text.length > 0 ? contentItem.implicitWidth + spacing : indicator.implicitWidth
    hoverEnabled: true

    indicator: BackgroundItem {
        x: control.leftPadding
        y: parent.height * 0.5 - height * 0.5
        radius: width * 0.5
        implicitWidth: Theme.baseSize
        implicitHeight: Theme.baseSize
        hovered: control.hovered
        borderColor: control.activeFocus ? Theme.highlightColor : "transparent"

        Rectangle {
            anchors.fill: parent
            anchors.margins: parent.width * 0.25
            radius: width * 0.5
            visible: control.checked || control.down
            color: {
                if (!control.enabled) return Theme.disabledColor;
                if (control.down) return Theme.highlightColor;

                return Theme.onButtonColor;
            }
        }

        Hatch {
            anchors.fill: parent
            color: Theme.surfaceColor
            visible: !control.enabled
        }
    }

    contentItem: Label {
        id: label
        text: control.text
        font: control.font
        leftPadding: indicator.width + spacing
        verticalAlignment: Text.AlignVCenter
    }
}
