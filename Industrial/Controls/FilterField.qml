import QtQuick 2.6

TextField {
    id: control

    clip: true

    Button {
        anchors.right: parent.right
        height: parent.height - Theme.underline
        leftCropped: true
        bottomCropped: true
        iconSource: "qrc:/icons/erase.svg"
        tipText: qsTr("Clear filter")
        color: control.backgroundColor
        radius: Theme.rounding
        visible: control.text.length > 0 && control.enabled
        onClicked: control.clear()
    }
}
