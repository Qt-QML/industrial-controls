import QtQuick 2.6
import QtQuick.Controls 2.2 as T
import Industrial 1.0

T.Pane {
    id: control

    property color backgroundColor: theme.surfaceColor

    padding: controlSize.padding

    background: Rectangle { color: backgroundColor }
}
