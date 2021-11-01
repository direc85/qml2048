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

CoverBackground {
    Column {
        x: Theme.paddingMedium
        y: Theme.paddingMedium
        width: parent.width - 2*x
        spacing: Theme.paddingMedium
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            text: "2048"
        }

        Label {
            text: app.scoreName
        }

        Label {
            text: qsTr("Size: ") +app.scoreMode+"x"+app.scoreMode
        }

        Label {
            text: qsTr("Score: ") +app.scoreItem
        }

        Label {
            text: qsTr("Best tile: ") +app.scoreBest
        }

        Label {
            text: qsTr("High score: ") +app.scoreHigh
        }
    }
}
