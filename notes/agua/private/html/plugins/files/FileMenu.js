dojo.provide("plugins.files.FileMenu");

// WIDGET PARSER
dojo.require("dojo.parser");

// INHERITS
dojo.require("plugins.core.Common");

// HAS A
dojo.require("plugins.menu.Menu");
dojo.require("plugins.dijit.InputDialog");
dojo.require("plugins.dijit.InteractiveDialog");
dojo.require("plugins.dijit.ConfirmDialog");
dojo.require("plugins.form.Uploader");
dojo.require("dojo.io.iframe");

dojo.declare(
    "plugins.files.FileMenu",
	[ dijit._Widget, dijit._Templated, plugins.core.Common ], {
//Path to the template of this widget. 
templatePath: dojo.moduleUrl("plugins", "files/templates/filemenu.html"),

// Calls dijit._Templated.widgetsInTemplate
widgetsInTemplate : true,

//addingApp STATE
addingApp : false,

// OR USE @import IN HTML TEMPLATE
cssFiles : [
	dojo.moduleUrl("plugins", "files/css/filemenu.css"),
	dojo.moduleUrl("dojox", "form/resources/FileInput.css")
],

// PARENT WIDGET
parentWidget : null,

/////}}
	
constructor : function(args) {
	////console.log("FileMenu.constructor     plugins.files.FileMenu.constructor");			

	// GET INFO FROM ARGS
	this.parentWidget = args.parentWidget;

	// LOAD CSS
	this.loadCSS();		
},

postCreate : function() {
	////console.log("Controller.postCreate    plugins.files.Controller.postCreate()");

	// SET INPUT DIALOG
	this.setInputDialog();

	// SET INTERACTIVE DIALOG
	this.setInteractiveDialog();

	// SET CONFIRM DIALOG
	this.setConfirmDialog();

	// SET LABEL
	this.setTitle("File Menu");

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();

	// DO INHERITED STARTUP
	this.startup();
},

startup : function () {
	////console.log("FileMenu.startup    plugins.files.FileMenu.startup()");

	// COMPLETE CONSTRUCTION OF OBJECT
	this.inherited(arguments);	 

	// SET THE UPLOAD OBJECT
	this.setUploader();

	// DISABLE MENU ITEMS
	this.disableMenuItem('select');
	this.disableMenuItem('add');
	this.menu._started = false;
	this.menu.startup();

	// STOP PROPAGATION TO NORMAL RIGHTCLICK CONTEXT MENU
	dojo.connect(this.menu.domNode, "oncontextmenu", function (event) {
		event.stopPropagation();
	});


	// SUBSCRIBE TO UPDATES
	Agua.updater.subscribe(this, "updateProjects");
	Agua.updater.subscribe(this, "updateWorkflows");	
},

updateProjects : function (args) {
// RELOAD RELEVANT DISPLAYS
	//console.log("workflow.Stages.updateProjects    workflow.Stages.updateProjects(args)");
	//console.log("workflow.Stages.updateProjects    args:");
	//console.dir(args);

	this.parentWidget.updateProjects();
},

updateClusters : function (args) {
// RELOAD RELEVANT DISPLAYS
	//console.log("admin.Clusters.updateClusters    admin.Clusters.updateClusters(args)");
	//console.log("admin.Clusters.updateClusters    args:");
	//console.dir(args);
	this.setClusterCombo();
},

// SELECT
select : function (event) {
// STORE SELECTED FILE OR FOLDER
    console.log("FileMenu.select    plugins.files.FileSelectorMenu.select(event)");

    console.log("FileMenu.select    event: " + event);
    console.log("FileMenu.select    event.target: " + event.target);

    // GET PROJECT WIDGET
    var location = this.getPath();
    if ( ! location == null ) {
        console.log("FileMenu.select     location is null. Returning");
        return;
    }
    var filename = this.menu.currentTarget.innerHTML;

    console.log("FileMenu.select     filename: " + filename);
    console.log("FileMenu.select     location: " + location);
    console.log("FileMenu.select     this.type: " + this.type);
    
    var newValue;
    if ( filename != null && location != null )    newValue = location + "/" + filename;
    else if ( location != null )    newValue = location;
    else if ( filename != null )    newValue = filename;
    console.log("FileMenu.select     newValue: " + newValue);

    var application = this.parameterWidget.core.parameters.application;
    application.value = newValue;
    console.log("FileMenu.select     application: ");
    console.dir({application:application});
    
    console.log("FileMenu.select     Doing this.parameterWidget.changeValue()");
    this.parameterWidget.changeValue(this.parameterWidget.valueNode, this.parameterWidget.valueNode.innerHTML, newValue, this.type);

    console.log("FileMenu.select     Doing this.parameterWidget.core.io.chainOutputs()");
    var force = true;
    this.parameterWidget.core.io.chainOutputs(application, true);
    var stageRow = this.parameterWidget.core.parameters.stageRow;
    var node = stageRow.domNode;
    node.application = stageRow.application;
    node.parentWidget = stageRow;
    this.parameterWidget.core.stages.loadParametersPane(node);


    this.hide();
},

// ADD
add : function () {
// ADD VALUE TO PARAMETER
    var location = this.getPath();
    if ( location == null ) {
        console.log("FileMenu.add     location is null. Returning");
        return;
    }

    var filename = this.menu.currentTarget.innerHTML;
    console.log("FileMenu.add     filename: " + filename);
    console.log("FileMenu.add     location: " + location);
    console.log("FileMenu.add     this.type: " + this.type);
    console.log("FileMenu.add     this.parameterWidget.valueNode.innerHTML: " + this.parameterWidget.valueNode.innerHTML);

    var newValue;
    if ( filename != null && location != null )    newValue = location + "/" + filename;
    else if ( location != null )    newValue = location;
    else if ( filename != null )    newValue = filename;
    console.log("FileMenu.add     newValue: " + newValue);

    this.parameterWidget.addValue(this.parameterWidget.valueNode,   this.parameterWidget.valueNode.innerHTML, newValue, this.type);

    this.hide();
},

// UPLOAD
upload : function (event) {
	//console.log("FileMenu.upload     plugins.files.Menu.upload(event)");
	//console.log("FileMenu.upload     this: " + this);
	//console.log("FileMenu.upload     this.menu: " + this.menu);
	console.log("FileMenu.upload     this.menu.currentTarget: " + this.menu.currentTarget);
	console.dir({currentTarget:this.menu.currentTarget});

	dojo.stopEvent(event);	

	// SET UPLOADER PATH AND SHOW
	var item = this.menu.currentTarget.item;
	console.log("FileMenu.upload     item: " + dojo.toJson(item));
	var path = item.parentPath;
	console.log("FileMenu.upload     path: " + path);
	if ( path == null || path == '' )	return;
	this.uploader.setPath(path);
	this.uploader.show();

	// SET RELOAD CALLBACK
    var groupDrag = dijit.getEnclosingWidget(this.menu.currentTarget.offsetParent);
	console.log("fileMenu.upload    groupDrag: " + groupDrag);
	var fileDrag = groupDrag.parentWidget;
	console.dir({fileDrag:fileDrag});
	var children = fileDrag.getChildren();
	var index = 0;
	for ( var i = 0; i < children.length; i++ ) {
		if ( children[i] == groupDrag ) {
			index = i;
			break;
		}
	}
	console.log("index: " + index);
	var previousGroupDrag = children[index - 1];
	var parentFolder = path.match('([^\/]+)$')[1];
	console.log("parentFolder: " + parentFolder);
	this.callback = dojo.hitch(this, "reloadPane", previousGroupDrag, parentFolder);
},

onComplete : function() {
	console.log("fileMenu.onComplete    this.callback: " + this.callback);
    this.callback();
},

reloadPane : function(groupDragPane, folder) {
// USE FAKE event TO RELOAD DIRECTORY
	console.log("fileMenu.reloadPane    groupDragPane: " + groupDragPane);
	console.log("fileMenu.reloadPane    folder: " + folder);
	var items = groupDragPane.items;
	//console.log("fileMenu.reloadPane    items: " + dojo.toJson(items));
	var index = 0;
	for ( var i = 0; i < items.length; i++ ) {
		if ( items[i].name == folder ) {
			index = i;
			break;
		}
	}
	console.log("fileMenu.reloadPane    index: " + index);
	var event = { target: { item: items[index] } };
	groupDragPane.onclickHandler(event);
},

setUploader : function () {
	console.log("FileMenu.setUploader     plugins.files.FileMenu.setUploader()");
	var uploaderId = dijit.getUniqueId("plugins.form.UploadDialog");
	var username = Agua.cookie('username');
	var sessionId = Agua.cookie('sessionId');
	this.uploader = new plugins.form.Uploader(
	{
		uploaderId: uploaderId,
		username: 	username,
		sessionId: 	sessionId
	});
	
	// SET CONNECT
	dojo.connect(this.uploader, "onComplete", this, "onComplete");
},	//	setUploader

setMenu : function () {
// CONNECT SHORTKEYS FOR MENU
	////console.log("FileMenu.setMenu     plugins.files.Workflow.setMenu()");

	this.disableRightClick();
	
	this.setShortKeys();
	
	this.menu.onCancel = function(event) {
		//console.log("FileMenu.setMenu     DOING this.menu.onCancel(event)");
	}
},

disableRightClick : function () {
	//// STOP PROPAGATION TO NORMAL RIGHTCLICK CONTEXT MENU
	dojo.connect(this.menu.domNode, "contextmenu", function (event)
	{
		//console.log("FileMenu.setMenu    quenching contextmenu");
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
},

setShortKeys : function () {
	// NOTE: USE accelKey IN DOJO 1.3 ONWARDS
	dojo.connect(this.menu, "onKeyPress", dojo.hitch(this, function(event)
	{
		//console.log("FileMenu.setMenu     this.menu.onKeyPress(event)");
		var key = event.charOrCode;
		if ( this.altOn == true )
		{
			switch (key)
			{
				case "n" : this.newFolder(); break;
				case "m" : this.rename(); break;
				case "l" : this.deleteFile(); break;
				case "o" : this.openWorkflow(); break;
				case "u" : this.upload(); break;
				case "w" : this.download(); break;
			}
		}
		event.stopPropagation();
	}));

	// SET ALT KEY ON/OFF
	dojo.connect(this.menu, "onKeyDown", dojo.hitch(this, function(event){
		//console.log("FileMenu.setMenu     this.menu.onKeyDown(event)");
		var keycode = event.keyCode;
		if ( keycode == 18 )	this.altOn = true;
	}));
	dojo.connect(this.menu, "onKeyUp", dojo.hitch(this, function(event){
		//console.log("FileMenu.setMenu     this.menu.onKeyUp(event)");
		var keycode = event.keyCode;
		if ( keycode == 18 )	this.altOn = false;
	}));	
},

// OPEN WORKFLOW
openWorkflow : function () {
	console.log("FileMenu.openWorkflow     plugins.files.FileMenu.openWorkflow()");

	// LABEL THIS AS SELECTED FILE
	dojo.addClass(this.menu.currentTarget, 'dojoDndItemOver');
	
	var item = this.menu.currentTarget.item;
	console.log("FileMenu.openWorkflow     item: " + dojo.toJson(item));
	if ( ! item.parentPath.match(/^([^\/]+)\/([^\/]+)/) )	return;
	var project = item.parentPath.match(/^([^\/]+)\/[^\/]+/)[1];	
	var workflow = item.parentPath.match(/^[^\/]+\/([^\/]+)/)[1];	
	console.log("FileMenu.openWorkflow     project: " + project);
	console.log("FileMenu.openWorkflow     workflow: " + workflow);
	var workflowController = Agua.controllers["workflow"];
	console.log("FileMenu.openWorkflow     workflowController: " + workflowController);
	if ( workflowController == null )	return;
	console.log("FileMenu.openWorkflow     Doing workflowController.createTab({ project: " + project + ", workflow: " + workflow + "})");
	workflowController.createTab({ project: project, workflow: workflow });
},

// RENAME
rename : function () {
// RENAME FILE	
	//console.log("FileMenu.rename    plugins.files.FileMenu.rename()");
	//console.log("FileMenu.rename    this.menu.currentTarget: " + this.menu.currentTarget);

	var item = this.menu.currentTarget.item;
	//console.log("FileMenu.rename    item: " + dojo.toJson(item));
	var path = item.path;
	var parentPath = item.parentPath;

	var oldFilename = path;
	//console.log("FileMenu.rename    oldFilename: " + oldFilename);


	var oldpath = parentPath + "/" + path;

	// SET TITLE AND MESSAGE
	var title = "Rename file '" + oldFilename + "'";
	var message = "Please enter new name";
	
	// CALLBACKS
	var cancelCallback = function (){
		//console.log("FileMenu.rename    cancelCallback()");
	};

	var enterCallback = dojo.hitch(this, function (newFilename)
		{
			//console.log("FileMenu.rename    Doing enterCallback");
			
			// SANITY CHECK
			if ( newFilename == null )	return;
			newFilename = newFilename.replace(/\s+/, '');
			if ( newFilename == '' )	return;
			//console.log("FileMenu.rename    newFilename: " + newFilename);

			// CHECK IF NAME EXISTS ALREADY
			if ( this.inFiles(newFilename) == true )
			{
				Agua.toastMessage({message: "Filename '" + newFilename + "' already exists " });
				////console.log("FileMenu.rename    File '" + newFilename + "' already exists in project '" + oldFilename + "'. Returning");
				return;
			}
			//console.log("FileMenu.rename    newFilename NOT inFiles. Doing rename");

			// SET NEW FILENAME IN item OBJECT
			this.menu.currentTarget.item.path = newFilename;
			this.menu.currentTarget.innerHTML = newFilename;

			// SET NEW PATH
			var newpath = parentPath + "/" + newFilename;
			
			// CREATE FOLDER ON SERVER	
			var url = Agua.cgiUrl + "folders.cgi?";
			var query = "mode=renameFile";
			query += "&sessionId=" + Agua.cookie('sessionId');
			query += "&username=" + Agua.cookie('username');
			query += "&oldpath=" + oldpath;
			query += "&newpath=" + newpath;
			
			var thisObject = this;
			dojo.xhrGet(
				{
					url: url + query,
					handleAs: "json",
					sync: false,
					handle: function(response){
						if ( response.error )
						{
							Agua.error(response.error);
						}
						else if ( response.status )
						{
							Agua.warning(response.status);
							var parentNode = thisObject.menu.currentTarget.parentNode;
							parentNode.removeChild(thisObject.menu.currentTarget);
						}
					}
				}
			);
			
		}
	);		

	// SHOW THE DIALOG
	this.loadInputDialog(title, message, enterCallback, cancelCallback);
},

inFiles : function (newFilename) {
// RETURN TRUE IF FILE NAME EXISTS IN THIS GROUP DRAG PANE, ELSE RETURN FALSE
	//console.log("FileMenu.inFiles    plugins.files.FileMenu.inFiles(newFilename)");
	//console.log("FileMenu.inFiles    newFilename: " + newFilename);
	if ( newFilename == null )	return;
	
	var groupDragPane = dijit.getEnclosingWidget(this.menu.currentTarget);
	//console.log("FileMenu.setUploader     groupDragPane: " + groupDragPane);

	var childNodes = groupDragPane._dragSource.getAllNodes();
	//console.log("FileMenu.inFiles    childNodes: " + childNodes);
	
	for ( var i = 0; i < childNodes.length; i++ )
	{
		////console.log("FileMenu.inFiles    childNodes[i].innerHTML: " + childNodes[i].innerHTML);
		if ( newFilename == childNodes[i].innerHTML )	return true;
	}
	
	return false;
},

// NEW FOLDER
newFolder : function () {
// CREATE A NEW FOLDER
	//console.log("FileMenu.newFolder     plugins.files.Workflow.newFolder()");
	if ( this.menu.currentTarget == null )	return;

	var groupDragPane = dijit.getEnclosingWidget(this.menu.currentTarget);
	//console.log("FileMenu.newFolder     groupDragPane: " + groupDragPane);

	// SET TITLE AND MESSAGE
	var title = "New Folder";
	var message = "Please enter folder name";
	
	// CALLBACKS
	var cancelCallback = function (){
		//console.log("FileMenu.newFolder    cancelCallback()");
	};
	var enterCallback = dojo.hitch(this, function (newFoldername)
		{
			//console.log("FileMenu.newFolder    Doing enterCallback");
			
			// SANITY CHECK
			if ( newFoldername == null )	return;
			newFoldername = newFoldername.replace(/\s+/, '');
			if ( newFoldername == '' )	return;
			//console.log("FileMenu.newFolder    newFoldername: " + newFoldername);

			// CHECK IF NAME EXISTS ALREADY
			if ( this.inFiles(groupDragPane, newFoldername) == true )
			{
				//console.log("FileMenu.newFolder    File '" + newFoldername + "' already exists in project '" + oldFilename + "'. Returning");
				return;
			}
			
			// INSERT NEW CHILD
			var item = new Object;
			item.name = newFoldername;
			item.type = ["folder"];
			item.directory = true;
			item.parentPath = groupDragPane.path;
			item.path = newFoldername;
			//console.log("FileMenu.newFolder    item: " + dojo.toJson(item));
			groupDragPane.items.push(item);

			// GENERATE CHILD
			var newChild = groupDragPane.parentWidget._getMenuItemForItem(item, groupDragPane);
			//console.log("FileMenu.newFolder    groupDragPane._dragSource.getAllNodes().length BEFORE insertNodes(newChild): " + groupDragPane._dragSource.getAllNodes().length);

			// INSERT CHILD
			//console.log("FileMenu.newFolder    newChild: " + dojo.toJson(newChild));
			groupDragPane._dragSource.insertNodes(false, [ newChild ]);

			//console.log("FileMenu.newFolder    groupDragPane._dragSource.getAllNodes().length AFTER insertNodes(newChild): " + groupDragPane._dragSource.getAllNodes().length);
	
			// ADD 'directory' CLASS TO NEW CHILD
			var allNodes = groupDragPane._dragSource.getAllNodes();
			var node = allNodes[allNodes.length - 1];
			node.setAttribute("dndType", "file");
			dojo.addClass(node, "directory");
			
			// ADD item ATTRIBUTE ON NODE
			node.item = item;
			node.item._S = newChild.store;

			// ADD MENU
			var dynamicMenu = groupDragPane.createMenu("folder");
			//console.log("FileMenu.newFolder   dynamicMenu: " + dynamicMenu);
				
			// BIND THE MENU TO THE DND NODE
			dynamicMenu.bindDomNode(node);
			
			// CONNECT ONCLICK
			dojo.connect(node, "onclick", groupDragPane, "onclickHandler");
			
			// CREATE FOLDER ON SERVER	
			var url = Agua.cgiUrl + "folders.cgi?";
			var folderPath = groupDragPane.path + "/" + newFoldername;
			var query = "mode=newFolder";
			query += "&sessionId=" + Agua.cookie('sessionId');
			query += "&username=" + Agua.cookie('username');
			query += "&folderpath=" + folderPath;
			
			var thisObject = this;
			dojo.xhrGet(
				{
					url: url + query,
					handleAs: "json",
						//handleAs: "json-comment-optional",
					sync: false,
					handle: function(response){
						if ( response.error )
						{
							// error: file not found, removing, file being copied
							Agua.error(response.error);
						}
						else if ( response.status )
						{
							// status: initiated, ongoing, completed
							Agua.warning(response.status);
							var parentNode = thisObject.menu.currentTarget.parentNode;
							parentNode.removeChild(thisObject.menu.currentTarget);
						}
					}
				}
			);
		}
	);		

	// SHOW THE DIALOG
	this.loadInputDialog(title, message, enterCallback, cancelCallback);

},	//	newFolder



// DELETE
deleteFile : function () {
// deleteFile SELECTED NODE
	//console.log("FileMenu.deleteFile     plugins.files.Workflow.deleteFile(event)");
	if ( this.menu.currentTarget == null )	return;

	// GET THE PROJECT WIDGET
	var filename = this.menu.currentTarget.item.name;
	//console.log("FileMenu.deleteFile     filename: " + filename);

	var isDirectory = this.menu.currentTarget.item.directory;
	//console.log("FileMenu.deleteFile     isDirectory: " + isDirectory);
	var type = "file";
	if ( isDirectory == true )	type = "folder";

	var groupDragPane = dijit.getEnclosingWidget(this.menu.currentTarget);
	////console.log("FileMenu.newFolder     groupDragPane: " + groupDragPane);

	// CALLBACKS
	var noCallback = function (){
		////console.log("FileMenu.newFolder    cancelCallback()");
	};
	var yesCallback = dojo.hitch(this, function ()
		{
			//console.log("FileMenu.newFolder    Doing enterCallback");
			groupDragPane._dragSource.deleteSelectedNodes();

			var item = this.menu.currentTarget.item;
			var file = item.parentPath + "/" + item.path;
			
			var url = Agua.cgiUrl + "folders.cgi?";
			var query = "mode=removeFile";
			query += "&sessionId=" + Agua.cookie('sessionId');
			query += "&username=" + Agua.cookie('username');
			query += "&file=" + file;

			var thisObject = this;
			dojo.xhrGet(
				{
					url: url + query,
					handleAs: "json",
						//handleAs: "json-comment-optional",
					sync: false,
					handle: function(response){
						if ( response.error )
						{
							// error: file not found, removing, file being copied
							Agua.error(response.error);
						}
						else if ( response.status )
						{
							// status: initiated, ongoing, completed
							Agua.warning(response.status)			
							var parentNode = thisObject.menu.currentTarget.parentNode;
							parentNode.removeChild(thisObject.menu.currentTarget);
						}
					}
				}
			);
		}
	);

	// SET TITLE AND MESSAGE
	var title = "Delete " + type + ": '" + filename + "'?";
	var message = "All its data will be destroyed";

	// SHOW THE DIALOG
	this.loadConfirmDialog(title, message, yesCallback, noCallback);
	
},	//	deleteFile

// DOWNLOAD
download : function () {
// DOWNLOAD FILE FROM FOLDER
	//console.log("FileMenu.download     plugins.files.Workflow.download()");

	var item = this.menu.currentTarget.item;
	//console.log("FileMenu.download     item: " + dojo.toJson(item));

	if ( ! item.parentPath.match(/^([^\/]+)\/([^\/]+)/) )	return;
	var project = item.parentPath.match(/^([^\/]+)\/[^\/]+/)[1];	
	var workflow = item.parentPath.match(/^[^\/]+\/([^\/]+)/)[1];	
	//console.log("FileMenu.download     project: " + project);
	//console.log("FileMenu.download     workflow: " + workflow);

	var filepath = item.parentPath;
	if ( item.path != null && item.path != '' )
		filepath += "/" + item.path;
	//console.log("FileMenu.download     filepath: " + filepath);
	
	var url = item._S.url;
	var owner;
	if ( url.match(/owner=([^&]+)/) )
	{
		owner = url.match(/owner=([^&]+)/)[1];	
	}
	//console.log("FileMenu.download     owner: " + owner);


	var query = "?mode=downloadFile";

	// SET requestor = THIS_USER IF core.parameters.shared IS TRUE
	if ( owner != null )
	{
		query += "&username=" + owner;
		query += "&requestor=" + Agua.cookie('username');
	}
	else
	{
		query += "&username=" + Agua.cookie('username');
	}

	query += "&sessionId=" + Agua.cookie('sessionId');
	query += "&filepath=" + filepath;
	//console.log("FileMenu.download     query: " + query);
	
	var downloadUrl = Agua.cgiUrl + "download.cgi";
	//////console.log("FileMenu.download     url: " + url);
	
	var args = {
		method: "GET",
		url: downloadUrl + query,
		handleAs: "json",
		timeout: 10000,
		load: this.handleDownload
	};
	//////console.log("FileMenu.download     args: ", args);

	// do an IFrame request to download the csv file.
	//console.log("FileMenu.download     Doing dojo.io.iframe.send(args))");
	var value = dojo.io.iframe.send(args);
	//console.log("FileMenu.download     value: " + dojo.toJson(value));

},

handleDownload : function (response, ioArgs) {
	//console.log("ParameterRow.handleDownload     plugins.workflow.ParameterRow.handleDownload(response, ioArgs)");
	//console.log("ParameterRow.handleDownload     response: " + dojo.toJson(response));
	//console.log("ParameterRow.handleDownload     response.message: " + response.message);

	if ( response.message == "ifd.getElementsByTagName(\"textarea\")[0] is undefined" )
	{
		Agua.toastMessage({
			message: "Download failed: File is not present",
			type: "error"
		});
	}	
},

openFileDownload : function (filepath) {
	//console.log("FileMenu.openFileDownload     plugins.files._GroupDragPane.openFileDownload(filepath)");
	//console.log("FileMenu.openFileDownload     filepath: " + filepath);
	
	var query = "?username=" + Agua.cookie('username');
	query += "&sessionId=" + Agua.cookie('sessionId');
	query += "&filepath=" + filepath;
//		//console.log("FileMenu.openFileDownload    query: " + query);
	
	var url = Agua.cgiUrl + "download.cgi";
//		//console.log("FileMenu.openFileDownload    url: " + url);
	
	var args = {
		method: "GET",
		url: url + query,
		//content: {},
		handleAs: "html",
		timeout: 10000
		//load: dojo.hitch(this, "onDownloadComplete"),
		//error: dojo.hitch(this, "onDownloadError")
	};
//		//console.log("FileMenu.openFileDownload    args: ", args);

	// do an IFrame request to download the csv file.
//		//console.log("FileMenu.openFileDownload    Doing dojo.io.iframe.send(args))");
	dojo.io.iframe.send(args);
},



// UTILITIES
setConfirmDialog : function () {
	var yesCallback = function (){};
	var noCallback = function (){};
	var title = "Dialog title";
	var message = "Dialog message";
	
	this.confirmDialog = new plugins.dijit.ConfirmDialog(
		{
			title 				:	title,
			message 			:	message,
			parentWidget 		:	this,
			yesCallback 		:	yesCallback,
			noCallback 			:	noCallback
		}			
	);
},

loadConfirmDialog : function (title, message, yesCallback, noCallback) {
	//console.log("FileMenu.loadConfirmDialog    plugins.files.FileMenu.loadConfirmDialog()");
	//console.log("FileMenu.loadConfirmDialog    yesCallback.toString(): " + yesCallback.toString());
	//console.log("FileMenu.loadConfirmDialog    title: " + title);
	//console.log("FileMenu.loadConfirmDialog    message: " + message);
	//console.log("FileMenu.loadConfirmDialog    yesCallback: " + yesCallback);
	//console.log("FileMenu.loadConfirmDialog    noCallback: " + noCallback);

	this.confirmDialog.load(
		{
			title 				:	title,
			message 			:	message,
			yesCallback 		:	yesCallback,
			noCallback 			:	noCallback
		}			
	);
},


setInputDialog : function () {
	var enterCallback = function (){};
	var cancelCallback = function (){};
	var title = "";
	var message = "";
	
	this.inputDialog = new plugins.dijit.InputDialog(
		{
			title 				:	title,
			message 			:	message,
			inputMessage		:	"",
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
},

loadInputDialog : function (title, message, enterCallback, cancelCallback) {
	//console.log("FileMenu.loadInputDialog    plugins.files.FileMenu.loadInputDialog()");
	//console.log("FileMenu.loadInputDialog    enterCallback.toString(): " + enterCallback.toString());
	//console.log("FileMenu.loadInputDialog    title: " + title);
	//console.log("FileMenu.loadInputDialog    message: " + message);
	//console.log("FileMenu.loadInputDialog    enterCallback: " + enterCallback);
	//console.log("FileMenu.loadInputDialog    cancelCallback: " + cancelCallback);

	this.inputDialog.load(
		{
			title 				:	title,
			message 			:	message,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
},

setInteractiveDialog : function () {
	var enterCallback = function (){};
	var cancelCallback = function (){};
	var title = "";
	var message = "";
	
	//console.log("FileMenu.setInteractiveDialog    plugins.files.FileMenu.setInteractiveDialog()");
	this.interactiveDialog = new plugins.dijit.InteractiveDialog(
		{
			title 				:	title,
			message 			:	message,
			inputMessage 		:	"",
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
	//console.log("FileMenu.setInteractiveDialog    this.interactiveDialog: " + this.interactiveDialog);
},

loadInteractiveDialog : function (title, message, enterCallback, cancelCallback, checkboxMessage) {
	//console.log("FileMenu.loadInteractiveDialog    plugins.files.FileMenu.loadInteractiveDialog()");
	//console.log("FileMenu.loadInteractiveDialog    enterCallback.toString(): " + enterCallback.toString());
	//console.log("FileMenu.loadInteractiveDialog    title: " + title);
	//console.log("FileMenu.loadInteractiveDialog    message: " + message);
	//console.log("FileMenu.loadInteractiveDialog    enterCallback: " + enterCallback);
	//console.log("FileMenu.loadInteractiveDialog    cancelCallback: " + cancelCallback);

	this.interactiveDialog.load(
		{
			title 				:	title,
			message 			:	message,
			checkboxMessage 	:	checkboxMessage,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
},

bind : function (node) {
// BIND THE MENU TO A NODE
	//console.log("FileMenu.bind     plugins.files.FileMenu.bind(node)");
	if ( node == null )
		//console.log("FileMenu.bind     node is null. Returning...");

	return this.menu.bindDomNode(node);	
},

getPath : function () {
// RETURN THE FILE PATH OF THE FOCUSED GROUP DRAG PANE
	//console.log("FileMenu.getPath     plugins.files.FileMenu.getPath()");
	//console.log("FileMenu.setUploader     this.menu.currentTarget: " + this.menu.currentTarget);
	var groupDragPane = dijit.getEnclosingWidget(this.menu.currentTarget);
	//console.log("FileMenu.setUploader     groupDragPane: " + groupDragPane);

	if ( groupDragPane == null || ! groupDragPane )	return;
	//console.log("FileMenu.setUploader     Returning path: " + groupDragPane.path);

	return groupDragPane.path;
},


hide : function () {
	//console.log("FileMenu.hide    this.parentWidget: " + this.parentWidget);
	this.parentWidget.hide();
},

setTitle : function (title) {
// SET THE MENU TITLE
	console.log("FileMenu.setTitle    title: " + title);
	this.titleNode.containerNode.innerHTML = title;
},

show : function () {
	//console.log("FileMenu.show    files.FileMenu.show()");
	
	console.log("FileMenu.show    this.menu.currentTarget: " + this.menu.currentTarget);
	console.dir({currentTarget:this.menu.currentTarget});
	dojo.addClass(this.menu.currentTarget, 'dojoDndItemOver');

	dojo.style(this.containerNode, {
		opacity: 1,
		overflow: "visible"
	});
},


disableMenuItem : function (name) {
	console.log("FileMenu.disableMenuItem    name: " + name);

    var item = this[name + "Node"];
	console.log("FileMenu.disableMenuItem    item: " + item);
	console.dir({item:item});

	if ( this[name + "Node"] )
		this[name + "Node"].disabled = true;
},

enableMenuItem : function (name) {
	console.log("FileMenu.enableMenuItem    name: " + name);
	if ( this[name] )
		this[name]. enabled = true;
},

disable : function () {
	//console.log("FileMenu.disable    files.FileMenu.disable()");
	this.menu.enabled = false;
},

enable : function () {
	//console.log("FileMenu.enable    files.FileMenu.enable()");

	this.menu.enabled = true;
},

setShortKeys : function () {
	// NOTE: USE accelKey IN DOJO 1.3 ONWARDS
	dojo.connect(this.menu, "onKeyPress", dojo.hitch(this, function(event)
	{
		//console.log("FileMenu.setMenu     this.menu.onKeyPress(event)");
		var key = event.charOrCode;
		if ( this.altOn == true )
		{
			switch (key)
			{
				case "s" : this.select(); break;
				case "a" : this.add(); break;
				case "n" : this.newFolder(); break;
				case "m" : this.rename(); break;
				case "l" : this.deleteFile(); break;
				case "o" : this.openWorkflow(); break;
				case "u" : this.upload(); break;
				case "w" : this.download(); break;
			}
		}
		event.stopPropagation();
	}));

	// SET ALT KEY ON/OFF
	dojo.connect(this.menu, "onKeyDown", dojo.hitch(this, function(event){
		//console.log("FileMenu.setMenu     this.menu.onKeyDown(event)");
		var keycode = event.keyCode;
		if ( keycode == 18 )	this.altOn = true;
	}));
	dojo.connect(this.menu, "onKeyUp", dojo.hitch(this, function(event){
		//console.log("FileMenu.setMenu     this.menu.onKeyUp(event)");
		var keycode = event.keyCode;
		if ( keycode == 18 )	this.altOn = false;
	}));	
}





	

}); // plugins.files.FileMenu

/*
 //onUploadComplete : function () {
//// RELOAD THE GROUP DRAG PANE ON UPLOAD COMPLETE
//	//console.log("FileMenu.onUploadComplete     plugins.files.FileMenu.onUploadComplete()");
//	var groupDragPane = dijit.getEnclosingWidget(this.menu.currentTarget);
//	//console.log("FileMenu.onUploadComplete    groupDragPane: " + groupDragPane);
//
//return;
//
//	// RELOAD THE PROJECTS TAB
//	setTimeout(function(thisObj) { groupDragPane.reload(); }, 1000, this);
//	//console.log("FileMenu.uploadOnComplete     this.uploadNode: " + this.uploadNode);
//},


*/