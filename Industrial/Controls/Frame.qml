import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Frame {
    id: control

    property color backgroundColor: Theme.colors.background

    padding: Theme.margins

    background: Rectangle {
        color: backgroundColor

        Shadow {
            source: parent
        }
    }
}
