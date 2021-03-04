import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Item {
    id: root

    readonly property int noSelection: 0
    readonly property int singleSelection: 1
    readonly property int extendedSelection: 2

    property int selectionMode: noSelection
    property int selectionSaveRole: 0

    property int currentSortRole: 0
    property int currentSortOrder: Qt.AscendingOrder

    property int headerSize: Controls.Theme.baseSize - Controls.Theme.padding

    property Component headerColumnDelegate: defaultHeaderColumn
    property Component rowDelegate: defaultRow

    property alias list: list
    property alias model: list.model
    property int count: list.count

    property QtObject selection: QtObject {
        property int count: _indices.length

        property var _indices: []
        property var _oldSelection: null

        function clear() {
            root._lastIndex = -1;
            _indices = [];
            selectionChanged();
        }

        function forEach(callback) {
            _indices.forEach(callback);
        }

        function save(getCallback) {
            if (!getCallback) {
                getCallback = function(row) {
                    return model.data(model.index(row, 0), selectionSaveRole);
                }
            }
            _oldSelection = [];
            forEach( function(i) {
                _oldSelection.push(getCallback(i));
            });
            clear();
        }

        function restore(compareCallback) {
            if (!compareCallback) {
                compareCallback = function(row, oldData) {
                    return model.data(model.index(row, 0), selectionSaveRole) === oldData;
                }
            }
            var rowCount = root.count;
            _indices = [];
            for (var i = 0; i < _oldSelection.length; ++i) {
                for (var row = 0; row < rowCount; ++row) {
                    if (compareCallback(row, _oldSelection[i])) {
                        _indices.push(row);
                        break;
                    }
                }
            }
            _oldSelection = null;
            selectionChanged();
        }

        function contains(index) {
            return _indices.indexOf(index) !== -1;
        }

        function select(indexFirst, indexLast) {
            _select(indexFirst, indexLast, true);
        }

        function deselect(indexFirst, indexLast) {
            _select(indexFirst, indexLast, false);
        }

        function _select(indexFirst, indexLast, doSelect) {
            if (root.selectionMode === singleSelection) {
                if (doSelect) {
                    _indices = [indexFirst];
                }
                else {
                    _indices = [];
                }
                return;
            }

            if (indexLast === undefined) {
                indexLast = indexFirst;
            }
            var i0 = Math.max(0, Math.min(indexFirst, indexLast));
            var i1 = Math.min(root.count - 1, Math.max(indexFirst, indexLast));
            for (var i = i0; i <= i1; ++i) {
                var curIndex = _indices.indexOf(i);
                if (doSelect) {
                    if (curIndex === -1) {
                        _indices.push(i);
                    }
                }
                else {
                    if (curIndex !== -1) {
                        _indices.splice(curIndex, 1);
                    }
                }
            }
            selectionChanged();
        }
    }

    property var _columnModel: []
    property int _lastIndex: -1
    property int _viewPos: 0

    signal clicked(int index)
    signal doubleClicked(int index)
    signal pressAndHold(int index)

    onChildrenChanged: {
        var newColumns = [];
        for (var i = 0; i < children.length; ++i) {
            var obj = children[i];
            if (obj.isColumnHeader === true) {
                newColumns.push(obj);
            }
        }
        _columnModel = newColumns;

        if (currentSortRole == 0) {
            currentSortRole = _columnModel[0].role;
        }
        if (selectionSaveRole == 0) {
            selectionSaveRole = _columnModel[0].role;
        }
    }

    onModelChanged: {
        model.modelReset.connect( function() {selection.clear();} );
        model.rowsAboutToBeRemoved.connect( function() {
            _viewPos = list.list.indexAt(0, list.contentY);
            selection.save();
        });
        model.rowsInserted.connect( function() {
            list.list.positionViewAtIndex(_viewPos, ListView.Beginning);
            selection.restore();
        });
    }

    ListWrapper {
        id: list
        anchors.fill: parent
        delegate: rowDelegate

        header: Item {
            width: root.width
            height: root.headerSize
            z: 2

            Row {
                Repeater {
                    model: root._columnModel
                    delegate: headerColumnDelegate
                }
            }

            ListFader {
                y: parent.height
                z: 0
                width: root.width
                visible: parent.y > y

                Binding on faderColor {
                    when: list.faderColor !== undefined
                    value: list.faderColor
                }
            }

            Rectangle {
                width: root.width
                height: Controls.Theme.border
                anchors.top: parent.bottom

                color: Controls.Theme.colors.control
                opacity: 0.5
            }
        }

        Controls.MouseArea {
            y: root.headerSize
            width: parent.width
            height: parent.height - y

            hoverEnabled: true
            scrollGestureEnabled: false

            function itemIndex() {
                return list.list.indexAt(0, y + mouseY + list.list.contentY);
            }

            onClicked: {
                var index = itemIndex();
                if (index !== -1) {
                    if (root.selectionMode !== root.noSelection) {
                        if (!root.selection.contains(index)) {
                            root.selection.select(index);
                        }
                        else {
                            root.selection.deselect(index);
                        }
                        _lastIndex = index;
                    }
                    root.clicked(index);
                }
            }

            onDoubleClicked: {
                var index = itemIndex();
                if (index !== -1) {
                    root.doubleClicked(index);
                    _lastIndex = -1;
                }
            }

            onPressAndHold: {
                var index = itemIndex();
                if (index !== -1) {
                    if (root.selectionMode !== root.noSelection) {
                        root.selection.select(index, _lastIndex);
                        _lastIndex = -1;
                    }
                    root.pressAndHold(index);
                }
            }
        }
    }

    Component {
        id: defaultHeaderColumn

        Rectangle {
            id: innerHeader
            width: modelData.width
            height: root.headerSize
            color: Controls.Theme.colors.raised

            Item {
                anchors.fill: parent

                Controls.Label {
                    id: sortLabel

                    text: modelData.title
                    color: Controls.Theme.colors.description
                    font.pixelSize: Controls.Theme.auxFontSize

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.margins: Controls.Theme.auxFontSize * Controls.Theme.factors.margins
                }

                Controls.ColoredIcon {
                    width: height
                    height: parent.height
                    visible: root.currentSortRole === modelData.role

                    source: root.currentSortOrder === Qt.DescendingOrder ?
                                "qrc:/icons/up" : "qrc:/icons/down"
                    color: Controls.Theme.colors.description

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: sortLabel.right
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (root.currentSortRole === modelData.role) {
                            root.currentSortOrder = !root.currentSortOrder;
                        }
                        else {
                            root.currentSortRole = modelData.role;
                            root.currentSortOrder = false;
                        }
                    }
                }
            }

            Rectangle {
                id: headerHandle

                x: parent.width - width
                anchors.verticalCenter: parent.verticalCenter

                width: Controls.Theme.border
                height: parent.height / 2

                color: Controls.Theme.colors.control
                opacity: 0.5
            }

            MouseArea {
                anchors.right: parent.right

                width: Controls.Theme.sliderSize * 2
                height: parent.height

                cursorShape: Qt.SplitHCursor
                hoverEnabled: true

                drag.axis: Drag.XAxis
                drag.target: headerHandle
                drag.threshold: 0
                drag.minimumX: modelData.minimumWidth
                drag.maximumX: {
                    var minWidths = 0;
                    for (var i = index; i < root._columnModel.length; ++i) {
                        minWidths += root._columnModel[i].minimumWidth;
                    }
                    return root.width - (innerHeader.x + minWidths);
                }

                onPositionChanged: {
                    if (pressed) {
                        root._columnModel[index].width = headerHandle.x + headerHandle.width;

                        var totalWidth = 0;
                        for (var i = 0; i < root._columnModel.length; ++i) {
                            totalWidth += root._columnModel[i].width;
                        }

                        var extWidth = totalWidth - root.width;
                        for (var j = index + 1; j < root._columnModel.length; ++j) {
                            if (extWidth <= 0)
                                break;

                            var obj = root._columnModel[j];
                            var newWidth = Math.max(obj.minimumWidth, obj.width - extWidth);

                            extWidth -= obj.width - newWidth;
                            obj.width = newWidth;
                        }
                    }
                }
            }
        }
    }

    Component {
        id: defaultRow

        Rectangle {
            width: root.width
            height: Controls.Theme.baseSize

            color: root.selection.contains(index) ?
                       Controls.Theme.colors.hover : Controls.Theme.colors.raised;

            Row {
                Item {
                    width: Controls.Theme.margins
                    height: Controls.Theme.baseSize
                }

                Repeater {
                    id: rowRepeater

                    readonly property int rowIndex: index

                    model: root._columnModel
                    delegate: Loader {
                        sourceComponent: rowRepeater.rowIndex === -1 ?
                                             undefined : modelData.delegate

                        property QtObject styleData: QtObject {
                            readonly property int row: rowRepeater.rowIndex
                            readonly property int column: index
                            readonly property int width: modelData.width
                            readonly property bool selected: root.selection.contains(row)
                            readonly property var value: {
                                var modelIndex = root.model.index(row, 0);
                                root.model.data(modelIndex, modelData.role);
                            }
                        }
                    }
                }
            }
        }
    }
}
