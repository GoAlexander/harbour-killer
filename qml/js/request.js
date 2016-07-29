/*
  Copyright (C) 2015 Petr Vytovtov
  Contact: Petr Vytovtov <osanwe@protonmail.ch>
  All rights reserved.

  This file is part of Kat.

  Kat is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Kat is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Kat.  If not, see <http://www.gnu.org/licenses/>.
*/

var API_SERVER = "https://api.vk.com/method/";
var API_VERSION = "v=5.37"

function sendRequestTo(query, callback) {
    console.log(query)

    var request = new XMLHttpRequest()
    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
                console.log(request.responseText)
                if (typeof callback !== 'undefined' && request.responseText) {
                    var callback_args = [JSON.parse(request.responseText)]
                    for (var i = 2; i < arguments.length; ++i) callback_args.push(arguments[i])

                    callback.apply(null, callback_args)
                }
            } else {
                console.log("ERROR " + request.status + ": " + request.statusText)
            }
        }
    }
    request.open("GET", query, true)
    request.send()
}

function sendPostRequestToServer(query, jsonstring, callback) {
    console.log("sendPostRequestToServer");

    var xhr = new XMLHttpRequest();
    console.log(query)
    console.log(jsonstring)

    xhr.open('POST', query , true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200)
        {
            console.log(request.responseText)
            if (typeof callback !== 'undefined' && request.responseText) {
                callback (request.responseText.toString())
            }
        }
    };
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(jsonstring);
};

function sendRequestToServer(query, callback) {
    console.log(query)

    var request = new XMLHttpRequest()
    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
                console.log(request.responseText)
                if (typeof callback !== 'undefined' && request.responseText) {
                    callback (request.responseText.toString())
                }
            } else {
                console.log("ERROR " + request.status + ": " + request.statusText)
            }
        }
    }
    request.open("GET", query, true)
    request.send()
}

function sendRequest(method, data, callback, isNew) {
    var query = API_SERVER + method + "?" + API_VERSION +
            "&access_token=" + StorageJS.readSettingsValue("access_token");
    for (var arg in data) if (data[arg] !== "") query += "&" + arg + "=" + data[arg];

    sendRequestTo(query, callback, isNew)
}

function sendLongPollRequest(server, data, callback) {
    var query = "https://" + server + "?act=a_check";
    for (var arg in data) if (data[arg] !== "") query += "&" + arg + "=" + data[arg];

    sendRequestTo(query, callback)
}
