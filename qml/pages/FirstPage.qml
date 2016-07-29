/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: dialogFirstPage
    property string name: "TEST_NAME"
    property string surname: "TEST_SURNAME"

    function getNewVictim() {
        //TODO Write code here!
    }

    onAccepted: {
        console.log("accepted")
        pageStack.push(Qt.resolvedUrl("SecondPage.qml"), {}, PageStackAction.Animated)
    }
    onRejected: {
        console.log("declined")

        //TODO:
        //здесь произвожу расчеты!!!
        //и новые данные в параметрах передаю
        //только лучше QThread + .update(), т к он перейдет на новую страницу!!!
        //короче, здесь не все так тривиально!
        pageStack.push(Qt.resolvedUrl("FirstPage.qml"), {}, PageStackAction.Immediate)
        //Find new Victim
//        getNewVictim()

        //Update all resources:
//        dialogFirstPage.update()

        //or a bit different :)
        //avatar.update()
        //nameText.update()
        //surnameText.update()
    }

    Column {
        anchors.fill: parent

        //TODO another names of Header!
        DialogHeader {
            acceptText: "Accept"
            //TODO: remake or do it as in calling dialog (green/red)
            cancelText: "Cancel" //interesting bug!!!
        }

        Text {
            id: victimText
            width: parent.width
            horizontalAlignment: Text.Center
            color: Theme.highlightColor
            font.bold: true
            wrapMode: Text.Wrap
            font.pixelSize: Theme.fontSizeExtraLarge
            text: "Choose new victim:"
        }

        Image {
            id: avatar
            source: "../images/avatarUnknown.png"
            anchors.horizontalCenter: parent.horizontalCenter
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

    }

    //onDone: if (result == DialogResult.Accepted) name = nameField.text
}

/*
Page {
    id: page



    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("UI Template")
            }
            Label {
                x: Theme.paddingLarge
                text: qsTr("Hello Sailors")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }
    }

}
*/
