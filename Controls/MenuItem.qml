import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.MenuItem {
    id: control

    property url iconSource: ""
    property alias iconColor: icon.color

    property alias horizontalAlignment: label.horizontalAlignment

    leftPadding: icon.visible ? icon.width + controlSize.padding * 2 : controlSize.padding
    font.pixelSize: controlSize.fontSize
    width: parent.width
    height: controlSize.baseSize
    hoverEnabled: true

    background: BackgroundItem {
        hovered: control.hovered
        highlighted: control.activeFocus
        color: control.pressed ? theme.highlightColor : "transparent"
    }

    indicator: ColoredIcon {
        id: icon
        x: controlSize.padding
        color: label.color
        anchors.verticalCenter: parent.verticalCenter
        source: {
            if (!checkable) return control.iconSource;

            if (control.checked) return control.iconSource.length > 0 ? control.iconSource:
                                                                        "qrc:/icons/ok.svg"
            return "";
        }
        width: controlSize.baseSize - controlSize.padding * 2
        height: width
    }

    contentItem: Label {
        id: label
        font: control.font
        text: control.text
        color: {
            if (!enabled) return theme.disabledColor;
            if (control.pressed) return theme.onSelectionColor;
            return theme.onContainerColor;
        }
    }
}
