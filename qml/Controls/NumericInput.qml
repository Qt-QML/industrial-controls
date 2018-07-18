import QtQuick 2.9

TextInput {
    id: root

    property bool changed: false

    signal finished()

    onFinished: changed = false
    onTextEdited: changed = true
    onActiveFocusChanged:  if (!activeFocus && changed) finished()
    onEditingFinished: if (changed) finished()
}
