import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.ToolTip {
    id: control
    property bool сloseOnClick: true

    contentItem: Label {
        text: control.text
        font: control.font
        color: Theme.colors.tipText
        horizontalAlignment: Qt.AlignHCenter
    }

    background: Rectangle {
        color: Theme.colors.tip
        radius: 3

        MouseArea {
            anchors.fill: parent
            onPressed: if(control.сloseOnClick) control.close()
        }
    }
}
