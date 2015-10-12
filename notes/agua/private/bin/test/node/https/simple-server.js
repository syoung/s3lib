var util = require('util'),    
    http = require('http');

http.createServer(function (req, res) {

    //req.on('exit', function(err) {
    //    console.debug('unable to start server on port: ' + err);
    //});

req.on('error', function (err) {
        console.debug('unable to start server. err: ' + err);
});

    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.write('hello, i know nodejitsu! XXXXXoooooo')
    res.end();

}).listen(8000);



/* server started */  
util.puts('> hello world running on port 8000');