import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        implicitWidth: Industrial.baseSize * 6
        implicitHeight: Industrial.baseSize
        color: Industrial.colors.sunken

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
