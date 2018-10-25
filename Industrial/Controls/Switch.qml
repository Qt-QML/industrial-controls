import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Switch {
    id: control

    property bool inputChecked: checked
    property alias textColor: text.color
    property alias backgroundColor: backgroundItem.color
    property string tipText

    spacing: theme.spacing
    font.pixelSize: theme.mainFontSize
    implicitWidth: contentItem.implicitWidth
    implicitHeight: theme.baseSize
    hoverEnabled: true

    onInputCheckedChanged: if (checked != inputChecked) checked = inputChecked

    indicator: Rectangle {
        id: backgroundItem
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: theme.baseSize
        implicitHeight: theme.underline
        radius: height / 2
        color: control.checked ? theme.selectionColor : theme.containerColor

        Hatch {
            anchors.fill: parent
            color: theme.containerColor
            visible: !enabled
        }

        Handle {
            x: control.checked ? parent.width - width : 0
            anchors.verticalCenter: parent.verticalCenter

            Behavior on x { PropertyAnimation { duration: theme.animationTime} }
        }
    }

    contentItem: Label {
        id: text
        text: control.text
        font: control.font
        leftPadding: indicator.width + control.spacing
    }

    ToolTip {
        visible: (hovered || down) && tipText
        text: tipText
        delay: 1000
    }
}
