import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Popup {
    id: root
    width: theme.baseSize * 8
    closePolicy: Popup.CloseOnPressOutsideParent

    ColumnLayout{
        width: parent.width
        spacing: theme.spacing

        Slider {
            from: 50
            to: 150
            text: qsTr("Lightness")
            Binding on value { value: themeConfigurator.lightness }
            onMoved: themeConfigurator.setLightness(value)
            Layout.fillWidth: true
        }

        Slider {
            from: 0
            to: 8
            text: qsTr("Rounding")
            Binding on value { value: themeConfigurator.rounding }
            onMoved: themeConfigurator.setRounding(value)
            Layout.fillWidth: true
        }

        Slider {
            from: 24
            to: 64
            stepSize: 4
            text: qsTr("Base size")
            Binding on value { value: themeConfigurator.baseSize }
            onPressedChanged: if (!pressed) themeConfigurator.setBaseSize(value)
            Layout.fillWidth: true
        }
    }
}
