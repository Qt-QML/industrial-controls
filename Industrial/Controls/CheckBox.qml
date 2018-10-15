import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.CheckBox {
    id: control

    property string tipText

    property alias horizontalAlignment: label.horizontalAlignment

    font.pixelSize: controlSize.fontSize
    height: controlSize.baseSize
    leftPadding: 0
    spacing: controlSize.spacing
    implicitWidth: text.length > 0 ? contentItem.implicitWidth + spacing : indicator.implicitWidth
    implicitHeight: contentItem.height
    hoverEnabled: true

    indicator: BackgroundItem {
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: controlSize.baseSize
        implicitHeight: controlSize.baseSize
        highlighted: control.activeFocus
        hovered: control.hovered

        ColoredIcon {
            anchors.fill: parent
            anchors.margins: parent.width * 0.1
            source: "qrc:/ui/ok.svg"
            color: control.down ? customPalette.highlightColor : customPalette.textColor
            visible: control.checked || control.down
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
