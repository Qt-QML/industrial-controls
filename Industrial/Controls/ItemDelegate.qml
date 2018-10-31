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
    hoverEnabled: true

    background: BackgroundItem {
        radius: 0
        hovered: control.hovered
        color: {
            if (control.highlighted) return control.isValid ? theme.highlightColor :
                                                              theme.negativeColor;
            return theme.containerColor;
        }
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: parent
        anchors.margins: control.padding
        font: control.font
        text: control.text
        textColor: control.highlighted ? theme.onHighlightColor : theme.onContainerColor
    }
}
