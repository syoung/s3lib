var express = require("express");
var app = express();

app.use(express.favicon());

/* serves main page */
app.get("/", function(req, res) {
   res.sendfile('index.htm')
});

app.post("/user/add", function(req, res) { 
   /* some server side logic */
   res.send("OK");
});

/* serves all the static files */
app.get(/^(.+)$/, function(req, res){ 
	console.log('static file request : ' + req.params);
	res.sendfile( "/var/www/html" + req.params[0]); 
});

//// set up a route to redirect http to https
//http.get('*',function(req,res){  
//    res.redirect('https://mydomain.com'+req.url)
//})

//var port = process.env.PORT || 5000;
var port = process.env.PORT || 80;
app.listen(port, function() {
  console.log("Listening on " + port);
});


//// Error: ENOENT, stat '/mnt/repos/private/syoung/notes/agua/private/bin/test/node/http/agua/agua.html'