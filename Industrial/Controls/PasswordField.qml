import QtQuick 2.6

TextField {
    id: control

    property bool passwordChanged: false
    property bool passwordVisible: false

    rightPadding: showPasswordButton.visible ? showPasswordButton.width + Theme.padding : Theme.padding
    echoMode: passwordVisible ? TextField.Normal : TextInput.Password
    isValid: !passwordChanged || text.length >= 6
    onTextEdited: passwordChanged = true

    Button {
        id: showPasswordButton
        iconSource: passwordVisible ? "/icons/password_hide.svg" : "/icons/password_show.svg"
        visible: control.text.length
        anchors.right: parent.right
        height: parent.height - Theme.underline
        flat: true
        leftCropped: true
        bottomCropped: true
        onClicked: passwordVisible = !passwordVisible
    }
}

