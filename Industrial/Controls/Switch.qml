import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Switch {
    id: control

    property bool inputChecked: checked
    property bool flat: false
    property string tipText
    property alias textColor: text.color
    property alias backgroundColor: base.color

    implicitWidth: contentItem.implicitWidth
    implicitHeight: Theme.baseSize
    spacing: Theme.spacing
    focusPolicy: Qt.NoFocus
    hoverEnabled: true
    font.pixelSize: Theme.mainFontSize
    onInputCheckedChanged: if (checked != inputChecked) checked = inputChecked

    indicator: CheckMarkBase {
        id: base
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        implicitWidth: Theme.baseSize * 1.2
        implicitHeight: Theme.switchSize
        radius: height / 2
        down: control.down
        hovered: control.hovered
        opacity: {
            if(!control.flat && control.enabled) { if (control.down || control.checked) return 0.5; }
            return 1
        }
    }

    Rectangle {
        height: base.height
        width: height
        anchors.verticalCenter: base.verticalCenter
        color: "transparent"
        x: control.checked ? base.width - width : 0
        Behavior on x { PropertyAnimation { duration: Theme.animationTime} }

        Handle {
            height: Theme.switchSize - Theme.border * 4
            width: height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: {
                if (!control.enabled) return flat ? Theme.colors.sunken : Theme.colors.background;
                if (control.checked) return Theme.colors.highlight;
                if (control.pressed) return Theme.colors.highlight;
                return Theme.colors.control;
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
