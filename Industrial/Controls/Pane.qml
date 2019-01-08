import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Pane {
    id: control

    property color backgroundColor: industrial.surfaceColor

    padding: industrial.margins

    background: Rectangle {
        color: backgroundColor
        radius: industrial.rounding
    }
}
