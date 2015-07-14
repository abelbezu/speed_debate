/*
custom node.js server. listens to port 5001, processes the request and sends back the reply
it communicates with the data base -- only using mysql for now. Should work with redis in the future 
*/


var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var redis = require('redis');
var client = redis.createClient();


function to_offline(json_obj){
	jsonified = JSON.parse(json_obj);
	jsonified['status'] = 'offline';
	return JSON.stringify(jsonified);
}
function to_online(json_obj){

	jsonified = JSON.parse(json_obj);
	jsonified['status'] = 'online';
	console.log(jsonified);
	return JSON.stringify(jsonified);
}

io.on('connection', function(socket){
	socket.on('user present flag', function(data){
		console.log("got id: " + data['id']);
		

		client.hget('online_users', data['id'], function(err, obj){
			client.hset('online_users', data['id'], to_online(obj));
		});
		
		
	});



 var online_users;
  client.hgetall('online_users', function(err, obj){
  	online_users = obj;
  });



  setInterval(function(){

  	io.emit('online users', online_users);
  	
  	socket.emit('are you present?', {});

  }, 3000);

  setInterval(function(){

  Object.keys(online_users).forEach(function(index){
  		client.hget('online_users', index, function(err, obj){
			client.hset('online_users', index, to_offline(obj));
		});
   		
   });
   
  }, 10000);



});



http.listen(5001, function(){
  console.log('listening on *:5001');
});















