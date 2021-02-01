import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0 as Controls

Controls.Pane {
    id: root

    property var headerModel : [ { text: "Header", size: root.width } ]

    readonly property string naturalOrder: "naturalOrder"
    readonly property string ascOrder: "ascOrder"
    readonly property string descOrder: "descOrder"

    signal headerClicked(string columnId, string order)

    property bool interactiveMode: false

    property alias list: list.list
    property alias currentIndex: list.currentIndex
    property alias model: list.model
    property alias delegate: list.delegate
    property alias highlight: list.highlight
    property alias emptyText: list.emptyText
    property bool isDragActive: false
    property alias count: list.count

    backgroundColor: Controls.Theme.colors.background

    ListWrapper {
        id: list
        anchors.fill: parent
        spacing: 0
        color: root.backgroundColor
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
                    id: headers

                    model: headerModel

                    Controls.Label {
                        id: label
                        property int order: 0

                        text: modelData.text + ((label.order === 0 ? "" : ((label.order === 1 ? " ▼" : " ▲"))))
                        font.bold: true
                        font.pixelSize: Controls.Theme.auxFontSize
                        horizontalAlignment: Text.AlignHCenter
                        Layout.preferredWidth: modelData.size
                        Layout.alignment: Qt.AlignTop

                        MouseArea {
                            anchors.fill: parent
                            enabled: root.interactiveMode
                            visible: enabled
                            onClicked: {
                                for (var i = 0; i < headers.count; ++i) {
                                    if (headers.itemAt(i) && headers.itemAt(i) !== label && headers.itemAt(i).order !== undefined)
                                        headers.itemAt(i).order = 0
                                }

                                var stringOrder = root.naturalOrder
                                if (label.order === 0) {
                                    stringOrder = root.ascOrder
                                    label.order = 1
                                } else if (label.order === 1) {
                                    stringOrder = root.descOrder
                                    label.order = 2
                                } else {
                                    stringOrder = root.naturalOrder
                                    label.order = 0
                                }
                                root.headerClicked(!!modelData.columnId ? modelData.columnId : "", stringOrder)
                            }
                        }
                    }
                }
            }
        }
    }
}
