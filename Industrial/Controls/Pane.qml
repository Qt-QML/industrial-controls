import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Pane {
    id: control

    property alias backgroundColor: rect.color
    property alias radius: rect.radius

    padding: Theme.padding * 2

    background: Rectangle {
        id: rect
        color: Theme.colors.background
        radius: Theme.rounding
    }
}
