import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control

    property alias menuSize: backgroundRect.implicitWidth
    property alias backgroundColor: backgroundRect.color

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        id: backgroundRect

        implicitWidth: Theme.baseSize * 6
        implicitHeight: Theme.baseSize
        color: Theme.colors.sunken

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
