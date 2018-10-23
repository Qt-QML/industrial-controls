import QtQuick 2.6
import QtQuick.Controls 2.2 as Controls
import Industrial 1.0

Controls.ApplicationWindow {
    id: window

    property Theme theme: Theme {}

    color: theme.backgroundColor
}
