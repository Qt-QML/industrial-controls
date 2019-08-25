import QtQuick 2.0

Item {
    property color background: Qt.lighter(Qt.lighter(baseColor, lightness),backgroundFactor)
    property color sunken: Qt.lighter(Qt.lighter(baseColor, lightness),sunkenFactor)
    property color raised: Qt.lighter(Qt.lighter(baseColor, lightness),raisedFactor)
    property color disabled:Qt.lighter(Qt.lighter(baseColor, lightness),disabledFactor)
    property color control:Qt.lighter(Qt.lighter(baseColor, lightness),controlFactor)
    property color text: textBaseColor

    // temporary solution
    property color textSunken: textBaseColor
    property color textRaised: textBaseColor



    property color button: Qt.lighter(Qt.lighter(baseColor, lightness),buttonFactor)
    property color buttonText: Qt.lighter(textBaseColor, lightness + 0.4)

    property color tip: Qt.lighter(primaryColor, tipFactor)
    property color tipText: textBaseColor

    property color selection: Qt.lighter(primaryColor, selectionFactor)
    property color selectionText: textBaseColor

    property color highlight: Qt.lighter(primaryColor, highlightFactor)
    property color highlightText: textBaseColor

    property color link: "#51a0e7"
    property color positive: "#86c34a"
    property color neutral: "#ff9800"
    property color negative: "#e53535"
    property color shadow: "#80000000"




    property real lightness: themeConfigurator.lightness
    property color baseColor: themeConfigurator.baseColor
    property color textBaseColor: themeConfigurator.textBaseColor
    property color primaryColor: themeConfigurator.primaryColor
    property color textPrimaryColor: themeConfigurator.textPrimaryColor

    property real backgroundFactor: 0.6
    property real raisedFactor: 1
    property real sunkenFactor: 0.8
    property real buttonFactor: 1.4
    property real disabledFactor: 0.4

    property real tipFactor: 0.8
    property real selectionFactor: 1
    property real highlightFactor: 1.4
    property real controlFactor: 1.2

}
