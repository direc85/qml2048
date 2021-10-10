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
import "scoreitem.js" as ScoreItem

Item {
    id: container

    property string text
    property int value

    Rectangle {
        id: bgRect
        width: parent.width * 0.9
        height: parent.height * 0.6
        radius: 6
        anchors.centerIn: parent
        color: Theme.highlightBackgroundColor
        opacity: 0.125
    }
    Column {
        anchors.fill: bgRect
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height * 0.25
            font.bold: true
            color: Theme.highlightColor
            text: container.text
        }
        Text {
            id: score
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height * 0.6
            font.bold: true
            color: Theme.primaryColor
            text: container.value

            onTextChanged: {
                if (width > parent.width)
                    scale = parent.width / width * 0.9
                else
                    scale = 1
                ScoreItem.fade()
            }
        }
    }
}
