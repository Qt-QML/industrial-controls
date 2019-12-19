import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Dialog {
    id: control

    property color backgroundColor: Theme.colors.raised

    padding: Theme.padding
    clip: false

    background: Rectangle {
        color: backgroundColor
        radius: 2

        Shadow {
            source: parent
        }
    }

    footer: DialogButtonBox {}
}
