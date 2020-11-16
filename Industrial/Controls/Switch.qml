import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Switch {
    id: control

    property bool inputChecked: checked
    property bool flat: base.flat
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
        width: Theme.switchSize * 3//Theme.baseSize * 1.2
        height: Theme.switchSize * 3
        radius: height / 2
        flat: control.flat
        down: control.down
        hovered: control.hovered
        checked: control.checked
        opacity: {
            if(!control.flat && control.enabled) { if (control.down || control.checked) return 0.5; }
            return 1
        }
    }

    Handle {
        id: handle
        height: base.height - Theme.border * 6
        width: height
        //anchors.verticalCenter: parent.verticalCenter
        x: control.checked ? base.width - width - Theme.border * 3 : Theme.border * 3
        //y: base.height - height - Theme.border * 3
        y: base.height / 2 - height / 2
        Behavior on x { PropertyAnimation { duration: Theme.animationTime / 2} }
        color: {
            if (!control.enabled) return flat ? Theme.colors.sunken : Theme.colors.background;
            if (control.checked) return Theme.colors.highlight;
            if (control.pressed) return Theme.colors.highlight;
            return Theme.colors.control;
        }
    }

    //Component.onCompleted: console.log(Theme.checkmarkSize)

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
