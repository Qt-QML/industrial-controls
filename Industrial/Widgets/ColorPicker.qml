import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

Pane {
    id: root

    property alias currentColor: previewRect.color
    property alias backgroundColor: root.backgroundColor

    signal colorChange()

    GridLayout {
        columns: 3
        columnSpacing: Theme.spacing
        rowSpacing: Theme.spacing

        Label { text: qsTr("R") }

        Slider {
            id: rSlider
            implicitWidth: Theme.baseSize * 5
            from: 0
            to: 255
            onMoved: {
                previewRect.color.r = value / to;
                colorChange();
            }
        }

        Rectangle {
            id: previewRect
            implicitWidth: Theme.baseSize * 3
            implicitHeight: Theme.baseSize * 3
            Layout.alignment: Qt.AlignVCenter
            Layout.rowSpan: 3
            color: currentColor
            onColorChanged: {
                rSlider.value = color.r * rSlider.to;
                gSlider.value = color.g * gSlider.to;
                bSlider.value = color.b * bSlider.to;
                currentColor = color;
            }

            Shadow { source: parent }
        }

        Label { text: qsTr("G") }

        Slider {
            id: gSlider
            implicitWidth: Theme.baseSize * 5
            from: 0
            to: 255
            onMoved: {
                previewRect.color.g = value / to;
                colorChange();
            }
        }

        Label { text: qsTr("B") }

        Slider {
            id: bSlider
            implicitWidth: Theme.baseSize * 5
            from: 0
            to: 255
            onMoved: {
                previewRect.color.b = value / to;
                colorChange();
            }
        }
    }
}
