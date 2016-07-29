import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    property bool flag: false //false -> not loading
    property string uniqueKey

    //TODO: not necessary???
    BusyIndicator {
            id: myBusyIndicator
            size: BusyIndicatorSize.Large
            anchors.centerIn: parent
            running: flag
    }

    Column {
        anchors.fill: parent

        PageHeader { title: qsTr("Kill the victim")}

        TextField {
            id: myTextField
            placeholderText: qsTr("Enter unique code of victim")
            label: qsTr("Enter unique code of victim")
            width: parent.width
            //enter активен только когда в textField что-то есть:
            EnterKey.enabled: text.length > 0
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            //Переопределение действия после нажатия enter
            EnterKey.onClicked: {
                console.log("Text entered")

                flag = true
                if( myTextField.text == uniqueKey) { //"убил"
                    flag = false
                    //return to the FirstPage to find new victim
                    pageStack.replace(Qt.resolvedUrl("CongrPage.qml"))
                }
                else { //"промазал"
                    flag = false
                    pageStack.push(Qt.resolvedUrl("LoserPage.qml"))
                }
            }

            //Активирует клавиатуру с цифрами(!)
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }
    }
}
