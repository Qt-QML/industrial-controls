import QtQuick 2.6
import QtQuick.Layouts 1.3
import Industrial.Controls 1.0

ColumnLayout {
    id: root

    spacing: 0

    TabBar {
        id: tabBar
        Layout.fillWidth: true
        Layout.rightMargin: controlSize.baseSize + controlSize.padding

        TabButton { text: "Buttons"; flat: true }
        TabButton { text: "Inputs"; flat: true }
        TabButton { text: "Sliders & Checkers"; flat: true }
    }

    Pane {
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
}
/*
Frame {
    id: root

}

ColumnLayout {
    id: mainColumn
    spacing: controlSize.spacing

    TabBar {
        id: tabBar
        Layout.fillWidth: true

        TabButton { text: "Controls"; flat: true }
        TabButton { text: "Indicators"; flat: true }
    }

    StackLayout {
        currentIndex: tabBar.currentIndex
        Layout.fillWidth: true
        Layout.fillHeight: true

        Controls { }
        Indicators { }
    }
}


Frame {
    id: root

    GridLayout {
        anchors.fill: parent
        rowSpacing: controlSize.spacing
        columnSpacing: controlSize.spacing
        columns: 4

        Label {
            text: "Buttons"
            Layout.alignment: Qt.AlignHCenter
            Layout.columnSpan: 4
        }

        Button {
            text: "Text button"
            enabled: !checkButton.checked
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/up.svg"
            tipText: "Icon button"
        }

        Button {
            text: "Flat text Button"
            flat: true
            highlighted: checkButton.checked
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/up.svg"
            tipText: "Flat icon button"
            flat: true
        }

        Button {
            id: checkButton
            text: "Checkable button"
            checkable: true
            Layout.fillWidth: true
        }

        Button {
            iconSource: "qrc:/ui/up.svg"
            tipText: "Flat checkable icon button"
            flat: true
            checkable: true
        }

        DelayButton {
            text: "Delay button"
            checkable: true
        }

        DelayButton {
            iconSource: "qrc:/ui/down.svg"
            tipText: "Flat delay icon button"
            flat: true
            checkable: true
        }

        Label {
            text: "Checks"
            Layout.alignment: Qt.AlignHCenter
            Layout.columnSpan: 4
        }

        CheckBox {
            id: checkBox
            text: "Checkbox"
            Layout.fillWidth: true
        }

        CheckBox { enabled: checkBox.checked }

        RadioButton {
            text: "Radio button"
            Layout.fillWidth: true
        }

        RadioButton { enabled: checkBox.checked }

        Label {
            text: "Combos"
            Layout.alignment: Qt.AlignHCenter
            Layout.columnSpan: 4
        }

        ComboBox {
            model: Qt.fontFamilies()
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        ComboBox {
            model: [
                { text: "Up", icon: "qrc:/ui/up.svg" },
                { text: "Down", icon: "qrc:/ui/down.svg" }
            ]
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        Label {
            text: "Inputs"
            Layout.alignment: Qt.AlignHCenter
            Layout.columnSpan: 4
        }

        TextField {
            labelText: "Text edit"
            text: "Edit me"
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        FilterField {
            labelText: "Filter me"
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        SpinBox {
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        RealSpinBox {
            Layout.columnSpan: 2
            Layout.fillWidth: true
        }

        Item { Layout.fillHeight: true }
    }
}*/
