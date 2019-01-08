import QtQuick 2.6

Led {
    id: root

    property color blinkColor: industrial.highlightColor

    property alias interval: timer.interval

    function blink() { timer.start(); }

    color: timer.running ? blinkColor : industrial.backgroundColor
    glowRadius: timer.running ? root.width : industrial.shadowSize

    Timer {
        id: timer
        interval: industrial.animationTime
    }
}

