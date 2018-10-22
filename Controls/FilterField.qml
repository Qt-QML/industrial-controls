import QtQuick 2.6

TextField {
    id: control

    labelText: qsTr("Filter")

    Button {
        anchors.right: parent.right
        height: parent.height
        iconSource: "qrc:/icons/erase.svg"
        tipText: qsTr("Clear filter")
        flat: true
        visible: control.text.length > 0 && control.enabled
        onClicked: control.clear()
    }
}
