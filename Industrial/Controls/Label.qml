import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Label {
    id: control

    font.pixelSize: theme.mainFontSize
    color: control.enabled ? theme.onSurfaceColor : theme.disabledColor
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
}
