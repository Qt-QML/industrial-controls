import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ToolBar {
    id: control

    padding: industrial.padding

    background: Rectangle {
        color: industrial.colors.container

        Shadow {
            source: parent
        }
    }
}
