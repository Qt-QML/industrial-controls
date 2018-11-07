import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0
import Industrial.Widgets 1.0

Popup {
    id: root
    width: Theme.baseSize * 8
    closePolicy: Popup.CloseOnPressOutsideParent

    ColumnLayout{
        width: parent.width
        spacing: Theme.spacing

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

        RowLayout {
            spacing: Theme.spacing

            DualColorPicker {
                Binding on primaryColor { value: themeConfigurator.baseColor; when: !opened }
                Binding on secondaryColor { value: themeConfigurator.onBaseColor; when: !opened }
                onPrimaryColorPicked: themeConfigurator.setBaseColor(color)
                onSecondaryColorPicked: themeConfigurator.setOnBaseColor(color)
            }

            Label {
                text: qsTr("Base color")
                Layout.alignment: Qt.AlignCenter
            }
        }

        RowLayout {
            spacing: Theme.spacing

            DualColorPicker {
                Binding on primaryColor { value: themeConfigurator.primaryColor; }
                Binding on secondaryColor { value: themeConfigurator.onPrimaryColor;  }
                onPrimaryColorPicked: themeConfigurator.setPrimaryColor(color)
                onSecondaryColorPicked: themeConfigurator.setOnPrimaryColor(color)
            }

            Label {
                text: qsTr("Primary color")
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
