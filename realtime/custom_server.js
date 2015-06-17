/*
custom node.js server. listens to port 5001, processes the request and sends back the reply
it communicates with the data base -- only using mysql for now. Should work with redis in the future 
*/

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io');



io.on('connection', function(socket){
	socket.on('subscribe', function(room) {
		console.log('joining room', room);
		socket.join(room);
	});

	socket.on('send message', function(data) {
		console.log('sending room post', data.room);
		socket.broadcast.to(data.room).emit('conversation private post', {
			message: data.message
		});
	});
});

http.listen(5001, function(){
	console.log('listening on *:5001');
});

// var io = require('socket.io').listen(5001),
//     redis = require('redis').createClient(),

//  io.on('connect', function(){

//  	console.log("connected!");

//  });

//  //every two minutes, check if a user is online =

//  io.emit('are_you': "online" )















