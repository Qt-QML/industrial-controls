import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.Label {
    id: control

    font.pixelSize: controlSize.fontSize
    color: control.enabled ? customPalette.textColor : customPalette.sunkenColor
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
}
