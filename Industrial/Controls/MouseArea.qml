import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

MouseArea {
    id: control

    property var savedEvent: null;

    signal onceClicked(var mouse)

    onClicked: {
        savedEvent = mouse;
        timer.start();
    }

    onDoubleClicked: {
        timer.stop();
        savedEvent = null;
    }

    Timer {
        id: timer
        interval: 250
        onTriggered: {
           if (savedEvent) {
               onceClicked(savedEvent);
               savedEvent = null;
           }
        }
    }
}
