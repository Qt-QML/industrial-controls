import QtQuick 2.9

TextInput {
    id: root

    horizontalAlignment: Qt.AlignHCenter
    selectByMouse: true
    font.pixelSize: theme.mainFontSize
    color: enabled ? theme.onSurfaceColor : theme.disabledColor
    selectionColor: theme.selectionColor
    selectedTextColor: theme.onSelectionColor
}
