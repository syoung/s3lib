var http = require("http");
var mysql = require("mysql");
var util = require("util");
var should = require("should");

function getDateTime() {
    var date = new Date();

    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;

    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;

    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec;

    var year = date.getFullYear();

    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;

    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;

    return year + ":" + month + ":" + day + ":" + hour + ":" + min + ":" + sec;
}
console.log("TIME: " + getDateTime());

var sqlInfo = {
	host: "localhost",
	user: "root",
	password: "1234",
	database: "nodetest"
}
client = mysql.createConnection(sqlInfo);
client.connect();

var post  = {
	username: 	"testuser",
	query 	: 	"query1",
	ordinal	: 	4,
	action	: 	"AND",
	field	: 	"disease",
	operator: 	"contains",
	value	:	"prostate"

};

var query = client.query('DELETE FROM query WHERE username=\'testuser\'', function(err, result) {
	//console.log(query.sql);
	console.log("ran DELETE");
});

query = client.query('SELECT * FROM query WHERE username=\'testuser\'', null, function(err, result) {
	//console.log(query.sql);
	console.log("query SELECT. result: " + JSON.stringify(result));
});

query = client.query('INSERT INTO query SET ?', post, function(err, result) {
	//console.log(query.sql);
	console.log("ran INSERT");
});

query = client.query('SELECT * FROM query WHERE username=\'testuser\'', null, function(err, result) {
	//console.log(query.sql);
	console.log("query SELECT. result: " + JSON.stringify(result));
	
	//[{"username":"testuser","query":"query1","ordinal":4,"action":"AND","field":"disease","operator":"contains","value":"prostate"}]

});
//console.log(query.sql);

//INSERT INTO query VALUES(
//'testuser',
//'query1',
//4,
//'AND',
//'disease',
//'contains',
//'prostate'
//);

//client.query("SELECT * FROM queries;", function (error, rows, fields) { 
//	consolelog("query RESULTS: " + JSON.stringify(rows)); 
//});
//
//console.log("here2");


//var util = require("util");
//
//// Include http module, 
//var http = require("http");
//// And mysql module you"ve just installed. 
//var mysql = require("mysql"); 
//
//// Create the connection. 
//// Data is default to new mysql installation and should be changed according to your configuration. 
//var connection = mysql.createConnection({ 
//    user: "agua", 
//    password: "1234", 
//    database: "aguadev"
//}); 
//connection.connect();
//
//
//
//// Create the http server. 
//http.createServer(function (request, response) { 
//
//	console.log("INSIDE http.createServer");
//	
//	request.on("error", function (err) {
//		console.log("ERROR");
//		console.debug("unable to start server. err: " + err);
//	});
//
//    response.writeHead(200, {'Content-Type': 'text/plain'});
//
//	query = client.query('select * from query', null, function(err, result) {
//		response.write(JSON.stringify(result));
//		console.log(JSON.stringify(result));
//		response.end();
//
//	});
//
//    //response.write('hello, i know nodejitsu! XXXXXoooooo');
//	//response.end();
//
//
//   // Attach listener on end event. 
//    request.on("end", function () { 
//		console.log("INSIDE request.on(END)");
//      // Query the database. 
//
//		query = client.query('select * from query', null, function(err, result) {
//			response.write(JSON.stringify(result));
//		    response.end();
//
//			console.log(JSON.stringify(result));
//		});
////
////		connection.query("SELECT * FROM queries;", function (error, rows, fields) { 
////			response.writeHead(200, { 
////				//"Content-Type": "x-application/json" 
////				"Content-Type": "text/plain" 
////			}); 
////			
////			// Send data as JSON string. 
////			// Rows variable holds the result of the query. 
////			response.write(JSON.stringify(rows)); 
////			response.write("hello, i know nodejitsu! XXXXX")
////			response.end();	
////		}); 
//    }); 
//// Listen on the 8080 port. 
//}).listen(8000);
//
///* server started */  
//util.puts("> test-mysql running on port 8000");
//
//
