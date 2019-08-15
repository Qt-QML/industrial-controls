import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0
import Industrial.Widgets 1.0

Popup {
    id: root
    //width: Palette.baseSize * 8
    width: Palette.baseSize * 8
    closePolicy: Popup.CloseOnPressOutsideParent

    ColumnLayout{
        width: parent.width
        spacing: industrial.spacing

        Slider {
            from: 50
            to: 150
            text: qsTr("Lightness")
            value: Palette.lightness
            onMoved: { Palette.lightness = value}

            Layout.fillWidth: true
        }

        Slider {
            from: 0
            to: 8
            text: qsTr("Rounding")
            value: Palette.rounding
            onMoved: {Palette.rounding = value}
            Layout.fillWidth: true
        }

        Slider {
            from: 24
            to: 64
            stepSize: 4
            text: qsTr("Base size")
            value:  Palette.baseSize
            onPressedChanged: if (!pressed) Palette.baseSize = value
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: industrial.spacing

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
            spacing: industrial.spacing

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
