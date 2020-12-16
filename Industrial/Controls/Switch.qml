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
        width: Theme.baseSize * 1.2
        height: Theme.switchSize
        radius: height / 2
        flat: control.flat
        down: control.down
        hovered: control.hovered
        checked: control.checked
        opacity: {
            if(!control.flat && control.enabled) { if (control.down || control.checked) return 1; }
            return 1
        }
    }

    Handle {
        id: handle
        height: base.height - Theme.border * 4
        width: height
        x: control.checked ? base.width - width - Theme.border * 2 : Theme.border * 2
        y: parent.height / 2 - height / 2
        Behavior on x { PropertyAnimation { duration: Theme.animationTime / 2} }
        color: {
            if (!control.enabled) return flat ? Theme.colors.disabled : Theme.colors.background;
            if (control.checked ||control.pressed) return flat ? Theme.colors.highlight : Theme.colors.selectedText;
            return flat ? Theme.colors.controlBorder : Theme.colors.background;
        }
        hoverEnabled: flat
        shadowEnabled: false
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
