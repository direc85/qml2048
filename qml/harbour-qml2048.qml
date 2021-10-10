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


import QtQuick 2.0

import Sailfish.Silica 1.0
import "pages/storage.js" as Storage
import "pages/speed.js" as Speed
import "pages"

ApplicationWindow
{
    property int scoreItem
    property int scoreBest
    property int scoreHigh
    property string scoreName
    property string scoreMode
    property string history
    property bool shareMode

    property int communityScore;
    property int communityTile;

    id: app
    initialPage: mainPage
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    Component.onCompleted: {
        if(Storage.getState("name"))
            scoreName = Storage.getState("name")
        shareMode = false
        if(Storage.getState("shared"))
            if(Storage.getState("shared") === "yes")
                shareMode = true
        if(app.scoreName.length > 0)
            mainPage.newGameRequest()
        else
            mainPage.firstStart()
    }

    MainPage {
        id: mainPage
    }

    function setName(name)
    {
        scoreName = name
        Storage.setState("name",name)
    }

    function setShared(val)
    {
        if(scoreName.length < 2)
        {
            shareMode = false
            Storage.setState("shared","no")
            return;
        }

        if(val)
        {
                    console.debug("SHARED")
            shareMode = true
            Storage.setState("shared","yes")
        }
        else
        {
            console.debug("NOT SHARED")
            shareMode = false
            Storage.setState("shared","no")
        }
    }

    function resetlog(size)
    {
        history = ""
    }

    function addlog(val)
    {
        history += val
    }

    function sendscore()
    {
        var http = new XMLHttpRequest()
        var url = "http://sailfish.kazoe.org/qml2048_sendscore.php";
        var params = "name="+scoreName+"&besttile="+scoreBest+"&score="+scoreItem+"&mode="+scoreMode+"&log="+history;

        if(!shareMode) return;

        http.open("POST", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    console.log("Save online ok")
                } else {
                    console.log("error: " + http.status)
                }
            }
        }
        http.send(params);
    }

    function getCommunity(size)
    {
        var http = new XMLHttpRequest()
        var url = "http://sailfish.kazoe.org/qml2048_getscore.php";
        var params = "mode="+size;

        communityScore = 0
        communityTile = 0

        if(!shareMode) return;

        http.open("POST", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    communityScore = http.responseText.split(/[ ,]+/)[0]
                    communityTile = http.responseText.split(/[ ,]+/)[1]
                } else {
                    console.log("error: " + http.status)
                    console.log(http.responseText)
                }
            }
        }
        http.send(params);
    }
}
