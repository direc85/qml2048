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
import "../js/board.js" as Board

Rectangle {
    id: container

    property int start_count: 2

    property int grid_size: 4
    property int max_index: grid_size * grid_size

    property real grid_spacing: 4
    property real cell_size: (width - grid_spacing * (grid_size + 1)) / grid_size

    property bool listenActions: false

    signal merged(int value)
    signal end()

    function newGame(size) {
        if (size == null)
            size = grid_size
        app.scoreMode = size
        Board.newGame(size)
    }

    function moveTilesUp() {
        if (listenActions) {
            listenActions = false
            Board.moveTilesUp()
        }
    }

    function moveTilesDown() {
        if (listenActions) {
            listenActions = false
            Board.moveTilesDown()
        }
    }

    function moveTilesLeft() {
        if (listenActions) {
            listenActions = false
            Board.moveTilesLeft()
        }
    }

    function moveTilesRight() {
        if (listenActions) {
            listenActions = false
            Board.moveTilesRight()
        }
    }

    color: "#bbada0"
    radius: 6
    height: width
}
