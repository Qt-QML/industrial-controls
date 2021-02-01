import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

TextField {
    id: control

    property bool dms: true
    property real latitude
    property real longitude
    property real altitude
    property string typeText: dms ? "Dms" : "Deg"

    property alias table: background.table
    property alias flat: background.flat
    property alias caution: background.caution
    property alias isValid: background.isValid
    property alias labelText: background.text

    implicitWidth: background.implicitWidth
    implicitHeight: labelText.length > 0 ? Theme.baseSize * 1.25 : Theme.baseSize

    selectionColor: background.highlighterColor
    leftPadding: typeButton.width + Theme.padding
    rightPadding: copyButton.visible ? copyButton.width + Theme.padding : Theme.padding

    topPadding: labelText.length > 0 ? (Theme.auxFontSize / 1.2 - Theme.border) : 0
    verticalAlignment: Text.AlignVCenter

    property string latitudeStr: {
        switch (dms) {
        case true:
            return degreesToDmsString(latitude, false, 2);
        case false:
            return latitude.toFixed(6);
        }
    }

    property string longitudeStr: {
        switch (dms) {
        case true:
            return degreesToDmsString(longitude, true, 2);
        case false:
            return longitude.toFixed(6);
        }
    }

    text: latitudeStr + "/" + longitudeStr

    function textInputToCoord() {
        if (dms) {
            if ( validatorInput() ) {
                let latArr = [];
                let longArr = [];
                latArr.str = control.text.split("/")[0];
                latArr.sign = latArr.str.slice(0,1).toUpperCase() === "N" ? 1 : -1
                latArr.coord = latArr.str.slice(1).split(",");
                longArr.str = control.text.split("/")[1];
                longArr.sign = longArr.str.slice(0,1).toUpperCase() === "E" ? 1 : -1
                longArr.coord = longArr.str.slice(1).split(",");
                latitude = Helper.dmsToDegree(latArr.sign, Helper.stringToReal(latArr.coord[0]), Helper.stringToReal(latArr.coord[1]), Helper.stringToReal(latArr.coord[2]));
                longitude = Helper.dmsToDegree(longArr.sign, Helper.stringToReal(longArr.coord[0]), Helper.stringToReal(longArr.coord[1]), Helper.stringToReal(longArr.coord[2]));
                validate();
            }
            else caution = true;
        }
        if (!dms) {
            if ( validatorInput() ) {
                latitude = Helper.stringToReal(control.text.split("/")[0], ".");
                longitude = Helper.stringToReal(control.text.split("/")[1], ".");
                validate();
            }
            else caution = true;
        }
    }

    function validatorInput() {
        switch (dms) {
        case true:
            return /[N|S][\d]{1,2}([,][\d]{1,2})([,][\d]{1,2})([.][\d]{1,2})?\/[E|W][\d]{1,3}([,][\d]{1,2})([,][\d]{1,2})([.][\d]{1,2})?/i.test(control.text);
        case false:
            return /-?[\d]{1,3}([.][\d]*)?\/-?[\d]{1,3}([.][\d]*)?/.test(control.text);
        }
    }

    function validate() {
        (!acceptableInput && text.length || latitude > 90 || latitude < -90 || longitude > 180 || longitude < -180 ) ? caution = true : caution = false;
        control.deselect();
    }

    function degreesToDmsString(degrees, lng, secondsPrecision) {
        if (isNaN(degrees)) return "-"
        var dms = Helper.degreesToDms(degrees, lng, secondsPrecision);
        return (dms.sign < 0 ? lng ? qsTr("W") : qsTr("S") : lng ? qsTr("E") : qsTr("N")) +
                Helper.pad(dms.deg, lng ? 3 : 2) + "," + Helper.pad(dms.min, 2) + "," +
                Helper.pad(dms.sec, 3 + secondsPrecision);
    }

    onActiveFocusChanged: textInputToCoord();

    Keys.onReturnPressed: textInputToCoord();

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0

        Button {
            id: typeButton
            text: typeText
            font.pixelSize: Theme.auxFontSize / 1.2
            color: (control.focus) ? ((!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)) : "transparent"
            hoverColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.highlight)
            highlightColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)
            textColor: {
                if (pressed) return Theme.colors.highlightedText;
                if (hovered) return Theme.colors.text;
                if (!control.enabled) return Theme.colors.disabled;
                if (control.caution) return Theme.colors.neutral;
                if (!control.isValid) return Theme.colors.negative;
                return Theme.colors.description;
            }
            implicitHeight: Theme.checkmarkSize
            padding: Theme.padding / 2
            flat: true
            focusPolicy: Qt.NoFocus
            visible: labelText.length > 0 ? background.inputed : true
            onClicked: {
                control.forceActiveFocus();
                textInputToCoord();
                dms = validatorInput() ? !dms : dms
            }
            Layout.topMargin: labelText.length > 0 && background.inputed ? (Theme.auxFontSize / 1.2 - Theme.border) : 0
            Layout.leftMargin: Theme.padding / 2
        }

    }

    Button {
        id: copyButton
        iconSource: "qrc:/icons/copy.svg"
        color: (control.focus) ? ((!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)) : "transparent"
        hoverColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.highlight)
        highlightColor: (!control.isValid) ? Theme.colors.negative : ((control.caution) ? Theme.colors.neutral : Theme.colors.selection)
        iconColor: {
            if (pressed) return Theme.colors.highlightedText;
            if (hovered) return Theme.colors.text;
            if (!enabled) return Theme.colors.disabled;
            if (!control.isValid) return Theme.colors.negative;
            if (control.caution) return Theme.colors.neutral;
            return Theme.colors.description;
        }
        flat: true
        width: Theme.baseSize
        height: control.enabled ? control.height - Theme.border : control.height
        anchors.right: parent.right

        leftCropped: control.table ? 0 : radius
        bottomCropped: control.table ? 0 : radius
        radius: control.table ? 0 : Theme.rounding

        onClicked: {
            control.forceActiveFocus();
            control.selectAll();
            control.copy();
            control.deselect();
        }
    }

    background: BackgroundInput {
        id: background
        hovered: control.hovered
        anchors.fill: parent
        labelLeftPadding: Theme.padding
        inputed: displayText.length > 0 || placeholderText.length > 0 || control.activeFocus
        highlighted: control.activeFocus
        clip: true
    }
}
