import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.Menu {
    id: control
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    background: Rectangle {
        implicitWidth: Palette.baseSize * 6
        implicitHeight: Palette.baseSize
        color: industrial.colors.container

        Shadow {
            visible: !control.flat
            source: parent
        }
    }
}
