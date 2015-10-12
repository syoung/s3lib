var reload = function () {
console.clear();
dojo.reload("plugins.dojox.data.FileStore");
dojo.reload("dojox.widget.RollingList");
dojo.reload("plugins.files.TitlePane");
dojo.reload("plugins.files._GroupDragPane");
dojo.reload("plugins.files.FileDrag");
dojo.reload("plugins.files.FileMenu");
dojo.reload("plugins.files.WorkflowMenu");
dojo.reload("plugins.folders.ProjectFiles");
dojo.reload("plugins.folders.SourceFiles");
dojo.reload("plugins.folders.Folders");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};

var doPollCopy = function () {
    console.clear();

    var projectFiles = Agua.controllers["folders" ].tabPanes[0].projectFiles;
    console.log("projectFiles: ");
    console.dir({projectFiles:projectFiles});
    projectFiles.refreshFileDrags();

    var folders = Agua.getProjects();
    var projectName = folders[0].name;
    var fileDrag = projectFiles.getFileDragByProject(projectName);
    console.dir({fileDrag:fileDrag});    

    var dragPanes = fileDrag.getChildren();
    console.log("ProjectFiles.openLocation    dragPanes.length: " + dragPanes.length);
    console.dir({dragPanes:dragPanes});
    var dragPane = dragPanes[0];
    dragPane.url = "../cgi-bin/agua/folders.cgi";
    dragPane.putData = {
mode        : "fileCopy",	
sessionId    : "9999999999.9999.999",
url        :    "../cgi-bin/agua/folders.cgi?",
username    :    "admin" 
};

    // SET RESPONSE STATUS
    dragPane.url = Agua.cgiUrl + "/t/test.cgi?response={'status':'copying'}&";

dragPane.showMessage = function (msg) {
    console.log("_GroupDragPane.showMessage    msg: " + msg);
};

dragPane.pollCopy = function() {
	console.log("_GroupDragPane.pollCopy    this.url: " + this.url);
	if ( ! this.url  || ! this.putData ) {
		if ( this.standby )
			this.standby.hide();
		return;
	}
	
	this.putData.modifier = "status";
	console.log("XXXXX_GroupDragPane.pollCopy    this.putData: ");
	console.dir({this_putData:this.putData});

	var thisObject = this;
	var completed = false;
	dojo.xhrPut({
		url			: 	thisObject.url,
		handleAs	: 	"json-comment-optional",
		sync		: 	false,
		putData		:	dojo.toJson(this.putData),
		handle		: 	function (response) {
			console.log("_GroupDragPane.pollCopy    this.response: ");
			console.dir({response:response});
			
			if ( response.status == 'completed' )
				completed = true;
			else if ( response.error ) {
				//Agua.toastError(response.error);
				//thisObject.timer.stop();
			}
			else
				thisObject.delayedPollCopy();
		}
	});
};

dragPane.delayedPollCopy = function() {
	console.log("XXXXXXX _GroupDragPane.delayedPollCopy    Doing this.sequence.go(commands, ...)");
        var thisObject = this;
	var commands = [
//            { func: [dojo.hitch(console,"log","woot"), window, "woot2?"], pauseAfter: 1000, repeat:20 },	
            { func: [dojo.hitch(thisObject, "showMessage", "Pausing for 2 seconds")], pauseAfter: 2000 },
	    { func: [dojo.hitch(thisObject, "pollCopy")] } 
	];
	console.log("_GroupDragPane.delayedPollCopy    commands: " + commands);
	console.dir({commands:commands});
	
	this.sequence.go(commands, function(){ console.log('completed commands'); });	
};

    // DO pollCopy
    dragPane.pollCopy();
    


};


//reload();

doPollCopy();



