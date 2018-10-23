import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ApplicationWindow {
    id: main

    visible: true
    title: qsTr("Industrial demo")
    width: controlSize.baseSize * 24
    height: controlSize.baseSize * 12
    theme: themeConfigurator.theme

    Loader {
        id: loader
        anchors.fill: parent
        anchors.margins: controlSize.margins
        source: "Controls.qml"
    }

    Button {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: controlSize.margins
        iconSource: "qrc:/icons/configure.svg"
        tipText: qsTr("Configure")
        flat: true
        onClicked: popup.visible = !popup.visible

        Popup {
            id: popup
            x: parent.width - width
            y: parent.height
            width: controlSize.baseSize * 8

            ColumnLayout{
                width: parent.width
                spacing: controlSize.spacing

                Slider {
                    from: 1
                    to: 200
                    Binding on value { value: themeConfigurator.lightness }
                    onMoved: themeConfigurator.setLightness(value)
                    Layout.fillWidth: true
                }
            }
        }
    }
}
