import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.fill: parent
        width: page.width
        spacing: Theme.paddingLarge

        PageHeader {
            title: qsTr("Shoot status")
        }

        Text {
            id: myText
            width: parent.width
            horizontalAlignment: Text.Center
            verticalAlignment: Text.Center
            color: Theme.highlightColor
            font.bold: false
            wrapMode: Text.Wrap
            font.pixelSize: Theme.fontSizeExtraLarge
            text: "Congratulations!\nYou killed your victim!"
        }
    }
}

