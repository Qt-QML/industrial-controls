import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import "."

T.Label {
    id: control

    font.pixelSize: Industrial.mainFontSize
    color: control.enabled ? Industrial.colors.textRaised : Industrial.colors.disabled
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
}
