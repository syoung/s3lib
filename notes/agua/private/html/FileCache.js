// FILECACHE METHODS
setFileCaches : function () {
	console.log("Data.setFileCache    plugins.core.Data.setFileCache()");
	
	this.data.filecaches = {
		
		"/data/sequence/demo" :	{
			username	:	"admin",
			fileSystem	:	{
				"name":"",
				"path":"",
				"total":"8",
				"items": [
					{
						"name":"BOWTIE",
						"path":"BOWTIE",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332522670,
						"children":["paired"]
					},
					{
						"name":"ELAND",
						"path":"ELAND",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332522670,
						"children":["paired"]
					},
					{
						"name":"MAQ",
						"path":"MAQ",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332522669,
						"children":[".svn",
						"paired",
						"single"]
					},
					{
						"name":"NOVOALIGN",
						"path":"NOVOALIGN",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332726328,
						"children":["paired",
						"paired~copyFile"]
					},
					{
						"name":"image2eland",
						"path":"image2eland",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332338385,
						"children":["inputs",
						"outputs"]
					},
					{
						"name":"jbrowseFeature",
						"path":"jbrowseFeature",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332901372,
						"children":["ntHumChimp",
						"parkinsons",
						"test",
						"testB"]
					},
					{
						"name":"splitace",
						"path":"splitace",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332522586,
						"children":["454Contigs.ace"]
					},
					{
						"name":"tophat",
						"path":"tophat",
						"parentPath":"",
						"parentDir":"",
						"directory":true,
						"size":"4096",
						"modified":1332338385,
						"children":[]
					}
				]
			}
		},

		"/data/sequence/demo/jbrowseFeature" :	{
			username	:	"admin",
			fileSystem	:	{
				"name":"jbrowseFeature",
				"path":"jbrowseFeature",
				"total":"4",
				"items":	[
					{
						"name":"ntHumChimp",
						"path":"ntHumChimp",
						"parentPath":"jbrowseFeature",
						"parentDir":"jbrowseFeature",
						"directory":true,
						"size":"4096",
						"modified":1332896089,
						"children":["inputs",
						"outputs",
						"parkinsons"]
					},
					{"name":"parkinsons",
						"path":"parkinsons",
						"parentPath":"jbrowseFeature",
						"parentDir":"jbrowseFeature",
						"directory":true,
						"size":"4096",
						"modified":1332896096,
						"children":["inputs",
						"test"]
					},
					{"name":"test",
						"path":"test",
						"parentPath":"jbrowseFeature",
						"parentDir":"jbrowseFeature",
						"directory":true,
						"size":"4096",
						"modified":1332896136,
						"children":["test1.tx2",
						"test1.txt",
						"test2"]
					},
					{"name":"testB",
						"path":"testB",
						"parentPath":"jbrowseFeature",
						"parentDir":"jbrowseFeature",
						"directory":true,
						"size":"4096",
						"modified":1332896369,
						"children":["test",
						"testB2"]
					}
				]
			}
		},
		
		"/data/sequence/demo/jbrowseFeature/testB" :	{
			username	:	"admin",
			fileSystem 	:	{
				"name":"testB",
				"path":"jbrowseFeature/testB",
				"total":"2",
				"items": [
					{
						"name":"test",
						"path":"test",
						"parentPath":"jbrowseFeature/testB",
						"parentDir":"jbrowseFeature/testB",
						"directory":true,
						"size":"4096",
						"modified":1332897136,
						"children": [
							"test1.tx2",
							"test1.txt",
							"test2"]
					},
					{
						"name":"testB2",
						"path":"testB2",
						"parentPath":"jbrowseFeature/testB",
						"parentDir":"jbrowseFeature/testB",
						"directory":true,
						"size":"4096",
						"modified":1332897005,
						"children":["testB2.txt"]
					}
				]
			}
		},

		"/data/sequence/demo/jbrowseFeature/testB/testB2" :	{
			username	:	"admin",
			fileSystem	: {
				"name":"testB2",
				"path":"jbrowseFeature/testB/testB2",
				"total":"1",
				"items": [
					{
						"name":"testB2.txt",
						"path":"testB2.txt",
						"parentPath":"jbrowseFeature/testB/testB2",
						"parentDir":"jbrowseFeature/testB/testB2",
						"directory":false,
						"size":"12",
						"modified":1332897236,
						"sample":"testB2&nbsp;text&nbsp;",
						"bytes":"200"
					}
				]
			}
		}
	}
},

getFileCache : function (location) {
	var fileCaches = this.getGeneric("filecaches");
	console.log("Data.getFileCache    fileCache: " + dojo.toJson(fileCaches));
	
	return fileCaches[location];
},

getFileSystem : function (putData, callback, args) {
	console.log("Data.getFileSystem    putData:");
	console.dir({putData:putData});
	console.log("Data.getFileSystem    callback:");
	console.dir({callback:callback});
	console.log("Data.getFileSystem    args:");
	console.dir({args:args});
	
	// SET DEFAULT ARGS EMPTY ARRAY
	if ( ! args )
		args = new Array;
	
	// SET LOCATION
	var location = putData.location;
	if ( putData.query ) {
		if ( location )
			location += "/";
		location += putData.query;
	}
	console.log("Data.getFileSystem     location: " + location);
	
	// RETURN IF CACHED
	var fileCache = this.getFileCache(location);
	console.log("Data.getFileSystem    fileCache:");
	console.dir({fileCache:fileCache});
	
	
	if ( fileCache )
		return fileCache;
	
	// QUERY REMOTE
	var thisObject = this;
	var putArgs = {
		url			: 	putData.url,
		contentType	: 	"text",
		sync		: 	false,
		preventCache: 	true,
		handleAs	: 	"json-comment-optional",
		putData		: 	dojo.toJson(putData),
		handle		:	function(response) {
			console.log("Data.getFileSystem    handle    response:");
			console.dir({response:response});
			
			args.push(response);
			console.log("Data.getFileSystem    handle    args:");
			console.dir({args:args});
			
			callback(args);
		}
	};
	var deferred = dojo.xhrPut(putArgs);
	
	if ( callback )
		deferred.addCallback(callback);
},

// GENERIC METHODS
getGeneric : function (name) {
	return this.cloneData(name);
}

