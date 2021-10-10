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
import "../components"

Page {
    id: page

    SilicaFlickable {
        id: aboutFlickable
        anchors.fill: parent
        contentHeight: header.height + column.height

        PageHeader {
            id: header
            title: qsTr("About")
        }

        Column {
            id: column
            anchors {
                top: header.bottom
                horizontalCenter: parent.horizontalCenter
            }
            width: Math.min(Screen.width, aboutFlickable.width)
            spacing: Theme.paddingLarge

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: Qt.resolvedUrl("/usr/share/icons/hicolor/172x172/apps/harbour-qml2048.png")
                width: Theme.iconSizeExtraLarge
                height: Theme.iconSizeExtraLarge
                smooth: true
                asynchronous: true
            }

            AboutLabel {
                font.pixelSize: Theme.fontSizeLarge
                color: Theme.highlightColor
                text: "2048\n(QML version)"
            }

            AboutLabel {
                text: qsTr("License: GPLv3")
            }

            AboutLabel {
                text: qsTr("Original Harmattan version by raandoom")
                width: parent.width
            }

            AboutLabel {
                text: qsTr("Ported to SailfishOS by condo4 (Fabien Proriol)")
            }

            AboutLabel {
                text: qsTr("Improved noarch build by direc85 (Matti Viljanen)")
                width: parent.width
            }

            AboutLabel {
                text: qsTr("If you want to make donation, you can send bitcoins to 12Zrqvi4S8a4Qme5Ynh9EJsRHSqyKMaf1z")
                width: parent.width
                wrapMode:Text.WrapAtWordBoundaryOrAnywhere
            }

            Button {
                id: homepage
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Sourcecode on GitHub"
                onClicked: {
                    Qt.openUrlExternally("https://github.com/condo4/qml2048")
                }
            }
        }
    }
}
