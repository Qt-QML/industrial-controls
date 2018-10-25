import QtQuick 2.6

Item {
    id: control

    property bool highlighted: false
    property bool hovered: false
    property bool shadow: false
    property int leftPadding: theme.padding
    property int leftCroppig: 0
    property int rightCroppig: 0
    property int bottomCroppig: radius
    readonly property int offset: radius + 1

    property alias radius: background.radius
    property alias color: background.color
    property alias highlighterColor: highlighter.color

    Item {
        anchors.fill: parent
        clip: true

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.leftMargin: -leftCroppig
            anchors.rightMargin: -rightCroppig
            anchors.bottomMargin: -bottomCroppig
            color: theme.containerColor
            radius: theme.rounding

            Rectangle {
                anchors.fill: parent
                color: theme.onButtonColor
                radius: parent.radius
                opacity: 0.1
                visible: hovered
            }
        }
    }

    Rectangle {
        id: highlighter
        anchors.bottom: parent.bottom
        width: parent.width
        height: theme.underline
        visible: control.enabled
        color: control.highlighted ? theme.highlightColor : "transparent"
    }

    Shadow {
        visible: shadow
        source: parent
    }
}
