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

Rectangle {

    signal newGameClicked()

    TouchBlocker {
        anchors.fill: parent
    }

    Column {
        anchors.centerIn: parent
        width: parent.width - 40
        spacing: 10

        Text {
            text: ":("
            color: "white"
            font.pixelSize: parent.width / 2
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            color: "white"
            font.pixelSize: 48
            width: parent.width
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "It looks like there are no more moves available"

        }

        Button {
            text: "New game"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: newGameClicked()
        }
    }

    function show() {
        show_anim.start()
    }

    function hide() {
        hide_anim.start()
    }

    PropertyAnimation {
        id: show_anim
        target: loseScreen
        property: "y"
        duration: 1000
        easing.type: Easing.OutBounce
        from: - height
        to: 0
    }

    PropertyAnimation {
        id: hide_anim
        target: loseScreen
        property: "y"
        duration: 500
        from: 0
        to: - height
    }
}
