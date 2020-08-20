import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Switch {
    id: control

    property real handleSizeFactor: 1.2
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
        implicitHeight: Theme.switchSize
        radius: height / 2
        color: {
            if (control.flat) return "transparent";
            if (control.checked) return Theme.colors.selection;
            if (control.pressed) return Theme.colors.highlight;
            return Theme.colors.sunken;
        }
        border.width: 2
        border.color: {
            if (control.checked ) return Theme.colors.selection;
            if (control.flat) return Theme.colors.border;
            return "transparent"
        }

        Hatch {
            anchors.fill: parent
            color: Theme.colors.raised
            visible: !control.enabled
        }

        Rectangle {
            height: Theme.switchSize
            width: height
            x: control.checked ? parent.width - width : 0
            radius: height / 2
            color: "transparent"
            Behavior on x { PropertyAnimation { duration: Theme.animationTime} }
            Handle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                height: Theme.switchSize / handleSizeFactor
                width: height
                color: {
                    if (!control.enabled) return Theme.colors.sunken;
                    if (control.checked) return Theme.colors.highlight;
                    if (control.pressed) return Theme.colors.highlight;
                    return Theme.colors.control;
                }
            }
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
