var http = require('http'),
    _ = require('underscore');
var httpProxy = require('http-proxy');
var proxyOptions = {
  router: {
    "confluence.aguadev.org"     : 'localhost:8090',
    "www.aguadev.org"       : 'localhost:8090',
    "www.testAppY.com"     : 'localhost:10520',
    "test.oldApps.com"     : 'localhost:10520',
    'bc.ryanwu.co'         : 'localhost:8888'
  }
},
  redirectOptions = {
    'www.aguadev.org'      : 'http://www/aguadev.org:8090/',
    'www.olddomain.com'  : 'http://newdomain.com/',
    'blog.olddomain.com' : 'http://newdomain.com/blog/'
  };
 
var proxy = new httpProxy.createProxyServer(proxyOptions);
 
var server = http.createServer(function(req, res) {
    var oriHost = req.headers.host,
        //remove port number from original host
        host = oriHost.indexOf(":") ? oriHost.split(':')[0] : oriHost;
 
  //Check matches of redirect hostnames
  if(_.has(redirectOptions, host)) {
    res.writeHead(301, { //You can use 301, 302 or whatever status code
      'Location': redirectOptions[host], 
      'Expires': (new Date()).toGMTString() 
    });
    res.end();
  } else {
    //Routing proxy will handle the rest of requests
    proxy.proxyRequest(req, res);
  }
});
 
server.on('upgrade', function(req, socket, head) {
  proxy.proxyWebSocketRequest(req, socket, head);
});
 
server.listen(80);