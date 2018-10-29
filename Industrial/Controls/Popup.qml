import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Popup {
    id: control

    property color backgroundColor: theme.containerColor

    padding: theme.padding

    background:  Rectangle {
        color: backgroundColor
        radius: 2

        Shadow {
            source: parent
        }
    }
}
