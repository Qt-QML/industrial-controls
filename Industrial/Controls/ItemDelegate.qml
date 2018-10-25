import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.ItemDelegate {
    id: control

    property bool isValid: true

    property alias horizontalAlignment: content.horizontalAlignment
    property alias iconSource: content.iconSource

    implicitHeight: theme.baseSize
    padding: theme.padding
    font.pixelSize: theme.mainFontSize

    background: Rectangle {
        anchors.fill: parent
        visible: control.highlighted
        color: isValid ? theme.highlightColor : theme.negativeColor
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: parent
        anchors.margins: control.padding
        font: control.font
        text: control.text
        textColor: control.highlighted ? theme.onSelectionColor : theme.onContainerColor
    }
}
