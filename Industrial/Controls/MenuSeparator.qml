import QtQuick 2.6
import QtQuick.Templates 2.2 as T

T.MenuSeparator {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentItem.implicitHeight + topPadding + bottomPadding)
    //width: parent.width //

    padding: 0
    topPadding: Theme.padding
    bottomPadding: Theme.padding

    contentItem: Rectangle {
        implicitHeight: 1
        color: Theme.colors.line
    }
}
