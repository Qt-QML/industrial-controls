import QtQuick 2.6

Button {
    id: control

    property real radius: Math.min(width, height) / 2

    implicitWidth: theme.baseSize * 1.5
    implicitHeight: implicitWidth
    round: true
    highlighted: true
}
