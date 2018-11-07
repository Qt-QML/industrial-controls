import QtQuick 2.6

ColoredIcon {
    id: icon

    property bool focused: false
    property bool opened: false
    property bool isValid: true

    width: Theme.baseSize / 2
    height: width
    source: "qrc:/icons/menu_arrow.svg"
    color: {
        if (!enabled) return Theme.disabledColor;
        if (!isValid) return Theme.negativeColor;
        if (opened) return Theme.highlightColor;
        if (focused) return Theme.selectionColor;

        return Theme.onButtonColor;
    }
}
