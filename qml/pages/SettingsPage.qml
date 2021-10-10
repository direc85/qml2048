import QtQuick 2.6
import Sailfish.Silica 1.0

Dialog {
    id: settings

    SilicaFlickable {
        VerticalScrollDecorator {}

        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge


            DialogHeader {
                title: qsTr("Settings")
            }


            TextField {
                id: inputname
                anchors { left: parent.left; right: parent.right; }
                label: qsTr("Your name for highscore")
                placeholderText: qsTr("Your name for highscore")
            }
            TextSwitch {
                id: sharedinput
                text: qsTr("Share score")
                description: qsTr("Send your highscore if you have more than 2048 tile")
                visible: inputname.text !== ""
                // Disable, because the service doesn't exist
                enabled: false
            }
        }
    }

    onOpened: {
        inputname.text = app.scoreName
        sharedinput.checked = false //app.shareMode
    }

    onAccepted: {
        app.setName(inputname.text)
        app.setShared(sharedinput.checked)
        mainPage.newGameRequest()
    }
    onCanceled: {
        board.focus = true
        settings.close()
    }
}
