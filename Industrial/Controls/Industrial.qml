pragma Singleton // We indicate that this QML Type is a singleton

import QtQuick 2.0

Item {



    property real lightness: colors.lightness * 100
    onLightnessChanged: {
        colors.lightness = lightness / 100
    }
    property IndustrialColors colors: IndustrialColors{}




    property real rounding: 4
    property real baseSize: 32
    property real animationTime: 100
    property real underline: 2
    property real scrollSize: 2
    property real shadowSize: 3


    property real spacing:  baseSize / spacingFactor
    property real margins:  baseSize / marginsFactor
    property real padding:  baseSize / paddingFactor
    property real iconSize: baseSize / iconFactor
    property real fillSize: baseSize / fillFactor
    property real handleSize: baseSize / handleSizeFactor
    property real checkmarkSize: baseSize / checkmarkFactor
    property real floatSize: baseSize / floatFactor
    property real mainFontSize: baseSize / mainFontFactor
    property real auxFontSize: baseSize / auxFontFactor


    property real mainFontFactor:2.0
    property real auxFontFactor:2.5
    property real spacingFactor:4.0
    property real marginsFactor:4.0
    property real paddingFactor:6.0
    property real iconFactor:1.75
    property real fillFactor:8.0
    property real handleSizeFactor:1.5
    property real checkmarkFactor:1.5
    property real floatFactor:0.75
}
