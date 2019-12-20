import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0 as Controls

Controls.Pane {
    id: root

    property var headerModel : [ { text: "Header", size: root.width } ]

    property alias list: list.list
    property alias currentIndex: list.currentIndex
    property alias model: list.model
    property alias delegate: list.delegate
    property alias highlight: list.highlight
    property alias emptyText: list.emptyText

    backgroundColor: Controls.Theme.colors.background

    ListWrapper {
        id: list
        anchors.fill: parent
        spacing: 0
        backgroundColor: root.backgroundColor
        header: ListFader {
            width: parent.width
            height: row.height
            faderOffset: 1
            faderHeight: list.contentY

            RowLayout {
                id: row
                width: parent.width
                spacing: 0

                Repeater {
                    model: headerModel

                    Controls.Label {
                        text: modelData.text
                        font.bold: true
                        font.pixelSize: Controls.Theme.auxFontSize
                        horizontalAlignment: Text.AlignHCenter
                        Layout.preferredWidth: modelData.size
                        Layout.alignment: Qt.AlignTop
                    }
                }
            }
        }
    }
}
