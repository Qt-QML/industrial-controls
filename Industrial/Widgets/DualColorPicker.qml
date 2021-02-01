import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Item {
    id: root

    readonly property bool opened: primary.opened || secondary.opened

    property alias primaryColor: primary.color
    property alias secondaryColor: secondary.color
    property color _tmpColor: "black"

    signal primaryColorPicked(color color)
    signal secondaryColorPicked(color color)

    implicitWidth: primary.implicitWidth + secondary.implicitWidth * 0.5
    implicitHeight: primary.implicitHeight + secondary.implicitHeight * 0.5

    Button {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: -width * 0.1
        flat: true
        iconSource: "qrc:/icons/swap.svg"
        onClicked: {
            _tmpColor = primary.color;
            primary.color = secondary.color;
            secondary.color = _tmpColor;

            primaryColorPicked(primary.color);
            secondaryColorPicked(secondary.color)
        }
    }

    ColorPicker {
        id: primary
        width: root.width / 1.5
        height: root.width / 1.5
        color: "black"
        onColorPicked: primaryColorPicked(color)

        ColorPicker {
            id: secondary
            width: primary.width
            height: primary.height
            x: parent.width * 0.5
            y: parent.width * 0.5
            color: "white"
            onColorPicked: secondaryColorPicked(color)
        }
    }
}
