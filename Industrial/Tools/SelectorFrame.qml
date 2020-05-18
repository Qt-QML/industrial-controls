import QtQuick 2.6

import Industrial.Controls 1.0 as Controls

Item {
    id: frameItem

    property alias frameBorderSize: frame.border.width
    property alias frameBorderColor: frame.border.color
    property alias frameColor: frame.color
    property alias frameOpacity: frame.opacity

    signal release(int x, int y, int width, int height)

    MouseArea {
        id: area
        
        property int startX: 0
        property int startY: 0

        anchors.fill: parent
        propagateComposedEvents: true
        
        onPressed: {
            if (mouse.modifiers & Qt.ShiftModifier) {
                frame.width = 0
                frame.height = 0
                startX = mouse.x
                startY = mouse.y
                
                frame.visible = true
            } else {
                mouse.accepted = false
            }
        }

        onPositionChanged: {
            if (mouse.x - startX > 0) {
                frame.x = startX
                frame.width = mouse.x - startX
            } else {
                frame.x = mouse.x
                frame.width = startX - mouse.x
            }
            if (mouse.y - startY > 0) {
                frame.y = startY
                frame.height = mouse.y - startY
            } else {
                frame.y = mouse.y
                frame.height = startY - mouse.y
            }
        }

        onReleased: {
            if (mouse.modifiers & Qt.ShiftModifier)
                frameItem.release(frame.x, frame.y, frame.width, frame.height)
            frame.visible = false            
        }

        Rectangle {
            id: frame

            visible: false

            border.width: 1
            border.color: Controls.Theme.colors.highlight

            color: Controls.Theme.colors.selection
            opacity: 0.5
        }

    }
}
