



/*
	Mimic active records in rails
	*/
	mysql  = require('mysql');
	
	var FunctionalRecord = function(database_name, db_host, username, password){
		
	        this.database_name = database_name;
	        this.db_host = db_host;
	        this.username = username;
	        this.password = password;
		
			this.connection = mysql.createConnection({
							  host     : this.db_host,
							  user     : this.username,
							  password : this.password
							});
			this.connect = function(){
				this.connection.connect(function(err) {
				  //if an error occurs using connecting, output that error
		 		  if (err) {
				    console.error('error connecting: ' + err.stack);
				    return;
				  }

				  console.log('connected ... ');
				});

				this.connection.query('USE '+ database_name);

			};


		// 	//connect to the database as the specified user
		// 	this.connection.connect(function(err) {
		// 		  // if an error occurs using connecting, output that error
		// 		  if (err) {
		// 		    console.error('error connecting: ' + err.stack);
		// 		    return;
		// 		  }

		// 		  console.log('connected as id ' + connection.threadId);
		// 		});
		// 	// user the specified database
		// 	this.connection.query('USE '+ database_name);
		
		//finds a record from the database
		this.find = function(table_name, id){
			this.connection.query('SELECT * FROM '+ table_name + 'WHERE( id = ' + toString(id) + ')');
		},
		this.all = function(table_name){
			this.connection.query('SELECT * FROM '+ table_name);
		}

		


	}

module.exports = FunctionalRecord;