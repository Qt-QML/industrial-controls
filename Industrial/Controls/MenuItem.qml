import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.MenuItem {
    id: control

    property url iconSource: ""
    property color iconColor: label.color

    leftPadding: icon.visible ? icon.width + controlSize.padding * 2 : 0
    font.pixelSize: controlSize.fontSize
    width: parent.width
    height: controlSize.baseSize
    hoverEnabled: true

    background: BackgroundItem {
        hovered: control.hovered
        highlighted: control.activeFocus
        color: control.pressed ? customPalette.highlightColor : "transparent"
    }

    indicator: ColoredIcon {
        x: controlSize.padding
        id: icon
        color: enabled ? iconColor : customPalette.sunkenColor
        source: {
            if (!checkable) return control.iconSource;

            if (control.checked) return control.iconSource.length > 0 ? control.iconSource:
                                                                        "qrc:/ui/ok.svg"
            return "";
        }
        anchors.verticalCenter: parent.verticalCenter
        width: controlSize.baseSize * 0.6
        height: width
    }

    contentItem: Label {
        id: label
        font: control.font
        text: control.text
        color: {
            if (!enabled) return customPalette.sunkenColor;
            if (control.pressed) return customPalette.selectedTextColor;
            return customPalette.textColor;
        }
    }
}
