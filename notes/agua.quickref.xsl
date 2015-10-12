agua.quickref




<entry [Thu 2012:07:19 06:19:20 EST] <entry [Fri 2012:06:01 23:43:18 EST] agua STAGING SCHEMA>

syoung:aguadev  commits                         PRIVATE
syoung:agua     builds (testing)                PRIVATE
agua:aguadev    major,minor,patches (testing)   
agua:agua       major,minor,patches (release)   PUBLIC
    
    
</entry>
<entry [Tue 2012:07:10 01:22:40 EST] FIREBUG TEST: UPLOADER>

LOAD FILEMANAGER:

var doIt = function () {
    console.clear();
    dojo.reload("plugins.folders.ProjectFiles");
    dojo.reload("plugins.folders.SourceFiles");
    dojo.reload("plugins.folders.SharedProjectFiles");
    dojo.reload("plugins.folders.SharedSourceFiles");
    dojo.reload("plugins.folders.Folders");
    dojo.reload("plugins.files.FileManager");
    dojo.reload("plugins.files.Controller");
    dojo.reload("plugins.core.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();

    dojo.addOnLoad( function() {
        if ( Agua.fileManager )
            Agua.fileManager.destroy();
        Agua.fileManager = new plugins.files.FileManager({
            paneId: "projects" + this.paneId,
            tabsNodeId: "tabs"
            //selectCallback: selectCallback,
            //addCallback: addCallback,
            //parentWidget: this
            //core: this.core
        }); 
        console.log("files.Controller.createFileManager    Agua.fileManager: ");
        console.dir({Agua_fileManager:Agua.fileManager});    
    });

};

doIt();
//dojo.reloadCss();



GET UPLOADER:

var fileuploader = Agua.fileManager.fileMenu.uploader;
console.dir({fileuploader:fileuploader});
    
</entry>
<entry [Mon 2012:07:09 14:47:22 EST] FIRBUG TESTS: SHARING>
    
SOURCES

var doIt = function () {
    console.clear();
    
    dojo.reload("plugins.form.DndSource");
    dojo.reload("plugins.form.EditForm");
    dojo.reload("plugins.admin.Sources");
    dojo.reload("plugins.core.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()

    console.clear();
};

doIt();
//dojo.reloadCss();


GROUP SOURCES

var doIt = function () {
    console.clear();
    dojo.reload("plugins.admin.GroupSources");
    dojo.reload("plugins.core.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();
};

doIt();
//dojo.reloadCss();



</entry>
<entry [Fri 2012:07:06 06:32:51 EST] USE RSYNC TO COPY AGUA TO LaCie EXTERNAL (UPDATED: NO VERSION NUMBER)>

GIT VERSION
git describe --tags --abbrev=1
    0.8.0-alpha.1+build10-7-gb75bae

CREATE DIR
mkdir -p /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build10

COPY FILES
sudo rsync -av --safe-links /agua/* /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build10

COPY .GIT DIR
cp -r /agua/.git /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build10
   
CHECK FILES
ll /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build10


COPY AGUATEST
-------------
mkdir -p /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10
sudo rsync -av --safe-links /repos/private/syoung/aguatest/* /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10
cp -r /repos/private/syoung/aguatest/.git /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10
ll /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10

    
</entry>
<entry [Sun 2012:05:13 01:35:41 EST] FIREBUG TESTS: LOGIN>

var doIt = function () {
console.clear();
dojo.reload("plugins.login.Login");
dojo.reload("plugins.core.reload");
dojo.reloadPage();
};
doIt();
//dojo.reloadCss();

    
</entry>
<entry [Mon 2012:04:23 00:36:18 EST] FIREBUG TESTS: FOLDERS Folders>
    

COMPACT VERSION:

console.clear();
var doIt = function () {
    console.clear();    
    dojo.reload("plugins.folders.reload");
    dojo.reload("plugins.core.reload");
    dojo.reloadPage()
    console.clear();

    setTimeout(function() {
        console.log("XXXX Doing setTimeout");
        Agua.controllers["folders"].createTab();
    },
   5000,    
    this);

    setTimeout(function() {
        console.log("XXXX Doing openLocation");
        Agua.controllers["folders"].tabPanes[0].projectFiles.openLocation("Project1/Workflow1");
    },
   10000,    
    this);
};

doIt();
//dojo.reloadCss();

    




FULL VERSION:

console.clear();
var doIt = function () {
    console.clear();    
    dojo.reload("plugins.files.TitlePane");
    dojo.reload("plugins.folders.Files");
    dojo.reload("plugins.folders.Folders");
    dojo.reload("plugins.files.FileMenu");
    dojo.reload("plugins.files.FolderMenu");
    dojo.reload("plugins.files.WorkflowMenu");
    dojo.reload("plugins.folders.Files");
    dojo.reload("plugins.folders.ProjectFiles");
    dojo.reload("plugins.files._GroupDragPane");
    dojo.reload("plugins.files.FileDrag");
    dojo.reload("plugins.core.loadAgua");
    dojo.reload("plugins.core.Agua.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();

    setTimeout(function() {
        console.log("XXXX Doing setTimeout");
        Agua.controllers["folders"].createTab();
    },
   5000,    
    this);

    setTimeout(function() {
        console.log("XXXX Doing openLocation");
        Agua.controllers["folders"].tabPanes[0].projectFiles.openLocation("Project1/Workflow1");
    },
   10000,    
    this);
};

doIt();
//dojo.reloadCss();



//console.dir({workflows:Agua.data.workflows});


//Agua.removeFileTree('admin', 'Project2/Workflow3');


Agua.hashLength = function (hash) {
    i = 0;
    for ( index in hash ) i++;
    console.log("Agua.hashLength    Returning i: " + i);

    return i;
};


Agua.removeItemFromParent = function (parent, childName) {
	console.log("Data.removeItemFromParent    parent.items: ");
	console.dir({parent_items:parent.items});
	console.log("Data.removeItemFromParent    childName: " + childName);
	console.log("Data.removeItemFromParent    parent.items.length: " + parent.items.length);

	for ( i = 0; i < parent.items.length; i++ ) {
		console.log("Data.removeItemFromParent    Checking child " + i);
		var childObject = parent.items[i];
		console.log("Data.removeItemFromParent    childObject: ");
		console.dir({childObject:childObject});	
		if ( childObject.name == childName ) {
			console.log("Data.removeItemFromParent    DELETING childName: " + childName);
			parent.items.splice(i, 1);
			break;
		}
	}

	console.log("Data.removeItemFromParent    AFTER parent.items: ");
	console.dir({parent_items:parent.items});
};


var removeItem = function () {

    var parent = Agua.data.filecaches.admin.Project2;
    var itemName = "Workflow3";
    Agua.removeItemFromParent(parent, itemName);
};


removeItem();


// _GroupDragPane.deleteItem

var dragPane = dijit.byId("plugins_files__GroupDragPane_5");
console.dir({dragPane:dragPane});

//dragPane.insertEmptyItem();
//dragPane.onItems();



</entry>
<entry [Tue 2012:04:03 10:38:05 EST] FIREBUG TESTS: FOLDERS FileManager>


console.clear();
var doIt = function () {
    console.clear();    
    dojo.reload("plugins.workflow.ParameterRow");
    dojo.reload("plugins.workflow.Workflow");
    dojo.reload("plugins.files.FileMenu");
    dojo.reload("plugins.files.FileManager");
    dojo.reload("plugins.files.Controller");
    dojo.reload("plugins.core.reload");
    dojo.reloadPage()
    console.clear();

    setTimeout(function() {
        Agua.controllers["workflow"].createTab();

//Agua.fileManager = new plugins.files.FileManager({});

    },
   5000,    
    this);
};

doIt();
//dojo.reloadCss();





var doIt = function () {
    console.clear();
    dojo.reload("plugins.folders.ProjectFiles");
    dojo.reload("plugins.folders.SourceFiles");
    dojo.reload("plugins.folders.SharedProjectFiles");
    dojo.reload("plugins.folders.SharedSourceFiles");
    dojo.reload("plugins.folders.Folders");
    dojo.reload("plugins.files.FileManager");
    dojo.reload("plugins.files.Controller");
    dojo.reload("plugins.core.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();
};

doIt();
//dojo.reloadCss();




OR LOAD FILEMANAGER:


var doIt = function () {
    console.clear();
    dojo.reload("plugins.folders.ProjectFiles");
    dojo.reload("plugins.folders.SourceFiles");
    dojo.reload("plugins.folders.SharedProjectFiles");
    dojo.reload("plugins.folders.SharedSourceFiles");
    dojo.reload("plugins.folders.Folders");
    dojo.reload("plugins.files.FileManager");
    dojo.reload("plugins.files.Controller");
    dojo.reload("plugins.core.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();

    dojo.addOnLoad( function() {
        if ( Agua.fileManager )
            Agua.fileManager.destroy();
        Agua.fileManager = new plugins.files.FileManager({
            paneId: "projects" + this.paneId,
            tabsNodeId: "tabs"
            //selectCallback: selectCallback,
            //addCallback: addCallback,
            //parentWidget: this
            //core: this.core
        }); 
        console.log("files.Controller.createFileManager    Agua.fileManager: ");
        console.dir({Agua_fileManager:Agua.fileManager});    
    });

};

doIt();
//dojo.reloadCss();




    
</entry>
<entry [Tue 2012:03:06 04:33:30 EST] COPY TO LACIE WITH RSYNC>
    
1. COPY ALL EXCEPT LINKED DIRS, E.G., plugins/view/jbrowse/species AND plugins/view/jbrowse/users

sudo rsync -av --safe-links /agua/0.6/* /media/LaCie/u10.10/syoung/0.6


TEST 
rsync -av --safe-links /agua/0.6/html/plugins/view/jbrowse/ /tmp/jbrowse6
    OK


NB: THIS COPIES ALL species AND users FILES
sudo rsync -av --copy-unsafe-links /agua/0.6/* /media/LaCie/u10.10/syoung/0.6
  
</entry>
<entry [Wed 2012:02:22 09:56:14 EST] FIREBUG TESTS: CORE>
    
var doIt = function () {

console.clear();
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()

};

doIt();
//dojo.reloadCss();


</entry>
<entry [Wed 2011:11:30 18:13:24 EST] FIREBUG TESTS: VIEW>

var doIt = function () {
console.clear();
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.reload");
dojo.reloadPage();
};
doIt();
//dojo.reloadCss();



    
</entry>
<entry [Sun 2011:11:27 05:20:30 EST] FIRDBUG TESTS: FOLDERS openLocation>

SEE FILE apps/js/openLocation.v1.js


</entry>
<entry [Mon 2011:08:08 01:24:17 EST] FIREBUG TESTS: HOME>

HOME PANE FIREBUG TESTS
=======================

var doIt = function () {
console.clear();
dojo.reload("plugins.home.Home");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};
doIt();
//dojo.reloadCss();


var update = function () {
console.clear();
var packageObject = { "owner": "agua", "installdir": "/agua/bioapps", "version": "0.7.0", "status": "ready", "description": "", "datetime": "2012-02-13 03:48:41", "package": "bioapps", "username": "admin", "opsdir": "/agua/repos/public/agua/biorepository/agua/bioapps", "notes": "", "current": [ "0.7.0", "0.7.1", "0.7.2" ], "url": "" };

var home = Agua.controllers["home"].tabPanes[0];
home.packageCombo.set('value', "bioapps");
home.updatePackage(packageObject);
}

var stop = function () {
    //dojo.reloadCss();
    var home = Agua.controllers["home"].tabPanes[0];
    console.dir({home:home});
    //home.stopProgress();
}

doIt();
//update();
//stop();
//dojo.reloadCss();


var home = Agua.controllers["home"].tabPanes[0];
var progresspane = home.progressPane;

var canvas= progresspane.canvas;
var content = canvas.childNodes[1].innerHTML;
console.dir({content:content});


home.pollProgress = function (url, version, packageObject) {
	console.log("Home.pollProgress    Home.pollProgress(url, version)");
	console.log("Home.pollProgress    url: " + url);
	console.log("Home.pollProgress    version: " + version);
	
	if ( this.timer ) {
		this.timer.start();
		return;
	}
	
	this.timerInterval = 30000; 	// 1000ths OF A SECOND	
	console.log("Home.pollProgress    this.timerInterval: " + this.timerInterval);
	this.timer = new dojox.timing.Timer;
	console.log("Home.pollProgress    Created this.timer: " + this.timer);
	this.timer.setInterval(this.timerInterval);
	
	var thisObject = this;	
	this.timer.onTick = function() {
		console.log("Home.pollProgress    timer onTick: " + new Date().toTimeString());
		console.dir({thisObject:thisObject});
		thisObject.progressPane.set('href', '');
		thisObject.progressPane.set('href', url);
		thisObject.progressPane.show();
		
	
		var canvas= thisObject.progressPane.canvas;
		var content = canvas.childNodes[1].innerHTML;
		console.log("Home.pollProgress    content:");
		console.dir({content:content});

		var report = thisObject.progressPane.containerNode.innerHTML;
		
	
		console.dir({report:report});
		var reportedVersion = thisObject.reportedVersion();
		console.log("reportedVersion: " + reportedVersion);

		//if ( report.match(/Completed installation, reportedVersion:\s*(\S+)/) ) {
		//	console.log("MATCHED");
		//	reportedVersion = report.match(/Completed installation, reportedVersion:\s*(\S+)/)[1];
		//}
		if ( reportedVersion )  {
			console.log("reportedVersion is defined: " + reportedVersion + ". Stopping timer");
			thisObject.timer.stop();
			
			packageObject.version = reportedVersion;
			thisObject.setVersion(packageObject);
	
			// RELOAD RELEVANT DISPLAYS
			Agua.updater.update("updatePackages", { original: thisObject });	
		}
	};	
	
	this.timer.start();
	dojo.attr(this.timer, 'isRunning', true);
};


home.setProgressPane = function () {
	console.log("plugins.home.Home.setProgressPane");
	console.dir({progressPane:this.progressPane});

	// SET CLASS
	dojo.attr(this.progressPane.domNode, 'class', 'home progressPane dojoxDialog dijitDialog');

	var thisObject = this;

	this.progressPane.close = dojo.hitch(this, function() {
		console.log("plugins.home.Home.setProgressPane    this.progressPane.close");
		this.progressPane.minimize();
		this.timer.stop();
		dojo.attr(this.timer, 'isRunning', false);
	});
	
	this.progressPane.onDownloadError = dojo.hitch(this, function() {
		console.log("Home.setProgressPane    this.progressPane.onLoadError");
	});

	this.progressPane._onShow = dojo.hitch(this, function() {
		console.log("plugins.home.Home.setProgressPane    this.progressPane._onShow");
	});

};


</entry>
<entry [Mon 2011:08:08 01:24:17 EST] FIREBUG TESTS: WORKFLOW>

WORKFLOW PANE FIREBUG TESTS
===========================

console.clear();
var doIt = function () {
    console.clear();    
    dojo.reload("plugins.workflow.reload");
    dojo.reload("plugins.core.reload");
    dojo.reloadPage()
    console.clear();

    setTimeout(function() {
        console.log("XXXX Doing setTimeout");
        Agua.controllers["workflow"].createTab();
    },
   5000,    
    this);
};

doIt();
//dojo.reloadCss();






WORKFLOWS.updateDropTarget

var update = function (){

console.clear();
Agua.controllers["workflow"].tabPanes[0].core.userWorkflows;
console.dir({workflows:workflows});
workflows.updateDropTarget('Project1', 'Workflow1');

};

//update();


STANDBY

var doIt = function () {
    console.clear();
    dojo.reload("plugins.workflow.Workflows");
    dojo.reload("plugins.workflow.Workflow");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();
};

doIt();
//dojo.reloadCss();


var workflow = Agua.controllers["workflow"].tabPanes[0];
console.dir({workflow:workflow});
var standby = workflow.core.Workflows.standby;
console.dir({standby:standby});


STAGEROW

var doIt = function () {
    console.clear();
    dojo.reload("plugins.workflow.StageRow");
    dojo.reload("plugins.workflow.Workflows");
    dojo.reload("plugins.workflow.Workflow");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();
};

doIt();
//dojo.reloadCss();


STAGES

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.RunStatus");
dojo.reload("plugins.workflow.StageRow");
dojo.reload("plugins.workflow.Workflows");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
console.clear();
Agua.controllers["workflow"].createTab();
};
doIt();
//dojo.reloadCss();


PROJECT PANEL

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.WorkflowStage");
dojo.reload("plugins.workflow.ProjectWorkflow");
dojo.reload("plugins.workflow.ProjectPanel");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
};
doIt();
//dojo.reloadCss();

RUNSTATUS

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.RunStatus");
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.reload");
dojo.reloadPage()
};

doIt();
//dojo.reloadCss();

var doStage = function() {
    var stages = Agua.controllers["workflow"].tabPanes[0].core.Workflows;
    //console.dir({stages:stages});
    stages.checkStages();
};




SHARED APPS

console.clear();
var doIt = function () {

dojo.reload("plugins.core.Agua");
dojo.reload("plugins.workflow.SharedApps");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();

}
doIt();


PARAMETERS

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
}
doIt();

var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters;



PARAMETER ROW

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.ParameterRow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
}
doIt();

var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters;
//var appType = dijit.byNode(parameters.domNode.childNodes[0]);
//appType;
var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters;
var parameterRow = dijit.byNode(parameters.inputRows.childNodes[0]);
parameterRow;



STAGE ROW

console.clear();
var doIt = function () {
dojo.reload("plugins.core.Agua");
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.workflow.StageRow");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.workflow.ParameterRow");
//dojo.reload("plugins.form.EditForm");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
};
doIt();

var stages = Agua.controllers["workflow"].tabPanes[0].core.Workflows;
var stageRow = stages.dropTarget.getAllNodes()[0].parentWidget;
//stageRow.checkValidParameters();


STAGES (STANDBY)

console.clear();
var doIt = function () {
dojo.reload("plugins.workflow.Workflows");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
};
doIt();

var stages = Agua.controllers["workflow"].tabPanes[0].core.Workflows;
console.dir({standby: stages.WorkflowsStandby});


FILEMANAGER

var workflow = Agua.controllers["workflow"].tabPanes[0];
var fileman = workflow.core.fileManager;
fileman;
//fileman.show();
fileman.hide();


    
</entry>
<entry [Mon 2011:08:08 01:24:01 EST] FIREBUG TESTS: ADMIN>
    
SETTINGS

console.clear();
var admin = Agua.controllers["admin"].tabPanes[0];
var settings = admin.paneWidgets["plugins.admin.Settings"][0];
console.dir({settings:settings});

//var amazonuserid = settings.amazonuserid.value();
//console.log({amazonuserid:amazonuserid});

var secret = settings.secretaccesskey;
var value = secret.get('value');
console.log("value: " + value);



APPS

console.clear();
var doIt = function () {
    dojo.reload("plugins.core.Agua");
    //dojo.reload("plugins.form.EditRow");
    dojo.reload("plugins.admin.Apps");
    dojo.reloadPage()
    Agua.controllers["admin"].createTab();
}
doIt();


AMIS

console.clear();
var doIt = function () {

    dojo.reload("plugins.admin.Amis");
    dojo.reload("plugins.admin.Admin");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    Agua.controllers["admin"].createTab();
}
doIt();


AWS

console.clear();
var doIt = function () {
    dojo.reload("plugins.admin.Aws");
    dojo.reload("plugins.admin.Admin");
    dojo.reload("plugins.core.reload");
    dojo.reloadPage();
    Agua.controllers["admin"].createTab();
}
doIt();


CLUSTERS

console.clear();
var doIt = function () {

    dojo.reload("plugins.admin.Clusters");
    dojo.reload("plugins.admin.Admin");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    Agua.controllers["admin"].createTab();
}
doIt();
	

HUB

console.clear();
var doIt = function () {
    dojo.reload("plugins.admin.Hub");
    dojo.reload("plugins.admin.Admin");
    dojo.reload("plugins.core.reload");
    dojo.reloadPage();
}
doIt();


PARAMETERS

console.clear();

var doIt = function () {

dojo.reload("plugins.core.Agua");
dojo.reload("plugins.admin.Parameters");
dojo.reloadPage()
Agua.controllers["admin"].createTab();

}
doIt();

var params = Agua.controllers["admin"].tabPanes[0].paneWidgets("plugins.admin.Parameters")[0];
params;


    
</entry>
<entry [Wed 2011:08:07 13:25:19 EST] SHUTDOWN/STARTUP HEADNODE AND MASTER>


SHUT DOWN
=========

ec2stop $head $master
#ec2-stop-instances i-98b09ef8 i-b34d25d2
    INSTANCE	i-98b09ef8	running	stopping
    INSTANCE	i-b34d25d2	running	stopping


START UP
========

ec2start $head $master
# ec2-start-instances i-98b09ef8 i-b34d25d2
  
fixip
ADDRESS	107.20.137.20	i-b34d25d2

</entry>
<entry [Tue 2011:06:28 02:37:53 EST] DOJO DND SUBSCRIBERS>

dojo.subscribe("/dnd/start", function(source){
	console.debug("/dnd/start Starting the drop", source);
});

dojo.subscribe("/dnd/drop/before", function(source, nodes, copy, target){
    console.debug(copy ? "/dnd/drop/before Copying from" : "Moving from", source, "to", target, "before", target.before);
});

dojo.subscribe("/dnd/drop", function(source, nodes, copy, target){
    console.debug(copy ? "/dnd/drop Copying from" : "Moving from", source, "to", target, "before", target.before);
});
    
</entry>
<entry [Mon 2011:06:27 19:44:04 EST] CLEAR FIREFOX CACHE USING about:config>

http://kb.mozillazine.org/Firefox_:_FAQs_:_About:config_Entries

1. SET CACHE TO FALSE IN CONFIG
###about->config --> browser.memory.cache.enable --> SET TO FALSE
about->config --> browser.cache.memory.enable --> SET TO FALSE

2. SET CACHE SIZE TO ZERO IN OPTIONS

Edit --> Preferences --> Advanced --> Offline storage --> SET TO ZERO
### Tools --> Options --> Privacy --> Offline Storage --> 0 MB
### Tools --> Options --> Privacy --> Network --> Cache size --> SET TO ZERO
    
</entry>
<entry [Mon 2011:06:27 19:43:21 EST] WIDGET CREATION METHOD CALL SEQUENCE>

http://www.dojotoolkit.org/book/dojo-porting-guide-0-4-x-0-9/widgets/custom

postMixInProperties()
buildRendering()        - swaps out the source HTML with the widget's HTML, typically from a template. _Templated mixin defines this function.

postCreate()            Note that the children don't yet exist
startup()               is called after all the other widgets have been created

NB: No arguments are passed to these functions.


EXAMPLES FROM Workflow.js:
--------------------------

// CONSTRUCTOR	
// Any initialization code would go here in the constructor.
// plugins.report.Template and its superclasses dijit._Widget and
// dijit._Templated do not have parameters in their constructors, so
// there wouldn't be any multiple-inheritance complications
// if you were to include some paramters here.

constructor : function(args) {
	// LOAD CSS
	this.loadCSS();
	
	// SET ARGS
	this.attachWidget = Agua.tabs;

	if ( args != null )
	{
		this.project = args.project;
		this.workflow = args.workflow;
	}
	
	// SET CORE CLASSES
	this.core.workflow = this;
},


// POSTMIXINPROPERTIES
//Inherited from dijit._Widget and called just before template
//instantiation in buildRendering. This method is especially useful
//for manipulating the template before it becomes visible.

postMixInProperties: function() {

},

// POSTCREATE
//You can override this method to manipulate widget once it is
//placed in the UI, but be warned that any child widgets contained
//in it may not be ready yet.        

postCreate: function() {
	this.startup();
},


</entry>
<entry [Mon 2011:06:27 19:42:38 EST] DIJIT WIDGET REGISTRY>

// GET ARRAY OF REGISTERED WIDGETS
var widgets = dijit.registry.byClass("dijit.layout.BorderContainer");

// RUN A FUNCTION FOR EVERY AVAILABLE WIDGET 
dijit.registry.forEach(function(widget, index, hash){

    if ( widget.id == this.id )
    {
        console.log("RUN A FUNCTION ON widget " + widget);
    }
});


// A STRAIGHT LOOP THROUGH THE WIDGETS
for ( var widget in widgets )
{
    console.log("dijit.layout.BorderContainer.postMixInProperties    widget: " + widget);
}


</entry><entry [Fri 2011:05:13 17:54:43 EST] CREATE BUILD *tar.gz RELEASE FILE>

/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.6 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /home/syoung/RELEASE
    
</entry>
