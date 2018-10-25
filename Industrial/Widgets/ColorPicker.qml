import QtQuick 2.6
import QtQuick.Layouts 1.0
import Industrial.Controls 1.0

Rectangle {
    id: root

    property alias opened: popup.visible

    signal picked(color pickedColor)

    implicitWidth: theme.baseSize * 1.5
    implicitHeight: theme.baseSize * 1.5

    Shadow { source: parent }

    MouseArea {
        anchors.fill: parent
        onClicked: opened ? popup.close() : popup.open()
    }

    Popup {
        id: popup
        x: -width
        modal: true
        closePolicy: Popup.CloseOnPressOutsideParent

        onVisibleChanged: if (visible) previewRect.color = root.color

        contentItem: Pane {
            clip: true

            GridLayout {
                columns: 3
                columnSpacing: theme.spacing
                rowSpacing: theme.spacing

                Label { text: qsTr("R") }

                Slider {
                    id: rSlider
                    implicitWidth: theme.baseSize * 5
                    from: 0
                    to: 255
                    onMoved: previewRect.color.r = value / to
                }

                Rectangle {
                    id: previewRect
                    implicitWidth: theme.baseSize * 3
                    implicitHeight: theme.baseSize * 3
                    Layout.alignment: Qt.AlignVCenter
                    Layout.rowSpan: 3
                    color: "transparent"
                    onColorChanged: {
                        rSlider.value = color.r * rSlider.to;
                        gSlider.value = color.g * gSlider.to;
                        bSlider.value = color.b * bSlider.to;
                    }

                     Shadow { source: parent }
                }

                Label { text: qsTr("G") }

                Slider {
                    id: gSlider
                    implicitWidth: theme.baseSize * 5
                    from: 0
                    to: 255
                    onMoved: previewRect.color.g = value / to
                }

                Label { text: qsTr("B") }

                Slider {
                    id: bSlider
                    implicitWidth: theme.baseSize * 5
                    from: 0
                    to: 255
                    onMoved: previewRect.color.b = value / to
                }

                Button {
                    text: qsTr("Assign")
                    onClicked: {
                        root.color = previewRect.color;
                        root.picked(root.color);
                    }
                    Layout.fillWidth: true
                    Layout.columnSpan: 3
                }
            }
        }
    }
}
