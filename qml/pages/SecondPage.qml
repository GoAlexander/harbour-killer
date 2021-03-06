import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: secondPage
    property string name
    property string surname
    property string imagePath //: "../images/avatarUnknown.png"
    //property bool flag: false //false -> not loading
    property string uniqueKey

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

        /*
        BusyIndicator {
                id: myBusyIndicator
                size: BusyIndicatorSize.Large
                anchors.centerIn: parent
                running: flag //model.status == Model.Loading
        }
        */


        Column {
            anchors.fill: parent
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Wanted")
            }

            Image {
                id: avatarSecondPage
                //По идее, картинка уже закеширована в FirstPage, поэтому траффик не будет жрать!
                source: imagePath
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent //TODO make hole bigger!!!
                width: 400 //parent.width
                height: 400 //sourceSize.height * width / sourceSize.width
            }

            Text {
                id: nameText
                width: parent.width
                horizontalAlignment: Text.Center
                color: Theme.highlightColor
                font.bold: false
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraLarge
                text: name
            }
            Text {
                id: surnameText
                width: parent.width
                horizontalAlignment: Text.Center
                color: Theme.highlightColor
                font.bold: false
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraLarge
                text: surname
            }

            //TODO make it more beautiful!!!
            Separator {
                //alignment: Qt.AlignHCenter
                width: parent.width
                horizontalAlignment: Text.Center
            }

            Text {
                id: keyText
                width: parent.width
                horizontalAlignment: Text.Center
                color: Theme.highlightColor
                font.bold: false
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraLarge
                text: "Your code:\n" + uniqueKey
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
                    pageStack.push(Qt.resolvedUrl("EnterCodePage.qml"), {"uniqueKey": uniqueKey})
                    /*
                    flag = true
                    //TODO -> checking
                    if(true) { //"убил"
                        //processing...
                        flag = false
                        //return to the FirstPage to find new victim
                        pageStack.replace(Qt.resolvedUrl("CongrPage.qml"))
                    }
                    else { //"промазал"
                        //processing...
                        flag = false
                        pageStack.push(Qt.resolvedUrl("LoserPage.qml"))
                    }
                    */
                }
            }
            //MenuLabel { text: qsTr("Informational label") }
        }

    }
}





