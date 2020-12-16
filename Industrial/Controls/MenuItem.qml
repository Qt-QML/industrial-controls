import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.MenuItem {
    id: control

    property string iconSource: ""
    property bool selected: false

    property alias iconColor: icon.color
    property alias horizontalAlignment: label.horizontalAlignment

    implicitWidth: label.implicitWidth + leftPadding + rightPadding
    implicitHeight: Theme.baseSize
    //width: parent.width //

    focusPolicy: Qt.NoFocus
    padding: 0
    leftPadding: icon.source == "" ? Theme.padding * 2 : icon.x + icon.width + Theme.padding
    rightPadding: Theme.padding * 2
    font.pixelSize: Theme.mainFontSize
    hoverEnabled: true

    background: BackgroundItem {
        radius: 0
        hovered: control.hovered
        color: {
            if (selected) return Theme.colors.selection;
            if (control.pressed) return Theme.colors.highlight;
            return "transparent";
        }
    }

    indicator: ColoredIcon {
        id: icon
        x: Theme.padding
        anchors.verticalCenter: parent.verticalCenter
        source: {
            if (!checkable) return control.iconSource;
            if (control.checked) return control.iconSource.length > 0 ? control.iconSource: "qrc:/icons/ok.svg";
            return "";
        }
        height: Theme.iconSize
        width: height
        color: {
            if (!enabled) return Theme.colors.disabled;
            if (control.pressed) return Theme.colors.highlightedText;
            if (selected || (checked && selected)) return Theme.colors.selectedText;
            if (checked) return Theme.colors.highlight;
            return Theme.colors.description;
        }
    }

    contentItem: Label {
        id: label
        font: control.font
        text: control.text
        color: {
            if (!enabled) return Theme.colors.disabled;
            if (control.pressed) return Theme.colors.highlightedText;
            if (selected || (checked && selected)) return Theme.colors.selectedText;
            return Theme.colors.text;
        }
    }
}
