import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0
import Industrial.Widgets 1.0

Popup {
    id: root
    width: Industrial.baseSize * 8
    closePolicy: Popup.CloseOnPressOutsideParent

    ColumnLayout{
        width: parent.width
        spacing: Industrial.spacing

        Slider {
            from: 50
            to: 150
            text: qsTr("Lightness")
            value: Industrial.colors.lightness * 100
            onMoved: { Industrial.colors.lightness = value / 100}

            Layout.fillWidth: true
        }

        Slider {
            from: 0
            to: 8
            text: qsTr("Rounding")
            value: Industrial.rounding
            onMoved: {Industrial.rounding = value}
            Layout.fillWidth: true
        }

        Slider {
            from: 24
            to: 64
            stepSize: 4
            text: qsTr("Base size")
            value:  Industrial.baseSize
            onPressedChanged: if (!pressed) Industrial.baseSize = value
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: Industrial.spacing

            DualColorPicker {
                primaryColor: Industrial.colors.baseColor
                onPrimaryColorPicked:Industrial.colors.baseColor = color
                secondaryColor: Industrial.colors.textBaseColor
                onSecondaryColorPicked: Industrial.colors.textBaseColor = color
            }

            Label {
                text: qsTr("Base color")
                Layout.alignment: Qt.AlignCenter
            }
        }

        RowLayout {
            spacing: Industrial.spacing

            DualColorPicker {
                primaryColor: Industrial.colors.primaryColor
                onPrimaryColorPicked:Industrial.colors.primaryColor = color
                secondaryColor: Industrial.colors.textPrimaryColor
                onSecondaryColorPicked: Industrial.colors.textPrimaryColor = color
            }

            Label {
                text: qsTr("Primary color")
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
