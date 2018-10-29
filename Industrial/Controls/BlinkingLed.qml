import QtQuick 2.6

Led {
    id: root

    property color blinkColor: theme.highlightColor

    property alias interval: timer.interval

    function blink() { timer.start(); }

    color: timer.running ? blinkColor : theme.backgroundColor

    Timer {
        id: timer
        interval: 100
    }
}

