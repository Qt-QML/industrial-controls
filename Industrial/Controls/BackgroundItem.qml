import QtQuick 2.6

Item {
    id: control

    property bool highlighted: false
    property bool hovered: false
    property bool shadow: false
    property int leftPadding: controlSize.padding
    property int croppig: radius
    readonly property int offset: radius + 1

    property alias radius: background.radius
    property alias color: background.color
    property alias highlighterColor: highlighter.color

    implicitHeight: controlSize.inputControlHeight

    Item {
        anchors.fill: parent
        clip: true

        Rectangle {
            id: background
            color: theme.containerColor
            anchors.fill: parent
            radius: controlSize.rounding
            anchors.bottomMargin: -croppig

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
        height: controlSize.underline
        visible: control.enabled
        color: control.highlighted ? theme.highlightColor : "transparent"
    }

    Shadow {
        visible: shadow
        source: parent
    }
}
