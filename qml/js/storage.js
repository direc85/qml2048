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


.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

var db = null
var animation_speed = 200

function openDb()
{
    if(db !== null) return
    db = Sql.LocalStorage.openDatabaseSync("qml2048","1.0","qml2048 game data",100)
    db.transaction(ensureTablesExist)
}

// This ensures that the table exists.
// When updating, keep in mind there are users using an old version!
function ensureTablesExist(tx)
{
    tx.executeSql('CREATE TABLE IF NOT EXISTS highscores(score INT, size INT UNIQUE)',[])
    tx.executeSql('CREATE TABLE IF NOT EXISTS state(key TEXT UNIQUE, value TEXT)',[])
}

function setHighscore(score,size)
{
    openDb()
    db.transaction(function(tx){
                       var rs = tx.executeSql(
                                   'INSERT OR REPLACE INTO highscores(score,size) VALUES (?,?)',
                                   [score,size])
                   })
}

function getHighscore(size)
{
    openDb()
    var topscore = 0
    db.transaction(function(tx){
                       var rs = tx.executeSql(
                                   'SELECT score FROM highscores WHERE size=? ORDER BY score DESC LIMIT 1',
                                   [size])
                       if(rs.rows.length > 0) {
                           topscore = rs.rows.item(0).score
                       }
                   })
    return topscore
}

function setState(key,value) {
    openDb()
    db.transaction(function(tx){
                       var rs = tx.executeSql('INSERT OR REPLACE INTO state VALUES (?,?)',
                                              [key,value.toString()]);
                   })
}

function getState(key) {
    openDb()
    var value = null
    db.transaction(function(tx){
                       var rs = tx.executeSql("SELECT value FROM state WHERE key=?",[key])
                       if(rs.rows.length > 0) {
                           value = rs.rows.item(0).value
                       }
                   })
    return value
}
