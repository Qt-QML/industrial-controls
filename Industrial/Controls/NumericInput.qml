import QtQuick 2.9

TextInput {
    id: root

    horizontalAlignment: Qt.AlignHCenter
    selectByMouse: true
    font.pixelSize: Theme.mainFontSize
    color: enabled ? Theme.onSurfaceColor : Theme.disabledColor
    selectionColor: Theme.selectionColor
    selectedTextColor: Theme.onSelectionColor
}
