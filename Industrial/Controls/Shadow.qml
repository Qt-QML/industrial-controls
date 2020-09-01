import QtQuick 2.6
import QtGraphicalEffects 1.0

RectangularGlow {
    id: shadow

    property Item source

    glowRadius: Theme.shadowSize
    spread: 0.2
    //color: "#77000000"
    color: "#000000"
    opacity: 0.40
    cornerRadius: (source.radius ? source.radius : 0) + glowRadius
    anchors.centerIn: source
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    width: source.width
    height: source.height
    z: -1
}
