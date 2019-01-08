import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        implicitWidth: industrial.baseSize * 6
        implicitHeight: industrial.baseSize
        color: industrial.containerColor

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
