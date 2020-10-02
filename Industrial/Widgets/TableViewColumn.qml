import QtQuick 2.6
import Industrial.Controls 1.0 as Controls

Item {
    readonly property bool isColumnHeader: true

    property string title
    //property int width

    property int minimumWidth: Controls.Theme.baseSize * 2
    property int maximumWidth: 100000

    property int role
    property Component delegate
}
