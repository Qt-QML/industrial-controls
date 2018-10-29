import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ToolBar {
    id: control

    padding: theme.padding

    background: Rectangle {
        color: theme.containerColor

        Shadow {
            source: parent
        }
    }
}
