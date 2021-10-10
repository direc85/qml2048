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
import "tile.js" as Tile
import "storage.js" as Storage

Rectangle {

    id: cell

    property int value
    // position for move
    property variant new_x: null
    property variant new_y: null
    // if tile merged with some other
    property bool merged: false
    // tile which merged with this (used for kill animation)
    property variant merged_cell
    // signal for board
    property bool emitMoved: false
    signal moved

    radius: 3
    width: 0
    height: 0
    color: "#00000000"

    function show(pos,size) {
        x = pos.x
        y = pos.y
        width = size
        height = size
        Tile.show()
    }

    function move() {
        Tile.move()
    }

    function kill() {
        kill_scale.duration = Storage.animation_speed
        kill_opac.duration = Storage.animation_speed
        kill_anim.start()
    }

    PropertyAnimation {
        id: show_anim
        target: labelContainer
        properties: "width,height"
        duration: 200
        from: 0
        easing.type: Easing.OutBack
        onRunningChanged: {
            if (!running) { // animation completed
                label.text = value
                Tile.updateTextSize()
            }
        }
    }

    PropertyAnimation {
        id: move_anim_x
        target: cell
        properties: "x"
        duration: 200
        onRunningChanged: {
            if (!running) { // animation completed
                label.text = value
                if (merged_cell) {
                    merged_cell.kill()
                    merged_cell = null
                }
                if (emitMoved) {
                    emitMoved = false
                    moved()
                }
            }
        }
    }

    PropertyAnimation {
        id: move_anim_y
        target: cell
        properties: "y"
        duration: 200
        onRunningChanged: {
            if (!running) { // animation completed
                label.text = value
                if (merged_cell) {
                    merged_cell.kill()
                    merged_cell = null
                }
                if (emitMoved) {
                    emitMoved = false
                    moved()
                }
            }
        }
    }

    ParallelAnimation {
        id: kill_anim
        PropertyAnimation { id: kill_scale; target: cell; property: "scale";   duration: 200; from: 1; to: 2; }
        PropertyAnimation { id: kill_opac; target: cell; property: "opacity"; duration: 200; from: 1; to: 0; }
        onRunningChanged: {
            if (!running) { // animation completed
                cell.destroy()
            }
        }

    }

    Rectangle {
        id: labelContainer

        // cell center point (used for show animation)
        property int center_x
        property int center_y

        // keep container center at tile center
        onWidthChanged: x = cell.width / 2 - width / 2
        onHeightChanged: y = cell.height / 2 - height / 2

        width: 0
        height: 0
        color: "#eee4da"
        radius: 3

        Text {
            id: label
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#776e65"
            font.bold: true
            font.pixelSize: cell.height / 2
            onTextChanged: {
                Tile.updateTextSize()
                Tile.updateColor()
            }
        }
    }
}
