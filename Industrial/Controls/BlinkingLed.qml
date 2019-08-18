import QtQuick 2.6

Led {
    id: root

    property color blinkColor: Industrial.colors.highlight

    property alias interval: timer.interval

    function blink() { timer.start(); }

    color: timer.running ? blinkColor : industrial.colors.background
    glowRadius: timer.running ? root.width : Industrial.shadowSize

    Timer {
        id: timer
        interval: Industrial.animationTime
    }
}

