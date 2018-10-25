import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        implicitWidth: theme.baseSize * 6
        implicitHeight: theme.baseSize
        color: theme.containerColor

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
