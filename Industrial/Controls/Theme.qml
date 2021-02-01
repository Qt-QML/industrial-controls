pragma Singleton // We indicate that this QML Type is a singleton

import QtQuick 2.6

QtObject {
    id: root

    property bool night: true
    property real baseSize: 32
    property bool scrollInteractive: false
    property real animationTime: 200

    property ThemeColors dayColors: ThemeColors {
       background: "#eff0f0"
       sunken: "#dfe1e2"
       raised: "#fafafa"
       text: "#181a1b"
       description: "#627884"
       disabled: "#bbc1c4"

       control: "#c3cfd5"
       controlBorder: "#a3b8c2"
       line: "#80a3b8c2"
       controlText: "#181a1b"

       tip: "#00ad9f"
       tipText: "#ffffff"

       selection: "#00ad9f"
       selectedText: "#ffffff"

       highlight: "#0bd8c7"
       hover: "#330bd8c7"
       highlightedText: "#ffffff"

       link: "#51a0e7"
       negative: "#ee2c2c"
       neutral: "#ffbf00"
       positive: "#00c2b2"
    }

    property ThemeColors nightColors: ThemeColors {}
    property ThemeFactors factors: ThemeFactors {}

    readonly property ThemeColors colors: night ? nightColors : dayColors

    readonly property real rounding: baseSize * factors.rounding
    readonly property real underline: baseSize * factors.underline
    readonly property real shadowSize: baseSize * factors.shadow

    readonly property real mainFontSize: baseSize * factors.mainFontSize
    readonly property real auxFontSize: baseSize * factors.auxFontSize
    readonly property real spacing: baseSize * factors.spacing
    readonly property real margins: baseSize * factors.margins
    readonly property real padding: baseSize * factors.padding
    readonly property int  iconSize: baseSize * factors.iconSize
    readonly property real scrollSize: baseSize * factors.scrollSize
    readonly property real sliderSize: baseSize * factors.sliderSize
    readonly property real switchSize: baseSize * factors.switchSize
    readonly property real handleSize: baseSize * factors.handleSize
    readonly property real checkmarkSize: baseSize * factors.checkmarkSize
    readonly property real floatSize: baseSize * factors.floatSize
    readonly property real border: baseSize * factors.border
}
