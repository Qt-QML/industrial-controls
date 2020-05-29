pragma Singleton // We indicate that this QML Type is a singleton

import QtQuick 2.6

Item {
    id: root

    property bool night: true

    readonly property ThemeColors colors: night ? nightColors : dayColors

    property ThemeColors dayColors: ThemeColors {
       background: "#eff0f1"
       sunken: "#e7e8e8"
       raised: "#f6f7f7"
       text: "#000000"
       hover: "#1600ddc7"
       border: "#2c393f"

       disabled: "#161c20"

       control: "#e7e8e8"
       controlText: "#000000"
       tip: "#63e6d9"
       tipText: "#000000"

       selection: "#33c5b4"
       selectedText: "#000000"

       highlight: "#3eecd8"
       highlightedText: "#000000"
    }

    property ThemeColors nightColors: ThemeColors {}
    property ThemeFactors factors: ThemeFactors {}

    property real baseSize: 32

    property real rounding: 4
    property real underline: 2
    property real shadowSize: 3
    property bool scrollInteractive: false

    property real animationTime: 200

    readonly property real mainFontSize: baseSize / factors.mainFontSize
    readonly property real auxFontSize: baseSize / factors.auxFontSize
    readonly property real spacing: baseSize / factors.spacing
    readonly property real margins: baseSize / factors.margins
    readonly property real padding: baseSize / factors.padding
    readonly property real iconSize: baseSize / factors.iconSize
    readonly property real scrollSize: baseSize / factors.scrollSize
    readonly property real sliderSize: baseSize / factors.sliderSize
    readonly property real switchSize: baseSize / factors.switchSize
    readonly property real handleSize: baseSize / factors.handleSize
    readonly property real checkmarkSize: baseSize / factors.checkmarkSize
    readonly property real floatSize: baseSize / factors.floatSize
}
