import QtQuick 2.9
import "."

TextInput {
    id: root

    inputMethodHints: Qt.ImhDigitsOnly
    horizontalAlignment: Qt.AlignHCenter
    selectByMouse: true
    clip: true
    readOnly: !control.editable
    font: control.font
    color: control.enabled ? control.color : Industrial.colors.disabled
    selectionColor: Industrial.colors.selection
    selectedTextColor: Industrial.colors.selectionText
}
