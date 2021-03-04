import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Industrial.Controls 1.0

Calendar{
    id: control
    property bool navigationBarVisible: true
    property bool weekNumbersVisible: false
    property bool round: true

    style: CalendarStyle {
        gridColor: "transparent"
        gridVisible: false

        background: Rectangle {
            id: backgroundRect
            color: "transparent"
            implicitHeight: Theme.baseSize * 8
            implicitWidth: Theme.baseSize * 8
            radius: round ? Theme.rounding : 0
        }

        navigationBar: Rectangle {
            height: Theme.baseSize
            color: Theme.colors.raised
            radius: round ? Theme.rounding : 0
            anchors.bottomMargin: -radius

            Rectangle {
                color: Theme.colors.line
                height: 1
                width: parent.width
                anchors.bottom: parent.bottom
            }

            Label {
                id: dateText
                text: styleData.title
                color:  Theme.colors.text
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: Theme.mainFontSize
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: previousMonth
                width: parent.height
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                round: true
                color: "transparent"
                iconSource: "qrc:/icons/left.svg"
                onClicked: control.showPreviousMonth()
            }

            Button {
                id: nextMonth
                width: parent.height
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                round: true
                color: "transparent"
                iconSource: "qrc:/icons/right.svg"
                onClicked: control.showNextMonth()
            }
        }

        dayOfWeekDelegate: Rectangle {
            height: Theme.baseSize * 0.75
            color: Theme.colors.raised

            Label {
                text: control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                anchors.centerIn: parent
                color: Theme.colors.description
                font.pixelSize: Theme.auxFontSize
            }
        }

        dayDelegate: Rectangle {
            width: height
            radius: height / 2
            color: styleData.selected ? Theme.colors.selection : (styleData.hovered ? Theme.colors.hover : "transparent");

            Label {
                text: styleData.date.getDate()
                font.pixelSize: Theme.mainFontSize
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: styleData.visibleMonth && styleData.valid || styleData.hovered ?
                           (styleData.selected ? Theme.colors.selectedText : Theme.colors.text) : (styleData.selected ? Theme.colors.selectedText : Theme.colors.description)
            }
        }

        weekNumberDelegate: Rectangle {
            width: Theme.baseSize
            color: "transparent"

            Label {
                text:  styleData.weekNumber
                anchors.centerIn: parent
                color: Theme.colors.description
                font.pixelSize: Theme.auxFontSize
            }
        }
    }
}
