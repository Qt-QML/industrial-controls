import QtQuick 2.6
import QtQuick.Templates 2.1 as T
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0 as Controls

T.ComboBox {
    id: control

    property var currentItem: model && model[currentIndex] ? model[currentIndex] : undefined
    property string iconRole: "icon"
    property string displayIcon: currentItem && currentItem[control.iconRole] !== undefined ?
                                     currentItem[control.iconRole] : ""

    property alias table: background.table
    property alias isValid: background.isValid
    property alias labelText: background.text
    property alias labelColor: background.textColor
    property alias labelWidth: background.textWidth //FIXME
    property alias backgroundColor: background.color
    property alias contentColor: content.textColor
    property alias horizontalAlignment: content.horizontalAlignment
    property Component delegateContent

    function findIndex(item) {
        for (var i = 0 ;i < count; ++i) {
            if (item === model[i]) return i;
        }
        return -1;
    }

    implicitWidth: background.implicitWidth
    implicitHeight: labelText.length > 0 ? Theme.baseSize * 1.25 : Theme.baseSize
    font.pixelSize: Theme.mainFontSize
    clip: true
    textRole: "text"
    displayText: currentItem && currentItem[control.textRole] !== undefined ?
                     currentItem[control.textRole] : currentItem

    leftPadding: Theme.padding
    rightPadding: Theme.padding + Theme.baseSize

    indicator: ColoredIcon {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: Theme.padding
        height: Theme.iconSize
        width: height
        source: control.popup.visible ? "qrc:/icons/up.svg" : "qrc:/icons/down.svg"
        color: {
            if (!control.enabled) return Theme.colors.background;
            if (!control.isValid || !control.isValid && highlighted) return Theme.colors.negative;
            if (control.caution || control.caution && highlighted) return Theme.colors.neutral;
            if (control.activeFocus) return Theme.colors.selection;
            //if (table) return Theme.colors.control;
            return Theme.colors.description;
        }
    }

    background: BackgroundInput {
        id: background
        hovered: control.hovered
        anchors.fill: parent
        flat: control.flat
        textPadding: Theme.padding
        inputed: displayText.length > 0
        highlighted: control.activeFocus
    }

    delegate: ItemDelegate {
        id: delegate
        width: control.width
        horizontalAlignment: control.horizontalAlignment
        text: {
            if (modelData !== undefined) {
                return modelData[control.textRole] ? modelData[control.textRole] : modelData;
            }
            if (model !== undefined) {
                return model[control.textRole] ? model[control.textRole] : model;
            }
            return ""
        }

        iconSource: {
            if (modelData !== undefined) {
                return modelData[control.iconRole] ? modelData[control.iconRole] : "";
            }
            if (model !== undefined) {
                return model[control.iconRole] ? model[control.iconRole] : "";
            }
            return ""
        }

        font: control.font
        highlighted: control.currentIndex === index
        isValid: control.isValid

        Loader {
            property var delegateModel: modelData

            anchors.right: parent.right
            anchors.rightMargin: Theme.margins
            anchors.verticalCenter: parent.verticalCenter
            sourceComponent: delegateContent
        }
    }

    contentItem: ContentItem {
        id: content
        anchors.fill: control
        anchors.topMargin: background.textHeight - background.underline
        anchors.leftMargin: Theme.padding
        anchors.rightMargin: Theme.padding + Theme.baseSize
        font: control.font
        text: displayText
        iconSource: displayIcon
        textColor: control.enabled ? Theme.colors.text : Theme.colors.disabled
        horizontalAlignment: Text.AlignLeft
    }

    popup: Popup {
        y: control.height
        backgroundColor: Theme.colors.raised
        width: control.width
        implicitHeight: contentItem.implicitHeight + Theme.padding * 2
        leftPadding: 0
        rightPadding: 0
        topPadding: Theme.padding
        bottomPadding: Theme.padding

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            boundsBehavior: Flickable.StopAtBounds
        }
    }
}
