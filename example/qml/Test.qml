import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0
import Industrial.Widgets 1.0

Pane {
    id: root

    padding: Theme.padding

    SplitView {
        anchors.fill: parent

        topItemDelegate: Pane {
            backgroundColor: Theme.colors.positive
        }


        bottomItemDelegate: Pane {
            backgroundColor: Theme.colors.negative
        }
    }
}
