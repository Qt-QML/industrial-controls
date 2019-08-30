import QtQuick 2.6


Item {
    id: control

    property bool hovered: false
    property bool flat: false
    property int topCropping: 0
    property int bottomCropping: 0
    property int leftCropping: 0
    property int rightCropping: 0
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
            anchors.topMargin: -topCropping
            anchors.bottomMargin: -bottomCropping
            anchors.leftMargin: -leftCropping
            anchors.rightMargin: -rightCropping
            radius: Theme.rounding
            color: flat ? "transparent" : Theme.colors.sunken
            border.color: borderColor

            Rectangle {
                anchors.fill: parent
                color: Theme.colors.controlText
                radius: parent.radius
                opacity: 0.1
                visible: hovered
            }
        }
    }
}
