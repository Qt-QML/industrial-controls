import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.CheckBox {
    id: control

    property string tipText

    property alias flat: background.flat
    property alias horizontalAlignment: label.horizontalAlignment

    font.pixelSize: Theme.mainFontSize
    height: Theme.baseSize
    focusPolicy: Qt.NoFocus
    leftPadding: 0
    spacing: Theme.spacing
    implicitWidth: text.length > 0 ? contentItem.implicitWidth + spacing : indicator.implicitWidth
    implicitHeight: contentItem.height
    hoverEnabled: true

    indicator: BackgroundItem {
        id: background
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: Theme.checkmarkSize
        implicitHeight: Theme.checkmarkSize
        hovered: control.hovered
        borderColor: control.flat ? Theme.controlColor : "transparent"

        ColoredIcon {
            anchors.fill: parent
            anchors.margins: parent.width * 0.1
            source: "qrc:/icons/ok.svg"
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

    ToolTip {
        visible: (hovered || down) && tipText
        text: tipText
        delay: 1000
    }
}
