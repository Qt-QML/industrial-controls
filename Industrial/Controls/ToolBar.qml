import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.ToolBar {
    id: control

    padding: Industrial.padding

    background: Rectangle {
        color: industrial.colors.sunken

        Shadow {
            source: parent
        }
    }
}
