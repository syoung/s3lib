<entry [Sat 2012:05:26 16:39:27 EST] FIXED folders/copyFile/test.html - CHECK FILE EXISTS AND STANDBY>

Agua.isFileCacheItem = isFileCacheItem = function (username, directory, itemName) {

	console.log("Agua.isFileCacheItem     username: " + username);
	console.log("Agua.isFileCacheItem     directory: " + directory);
	console.log("Agua.isFileCacheItem     itemName: " + itemName);

	var fileCache = this.getFileCache(username, directory);
	console.log("Agua.isFileCacheItem     fileCache: " + fileCache);
	console.dir({fileCache:fileCache});
	
	if ( ! fileCache || ! fileCache.items )	return false;
	
	for ( var i =0; i < fileCache.items.length; i++ ) {
		if ( fileCache.items[i].name == itemName)	return true;
	}
	
	return false;
};

var username = "aguatest";
var directory = "Project1/Workflow1";
var item    = "test-array-sgeid.sh";
var isItem = Agua.isFileCacheItem(username, directory, item);

console.log("isItem: " + isItem);

    
</entry>
<entry [Thu 2012:05:24 18:12:36 EST] dojo DND MOVE TEST dojo.subscribe LISTENERS>


dojo.subscribe("/dnd/drop", function(target){
	console.log("/dnd/drop");
	console.log("target: " + target);
	console.log("dojo.dnd.manager().target: " + dojo.dnd.manager().target);
});

dojo.subscribe("/dnd/start", function(target){
	console.log("/dnd/start");
	console.log("target.accept: ");
	console.dir(target.accept);
	console.log("dojo.dnd.manager().target: " + dojo.dnd.manager().target);
});

dojo.subscribe("/dnd/cancel", function(target){
	console.log("/dnd/cancel");
	console.log("target: " + target);
	console.log("dojo.dnd.manager().target: " + dojo.dnd.manager().target);
});


    
</entry>
<entry [Wed 2012:05:23 22:42:42 EST] VIEW PASSED DOH TESTS>

http://localhost/agua/t/plugins/runTests.html


    
</entry>
<entry [Wed 2012:05:23 05:43:12 EST] ONWORKING FIX REMOVE VIEW>


console.clear();

var doIt = function () {
console.clear();
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.reload");
dojo.reloadPage();
};


var view = Agua.controllers["view"].tabPanes[0];
console.dir({view:view});

view.removeBrowserTab = function (browser, projectName, viewName) {
	// REMOVE BROWSER TAB FROM PANE
	console.log("View.removeBrowserTab    DOING this.rightPane.removeChild(browser.mainTab)");
	
	this.rightPane.removeChild(browser.mainTab);
	console.log("View.removeBrowserTab    AFTER removeChild(browser.mainTab)");

return;
	
	// DESTROY BROWSER WIDGET	
	console.log("View.removeBrowserTab    BEFORE browser.destroy(), browser: " + browser);
	browser.destroyRecursive();
	console.log("View.removeBrowserTab    AFTER browser.destroy(), browser: " + browser);

	return true;
};





var remove = function () {

var response = { status: "none" };

var viewObject = {
project: "Project1",
view :    "View21"
};

view._handleRemoveView(response, viewObject);

};



//doIt();
remove();





=======



var doIt = function () {
console.clear();
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.reload");
dojo.reloadPage();
};

var doStandby = function () {

console.log("DOING doStandby");

//console.clear();

var standby = dijit.byId("dojox_widget_Standby_1");
console.dir({standby:standby});

};


var view = Agua.controllers["view"]
.tabPanes[0];


view.removeBrowserTab = function (browser, projectName, viewName) {
	// REMOVE BROWSER TAB FROM PANE
	console.log("View.removeBrowserTab    plugins.view.View.removeChild(browser)");

	this.rightPane.removeChild(browser.mainTab);
	console.log("View.removeBrowserTab    AFTER removeChild(browser.mainTab)");

return;

	
	// DESTROY BROWSER WIDGET	
	console.log("View.removeBrowserTab    BEFORE browser.destroy(), browser: " + browser);
	browser.destroyRecursive();
	console.log("View.removeBrowserTab    AFTER browser.destroy(), browser: " + browser);

	return true;
},;


var remove = function () {

console.dir({view:view});
var projectName = "Project1";
var viewName = "View3";
var browser = view.getBrowser(projectName, viewName);
view.removeBrowserTab(browser, projectName, viewName);

};

//doIt();
//dojo.reloadCss();
//doStandby();

remove();

    
</entry>
<entry [Mon 2012:05:21 15:39:50 EST] TEST VIEW removeViewFeature>


var view = Agua.controllers["view"].tabPanes[0];
console.dir({view:view});


var viewObject = {
build	    :	"hg19",
mode	    :	"viewStatus",
project	    :	"Project1",
sessionId   :	"9999999999.9999.999",
species	    :	"human",
username    :	"aguatest",
view	    :	"View4"
};

Agua.




console.clear();

var doIt = function () {
console.clear();
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.reload");
dojo.reloadPage();
};
//doIt();
//dojo.reloadCss();

Agua.getPreviousView = function (viewObject) {
	console.log("Agua.View.getPreviousView    viewObject: ");
	console.dir({viewObject:viewObject});	

	var views = this.getViews();


	var viewsCopy = dojo.clone(views);
	var projectViews = this.filterByKeyValues(viewsCopy, ["project"], [viewObject.project]);

	console.log("Agua.View.getPreviousView    projectViews: ");
	console.dir({projectViews:projectViews});


	// GET PREVIOUS OR NEXT PROJECT IF NO VIEWS LEFT IN PROJECT
	if ( ! projectViews || projectViews.length == 0 ) {
		console.log("Agua.View.getPreviousView    BEFORE SORT views: ");
		console.dir({views:views});	
		
		views = this.sortHasharrayByKeys(views, ["project", "view"]);

		console.log("Agua.View.getPreviousView    AFTER SORT views: ");
		console.dir({views:views});	

		var index = this.getIndexInArray(views, viewObject, ["project", "view"]);
		console.log("Agua.View.getPreviousView    index: " + index);


	}
	
	
};

var viewObject = { project: "Project1", view: "View26" };
Agua.getPreviousView(viewObject);

    
</entry>
<entry [Thu 2012:05:17 21:56:40 EST] BACKED UP aguatest USER AND COPIED feature ENTRIES TO testuser>

1. DUMP aguatest

/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/t/dump/aguatest.120517.dump \
--database aguatest \
--username aguatest \
--tables "access:owner='aguatest',\
ami,\
app:owner='aguatest',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='aguatest',\
groupmember:name='aguatest',\
groups,\
package,\
parameter:owner='aguatest',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


2. CONVERT aguatest TO testuser FOR NEW feature VALUES


INSERT INTO feature VALUES ('testuser','Project1','Workflow1','control1','dynamic','human','hg19','/mnt/data/jbrowse/species/human/hg19/demo/control1');
INSERT INTO feature VALUES ('testuser','Project1','Workflow1','control2','dynamic','human','hg19','/mnt/data/jbrowse/species/human/hg19/demo/control2');
INSERT INTO feature VALUES ('testuser','Project1','Workflow1','test1','dynamic','human','hg19','/mnt/data/jbrowse/species/human/hg19/demo/test1');
INSERT INTO feature VALUES ('testuser','Project1','Workflow1','test2','dynamic','human','hg19','/mnt/data/jbrowse/species/human/hg19/demo/test2');


3. CREATE View1 AND View2 IN AGUA

</entry>
<entry [Tue 2012:05:15 03:13:57 EST] UPDATED TEST VIEW add/remove AFTER FILECACHE>



    
</entry>
<entry [Sun 2012:05:13 20:16:51 EST] FOLDERS openLocation>


var file = "Project2/test/test.out";
var destination = "Project1/Workflow1";
var destinationfile = "Project1/Workflow1/test.out";
var username = "aguatest";
var projectName = "Project1";
//////////////////////////////////////////////////
Agua.removeRemoteFile = function (username, location, callback) {
	console.log("Agua.File.removeRemoteFile    username: " + username);
	console.log("Agua.File.removeRemoteFile    location: " + location);
	console.log("Agua.File.removeRemoteFile    callback: " + callback);

	// DELETE ON REMOTE
	var url 			= 	Agua.cgiUrl + "folders.cgi?";
	var putData 		= 	new Object;
	putData.mode		=	"removeFile";
	putData.sessionId	=	Agua.cookie('sessionId');
	putData.username	=	Agua.cookie('username');
	putData.file		=	location;

	var thisObject = this;
	dojo.xhrPut(
		{
			url			: 	url,
			putData		:	dojo.toJson(putData),
			handleAs	: 	"json",
			sync		: 	false,
			handle		: 	function(response) {
				if ( callback )	callback(response);
			}
		}
	);
};

//////////////////////////////////////////
var copyFile = function () {

var folders = Agua.controllers["folders"].tabPanes[0];
console.log("runTests    ************************ COPY FILE ************************ folders:");
console.dir({folders:folders});

var fileDrag = folders.projectFiles.getFileDragByProject(projectName);
console.dir({fileDrag:fileDrag});
var dragPanes = fileDrag.getChildren();
console.log("copyFiles    dragPanes.length: " + dragPanes.length);
console.dir({dragPanes:dragPanes});

var dragPane = dragPanes[0];
dragPane.url = "../cgi-bin/agua/folders.cgi";
dragPane.putData = {
	mode        :     "copyFile",    
	sessionId   :     "9999999999.9999.999",
	url            :   "../cgi-bin/agua/folders.cgi?",
	username    :   "aguatest",
	file        :   file,
	destination :    destination
};    

console.log("copyFile    Doing timeout    dragSource.onDropExternal(source, nodes, copy)");

// SET COPY TARGET
var targetFileDrag = folders.projectFiles.fileDrags[0];
console.log("targetFileDrag: "); 
console.dir({targetFileDrag:targetFileDrag});

var targetDragPane = targetFileDrag.getChildren()[1];
console.log("targetDragPane: " + targetDragPane); 
console.dir({targetDragPane:targetDragPane});
var targetDragSource = targetDragPane._dragSource;

var sourceFileDrag = folders.projectFiles.fileDrags[1];
console.log("sourceFileDrag: "); 
console.dir({sourceFileDrag:sourceFileDrag});

// SET COPY SOURCE
var sourceDragPane = sourceFileDrag.getChildren()[0];
console.log("sourceDragPane ");
console.dir({sourceDragPane:sourceDragPane});

var sourceDragSource = sourceDragPane._dragSource;
console.log("sourceDragSource: ");
console.dir({sourceDragSource:sourceDragSource});

var dndItem = sourceDragSource.node.childNodes[0];
console.log("dndItem: " );
console.dir({dndItem:dndItem});

console.log("copyFile    Doing targetDragSource.onDropExternal() XXXXXXXXXXXXXXXXXXXXXXXXXXX");

targetDragSource.onDropExternal(sourceDragSource, [dndItem], true);

};


//Agua.removeRemoteFile(username, destinationfile, null);
copyFile();









var doIt = function () {
console.clear();
var folders = Agua.controllers["folders"].tabPanes[0];
console.log("runTests    folders:");
console.dir({folders:folders});

var file = "Project2/test/test.out";
var destination = "Project1/Workflow1";
var projects = Agua.getProjects();
var projectName = projects[0].name;
console.log("projectName: " + projectName);

var fileDrag = folders.projectFiles.getFileDragByProject(projectName);
console.log("HERE");
console.dir({fileDrag:fileDrag});

var username = "aguatest";
folders.projectFiles.openLocation(destination, username);
};

doIt();





console.clear();
var folders = Agua.controllers["folders"].tabPanes[0];
console.log("runTests    folders:");
console.dir({folders:folders});

var file = "Project2/test/test.out";
var destination = "Project1/Workflow1";
var projects = Agua.getProjects();
var projectName = projects[0].name;
console.log("projectName: " + projectName);

folders.projectFiles.openLocation = function (location, username) {
    console.log("Files.openLocation    location: " + location);
    console.log("Files.openLocation    username: " + username);
    
    var folders = location.split(/\//);
    var projectName = folders[0];
    var fileDrag = this.getFileDragByProject(projectName);
    console.log("Files.openLocation    fileDrag: ");
    console.dir({fileDrag:fileDrag});
    if ( ! fileDrag ) {
        //console.log("Files.openLocation    fileDrag is NULL. RETURNING");
        return;
    }

    var dragPanes = fileDrag.getChildren();
    console.log("Files.openLocation    dragPanes.length: " + dragPanes.length);
    console.dir({dragPanes:dragPanes});
    if ( ! dragPanes )
        fileDrag.startup();
    dragPanes = fileDrag.getChildren();
    console.log("Files.openLocation    dragPanes.length: " + dragPanes.length);
    console.dir({dragPanes:dragPanes});

//    if ( folders.length < 2 )    return;

    console.log("Files.openLocation    Doing this.folderRoundRobin(" + location + ", 1)");
    this.folderRoundRobin(location, 1);    
    this.folderRoundRobin(location, 1);    
};


folders.projectFiles.folderRoundRobin = function (location, index) {
	console.log("Files.folderRoundRobin    location: " + location);
	console.log("Files.folderRoundRobin    index: " + index);
	console.log("Files.folderRoundRobin    caller: " + this.folderRoundRobin.caller.nom);
	
	var folders = location.split(/\//);
	console.log("Files.folderRoundRobin    folders.length: " + folders.length);
	var projectName = folders[0];

	var fileDrag = this.getFileDragByProject(projectName);
	console.dir({fileDrag:fileDrag});    

	var dragPanes = fileDrag.getChildren();
	console.log("Files.folderRoundRobin    dragPanes.length: " + dragPanes.length);

	// SET CALLBACK
	var callback = dojo.hitch(this, "connectRoundRobin", fileDrag, location, index + 1);	

	// OPEN PANE IF NOT OPEN
	var thisObject;
	if ( dragPanes.length < index + 1 && index < folders.length ) {

        console.log("Files.folderRoundRobin    dragPanes.length < index + 1. Doing this.openFolder()");

		//setTimeout(function() {
        this.openFolder(dragPanes[index - 1], folders[index], callback);
//		},
//		1000,
//		this);
	}

	// REMOVE dojo.connect ON PREVIOUS DRAG PANE
	if ( index < 1 ) {
		console.log("Files.folderRoundRobin    index: " + index + ". No previousDragPane. Returning.");
		return;
	}
	var previousDragPane = dragPanes[index - 1];
	
	if ( previousDragPane._connection )
		dojo.disconnect(previousDragPane._connection);

	// REOPEN PANE IF WRONG FOLDER IS OPEN
	var dragPane = dragPanes[index];
	console.log("Files.folderRoundRobin    dragPane " + index + ": " + dragPane);

	var path = dragPane.path;
	console.log("Files.folderRoundRobin    Doing folder " + index + " path: " + path);
	var folderPath = this.folderPathByIndex(folders, index);
	console.log("Files.folderRoundRobin    Doing folder " + index + " folderPath: " + folderPath);
	
	if ( folderPath != path )
		this.openFolder(dragPanes[index - 1], folders[index], callback);
};

folders.projectFiles.openFolder = function (dragPane, name, callback) {
	console.log("Files.openFolder    dragPane: ");
        console.dir({dragPane:dragPane});
	console.log("Files.openFolder    name: " + name);
	
	// REMOVE 'SELECTED' STYLE ON ANY SELECTED ITEMS
	dragPane._dragSource._removeSelection();
	
	var itemIndex = this.getItemIndexByName(dragPane, name);
	console.log("Files.openFolder    itemIndex: " + itemIndex);
	if ( itemIndex < 0 )	return;
	
	var items = dragPane._dragSource.getAllNodes();
	console.log("Files.openFolder    items:");
	console.dir({items:items});
	
	// ADD CLASS dojoDndItemAnchor TO OPENED FOLDER
	console.log("Files.openFolder    Adding class 'dojoDndItemAnchor' to item " + itemIndex);
	dojo.addClass(items[itemIndex], 'dojoDndItemAnchor');
	
    var item = items[itemIndex].item;
    var event = { target: { item: item } };
	console.log("Files.openFolder    event:");
	console.dir({event:event});

	console.log("Files.openFolder    BEFORE this._connection:");
	console.dir({this_connection:this._connection});
	if ( this._connection )
		dojo.disconnect(this._connection);
	console.log("Files.openFolder    AFTER this._connection:");
	console.dir({this_connection:this._connection});

	delete this._connection;
	this._connection = dojo.connect(dragPane.parentWidget, "addChild", dojo.hitch(this, callback));
	//this._connection = dojo.connect(dragPane.parentWidget, "addChild", dojo.hitch(this, "testCallback", dragPane.parentWidget));
//	this._connection = dojo.connect(dragPane.parentWidget, "addChild", this, callback);
	//this._connection = dojo.connect(dragPane.parentWidget, "addChild", this, callback);
	
    dragPane.onclickHandler(event);	
};

var fileDrag = folders.projectFiles.getFileDragByProject(projectName);
console.log("HERE");
console.dir({fileDrag:fileDrag});

var username = "aguatest";
folders.projectFiles.openLocation(destination, username);


    
</entry>
<entry [Sat 2012:05:12 12:17:33 EST] LOGIN PROGRESS BAR>

console.clear();
var login = Agua.loginController;
login.setLoginStyle = function () {
	
	dojo.removeClass(this.message, "error");
	dojo.removeClass(this.message, "accepted");
	this.message.innerHTML = "Authenticating...";
	
	console.log("Login.setLoginStyle    Doing progress bar removeClass 'inactive'"); 
    console.dir({progressBar:login.progressBar});       
    dojo.removeClass(this.progressBar.domNode, "inactive");
};

login.setLogoutStyle = function () {
	console.log("Logout.setLogoutStyle    Getting ");
	
	// RESET LOGIN DIALOGUE
	this.message.innerHTML = this.loginMessage;
	dojo.removeClass(this.message, "error");
	dojo.removeClass(this.message, "accepted");

	// RESET LOGIN STATUS
	this.statusBar.username.innerHTML = 'Logged out';
	this.statusBar.launcher.innerHTML = 'Log In';

	console.log("Login.setLoginStyle    Doing progress bar addClass 'inactive'");        
    dojo.addClass(this.progressBar.domNode, "inactive");
};

Agua.loginController.setLoginStyle();



    
</entry>
<entry [Fri 2012:05:11 03:05:40 EST] DESTROY CONTROLLER WIDGETS ON LOGOUT>


var logout = function () {

console.clear();
var buttons = Agua.toolbar.getChildren();
console.dir({buttons:buttons});

for ( var i = 1; i < buttons.length; i++ ) {

    var button = buttons[i];
    controller = button.parentWidget;
    
    console.log("button " + i);
    console.dir({button:button});
    console.log("controller " + i);
    console.dir({controller:controller});
    
    console.log("Agua.logout    Doing controllers.destroyRecursive()");
    console.log("BEFORE dijit.registry.length: " + dijit.registry.length);
    
    controller.destroyRecursive();

    console.log("AFTER dijit.registry.length: " + dijit.registry.length);
}

};

logout();



var admin = Agua.controllers["home"].tabPanes[0];
//admin.destroy();
//dojo.destroy(admin);
//console.dir({admin:admin});




console.clear();

var buttons = Agua.toolbar.getChildren();
console.dir({buttons:buttons});

var tabs = Agua.tabs.getChildren();
console.dir({tabs:tabs});

var button = buttons[1];
console.dir({button:button});
var controller = button.parentWidget;
console.dir({controller:controller});






var doIt = function () {
    console.clear();
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();
};

doIt();
//dojo.reloadCss();



console.clear();
var admin = Agua.controllers["admin"];
console.dir({admin:admin});

var folders = Agua.controllers["folders"];
console.dir({folders:folders});

var destroyByNode = function(thisNode) {
var thisDijit = dijit.byNode(thisNode);
    if (thisDijit) {
        thisDijit.destroy();
    }         
    dojo.destroy(thisNode);
};
//admin.menuButton.destroy();


console.dir({Agua_toolbar:Agua.toolbar});

console.dir({Agua_tabs:Agua.tabs});

console.dir({admin_menuButton:admin.menuButton});
//Agua.tabs.removeChild(admin.menuButton);

dojo.destroy(folders.menuButton.domNode);

folders.destroy();
console.log("END");




var destroy = function () {

console.clear();
for ( var name in Agua.controllers ) {
    console.log("name : " + name);
   if ( name.match("login") 
    || name.match("plugins.core.Agua")
    || name.match("data") ) {
        console.log("Agua or Login. Next");
    }

    if ( Agua.controllers[name].destroyRecursive ) 
    {
        Agua.controllers[name].destroyRecursive();
    }
}

};



//destroy();

//dojo.reload("plugins.data.Controller");
//dojo.reloadPage();


    
</entry>
<entry [Tue 2012:05:08 22:27:17 EST] VIEW STATUS>

echo '{"username":"guest","sessionId":"9999999999.9999.999","database":"agua","project":"Project1","view":"View3","speciesBuild":"human","build":"hg19","mode":"viewStatus"}' | /var/www/cgi-bin/agua/view.cgi

    Content-type: text/html

    {"status":"ready","subroutine":"Agua::View::viewStatus","linenumber":"439","filename":"/mnt/agua/cgi-bin/lib/Agua/View.pm","timestamp":"2012-05-08 22:26:01"}

    
</entry>
<entry [Mon 2012:05:07 00:30:58 EST] GUEST USER ACCESS>

reset; echo '{"username":"guest","password":"guest","mode":"submitLogin","SHOWLOG":4}' | ./workflow.cgi

    { sessionId : '1336364998.14009.85' }



reset; echo '{"username":"guest","sessionId":"9999999999.9999.999","mode":"getTable","table":"workflows","SHOWLOG":4}' | ./workflow.cgi
    
    {
       "workflows" : [
          {
             "number" : "1",
             "provenance" : "",
             "notes" : "",
             "project" : "Project1",
             "name" : "Workflow1",
             "description" : "",
             "username" : "guest"
          }
       ]
    }

    
</entry>
<entry [Sun 2012:04:29 23:59:15 EST] FileMenu DELETE FILE>

console.clear();
var dragPane = dijit.byId("plugins_files__GroupDragPane_16");
console.dir({dragPane:dragPane});
var items = dragPane.items;
console.dir({items:items});

var path = dragPane.path;
console.log("path: " + path);
var folder = path.match(/([^\/]+)$/)[1];
console.log("folder: " + folder);


//dragPane.reloadPane();


dragPane.getPreviousPane = function () {
// RETURN THE PREVIOUS DRAG PANE IN THE FILE DRAG

	var fileDrag = this.parentWidget;
	console.dir({fileDrag:fileDrag});
	var index = 0;
	var children = fileDrag.getChildren();
	console.log("fileMenu.getPreviousPane    children.length: " + children.length);
	
	for ( var i = 0; i < children.length; i++ ) {
		if ( children[i] == this ) {
			index = i;
			break;
		}
	}
        if ( index == 0 )    return null;

        return children[index - 1];
}

var previousPane = dragPane.getPreviousPane();
console.dir({previousPane:previousPane});


var fileDrag = dragPane.parentWidget;
var fileMenu = fileDrag.fileMenu;
console.dir({fileMenu:fileMenu});

fileMenu.reloadPane(previousPane, folder);


    
</entry>
<entry [Fri 2012:04:20 22:58:48 EST] FOLDERS fileSystem>

echo '{"mode":"fileSystem","username":"admin","sessionId":"9999999999.9999.999","query":"Project1","SHOWLOG":4}' | ./folders.cgi


TEST fullPathJson:

fullpath: /nethome/admin/agua/Project1/Workflow1
2012-04-21 00:15:32    [DEBUG]   	Agua::Common::File::fullPathJson	217	outputpath: Project1/Workflow1
2012-04-21 00:15:32    [DEBUG]   	Agua::Common::File::fullPathJson	218	outputname: Workflow1
2012-04-21 00:15:32    [DEBUG]   	Agua::Common::File::fullPathJson	219	path: Project1/Workflow1
			

{
   "name" : "Workflow1",
   "path" : "Project1/Workflow1",
   "total" : "3",
   "items" : [
      {
         "name" : "downloadsX",
         "children" : [
            "chr22.fa",
            "chr22.fa.2bpb",
            "chr22.fa.vld",
            "lock",
            "scripts",
            "stdout"
         ],
         "path" : "downloadsX",
         "directory" : "true",
         "parentPath" : "Project1/Workflow1",
         "modified" : 1334979188,
         "size" : "4096",
         "parentDir" : "Project1/Workflow1"
      },
      {
         "name" : "scripts",
         "children" : [],
         "path" : "scripts",
         "directory" : "true",
         "parentPath" : "Project1/Workflow1",
         "modified" : 1334978197,
         "size" : "4096",
         "parentDir" : "Project1/Workflow1"
      },
      {
         "name" : "stdout",
         "children" : [
            "1-FTP.stderr",
            "1-FTP.stdout",
            "2-unzipFiles.stderr",
            "2-unzipFiles.stdout",
            "3-elandIndex.stderr",
            "3-elandIndex.stdout"
         ],
         "path" : "stdout",
         "directory" : "true",
         "parentPath" : "Project1/Workflow1",
         "modified" : 1334978198,
         "size" : "4096",
         "parentDir" : "Project1/Workflow1"
      }
   ]
}

    
</entry>
<entry [Fri 2012:04:20 21:09:43 EST] PERL TIMING TESTS - use Time::HiRes>

#### DEBUG -- TIMING
#use Time::HiRes qw[gettimeofday tv_interval];
#my $time1=[gettimeofday()];
    
.. DO STUFF
    
#my $milliseconds = tv_interval($time1)*1000;

    
</entry>
<entry [Wed 2012:04:18 08:52:32 EST] executeWorkflow TEST>
    
echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","start":1,"mode":"executeWorkflow","workflownumber":1,"SHOWLOG":4}' | ./workflow.cgi


</entry>
<entry [Sun 2012:04:15 23:18:52 EST] Workflow.RunStatus TEST >

CREATED t/html/plugins/workflow/getstatus/test.html

LOCATION
http://localhost/agua/t/plugins/workflow/getstatus/test.html



var doIt = function () {
    console.clear();
    dojo.reload("plugins.workflow.RunStatus");
    dojo.reload("plugins.workflow.Workflow");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();
};

doIt();
//dojo.reloadCss();

var runner = {
    childNodes  : [1,2,3],
    cluster     :	"smallcluster",
    project     :	"Project1",
    sessionId   :	"9999999999.9999.999",
    start       :   1,
    stop        :	"",
    username    :	"admin",
    workflow    :	"Workflow1",
    workflownumber:	"1"
};
var singleton = true;

var runstatus = Agua.controllers["workflow"].tabPanes[0].core.runStatus;
console.dir({runstatus:runstatus});

runstatus.getStatus(runner, singleton);
    
TEST RunStatus.handleResponse

var response = {'stages':[{'stagedescription':'','stagepid':'7860','number':'1','status':'completed','project':'Project1','submit':'0','workflowpid':'0','stagenotes':'','stagename':'','stagejobid':'0','completed':'2012-02-26 04:36:30','owner':'admin','workflownumber':'1','cluster':'','stderrfile':'/nethome/admin/agua/Project1/Workflow1/stdout/1-FTP.stderr','location':'bin/utils/deepvac.pl','version':'0.6.0','installdir':'/agua/bioapps','executor':'','name':'FTP','stdoutfile':'/nethome/admin/agua/Project1/Workflow1/stdout/1-FTP.stdout','package':'bioapps','username':'admin','workflow':'Workflow1','now':'2012-04-15 23:14:59','started':'2012-02-26 04:24:14','type':'utility','queued':'0000-00-00 00:00:00'},{'stagedescription':'','stagepid':'8997','number':'2','status':'completed','project':'Project1','submit':'0','workflowpid':'0','stagenotes':'','stagename':'','stagejobid':'0','completed':'2012-02-27 03:39:27','owner':'admin','workflownumber':'1','cluster':'','stderrfile':'/nethome/admin/agua/Project1/Workflow1/stdout/2-unzipFiles.stderr','location':'bin/utils/unzipFiles.pl','version':'0.6.0','installdir':'/agua/bioapps','executor':'','name':'unzipFiles','stdoutfile':'/nethome/admin/agua/Project1/Workflow1/stdout/2-unzipFiles.stdout','package':'bioapps','username':'admin','workflow':'Workflow1','now':'2012-04-15 23:14:59','started':'2012-02-27 03:39:00','type':'utility','queued':'0000-00-00 00:00:00'},{'stagedescription':'','stagepid':'0','number':'3','status':'','project':'Project1','submit':'0','workflowpid':'0','stagenotes':'','stagename':'','stagejobid':'0','completed':'0000-00-00 00:00:00','owner':'admin','workflownumber':'1','cluster':'','stderrfile':'','location':'bin/converters/elandIndex.pl','version':'0.6.0','installdir':'/agua/bioapps','executor':'','name':'elandIndex','stdoutfile':'','package':'bioapps','username':'admin','workflow':'Workflow1','now':'2012-04-15 23:14:59','started':'0000-00-00 00:00:00','type':'converter','queued':'0000-00-00 00:00:00'}]};
    
    
    
</entry>
<entry [Tue 2012:03:27 15:24:21 EST] FOLDERS: CGI TESTS>

echo '{"mode":"newFolder","sessionId":"9999999999.9999.999","username":"admin","folderpath":"jbrowseFeature/test/test2","location":"/data/sequence/demo"}' | ./folders.cgi 
    
</entry>
<entry [Sat 2012:03:10 00:43:59 EST] HISTORY: CGI TESTS>


export QUERY_STRING="username=syoung&sessionId=9999999999.9999.999&mode=downloadHistory"
./download.cgi


SEE
[Mon 2012:02:27 01:02:26 EST] ADDED download.c TO CALL download.pl

gcc download.c -o download.cgi
export QUERY_STRING="mode=downloadFile&username=admin&sessionId=9999999999.9999.999&filepath=/nethome/admin/agua/Project1/Workflow1/stdout/3-elandIndex.stdout"
./download.cgi

    
</entry>
<entry [Wed 2012:03:07 19:01:00 EST] TEST CGI sharedProjects>

INPUT COMMAND:

reset ; echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getTable","table":"sharedWorkflows","SHOWLOG":4}' | ./workflow.cgi &> /tmp/out

SAVED TSV FILES TO TEST INPUTS:

/agua/t/bin/Agua/Common/Shared/inputs/tsv/access.tsv
/agua/t/bin/Agua/Common/Shared/inputs/tsv/groupmembers.tsv
/agua/t/bin/Agua/Common/Shared/inputs/tsv/project.tsv
/agua/t/bin/Agua/Common/Shared/inputs/tsv/workflow.tsv
/agua/t/bin/Agua/Common/Shared/inputs/tsv/stage.tsv
/agua/t/bin/Agua/Common/Shared/inputs/tsv/stageparemeter.tsv


EXPECTED OUTPUT:

{"sharedworkflows":{"admin":[{"number":"1","provenance":"","project":"Project1","name":"Workflow1","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"2","provenance":"","project":"Project1","name":"Workflow2","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"3","provenance":"","project":"Project1","name":"Workflow3","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"4","provenance":"","project":"Project1","name":"Workflow4","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"5","provenance":"","project":"Project1","name":"WorkflowA","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"1","provenance":"","project":"Project2","name":"Workflow1","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"2","provenance":"","project":"Project2","name":"Workflow2","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"1","provenance":"","project":"ProjectX","name":"Workflow1","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"2","provenance":"","project":"ProjectX","name":"Workflow2","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"3","provenance":"","project":"ProjectX","name":"Workflow3","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"1","provenance":"","project":"ProjectY","name":"Workflow1","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"2","provenance":"","project":"ProjectY","name":"Workflow2","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""},{"number":"1","provenance":null,"project":"Reference","name":"genomes","groupwrite":"0","description":"","username":"admin","groupview":"1","groupcopy":"1","notes":""}],"agua":[{"number":"1","provenance":"","project":"Project1","worldcopy":"1","name":"Workflow1","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""},{"number":"2","provenance":"","project":"Project1","worldcopy":"1","name":"Workflow2","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""},{"number":"3","provenance":"","project":"Project1","worldcopy":"1","name":"Workflow3","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""},{"number":"4","provenance":"","project":"Project1","worldcopy":"1","name":"Workflow4","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""},{"number":"5","provenance":"","project":"Project1","worldcopy":"1","name":"WorkflowA","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""},{"number":"1","provenance":"","project":"Project2","worldcopy":"1","name":"Workflow1","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""},{"number":"2","provenance":"","project":"Project2","worldcopy":"1","name":"Workflow2","description":"","worldwrite":"1","username":"agua","worldview":"1","notes":""}]}}
    
</entry>
<entry [Wed 2012:03:07 11:42:12 EST] TEST CGI copyProject AND copyWorkflow>

copyProject
===========

echo '{ "sourceuser": "admin", "targetuser": "syoung", "sourceproject": "Project1", "targetproject": "proj5", "copyfiles": 0, "provenance": "[{\"copiedby\":\"syoung\",\"original\":{\"rights\":{\"groupview\":\"1\",\"groupcopy\":\"1\",\"groupwrite\":\"0\"},\"owner\":\"admin\",\"groupname\":\"users\",\"project\":\"Project1\",\"name\":\"Project1\",\"description\":\"\",\"username\":\"admin\"},\"date\":\"2012-03-07 09:32:38\"}]", "username": "syoung", "sessionId": "9999999999.9999.999", "mode": "copyProject","date":"2012-03-07 09:32:38"}' | ./workflow.cgi


{"status":"Copied to project Project1 to proj5","subroutine":"Agua::Common::Workflow::copyProject","linenumber":"700","filename":"/agua/cgi-bin/lib/Agua/Common/Workflow.pm","timestamp":"2012-03-07 11:43:51"}


copyWorkflow
============

echo '{"sourceuser":"admin","targetuser":"syoung","sourceworkflow":"Workflow1","sourceproject":"Project1","targetworkflow":"WorkflowXX1","targetproject":"p1","copyfiles":0,"date":"2012-03-07 11:06:30","provenance":"[{\"copiedby\":\"syoung\",\"original\":{\"number\":\"1\",\"provenance\":\"\",\"project\":\"Project1\",\"name\":\"Workflow1\",\"groupwrite\":\"0\",\"description\":\"\",\"username\":\"admin\",\"groupview\":\"1\",\"groupcopy\":\"1\",\"notes\":\"\"},\"date\":\"2012-03-07 11:06:30\"},{\"copiedby\":\"syoung\",\"original\":{\"number\":1,\"provenance\":\"[{\\\"copiedby\\\":\\\"syoung\\\",\\\"original\\\":{\\\"number\\\":\\\"1\\\",\\\"provenance\\\":\\\"\\\",\\\"project\\\":\\\"Project1\\\",\\\"name\\\":\\\"Workflow1\\\",\\\"groupwrite\\\":\\\"0\\\",\\\"description\\\":\\\"\\\",\\\"username\\\":\\\"admin\\\",\\\"groupview\\\":\\\"1\\\",\\\"groupcopy\\\":\\\"1\\\",\\\"notes\\\":\\\"\\\"},\\\"date\\\":\\\"2012-03-07 11:06:30\\\"}]\",\"project\":\"p1\",\"name\":\"WorkflowXX1\",\"groupwrite\":\"0\",\"description\":\"\",\"username\":\"syoung\",\"groupview\":\"1\",\"groupcopy\":\"1\",\"notes\":\"\"},\"date\":\"2012-03-07 11:06:30\"}]","username":"syoung","sessionId":"9999999999.9999.999","mode":"copyWorkflow"}' | ./workflow.cgi
Content-type: text/html

{"status":"Completed copy to WorkflowXX1","subroutine":"Agua::Common::Workflow::copyWorkflow","linenumber":"540","filename":"/agua/cgi-bin/lib/Agua/Common/Workflow.pm","timestamp":"2012-03-07 11:41:20"}

    
</entry>
<entry [Mon 2012:03:05 01:47:33 EST] Sync.t TEST CREATE/LOAD PROJECT FILES IN Agua::Common::Package>
    
sudo su

cd /agua/t/bin/Agua/Common/Package/Sync

reset ; \
./Sync.t --login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--keyfile /root/.ssh/idents/github.com/id_rsa \
--SHOWLOG 4

    
</entry>
<entry [Fri 2012:02:03 12:36:15 EST] COMPLETED Install.t TESTS FOR INSTALLING bioapps AND biorepository>

1. CREATED SSH KEY AND FIRST RELEASE OF AGUA AT www.github.com/agua

SEE git.xsl [Sun 2012:02:05 10:43:55 EST]
CREATED aquarius4 SSH KEY FOR agua GITHUB USER AND UPLOADED DRAFT FIRST RELEASE OF AGUA


2. INSTALLED AGUA LOCALLY WITH Install.t AND agua.pm

cd /agua/t/bin/Agua/Ops/Install
reset ; ./Install.t --login syoung --token 4416b765217a3c3de1ed99938ffe25e0 --keyfile /root/.ssh/idents/github.com/id_rsa



TEST SUITE:

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"upgrade","version":"0.2","application":"apps"}' | ./workflow.cgi

/agua/bin/logic/ops.pl apps install  \
--version 0.2 \
--installdir /agua/t/cgi-bin/version/targetdir/apps \
--logfile /var/www/html/agua/apps-upgradelog.html \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0



/agua/bin/scripts/install.pl


WHICH DOES

/agua/bin/scripts/../logic/ops.pl \
biorepository getRemoteTags syoung biorepository

WHICH DOES:

curl  https://github.com/api/v2/json/repos/show/syoung/biorepository/tags
    [
       {
          "sha" : "2f886d8f3de6af0cf945b2c842035d2a24296fe0",
          "name" : "0.6.0"
       }
    ]

 
THEN TAKES THE LATEST VERSION AND INSTALLS IT:

/agua/bin/logic/ops.pl \
biorepository install \
--owner syoung \
--installdir /agua/repos/public \
--repository biorepository \
--logfile /tmp/agua-biorepository.install.log \
--database agua
--version
    OK



cd /agua/t/cgi-bin/version/ops

/agua/bin/logic/ops.pl testversion install  \
--version 0.2 \
--installdir /agua/t/cgi-bin/version/targetdir \
--logfile /agua/t/cgi-bin/version/targetdir/updateapp.log \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0


#### MANUAL RUN OF AGUA apps UPDATE TO VERSION 0.2    

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"upgrade","version":"0.2","application":"apps"}' | ./workflow.cgi

/agua/bin/logic/ops.pl apps install  \
--version 0.2 \
--installdir /agua/t/cgi-bin/version/targetdir/apps \
--logfile /var/www/html/agua/apps-upgradelog.html \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0


#### MANUAL RUN OF AGUA apps UPDATE TO LATEST VERSION

cd /agua/repos/biorepository/syoung/apps
/agua/bin/logic/ops.pl apps install \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--installdir /agua/apps \
--logfile /var/www/html/agua/log/apps-upgradelog.html 



    
</entry>
<entry [Thu 2012:02:02 14:10:53 EST] COMPLETED Sync.t TESTING OF Agua::Common::Package>

reset ; ./Sync.t --login syoung --token 4416b765217a3c3de1ed99938ffe25e0 --keyfile /root/.ssh/idents/github.com/id_rsa

    Doing test createAppFiles
    ok 1 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/converter/eland2ace.app
    ok 2 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/aligner/ELAND.app
    ok 3 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/view/jbrowseFeatures.app
    ok 4 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/utility/FTP.app
    ok 5 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/report/filterSNP.app
    ok 6 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/expression/TOPHAT.app
    ok 7 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/pipeline/image2eland.app
    ok 8 - appfile: /agua/0.6/t/bin/Agua/Common/Package/Sync/outputs/biorepository/aguatest/apps/packages/apps/test/sleep.app
    ok 9 - completed _syncApps: private
    ok 10 - completed _syncApps: public
    ok 11 - completed _syncWorkflows: private
    1..11


VIEW ONE OF THE CREATED APPFILES:

/agua/0.6/bin/logic/flow.pl  outputs/biorepository/aguatest/apps/packages/apps/utility/FTP.app desc

  Application:
  name           FTP
  owner          aguatest
  package        apps
  version        0.6.0
  installdir     /agua/0.6/t/bin/Agua/Common/Package/outputs/private/apps/aguatest/apps
  locked         0
  type           utility
  location       bin/utils/deepvac.pl
  executor       /usr/bin/perl
  description    Download FTP files or web pages from a URL
  notes          Download all files found in links in a page or raw text file
  localonly      0

    Parameters:
    filter         
    outputdir      %project%/%workflow%/downloads
    regex          	chr[XYM0-9]+\.fa\.gz
    type           
    url            


    
</entry>
<entry [Tue 2012:01:31 10:23:01 EST] COMPLETED TESTING Agua::Common::Package::loadAppFiles>

cd /agua/0.6/t/bin/Agua/Common/Package

./Package.t --login syoung --token 4416b765217a3c3de1ed99938ffe25e0 --keyfile /root/.ssh/idents/github.com/id_rsa


1. FIXED MISSING URL 

FIXED PROBLEM WITH

TSV FILES installdir:

/agua/0.6/t/bin/Agua/Common/Package/inputs/apps/tsv/app.tsv

aguatest	apps	0.6.0	/agua/0.6/t/bin/Agua/Common/Package/outputs/private/apps/aguatest/apps	ELAND	aligner	bin/aligners/ELAND.pl	0	/usr/bin/perl	Solexa/Illumina short read aligner (max 32 bps aligned)	 	http://www.aguadev.org/confluence/display/howto/Bioapps+API

FIXED THE parameter TSV FILE installdir:

aguatest	apps	0.6.0	/agua/0.6/t/bin/Agua/Common/Package/inputs/apps	ELAND	alignment	inputtype	0	0	input	inputtype	string	--inputtype	fastq	required		Type of input sequence. Valid inputs: fastq, fasta, export or qseq				


createAppFiles GENERATES THE CORRECT installdir:

/agua/0.6/t/bin/Agua/Common/Package/outputs/biorepository/aguatest/apps/packages/apps/aligner/ELAND.app

   "installdir" : "/agua/0.6/t/bin/Agua/Common/Package/outputs/private/apps/aguatest/apps",
 

BUT loadAppFiles GENERATES THIS installdir:

/agua/0.6/t/bin/Agua/Common/Package/outputs/private/apps/aguatest


AND SINCE Agua::Common::Package::upgrade USES FINAL INSTALL DIRECTORY AS installdir

SO CHANGED Agua::Common::Package SYNC METHODS TO USE FINAL DIRECTORY AS INSTALLDIR

I.E.,

installdir:  /agua/0.6/t/bin/Agua/Common/Package/outputs/private/apps/aguatest/apps


    
</entry>
<entry [Sat 2012:01:28 04:16:28 EST] COMPLETED Agua::Common::Package TEST Package.t>

./Package.t --login syoung --token 4416b765217a3c3de1ed99938ffe25e0 --keyfile /root/.ssh/idents/github.com/id_rsa

ok 1 - inserted testversion row into package
ok 2 - testversion row values
ok 3 - retrieved tag (0.2) is the same as the desired version (0.2)
ok 4 - checkTableEntry: inserted correct values for testversion row in package
ok 5 - retrieved tag (0.3) is the same as the desired version (0.3)
ok 6 - checkTableEntry: inserted correct values for testversion row in package
ok 7 - retrieved tag (0.1) is the same as the desired version (0.1)
ok 8 - checkTableEntry: inserted correct values for testversion row in package
ok 9 - retrieved tag (0.4) is the same as the desired version (0.4)
ok 10 - checkTableEntry: inserted correct values for testversion row in package
ok 11 - retrieved tag (0.5) is the same as the desired version (0.5)
ok 12 - checkTableEntry: inserted correct values for testversion row in package
ok 13 - retrieved tag (0.5) is the same as the desired version (0.5)
ok 14 - checkTableEntry: inserted correct values for testversion row in package
ok 15 - correctly fails to validate incorrect version: 0.6
ok 16 - completed syncWorkflows
ok 17 - completed syncApps
ok 18 - correct package information: apps
ok 19 - correct package information: apps
ok 20 - correct package information: workflows
ok 21 - correct package information: workflows
ok 22 - correct package information: bioapps
ok 23 - correct package information: agua
1..23

    
</entry>
<entry [Fri 2012:01:27 12:04:20 EST] Ops/GitHub.pm TESTS>

createRepo

curl -F 'login=MYLOGIN' -F 'token=MYTOKENSTRING' -F 'name=testcreate' http://github.com/api/v2/json/repos/create  | pretty.pl

{
   "repository" : {
      "has_downloads" : "true",
      "owner" : "MYLOGIN",
      "has_issues" : "true",
      "name" : "testcreate",
      "private" : "false",
      "has_wiki" : "true",
      "size" : 0,
      "forks" : 1,
      "watchers" : 1,
      "created_at" : "2011/11/08 06:12:08 -0800",
      "fork" : "false",
      "url" : "https://github.com/MYLOGIN/testcreate",
      "open_issues" : 0
   }
}
	


</entry>
<entry [Thu 2012:01:19 13:47:55 EST] TESTED archive.pl USING NEW VERSION FILE CREATED BY version.pl>
    
cd /agua/0.6/t/bin/Agua/Version/outputs/testrepo

/agua/0.6/bin/scripts/version.pl \
--repodir /agua/0.6/t/bin/Agua/Version/outputs/testrepo \
--versiontype build \
--description "testing version.pl and archive.pl"

    New version: 1.3.7+build.14

git log --oneline --decorate --graph
    * 22289ed (HEAD, tag: 1.3.7+build.14, master) [1.3.7+build.14] testing version.pl and archive.pl
    * 0f6601c (tag: 1.3.7+build.13) [1.3.7+build.13] testing version.pl and archive.pl
    * 009ae04 (tag: 1.3.7+build.12) [1.3.7+build.12] testing version.pl and archive.pl
    * 240b10f (tag: 1.3.7+build.11.e0f985a) Commit 1.3.7+build.11.e0f985a
    ...
    
    
/agua/0.6/bin/scripts/archive.pl \
--name testrepo \
--repodir /agua/0.6/t/bin/Agua/Version/outputs/testrepo \
--outputdir /agua/0.6/t/bin/Agua/Version/outputs

git archive --format=tar --prefix=1.3.7+build.14/ HEAD | gzip > /agua/0.6/t/bin/Agua/Version/outputs/1.3.7+build.14/testrepo.1.3.7+build.14-22289ed.tar.gz

cd /agua/0.6/t/bin/Agua/Version/outputs/1.3.7+build.14
tar xvfz testrepo*
cd 1.3.7*
cat VERSION 
    1.3.7+build.14
    
    OK


</entry>
<entry [Thu 2012:01:19 11:19:47 EST] COMPLETED Agua::Version TESTS>

syoung@syoung-Satellite-L355:/agua/0.6/t/bin/Agua/Version$ ./Version.t 
ok 1 - parseSemVer    1.0.0-alpha
ok 2 - parseSemVer    1.0.0-alpha.1
ok 3 - parseSemVer    1.0.0-beta.2
ok 4 - parseSemVer    1.0.0-beta.11
ok 5 - parseSemVer    1.0.0-rc.1
ok 6 - parseSemVer    1.0.0-rc.1+build.1
ok 7 - parseSemVer    1.0.0
ok 8 - parseSemVer    1.0.0+0.3.7
ok 9 - parseSemVer    1.3.7+build
ok 10 - parseSemVer    1.3.7+build.2.b8f12d7
ok 11 - parseSemVer    1.3.7+build.11.e0f985a
ok 12 - incrementVersion    1.3.7+build.11.e0f985a --> 2.0.0 (major, )
ok 13 - incrementVersion    1.3.7+build.11.e0f985a --> 1.4.0 (minor, )
ok 14 - incrementVersion    1.3.7+build.11.e0f985a --> 1.3.8 (patch, )
ok 15 - incrementVersion    1.3.7+build.11.e0f985a --> undef (release, )
ok 16 - incrementVersion    1.3.7+build.11.e0f985a --> 1.3.7+build.12 (build, )
ok 17 - incrementVersion    1.3.7+build.11.e0f985a --> undef (build, alpha)
ok 18 - incrementVersion    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1 (major, alpha)
ok 19 - incrementVersion    1.3.7+build.11.e0f985a --> undef (, beta)
ok 20 - incrementVersion    1.3.7+build.11.e0f985a --> undef (, rc)
ok 21 - incrementVersion    1.0.0-alpha.1 --> 2.0.0 (major, )
ok 22 - incrementVersion    1.0.0-alpha.1 --> 1.1.0 (minor, )
ok 23 - incrementVersion    1.0.0-alpha.1 --> 1.0.1 (patch, )
ok 24 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-alpha.2 (release, )
ok 25 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-alpha.1+build.1 (build, )
ok 26 - incrementVersion    1.0.0-alpha.1 --> undef (build, alpha)
ok 27 - incrementVersion    1.0.0-alpha.1 --> 2.0.0-alpha.1 (major, alpha)
ok 28 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-beta.1 (, beta)
ok 29 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-rc.1 (, rc)
ok 30 - incrementVersion    1.0.0-beta.2 --> 2.0.0 (major, )
ok 31 - incrementVersion    1.0.0-beta.2 --> 1.1.0 (minor, )
ok 32 - incrementVersion    1.0.0-beta.2 --> 1.0.1 (patch, )
ok 33 - incrementVersion    1.0.0-beta.2 --> 1.0.0-beta.3 (release, )
ok 34 - incrementVersion    1.0.0-beta.2 --> 1.0.0-beta.2+build.1 (build, )
ok 35 - incrementVersion    1.0.0-beta.2 --> undef (build, alpha)
ok 36 - incrementVersion    1.0.0-beta.2 --> 2.0.0-alpha.1 (major, alpha)
ok 37 - incrementVersion    1.0.0-beta.2 --> undef (, beta)
ok 38 - incrementVersion    1.0.0-beta.2 --> 1.0.0-rc.1 (, rc)
ok 39 - incrementVersion    1.0.0-rc.1 --> 2.0.0 (major, )
ok 40 - incrementVersion    1.0.0-rc.1 --> 1.1.0 (minor, )
ok 41 - incrementVersion    1.0.0-rc.1 --> 1.0.1 (patch, )
ok 42 - incrementVersion    1.0.0-rc.1 --> 1.0.0-rc.2 (release, )
ok 43 - incrementVersion    1.0.0-rc.1 --> 1.0.0-rc.1+build.1 (build, )
ok 44 - incrementVersion    1.0.0-rc.1 --> undef (build, alpha)
ok 45 - incrementVersion    1.0.0-rc.1 --> 2.0.0-alpha.1 (major, alpha)
ok 46 - incrementVersion    1.0.0-rc.1 --> undef (, beta)
ok 47 - incrementVersion    1.0.0-rc.1 --> undef (, rc)
ok 48 - incrementVersion    1.0.0-rc.1+build.1 --> 2.0.0 (major, )
ok 49 - incrementVersion    1.0.0-rc.1+build.1 --> 1.1.0 (minor, )
ok 50 - incrementVersion    1.0.0-rc.1+build.1 --> 1.0.1 (patch, )
ok 51 - incrementVersion    1.0.0-rc.1+build.1 --> 1.0.0-rc.2 (release, )
ok 52 - incrementVersion    1.0.0-rc.1+build.1 --> 1.0.0-rc.1+build.2 (build, )
ok 53 - incrementVersion    1.0.0-rc.1+build.1 --> undef (build, alpha)
ok 54 - incrementVersion    1.0.0-rc.1+build.1 --> 2.0.0-alpha.1 (major, alpha)
ok 55 - incrementVersion    1.0.0-rc.1+build.1 --> undef (, beta)
ok 56 - incrementVersion    1.0.0-rc.1+build.1 --> undef (, rc)
ok 57 - incrementVersion    1.0.0 --> 2.0.0 (major, )
ok 58 - incrementVersion    1.0.0 --> 1.1.0 (minor, )
ok 59 - incrementVersion    1.0.0 --> 1.0.1 (patch, )
ok 60 - incrementVersion    1.0.0 --> undef (release, )
ok 61 - incrementVersion    1.0.0 --> 1.0.0+build.1 (build, )
ok 62 - incrementVersion    1.0.0 --> undef (build, alpha)
ok 63 - incrementVersion    1.0.0 --> 2.0.0-alpha.1 (major, alpha)
ok 64 - incrementVersion    1.0.0 --> undef (, beta)
ok 65 - incrementVersion    1.0.0 --> undef (, rc)

    
</entry>
<entry [Fri 2012:01:13 05:20:36 EST] VIEW: ADD DEFAULT VIEW>

DELETE VIEW
delete from view where username = 'aguatest';

ADD VIEW
echo '{"username":"aguatest","sessionId":"9999999999.9999.999","mode":"getTable","table":"views"}' | ./workflow.cgi

REMOVE VIEW
echo '{"stop":"35000000","mode":"removeView","status":"ready","project":"Project1","species":"human","tracklist":"knownGene","build":"hg19","datetime":"NOW()","username":"aguatest","sessionId":"9999999999.9999.999","view":"View1","chromosome":"chr1","SHOWLOG":5,"PRINTLOG":5,"logfile":"/tmp/aguatest.workflow.log","start":"250000000"}' | /var/www/cgi-bin/agua/0.6/view.cgi
    
</entry>
<entry [Tue 2012:01:10 05:45:56 EST] TEST Agua::Workflow::executeWorkflow>
    

echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"1","stop":"1","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}'  | /var/www/cgi-bin/agua/0.6/workflow.cgi

	
</entry>
<entry [Mon 2012:01:09 14:24:48 EST] TEST Agua::Common::Package::syncWorkflows>
    
echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"syncWorkflows"}' | /var/www/cgi-bin/agua/0.6/admin.cgi

</entry>
<entry [Fri 2012:01:06 14:26:41 EST] TEST Package.pm>

cd /agua/0.6/t/bin/Agua/Common/Package

./Package.t --login stuartpyoung --token a359152dd81fbd744a86128c0be5a764 --keyfile /root/.ssh/idents/github.com/id_rsa --owner syoung

WHICH RUNS:

/agua/0.6/bin/logic/ops.pl testversion install  \
--repository biorepository \
--owner syoung \
--installdir /agua/0.6/t/cgi-bin/package/targetdir \
--logfile /agua/0.6/t/cgi-bin/package/targetdir/updateapp.log \
--version 0.2 \
--login stuartpyoung \
--token a359152dd81fbd744a86128c0be5a764 \
--opsrepo biorepository



/agua/0.6/bin/logic/ops.pl testversion install  \
--owner syoung \
--repository testversion \
--installdir /agua/0.6/t/bin/Agua/Common/Package/outputs/target \
--logfile /agua/0.6/t/bin/Agua/Common/Package/outputs/target/updateapp.log \
--version 0.2 \
--login stuartpyoung \
--token a359152dd81fbd744a86128c0be5a764

GET PACKAGES

CREATE DEFAULT PACKAGES
echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getPackages"}' | /var/www/cgi-bin/agua/0.6/admin.cgi


ADD PACKAGE

{"username":"admin","sessionId":"9999999999.9999.999","mode":"addPackage","data":{"package":"test","version":"test","build":"test","opsdir":"aaa/aa","installdir":"a//a/","description":"Description","notes":"Notes","url":"URL"}}

    {"status":"Created package test","subroutine":"Agua::Common::Package::addPackage","linenumber":"177","filename":"/agua/0.6/cgi-bin/lib/Agua/Common/Package.pm","timestamp":"2012-01-06 14:26:02"}


REMOVE PACAKGE

echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"removePackage","data":{"package":"test","version":"test","opsdir":"aaa/aa","installdir":"a//a/"}}' | ./admin.cgi
    
    {"status":"Removed package test","subroutine":"Agua::Common::Package::removePackage","linenumber":"82","filename":"/agua/0.6/cgi-bin/lib/Agua/Common/Package.pm","timestamp":"2012-01-06 14:28:09"}
    
    
</entry>
