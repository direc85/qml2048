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


// show tile with animation
function show() {
    updateColor()
    labelContainer.x = cell.width / 2
    labelContainer.y = cell.height / 2
    labelContainer.center_x = x
    labelContainer.center_y = y
    show_anim.to = cell.width
    show_anim.duration = 200
    show_anim.start()
}

// move tile with animation (with merged tile if needed)
function move() {
    if (merged_cell)
        merged_cell.move()
    if (new_x && new_y) {
        move_anim_x.to = new_x
        move_anim_x.duration = 200
        move_anim_y.to = new_y
        move_anim_y.duration = 200
        move_anim_x.start()
        move_anim_y.start()
    }
}

// resize label if it is too large
function updateTextSize() {
    if (label.width > cell.width)
        label.scale = cell.width / label.width * 0.9
}

// set tile color (depend on current value)
function updateColor() {
    switch (value) {
    case 2      :
        labelContainer.color = "#eee4da"
        break
    case 4      :
        labelContainer.color = "#ede0c8"
        break
    case 8      :
        labelContainer.color = "#f2b179"
        label.color = "#f9f6f2"
        break
    case 16     :
        labelContainer.color = "#f59563"
        label.color = "#f9f6f2"
        break
    case 32     :
        labelContainer.color = "#f67c5f"
        label.color = "#f9f6f2"
        break
    case 64     :
        labelContainer.color = "#f65e3b"
        label.color = "#f9f6f2"
        break
    case 128    :
        labelContainer.color = "#edcf72"
        label.color = "#f9f6f2"
        break
    case 256    :
        labelContainer.color = "#edcc61"
        label.color = "#f9f6f2"
        break
    case 512    :
        labelContainer.color = "#edc850"
        label.color = "#f9f6f2"
        break
    case 1024   :
        labelContainer.color = "#edc53f"
        label.color = "#f9f6f2"
        break
    case 2048   :
        labelContainer.color = "#edc22e"
        label.color = "#f9f6f2"
        break
    default     :
        labelContainer.color = "#3c3a32"
        label.color = "#f9f6f2"
        break
    }
}
