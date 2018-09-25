import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Pane {
    id: control

    padding: controlSize.padding

    background: Rectangle {
        id: rect
        anchors.fill: parent
        color: customPalette.backgroundColor
        radius: 2

        Shadow {
            source: parent
        }
    }
}
