/**
 * qml2048, 2048 Game
 *
 * Copyright (C) 2014 Fabien Proriol
 *
 * This file is part of qml2048.
 *
 * qml2048 is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * qml2048 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU General Public License for more details. You should have received a copy of the GNU
 * General Public License along with CarBudget. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Fabien Proriol
 */


import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        id: gameArea

        Text {
            y:10
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: app.scoreName
            font.pixelSize: 30
            font.bold: true
            color: "#ffffff"
        }

        ScoreArea {
            id: score
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 10
            height: 240
            y: 20
        }

        Text {
            y:265
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Community highscore: " + app.communityScore + " (best tile " + app.communityTile + ")"
            font.pixelSize: 20
            font.bold: true
            color: "#ffffff"
            visible: app.communityScore > 100
        }

        PullDownMenu {
            MenuItem {
                text: qsTr("Settings")
                onClicked: settingsPage.open()
            }

            MenuItem {
                text: qsTr("New game")
                onClicked: newgame.open()
            }

            MenuItem {
                text: qsTr("About")
                onClicked: about.open()
            }
        }


        Board {
            id: board
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 90
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 10

            onMerged: score.addScore(value, grid_size)
            onEnd: {
                loseScreen.show()
                if(app.scoreMode <= 2 && app.scoreBest >= 32) app.sendscore()
                else if(app.scoreMode <= 3 && app.scoreBest >= 128) app.sendscore()
                else if(app.scoreBest >= 2^(app.scoreMode + 7)) app.sendscore()
            }

            SwipeArea {
                id: swipe
                anchors.fill: parent

                onSwipeUp: board.moveTilesUp()
                onSwipeDown: board.moveTilesDown()
                onSwipeLeft: board.moveTilesLeft()
                onSwipeRight: board.moveTilesRight()
            }
        }
    }

    Dialog {
        id: newgame

        DialogHeader {
            title: qsTr("Create a new game")
        }

        Slider {
            anchors.centerIn: parent
            id: slider
            label: qsTr("Grid size")
            minimumValue: 2
            maximumValue: 10
            value: 4
            stepSize: 1
            valueText: value
            width: parent.width
        }

        onAccepted: {
            mainPage.newGameRequest(slider.value)
        }
    }

    About {
        id: about
        version: "v.0.4.0"
        height: parent.height
        width: parent.width
    }

    LosePage {
        id: loseScreen
        width: gameArea.width
        height: gameArea.height
        y: - height
        color: "#80000000"

        onNewGameClicked: {
            hide()
            newGameRequest()
        }
    }

    SettingsPage {
        id: settingsPage
    }

    function newGameRequest(size) {
        app.resetlog()
        score.reset(size)
        board.newGame(size)
    }

    function firstStart()
    {
        settingsPage.open()
    }
}
