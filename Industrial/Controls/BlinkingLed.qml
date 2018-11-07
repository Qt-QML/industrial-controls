import QtQuick 2.6

Led {
    id: root

    property color blinkColor: Theme.highlightColor

    property alias interval: timer.interval

    function blink() { timer.start(); }

    color: timer.running ? blinkColor : Theme.backgroundColor

    Timer {
        id: timer
        interval: 100
    }
}

