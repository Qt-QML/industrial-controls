import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.ItemDelegate {
    id: control

    property bool isValid: true

    property alias horizontalAlignment: content.horizontalAlignment
    property alias iconSource: content.iconSource

    implicitHeight: Theme.baseSize
    padding: Theme.padding
    font.pixelSize: Theme.mainFontSize
    hoverEnabled: true

    background: BackgroundItem {
        radius: 0
        hovered: control.hovered
        color: control.highlighted ? Theme.colors.selection : "transparent"
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: parent
        anchors.margins: control.padding
        font: control.font
        text: control.text
        textColor: control.highlighted ? Theme.colors.selectedText : Theme.colors.text
    }
}
