import QtQuick 2.9

TextInput {
    id: root

    horizontalAlignment: Qt.AlignHCenter
    selectByMouse: true
    font.pixelSize: controlSize.fontSize
    color: enabled ? customPalette.textColor : customPalette.sunkenColor
    selectionColor: customPalette.selectionColor
    selectedTextColor: customPalette.selectedTextColor
}
