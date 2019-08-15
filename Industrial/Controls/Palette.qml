pragma Singleton // We indicate that this QML Type is a singleton

import QtQuick 2.0

Item {
    readonly property color background: "aliceblue"
    readonly property color sunken: "antiquewhite"
    readonly property color raised: "aqua"
    readonly property color text: "azure"
    readonly property color link: "bisque"

    readonly property color button: "black"
    readonly property color buttonText: "blanchedalmond"

    readonly property color tip: "blue"
    readonly property color tipText: "blueviolet"

    readonly property color selection: "brown"
    readonly property color selectionText: "burlywood"

    readonly property color highlight: "coral"
    readonly property color highlightText: "cornflowerblue"

    readonly property color positive: "green"
    readonly property color neutral: "orange"
    readonly property color negative: "red"

    readonly property color shadow: "dimgrey"
}
