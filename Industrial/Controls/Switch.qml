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
    implicitHeight: industrial.baseSize
    spacing: industrial.spacing
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    font.pixelSize: industrial.mainFontSize

    onInputCheckedChanged: if (checked != inputChecked) checked = inputChecked

    indicator: Rectangle {
        id: backgroundItem
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: industrial.baseSize
        implicitHeight: industrial.fillSize
        radius: height / 2
        color: control.checked ? Palette.selection : control.flat ? industrial.colors.control :
                                                                              industrial.colors.container

        Hatch {
            anchors.fill: parent
            color: industrial.colors.surface
            visible: !control.enabled
        }

        Handle {
            x: control.checked ? parent.width - width : 0
            anchors.verticalCenter: parent.verticalCenter

            Behavior on x { PropertyAnimation { duration: industrial.animationTime} }
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
