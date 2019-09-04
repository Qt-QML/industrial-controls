import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.CheckBox {
    id: control

    property string tipText

    property alias flat: base.flat
    property alias iconSource: icon.source
    property alias horizontalAlignment: label.horizontalAlignment

    font.pixelSize: Theme.mainFontSize
    height: Theme.baseSize
    focusPolicy: Qt.NoFocus
    leftPadding: 0
    spacing: Theme.spacing
    implicitWidth: text.length > 0 ? contentItem.implicitWidth + spacing : indicator.implicitWidth
    implicitHeight: contentItem.height
    hoverEnabled: true

    indicator: CheckMarkBase {
        id: base
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        down: control.down
        hovered: control.hovered
        checked: control.checked

        ColoredIcon {
            id: icon
            anchors.fill: parent
            anchors.margins: parent.width * 0.1
            source: "qrc:/icons/ok.svg"
            visible: control.checked || control.down
            color: base.indicatorColor
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
