import QtQuick 2.9

TextInput {
    id: root

    horizontalAlignment: Qt.AlignHCenter
    font.pixelSize: controlSize.fontSize
    color: enabled ? customPalette.textColor : customPalette.disabledColor
    selectByMouse: true
    selectionColor: customPalette.selectionColor
    selectedTextColor: customPalette.selectedTextColor
}
