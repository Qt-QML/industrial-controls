import QtQuick 2.6

TextField {
    id: control

    labelText: qsTr("Filter")
    clip: true

    Button {
        anchors.right: parent.right
        height: parent.height + radius
        iconSource: "qrc:/icons/erase.svg"
        tipText: qsTr("Clear filter")
        color: control.backgroundColor
        shadow: false
        radius: theme.rounding
        visible: control.text.length > 0 && control.enabled
        onClicked: control.clear()
    }
}
