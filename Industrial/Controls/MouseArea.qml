import QtQuick 2.6

MouseArea {
    id: control
    
    property int maxDoubleClickInterval: 250
    property var _savedEvent: null

    signal onceClicked(var mouse)

    onClicked: {
        _savedEvent = mouse;
        timer.start();
    }

    onDoubleClicked: {
        timer.stop();
        _savedEvent = null;
    }

    Timer {
        id: timer
        interval: control.maxDoubleClickInterval
        onTriggered: {
           if (_savedEvent) {
               onceClicked(_savedEvent);
               _savedEvent = null;
           }
        }
    }
}
