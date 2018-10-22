import QtQuick 2.6

ColoredIcon {
    id: icon

    property bool focused: false
    property bool opened: false
    property bool isValid: true

    width: controlSize.baseSize / 2
    height: width
    source: "qrc:/ui/menu_arrow.svg"
    color: {
        if (!enabled) return customPalette.sunkenColor;
        if (!isValid) return customPalette.dangerColor;
        if (opened) return customPalette.highlightColor;
        if (focused) return customPalette.selectionColor;

        return customPalette.secondaryTextColor;
    }
}
