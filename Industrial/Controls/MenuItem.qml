import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.MenuItem {
    id: control

    property url iconSource: ""
    property alias iconColor: icon.color

    property alias horizontalAlignment: label.horizontalAlignment

    implicitWidth: parent.width
    implicitHeight: industrial.baseSize
    focusPolicy: Qt.NoFocus
    leftPadding: icon.visible ? icon.width + industrial.padding * 2 : industrial.padding
    font.pixelSize: industrial.mainFontSize
    hoverEnabled: true

    background: BackgroundItem {
        radius: 0
        hovered: control.hovered
        color: control.pressed ? Palette.highlight : "transparent"
    }

    indicator: ColoredIcon {
        id: icon
        x: industrial.padding
        color: label.color
        anchors.verticalCenter: parent.verticalCenter
        source: {
            if (!checkable) return control.iconSource;

            if (control.checked) return control.iconSource.length > 0 ? control.iconSource:
                                                                        "qrc:/icons/ok.svg"
            return "";
        }
        width: industrial.baseSize - industrial.padding * 2
        height: width
    }

    contentItem: Label {
        id: label
        font: control.font
        text: control.text
        color: {
            if (!enabled) return industrial.colors.disabled;
            if (control.pressed) return Palette.highlightText;
            return industrial.colors.onContainer;
        }
    }
}
