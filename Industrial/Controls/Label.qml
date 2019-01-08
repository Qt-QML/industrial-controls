import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Label {
    id: control

    font.pixelSize: industrial.mainFontSize
    color: control.enabled ? industrial.onSurfaceColor : industrial.disabledColor
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
}
