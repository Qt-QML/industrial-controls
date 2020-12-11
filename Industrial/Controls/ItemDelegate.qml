import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

T.ItemDelegate {
    id: control

    property bool isValid: true

    property alias horizontalAlignment: content.horizontalAlignment
    property alias iconSource: content.iconSource

    implicitHeight: industrial.baseSize
    padding: industrial.padding
    font.pixelSize: industrial.mainFontSize
    hoverEnabled: true

    background: BackgroundItem {
        radius: 0
        hovered: control.hovered
        color: {
            if (control.highlighted) return control.isValid ? industrial.colors.selection :
                                                              industrial.colors.negative;
            return industrial.colors.container;
        }
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: parent
        anchors.margins: control.padding
        font: control.font
        text: control.text
        textColor: control.highlighted ? industrial.colors.onSelection : industrial.colors.onContainer
    }
}
