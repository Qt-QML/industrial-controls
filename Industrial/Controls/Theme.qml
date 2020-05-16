pragma Singleton // We indicate that this QML Type is a singleton

import QtQuick 2.0

Item {
    id: root

    property ThemeColors colors: ThemeColors {}

    property real rounding: 4

    property real baseSize: 32

    property real animationTime: 200
    property real underline: 2
    property real scrollSize: 2
    property real shadowSize: 3
    property bool scrollInteractive: false

    property real spacing: 8
    property real margins: 8
    property real padding: 6
    property real iconSize: 18
    property real sliderSize: 4
    property real switchSize: 8
    property real handleSize: 21
    property real checkmarkSize: 21
    property real floatSize: 42
    property real mainFontSize: 16
    property real auxFontSize: 12
}
