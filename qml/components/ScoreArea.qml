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


import QtQuick 2.6
import Sailfish.Silica 1.0
import "../js/storage.js" as Storage

Row {

    property int currentBoardSize: 4

    function reset(boardSize)
    {
        if (boardSize == null)
            boardSize = currentBoardSize

        app.addlog("{"+boardSize+"}")
        storeHighscore()
        currentBoardSize = boardSize
        app.getCommunity(boardSize)
        scoreItem.value = 0
        bestItem.value = Storage.getHighscore(boardSize)
        app.scoreHigh = bestItem.value
    }

    function addScore(scoreToAdd)
    {
        scoreItem.value += scoreToAdd
        if(bestItem.value < scoreItem.value)
        {
            bestItem.value = scoreItem.value
            storeHighscore()
        }
        app.scoreItem = scoreItem.value
        if(app.scoreBest < scoreToAdd)
            app.scoreBest = scoreToAdd
    }

    function storeHighscore() {
        if (bestItem.value)
        {
            Storage.setHighscore(bestItem.value,currentBoardSize)
            app.scoreHigh = bestItem.value
        }
    }

    Component.onDestruction: storeHighscore()



    ScoreItem {
        id: scoreItem
        text: "SCORE"
        value: 0

        width: parent.width / 2
        height:250
    }

    ScoreItem {
        id: bestItem
        text: "BEST"
        value: 0

        width: parent.width / 2
        height:250
    }
}
