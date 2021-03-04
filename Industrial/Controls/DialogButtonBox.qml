import QtQuick 2.6
import QtQuick.Controls 2.2 as T

T.DialogButtonBox {
    id: box

    spacing: Theme.spacing
    padding: Theme.padding

    background: Rectangle {
        color: backgroundColor
    }

    delegate: Button {
        width: (box.width - box.padding * 2 - Theme.spacing) / box.count
    }
}

