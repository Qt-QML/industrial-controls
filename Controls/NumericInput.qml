import QtQuick 2.9

TextInput {
    id: root

    horizontalAlignment: Qt.AlignHCenter
    selectByMouse: true
    font.pixelSize: controlSize.fontSize
    color: enabled ? customPalette.textColor : theme.disabledColor
    selectionColor: theme.selectionColor
    selectedTextColor: customPalette.selectedTextColor
}
