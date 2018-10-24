import QtQuick 2.6

ColoredIcon {
    id: icon

    property bool focused: false
    property bool opened: false
    property bool isValid: true

    width: controlSize.baseSize / 2
    height: width
    source: "qrc:/icons/menu_arrow.svg"
    color: {
        if (!enabled) return theme.disabledColor;
        if (!isValid) return theme.negativeColor;
        if (opened) return theme.highlightColor;
        if (focused) return theme.selectionColor;

        return theme.onButtonColor;
    }
}
