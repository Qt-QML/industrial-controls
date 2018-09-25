import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.TabBar { // TODO: replace with model-based bar
    id: control

    implicitWidth: controlSize.baseSize * count * 6
    implicitHeight: controlSize.baseSize

    background: Rectangle {
        color: customPalette.backgroundColor
    }
}
