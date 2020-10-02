import QtQuick 2.6
import QtQuick.Templates 2.2 as T
import QtQuick.Layouts 1.3

Row {
    id: row
    
    property bool setButtonWidth: true
    
    spacing: 1

    onVisibleChildrenChanged: {
        var buttons = [];
        var buttonsCnt = 0;

        for (var i = 0; i < visibleChildren.length; ++i) {
            var item = visibleChildren[i];

            if (item instanceof Button) {
                buttons.push(item);
                buttonsCnt++;
            }
        }

        for (var j = 0; j < buttonsCnt; ++j) {
            var button = buttons[j];

            if (row.setButtonWidth) {
                button.width = Qt.binding(function () { return row.width / buttonsCnt - 1; });
            }
            button.leftCropped = j > 0;
            button.rightCropped = j < buttonsCnt - 1;
        }
    }
}
