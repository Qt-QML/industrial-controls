import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Switch {
    id: control

    property bool inputChecked: checked
    property bool flat: false
    property string tipText

    property alias textColor: text.color
    property alias backgroundColor: backgroundItem.color

    implicitWidth: contentItem.implicitWidth
    implicitHeight: Theme.baseSize
    spacing: Theme.spacing
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    font.pixelSize: Theme.mainFontSize

    onInputCheckedChanged: if (checked != inputChecked) checked = inputChecked

    indicator: Rectangle {
        id: backgroundItem
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: Theme.baseSize
        implicitHeight: Theme.fillSize
        radius: height / 2
        color: control.checked ? Theme.colors.selection : control.flat ? Theme.colors.control :
                                                                              Theme.colors.sunken
        border.width: 1
        border.color: flat ? Theme.colors.border : "transparent"

        Hatch {
            anchors.fill: parent
            color: Theme.colors.raised
            visible: !control.enabled
        }

        Handle {
            x: control.checked ? parent.width - width : 0
            anchors.verticalCenter: parent.verticalCenter

            Behavior on x { PropertyAnimation { duration: Theme.animationTime} }
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
