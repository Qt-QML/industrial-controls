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
    implicitHeight: Industrial.baseSize
    spacing: Industrial.spacing
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    font.pixelSize: Industrial.mainFontSize

    onInputCheckedChanged: if (checked != inputChecked) checked = inputChecked

    indicator: Rectangle {
        id: backgroundItem
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: Industrial.baseSize
        implicitHeight: Industrial.fillSize
        radius: height / 2
        color: control.checked ? Industrial.colors.selection : control.flat ? Industrial.colors.control :
                                                                              Industrial.colors.sunken

        Hatch {
            anchors.fill: parent
            color: Industrial.colors.raised
            visible: !control.enabled
        }

        Handle {
            x: control.checked ? parent.width - width : 0
            anchors.verticalCenter: parent.verticalCenter

            Behavior on x { PropertyAnimation { duration: Industrial.animationTime} }
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
