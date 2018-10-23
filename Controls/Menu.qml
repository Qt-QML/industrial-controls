import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        implicitWidth: controlSize.baseSize * 6
        implicitHeight: controlSize.baseSize
        color: theme.containerColor

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
