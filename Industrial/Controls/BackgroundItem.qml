import QtQuick 2.6

Item {
    id: control

    property bool hovered: false
    property bool flat: false
    property int leftPadding: Theme.padding
    property int leftCroppig: 0
    property int rightCroppig: 0
    property int bottomCroppig: 0
    readonly property int offset: radius + 1
    property color borderColor: "transparent"

    property alias radius: background.radius
    property alias color: background.color

    Item {
        anchors.fill: parent
        clip: true

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.leftMargin: -leftCroppig
            anchors.rightMargin: -rightCroppig
            anchors.bottomMargin: -bottomCroppig
            radius: Theme.rounding
            color: flat ? "transparent" : Theme.containerColor
            border.color: borderColor

            Rectangle {
                anchors.fill: parent
                color: Theme.onButtonColor
                radius: parent.radius
                opacity: 0.1
                visible: hovered
            }
        }
    }
}
