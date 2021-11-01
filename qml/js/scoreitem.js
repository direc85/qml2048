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

function fade() {
    var comp = Qt.createComponent("../components/FadeText.qml")
    if (comp.status == Component.Ready) {
        var fadeObj = comp.createObject(score)
        if (fadeObj == null) {
            console.log("error creating fade object")
            console.log(comp.errorString())
            return
        }

        fadeObj.width = score.width
        fadeObj.height = score.height
        fadeObj.x = 0
        fadeObj.y = 0
        fadeObj.text = score.text
        fadeObj.font.pixelSize = score.font.pixelSize
        fadeObj.font.bold = score.font.bold
        fadeObj.color = score.color
        fadeObj.fade()
    } else {
        console.log("error loading fade component")
        console.log(comp.errorString())
        return
    }
}
