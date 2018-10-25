import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.CheckBox {
    id: control

    property string tipText

    property alias horizontalAlignment: label.horizontalAlignment

    font.pixelSize: theme.mainFontSize
    height: theme.baseSize
    leftPadding: 0
    spacing: theme.spacing
    implicitWidth: text.length > 0 ? contentItem.implicitWidth + spacing : indicator.implicitWidth
    implicitHeight: contentItem.height
    hoverEnabled: true

    indicator: BackgroundItem {
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: theme.baseSize
        implicitHeight: theme.baseSize
        highlighted: control.activeFocus
        hovered: control.hovered
        highlighterColor: control.activeFocus ? theme.highlightColor : theme.controlColor

        ColoredIcon {
            anchors.fill: parent
            anchors.margins: parent.width * 0.1
            source: "qrc:/icons/ok.svg"
            visible: control.checked || control.down
            color: {
                if (!control.enabled) return theme.disabledColor;
                if (control.down) return theme.highlightColor;

                return theme.onButtonColor;
            }
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
