
//// OK
//////npm install restify
//
//var restify = require('restify');
//var fs = require('fs');
//
//// Setup some https server options
//var https_options = {
//  key: fs.readFileSync('/etc/apache2/ssl.key/server.key'),
//  certificate: fs.readFileSync('/etc/apache2/ssl.key/server.crt')
//};
//
//// Instantiate our two servers
//var server = restify.createServer();
//var https_server = restify.createServer(https_options);
//
//// Put any routing, response, etc. logic here. This allows us to define these functions
//// only once, and it will be re-used on both the HTTP and HTTPs servers
//var setup_server = function(app) {
//        function respond(req, res, next) {
//           res.send('I see you ' + req.params.name);
//        }
//
//        // Routes
//        app.get('/test/:name', respond);
//}
//
//// Now, setup both servers in one step
//setup_server(server);
//setup_server(https_server);
//
//// Start our servers to listen on the appropriate ports
//server.listen(80, function() {
//  console.log('%s listening at %s', server.name, server.url);
//});
//
//https_server.listen(443, function() {
//  console.log('%s listening at %s', https_server.name, https_server.url);
//});


//// NOT OK
//////npm install routes
//
//var express = require('express');
//var fs = require('fs');
//var routes = require('routes');
//
//var privateKey = fs.readFileSync('/etc/apache2/ssl.key/server.key').toString();
//var certificate = fs.readFileSync('/etc/apache2/ssl.key/server.crt').toString();  
//
//// To enable HTTPS
//var app = module.exports = express({key: privateKey, cert: certificate});

//////  /mnt/repos/private/syoung/notes/agua/private/bin/test/node/https# node https.js 
//////  
//////  fs.js:427
//////	return binding.open(pathModule._makeLong(path), stringToFlags(flags), mode);
//////				   ^
//////  Error: ENOENT, no such file or directory 'cert/key.pem'
//////	  at Object.fs.openSync (fs.js:427:18)
//////	  at Object.fs.readFileSync (fs.js:284:15)
//////	  at Object.<anonymous> (/mnt/repos/private/syoung/notes/agua/private/bin/test/node/https/https.js:5:21)
//////	  at Module._compile (module.js:456:26)
//////	  at Object.Module._extensions..js (module.js:474:10)
//////	  at Module.load (module.js:356:32)
//////	  at Function.Module._load (module.js:312:12)
//////	  at Function.Module.runMain (module.js:497:10)
//////	  at startup (node.js:119:16)
//////	  at node.js:901:3




//// OK

var express = require('express');
var https = require('https');
var http = require('http');
var fs = require('fs');

// This line is from the Node.js HTTPS documentation.
var options = {
  key: fs.readFileSync('/etc/apache2/ssl.key/server.key'),
  cert: fs.readFileSync('/etc/apache2/ssl.key/server.crt')
};

// Create a service (the app object is just a callback).
var app = express();

/* serves all the static files */
app.get(/^(.+)$/, function(req, res){ 
	console.log('static file request : ' + req.params);
	res.sendfile( "/var/www/html" + req.params[0]); 
});

// Create an HTTP service.
//http.createServer(app).listen(80);
// Create an HTTPS service identical to the HTTP service.
https.createServer(options, app).listen(443);

///mnt/repos/private/syoung/notes/agua/private/bin/test/node/https# node https.js 
//
//crypto.js:104
//  if (options.cert) c.context.setCert(options.cert);
//                              ^
//Error: error:0906D06C:PEM routines:PEM_read_bio:no start line
//    at Object.exports.createCredentials (crypto.js:104:31)
//    at Server (tls.js:1111:28)
//    at new Server (https.js:35:14)
//    at Object.exports.createServer (https.js:54:10)
//    at Object.<anonymous> (/mnt/repos/private/syoung/notes/agua/private/bin/test/node/https/https.js:18:7)
//    at Module._compile (module.js:456:26)
//    at Object.Module._extensions..js (module.js:474:10)
//    at Module.load (module.js:356:32)
//    at Function.Module._load (module.js:312:12)
//    at Function.Module.runMain (module.js:497:10)
