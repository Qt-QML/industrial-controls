import QtQuick 2.6

Led {
    id: root

    property color blinkColor: customPalette.highlightColor

    property alias interval: timer.interval

    function blink() { timer.start(); }

    color: timer.running ? blinkColor : customPalette.sunkenColor

    Timer {
        id: timer
        interval: 100
    }
}

