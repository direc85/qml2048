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

function saveSpeed() {
    Storage.setState("speed",speedButton.checkedButton.speed)
}

function loadSpeed() {
    switch (Storage.getState("speed")) {
    case '400'  :   slowSpeedButton.checked = true;     break
    case '100'  :   fastSpeedButton.checked = true;     break
    default     :   normalSpeedButton.checked = true;   break
    }
}
