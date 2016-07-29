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

.import "./request.js" as RequestServer


// -------------- API functions --------------


var SERVER_URL = "http://tomcat8-killergame.rhcloud.com/KillerGameServer/rest";
var SERVER_VERSION = "v1.0"


// @GET("/tasks/getNextRandomTargetId/{killer}")
// @Headers({"Content-Type: application/json"}) 
function server_getNextRandomTargetId(killerId) {
    console.log("try to getNextRandomTargetId")
    var query = SERVER_URL  + "/tasks/getNextRandomTargetId/" + killerId
    console.log(query)
    RequestServer.sendRequestToServer(query, callback_getNextRandomTargetId)
}

// @GET("/person/getPersonLocation/{person}") 
// Response getTargetLocation (@Path("person") String person);
function server_getTargetLocation(personId) {
    RequestServer.sendRequestToServer(SERVER_URL  + "/person/getPersonLocation/" + personId,
                           callback_getTargetLocation)
}



// @GET("/person/getPersonBTDeviceHint/{target}")
// String getPersonBTHint (@Path("target") String target);
function server_getPersonBTDeviceHint(target) {
    RequestServer.sendRequestToServer(SERVER_URL  + "/person/getPersonBTDeviceHint/" + target,
                           callback_getPersonBTDeviceHint)
}



//@GET("/tasks/getCurrentTask/{killer}")
//Task getCurrentTask (@Path ("killer") String killer)	
function server_getCurrentTask(killerId) {
	// TODO: use id instead hardcode
    RequestServer.sendRequestToServer(SERVER_URL  + "/tasks/getCurrentTask/" + killerId,
                           callback_getCurrentTask)
}



// @GET ("/history/getTaskHistoryForKiller/{killerId}")  
// ArrayList<HistoryEntry> getTaskHistory (@Path ("killerId") String killerId);
function server_getTaskHistory(killerId) {
    RequestServer.sendRequestToServer(SERVER_URL  + "/history/getTaskHistoryForKiller/" + kilerId,
                           callback_getTaskHistory)
}



// @GET("/history/getRating/{from}/{to}")
// List<RatingEntry> getRating (@Path ("from") int from, @Path ("to") int to);
function server_getRating(from_, to_) {
    RequestServer.sendRequestToServer(SERVER_URL  + "/history/getRating/{from}" + from_ + "/" + to_,
                           callback_getRating)
}



// --------------- Callbacks -------------------
function callback_getCurrentTask(jsonObject){
	
}

function callback_getNextRandomTargetId(responseText) {
    console.log(responseText);	
}


function callback_getTargetLocation(jsonObject) {
	console.log(jsonObject);
}


function callback_getPersonBTDeviceHint(jsonObject) {
	console.log(jsonObject);
}


// This is not used, for example only:)
	function callback_Test(jsonObject) {
		var firstName = jsonObject.response[0].first_name
		var secondName = jsonObject.response[0].last_name
		var fullName = firstName + " " + secondName
		var oldAvatarName = StorageJS.readUserAvatar()
		var newAvatarName = jsonObject.response[0].photo_100.split("/")
		newAvatarName = newAvatarName[newAvatarName.length - 1]

		if (StorageJS.readFullUserName() !== fullName) {
			console.log("Replacing user name...")
			StorageJS.saveUserName(firstName, secondName)
			signaller.gotUserNameAndAvatar(fullName, cachePath + oldAvatarName)
		}
		if (oldAvatarName !== newAvatarName) {
			console.log("Replacing user avatar...")
			fileDownloader.startDownload(jsonObject.response[0].photo_100, 0)
			StorageJS.saveUserAvatar(newAvatarName)
		}
	}
//end

function callback_getTaskHistory(jsonObject) {
	console.log(jsonObject);
}

function callback_getRating(jsonObject) {
	console.log(jsonObject);
}


// -------------- Other functions --------------

