// npm install cgi
// npm install http
// npm install path

var cgi = require('cgi');
var http = require('https');
var path = require('path');

//var script = path.resolve(__dirname, 'init.pl');
var script = path.resolve('/a/cgi-bin', 'hello.cgi');
//var script = path.resolve('/a/html', 'download.cgi');
//var script = path.resolve('/var/www/cgi-bin/aguadev', 'aguad');
//var script = path.resolve('/var/www/cgi-bin/aguadev', 'hello2.cgi');

var fs = require('fs');
var options = {
  key: fs.readFileSync('/a/conf/.https/server.key'),
  cert: fs.readFileSync('/a/conf/.https/server.crt')
};

//var httpserver = http.createServer(options);

//http.createServer( cgi(script) ).listen(80);
http.createServer( options, cgi(script) ).listen(80);