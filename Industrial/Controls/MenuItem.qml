import QtQuick 2.6
import QtQuick.Controls 2.2 as T

import "../Shaders" as Shaders

T.MenuItem {
    id: control

    property url iconSource: ""
    property color iconColor: label.color

    leftPadding: icon.visible ? icon.width + controlSize.padding * 2 : 0
    font.pixelSize: controlSize.fontSize
    width: parent.width

    background: Rectangle {
        anchors.fill: control
        implicitWidth: controlSize.baseSize
        implicitHeight: implicitWidth
        color: {
            if (control.pressed) return customPalette.highlightColor;
            if (control.checked || control.highlighted) return customPalette.selectionColor;
            return "transparent";
        }
        border.color: control.activeFocus ? customPalette.selectionColor : "transparent"
    }

    Rectangle {
        anchors.fill: parent
        color: customPalette.textColor
        opacity: 0.1
        visible: control.hovered
    }

    Shaders.Hatch {
        anchors.fill: parent
        color: customPalette.sunkenColor
        visible: !control.enabled
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
