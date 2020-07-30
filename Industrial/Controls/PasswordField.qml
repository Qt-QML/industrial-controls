import QtQuick 2.6
import QtQuick.Templates 2.2 as T

TextField {
    id: root

    property bool passwordChanged: false
    property bool passwordVisible: false

    echoMode: passwordVisible ? TextField.Normal : TextInput.Password
    isValid: !passwordChanged || text.length >= 6
    onTextEdited: passwordChanged = true

    Button {
        id: showPasswordButton
        iconSource: passwordVisible ? "/icons/password_hide.svg" : "/icons/password_show.svg"
        visible: root.text.length
        anchors.right: parent.right
        height: parent.height - Theme.underline
        flat: true
        leftCropped: true
        bottomCropped: true
        onClicked: passwordVisible = !passwordVisible
    }
}

