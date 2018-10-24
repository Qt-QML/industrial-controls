import QtQuick 2.6

Button {
    id: control

    property real radius: Math.min(width, height) / 2

    implicitWidth: controlSize.inputControlHeight
    implicitHeight: implicitWidth
    round: true
    highlighted: true
}
