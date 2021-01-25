import QtQuick 2.6

TextField {
    id: control

    property bool passwordChanged: false
    property bool passwordVisible: false

    rightPadding: showPasswordButton.visible ? showPasswordButton.width + Theme.padding : Theme.padding
    echoMode: passwordVisible ? TextInput.Normal : TextInput.Password
    isValid: !passwordChanged || text.length >= 6
    onTextEdited: passwordChanged = true

    Button {
        id: showPasswordButton
        iconSource: passwordVisible ? "qrc:/icons/password_hide.svg" : "qrc:/icons/password_show.svg"
        color: (control.focus) ? ((!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)) : "transparent"
        hoverColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.highlight)
        highlightColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)
        iconColor: {
            if (pressed) return Theme.colors.highlightedText;
            if (hovered) return Theme.colors.text;
            if (!enabled) return Theme.colors.disabled;
            if (!control.isValid) return Theme.colors.negative;
            if (control.caution) return Theme.colors.neutral;
            return Theme.colors.description;
        }
        visible: control.text.length
        anchors.right: parent.right
        height: parent.height - Theme.underline
        flat: true

        leftCropped: control.table ? 0 : radius
        bottomCropped: control.table ? 0 : radius
        radius: control.table ? 0 : Theme.rounding

        onClicked: {
            passwordVisible = !passwordVisible
            echoMode = passwordVisible ? TextInput.Normal : TextInput.Password
        }
    }
}

