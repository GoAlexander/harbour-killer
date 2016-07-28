import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: secondPage
    property string name: "TEST_NAME"
    property string surname: "TEST_SURNAME"

    SilicaFlickable {
        //header: PageHeader { title: qsTr("Wanted") }
        anchors.fill: parent
        //contentHeight: applicationWindow.height

        PullDownMenu {
            //Разукрашиваем :)
            backgroundColor: "green"
            highlightColor: backgroundColor
            //При свайпе сразу будет выбираться option (как при звонке!)
            quickSelect: true

            MenuItem {
                text: "Open map"
                onClicked: {
                    console.log(qsTr("Option <Open map> clicked"))
                    pageStack.push(Qt.resolvedUrl("MapPage.qml"))
                }
            }
            //MenuLabel { text: qsTr("Informational label") }
        }
        contentHeight: column.height


        Column {
            anchors.fill: parent
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Wanted")
            }

            Image {
                id: avatarSecondPage
                source: "../images/avatarUnknown.png"
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent //TODO make hole bigger!!!
                width: 400 //parent.width
                height: 400 //sourceSize.height * width / sourceSize.width
            }

            Text {
                id: nameText
                width: parent.width
                horizontalAlignment: Text.Center
                color: Theme.secondaryColor
                font.bold: true
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraLarge
                text: name
            }
            Text {
                id: surnameText
                width: parent.width
                horizontalAlignment: Text.Center
                color: Theme.secondaryColor
                font.bold: true
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraLarge
                text: surname
            }
        }

        PushUpMenu {
            backgroundColor: "red"
            highlightColor: backgroundColor
            quickSelect: true

            MenuItem {
                text: "Kill!"
                onClicked: {
                    console.log(qsTr("Option <Kill!> clicked"))
                }
            }
            //MenuLabel { text: qsTr("Informational label") }
        }

    }
}





