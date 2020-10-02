import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control

    property color backgroundColor: Theme.colors.sunken

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        implicitWidth: Theme.baseSize * 6
        implicitHeight: Theme.baseSize
        color: backgroundColor

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
