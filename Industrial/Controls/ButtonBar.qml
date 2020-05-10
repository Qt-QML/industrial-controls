import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

Row {
    id: row
    spacing: 1

    onVisibleChildrenChanged: {
        for (var i = 0; i < visibleChildren.length; ++i) {
            var item = visibleChildren[i];

            item.width = Qt.binding(function () { return row.width / visibleChildren.length - 1; })
            item.leftCropped = i > 0;
            item.rightCropped = i < visibleChildren.length - 1;
        }
    }
}
