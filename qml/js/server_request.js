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
function server_getNextRandomTargetId(killerId, callback) {
    console.log("try to getNextRandomTargetId")
    var query = SERVER_URL  + "/tasks/getNextRandomTargetId/" + killerId
    console.log(query)
    RequestServer.sendRequestToServer(query, callback)
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



// @POST("/person/updatePersonLocation/{person}/{location}")
// Response updatePersonLocation (@Path("person") String person, @Path("location") String location);
function server_updatePersonLocatin(person_id, location) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/person/updatePersonLocation/" + person_id + "/" + location,
                                          "", callback_updatePersonLocation)
}



// @POST("/person")
// @FormUrlEncoded
// @Headers({"Content-Type: application/x-www-form-urlencoded"})
// Response postPerson (@Field("vkId") String person);
function server_postPerson(person_id) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/person/updatePersonLocation/" + person_id + "/" + location,
                                          "", callback_postPerson)
}


// @POST("/person/updatePersonBTDevice/{killer}/{btPerson}")
// Response updatedPersonBT (@Path("killer") String killer, @Path("btPerson") String btPerson);
function server_updatePersonBT(btPerson) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/person/updatePersonBTDevice/" + btPerson,
                                          "", callback_updatePersonBTDevice)
}



// @POST("/tasks/tryCompleteWithBT/{killerId}/{btTarget}")
// Response tryToCompleteWithBT (@Path("killerId") String killer, @Path("btTarget") String btTarget);
function server_tryCompleteWithBT(killerId, btTarget) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/tasks/tryCompleteWithBT/" + killerId + "/" + btTarget,
                                          "", callback_tryCompleteWithBT)
}



// @POST("/tasks/forgetRejectedTargets/{killer}")
// @Headers({"Content-Type: application/x-www-form-urlencoded"})
// Response forgetRejectedTargets (@Path ("killer") String person);
function server_forgetRejectedTargets(killerId) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/tasks/forgetRejectedTargets/" + killerId,
                                          "", callback_forgetRejectedTargets)
}



// @POST("/tasks/acceptTarget/{killer}/{target}")
// @Headers({"Content-Type: application/x-www-form-urlencoded"})
// Task acceptTarget (@Path ("killer") String killer, @Path ("target") String target);
function server_acceptTarget(killerId, target) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/tasks/acceptTarget/" + killerId + "/" + target,
                                          "", callback_acceptTarget)
}



// @POST("/tasks/cancelCurrentTask/{killer}")
// Response cancelTarget (@Path ("killer") String killer);
function server_cancelCurrentTask(killerId) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/tasks/cancelCurrentTask/" + killerId,
                                          "", callback_cancelCurrentTask)
}



// @POST("/tasks/tryCompleteWithLocation/{killerId}/{location}")
// String tryCompleteWithLocation( @Path ("killerId") String killerId, @Path("location") String location);
function server_tryCompleteWithLocation(killerId, location) {
    RequestServer.sendPostRequestToServer(SERVER_URL  + "/tasks/tryCompleteWithLocation/" + killerId + "/" + location,
                                          "", callback_tryCompleteWithLocation)
}




function server_testPost()
{
    var sendJSON = {};

    sendJSON["acc_data"] = client.speed_data;
    sendJSON["com_data"] = client.turns_data;
    sendJSON["tim_data"] = client.time_data;
    sendJSON["lat"]      = client.lat;
    sendJSON["lon"]      = client.lon;
    sendJSON["speed"]    = client.speed;
    sendJSON["values"]   = "" + client.values;
    var send_data = JSON.stringify(sendJSON)
    client.consoleLog(send_data);
    RequestServer.sendRequestToServer(SERVER_URL  + "/history/getRating/{from}" + from_ + "/" + to_,
                           callback_getRating)
}

// --------------- Callbacks -------------------
function callback_getCurrentTask(jsonObject){
	
}

// in FirstPage
//function callback_getNextRandomTargetId(responseText) {
//    console.log(responseText);
//}


function callback_getTargetLocation(jsonObject) {
	console.log(jsonObject);
}


function callback_getPersonBTDeviceHint(jsonObject) {
	console.log(jsonObject);
}


function callback_getTaskHistory(jsonObject) {
	console.log(jsonObject);
}

function callback_getRating(jsonObject) {
	console.log(jsonObject);
}


function callback_updatePersonLocation(jsonObject) {
    console.log(jsonObject);
}


function callback_postPerson(jsonObject) {
    console.log(jsonObject);
}


function callback_updatePersonBTDevice(jsonObject) {
    console.log(jsonObject);
}


function callback_tryCompleteWithBT(jsonObject) {
    console.log(jsonObject);
}


function callback_forgetRejectedTargets(jsonObject) {
    console.log(jsonObject);
}


function callback_acceptTarget(jsonObject) {
    console.log(jsonObject);
}


function callback_cancelCurrentTask(jsonObject) {
    console.log(jsonObject);
}


function callback_tryCompleteWithLocation(jsonObject) {
    console.log(jsonObject)
}


// -------------- Other functions --------------

