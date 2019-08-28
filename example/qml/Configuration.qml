import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0
import Industrial.Widgets 1.0

Popup {
    id: root
    width: Theme.baseSize * 8
    closePolicy: Popup.CloseOnPressOutsideParent

    ThemeConfigurator
    {
        id: congigurator
        theme: Theme
    }

    ColumnLayout{
        width: parent.width
        spacing: Theme.spacing

        Slider {
            from: 50
            to: 150
            text: qsTr("Lightness")
            value: Theme.colors.lightness * 100
            onMoved: { Theme.colors.lightness = value / 100}

            Layout.fillWidth: true
        }

        Slider {
            from: 0
            to: 8
            text: qsTr("Rounding")
            value: Theme.rounding
            onMoved: {Theme.rounding = value}
            Layout.fillWidth: true
        }

        Slider {
            from: 24
            to: 64
            stepSize: 4
            text: qsTr("Base size")
            value:  Theme.baseSize
            onPressedChanged: if (!pressed) Theme.baseSize = value
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: Theme.spacing

            DualColorPicker {
                primaryColor: Theme.colors.baseColor
                onPrimaryColorPicked:Theme.colors.baseColor = color
                secondaryColor: Theme.colors.textBaseColor
                onSecondaryColorPicked: Theme.colors.textBaseColor = color
            }

            Label {
                text: qsTr("Base color")
                Layout.alignment: Qt.AlignCenter
            }
        }

        RowLayout {
            spacing: Theme.spacing

            DualColorPicker {
                primaryColor: Theme.colors.primaryColor
                onPrimaryColorPicked:Theme.colors.primaryColor = color
                secondaryColor: Theme.colors.textPrimaryColor
                onSecondaryColorPicked: Theme.colors.textPrimaryColor = color
            }

            Label {
                text: qsTr("Primary color")
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
