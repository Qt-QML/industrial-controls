import QtQuick 2.6
import "../Shaders" as Shaders

Button {
    id: control

    property real radius: Math.min(width, height) / 2

    implicitWidth: controlSize.baseSize * 1.2
    implicitHeight: implicitWidth
    round: true
    highlighted: true
}
