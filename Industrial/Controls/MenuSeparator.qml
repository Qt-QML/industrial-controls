import QtQuick 2.12
import QtQuick.Templates 2.12 as T

T.MenuSeparator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 0
    verticalPadding: Theme.padding

    contentItem: Rectangle {
        implicitHeight: 1
        color: Theme.colors.line
    }
}
