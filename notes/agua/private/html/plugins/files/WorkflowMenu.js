
dojo.provide("plugins.files.WorkflowMenu");

// WIDGET PARSER
dojo.require("dojo.parser");

// INHERITS
dojo.require("plugins.files.FileMenu");

// HAS A
dojo.require("dijit.Menu");
dojo.require("plugins.dijit.SelectiveDialog");

dojo.declare(
    "plugins.files.WorkflowMenu",
	[ plugins.files.FileMenu ],
{
	/////}}	
	
//Path to the template of this widget. 
templatePath: dojo.moduleUrl("plugins", "files/templates/workflowmenu.html"),

//// Calls dijit._Templated.widgetsInTemplate
//widgetsInTemplate : true,
//

// OR USE @import IN HTML TEMPLATE
cssFiles : [
	dojo.moduleUrl("plugins", "files/css/workflowmenu.css")
],

constructor : function() {
	//////console.log("WorkflowMenu.constructor     plugins.files.WorkflowMenu.constructor");			

	//// GET INFO FROM ARGS
	//this.parentWidget = args.parentWidget;
	////////console.log("WorkflowMenu.constructor     parentWidget: " + parentWidget);

	// LOAD CSS
	this.loadCSS();		
},

postCreate : function() {
	//////console.log("WorkflowMenu.postCreate    plugins.files.WorkflowMenu.postCreate()");

	// SET INPUT DIALOG
	this.setInputDialog();

	// SET INTERACTIVE DIALOG
	this.setInteractiveDialog();

	// SET CONFIRM DIALOG
	this.setConfirmDialog();

	// SET LABEL
	this.setTitle("Workflow Menu");

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();
	
	// DO STARTUP
	this.startup();
},


startup : function () {
	////console.log("FileMenu.startup    plugins.files.FileMenu.startup()");

	// COMPLETE CONSTRUCTION OF OBJECT
	this.inherited(arguments);	 

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();	

	// DISABLE MENU ITEMS
	this.disableMenuItem('select');
	this.disableMenuItem('add');

	// SET SELECTIVE DIALOG FOR copyWorkflow	
	this.setSelectiveDialog();

	// SUBSCRIBE TO UPDATES
	Agua.updater.subscribe(this, "updateProjects");
},

updateProjects : function (args) {
	console.warn("WorkflowMenu.updateProjects    args:");
	console.dir(args);

},

setTitle : function (title) {
// NO TITLE - DO NOTHING
	////console.log("FileMenu.setTitle    plugins.files.FileMenu.setTitle(title)");
	////console.log("FileMenu.setTitle    title: " + title);

//this.titleNode.containerNode.innerHTML = title;
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
				case "p" : this.newProject(); break;
				case "w" : this.newWorkflow(); break;
				case "r" : this.renameWorkflow(); break;
				case "d" : this.deleteProject(); break;
				case "l" : this.deleteWorkflow(); break;
				case "o" : this.openWorkflow(); break;
				case "c" : this.copyWorkflow(); break;
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

// MAIN METHODS
newProject : function () {
// ADD A NEW PROJECT USING A DIALOG BOX FOR PROJECT NAME INPUT
	//////console.log("WorkflowMenu.newProject    plugins.files.WorkflowMenu.newProject()");

	// GET PROJECT WIDGET		
	var projectWidget = this.getProjectWidget();
	if ( projectWidget == null )
	{
		//////console.log("WorkflowMenu.newWorkflow     projectWidget is null. Returning");
		return;
	}
	//////console.log("WorkflowMenu.newWorkflow     projectWidget: " + projectWidget);

	
	// CALLBACKS
	var cancelCallback = function (){
		//////console.log("WorkflowMenu.newProject    cancelCallback()");
	};
	var enterCallback = dojo.hitch(this, function (projectName)
		{
			//////console.log("WorkflowMenu.newProject    plugins.files.WorkflowMenu.newProject()");
			
			// SANITY CHECK
			if ( projectName == null )	return;
			if ( projectName == '' )	return;
			
			projectName = projectName.replace(/\s+/, '');
			//////console.log("WorkflowMenu.newProject    projectName: " + projectName);
		
			// THEN ADD NEW PROJECT OBJECT TO Agua.projects ARRAY
			var projectObject = new Object;
			projectObject.name = projectName;
			
			if ( Agua.isProject(projectName) == true )
			{
				//////console.log("WorkflowMenu.newProject    project " + projectName + " already exists. Returning");
				return;
			}
			
			// ADD PROJECT
			Agua.addProject(projectObject);

			// RELOAD THE PROJECTS TAB
			setTimeout(function(thisObj) { projectWidget.reload(); }, 1000, this);
		}
	);		

	var title = "New Project";
	var message = "Please enter project name";
	//////console.log("WorkflowMenu.newProject    plugins.files.WorkflowMenu.newProject()");
	this.loadInputDialog(title, message, enterCallback, cancelCallback);
},


newWorkflow : function () {
// ADD A NEW WORKFLOW USING A DIALOG BOX FOR WORKFLOW NAME INPUT
	//console.log("WorkflowMenu.newWorkflow    plugins.files.WorkflowMenu.newWorkflow()");
	//console.log("WorkflowMenu.newWorkflow    this.interactiveDialog: " + this.interactiveDialog);

	// GET PROJECT WIDGET		
	var projectWidget = this.getProjectWidget();
	if ( projectWidget == null )	return;
	//////console.log("WorkflowMenu.newWorkflow     projectWidget: " + projectWidget);

	var projectName = this.getProjectName();
	//////console.log("WorkflowMenu.newWorkflow     projectName: " + projectName);

	var interactiveDialog = this.interactiveDialog;
	
	// SET TITLE AND MESSAGE
	var title = "New Workflow";
	var message = "Please enter workflow name";
	
	// CALLBACKS
	var cancelCallback = function (){
		//////console.log("WorkflowMenu.newWorkflow    cancelCallbapck()");
	};

	// CALLBACK FORMAT:
	// this.dialog.enterCallback(input, checked);	
	var enterCallback = dojo.hitch(this, function (workflowName, undefined )
		{
			//console.log("WorkflowMenu.newWorkflow    Doing enterCallback(workflowName, undef)");
			//console.log("WorkflowMenu.newWorkflow    workflowName: " + workflowName);
		
			// SANITY CHECK
			if ( workflowName == null || workflowName == '' )	return;
			workflowName = workflowName.replace(/\s+/, '');
			//console.log("WorkflowMenu.newWorkflow    workflowName: " + workflowName);

			// QUIT IF WORKFLOW EXISTS ALREADY
			if ( Agua.isWorkflow({ project: projectName, name: workflowName }) == true )
			{
				//console.log("WorkflowMenu.newWorkflow    Workflow '" + workflowName + "' already exists in project " + projectName + ". Sending message to dialog.");
				
				interactiveDialog.messageNode.innerHTML = "Workflow already exists in '" + projectName + "'";
				return;
			}
			else {
				//console.log("WorkflowMenu.newWorkflow    Workflow '" + workflowName + "' is unique in project " + projectName + ". Adding workflow.");
				
				interactiveDialog.messageNode.innerHTML = "Creating workflow";
				interactiveDialog.close();
			}
			
			// ADD PROJECT
			Agua.addWorkflow({ project: projectName, name: workflowName });
	
			// RELOAD THE PROJECTS TAB
			setTimeout(function(thisObj) { projectWidget.reload(); }, 1000, this);
		}
	);		

	// SHOW THE DIALOG
	this.loadInteractiveDialog(title, message, enterCallback, cancelCallback);
},

copyWorkflow : function () {
// DISPLAY A 'Copy Workflow' DIALOG THAT ALLOWS THE USER TO SELECT 
// THE DESTINATION PROJECT AND THE NAME OF THE NEW WORKFLOW

	//console.log("WorkflowMenu.copyWorkflow    plugins.files.WorkflowMenu.copyWorkflow()");
	//console.log("WorkflowMenu.copyWorkflow    this.selectiveDialog: " + this.selectiveDialog);

	var item = this.menu.currentTarget.item;
	////console.log("WorkflowMenu.copyWorkflow     item: " + dojo.toJson(item));
	var sourceProject = item.parentPath;	
	var sourceWorkflow = item.path;	
	//console.log("WorkflowMenu.copyWorkflow     sourceProject: " + sourceProject);
	//console.log("WorkflowMenu.copyWorkflow     sourceWorkflow: " + sourceWorkflow);

	// SET CALLBACKS
	var cancelCallback = function (){
		//console.log("WorkflowMenu.copyWorkflow    cancelCallback()");
	};
	var thisObject = this;
	
	var enterCallback = dojo.hitch(this, function (targetProject, targetWorkflow, copyFiles, dialogWidget)
		{
			//console.log("WorkflowMenu.copyWorkflow    Doing enterCallback(targetWorkflow, targetProject, copyfiles, dialogWidget)");
			//console.log("WorkflowMenu.copyWorkflow    targetWorkflow: " + targetWorkflow);
			//console.log("WorkflowMenu.copyWorkflow    targetProject: " + targetProject);
			//console.log("WorkflowMenu.copyWorkflow    copyFiles: " + copyFiles);
			//console.log("WorkflowMenu.copyWorkflow    dialogWidget: " + dialogWidget);
			
			// SET BUTTON LABELS
			var enterLabel = "Copy";
			var cancelLabel = "Cancel";
			
			// SANITY CHECK
			if ( targetWorkflow == null || targetWorkflow == '' )	return;
			targetWorkflow = targetWorkflow.replace(/\s+/, '');
			//console.log("WorkflowMenu.copyWorkflow    targetWorkflow: " + targetWorkflow);

			// QUIT IF WORKFLOW IS EMPTY
			if ( targetWorkflow == null || targetWorkflow == '' )
			{
				dialogWidget.messageNode.innerHTML = "Please input name of new Workflow";
				return;
			}

			// QUIT IF WORKFLOW EXISTS ALREADY
			if ( Agua.isWorkflow({ project: targetProject, name: targetWorkflow }) == true )
			{
				//console.log("WorkflowMenu.copyWorkflow    Workflow '" + targetWorkflow + "' already exists in project " + targetProject + ". Sending message to dialog.");
				
				dialogWidget.messageNode.innerHTML = "/" + targetWorkflow + "' already exists in '" + targetProject + "'";
				return;
			}
			else {
				//console.log("WorkflowMenu.copyWorkflow    Workflow '" + targetWorkflow + "' is unique in project " + targetProject + ". Adding workflow.");

				dialogWidget.messageNode.innerHTML = "Creating workflow";
				dialogWidget.close();
			}
			
			thisObject._copyWorkflow(sourceProject, sourceWorkflow, targetWorkflow, targetProject, copyFiles);
		}
	);		

	// SHOW THE DIALOG
	this.selectiveDialog.load(
		{
			title 				:	"Copy Workflow",
			message 			:	"Source: '" + sourceProject + ":" + sourceWorkflow + "'",
			comboValues 		:	Agua.getProjectNames(),
			inputMessage 		:	"Workflow name",
			comboMessage 		:	"Project",
			checkboxMessage		:	"Copy files",
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback,
			enterLabel			:	"Copy",
			cancelLabel			:	"Cancel"
		}			
	);

},

_copyWorkflow : function (sourceProject, sourceWorkflow, targetProject, targetWorkflow, copyFiles) {
	//console.log("WorkflowMenu._copyWorkflow    WorkflowMenu._copyWorkflow(sourceProject, sourceWorkflow, targetProject, targetWorkflow, copyFiles)");
	
	var username = Agua.cookie('username');
	// ADD PROJECT
	Agua.copyWorkflow(username, sourceProject, sourceWorkflow, username, targetProject, targetWorkflow, copyFiles);
},

renameWorkflow : function () {
	//console.log("WorkflowMenu.renameWorkflow    plugins.files.WorkflowMenu.renameWorkflow()");
	
	// GET PROJECT WIDGET		
	var projectWidget = this.getProjectWidget();
	if ( projectWidget == null )	return;
	console.log("XXXXXXX WorkflowMenu.renameWorkflow     projectWidget: " + projectWidget);

	// SET PROJECT AND ORIGINAL WORKFLOW
	var projectName = this.getProjectName();
	console.log("WorkflowMenu.renameWorkflow     0000000 projectName: " + projectName);
	var originalWorkflowName = this.getWorkflowName();
	console.log("WorkflowMenu.renameWorkflow     originalWorkflowName: " + originalWorkflowName);

	// SET STANDBY
	var standby = this.getStandby();
	var target = this.menu.currentTarget.parentNode;
	standby.set('target', target);
	standby.show();

	// SET TITLE AND MESSAGE
	var title = "Rename workflow '" + originalWorkflowName + "'";
	var message = "Please enter new name";
	
	// CALLBACKS
	var cancelCallback = function (){
		//console.log("WorkflowMenu.renameWorkflow    cancelCallback()");
	};
	var enterCallback = dojo.hitch(this, function (newWorkflowName)
		{
			//console.log("WorkflowMenu.renameWorkflow    Doing enterCallback");
			
			// SANITY CHECK
			if ( newWorkflowName == null )	return;
			newWorkflowName = newWorkflowName.replace(/\s+/, '');
			if ( newWorkflowName == '' )	return;
			//console.log("WorkflowMenu.renameWorkflow    newWorkflowName: " + newWorkflowName);

			// CHECK IF NAME EXISTS ALREADY
			if ( Agua.isWorkflow({ project: projectName, name: newWorkflowName }) == true )
			{
				//console.log("WorkflowMenu.renameWorkflow    Workflow '" + newWorkflowName + "' already exists in project '" + projectName + "'. Returning");
				return;
			}
			
			// GET ORIGINAL WORKFLOW OBJECT
			var workflowObject = Agua.getWorkflow({
				project: projectName,
				name: originalWorkflowName
			});
			console.log("WorkflowMenu.renameWorkflow    workflowObject:" + dojo.toJson(workflowObject));
			console.dir({workflowObject:workflowObject});

			// QUIT IF WORKFLOW DOES NOT EXIST
			if ( workflowObject == null )
			{
				//console.log("WorkflowMenu.renameWorkflow    workflow object is null: " + originalWorkflowName + ". Returning");
				return;
			}
			
			// CALLBACK: RELOAD THE PROJECTS TAB AND HIDE STANDBY
			var callback = dojo.hitch(this, function () {
				console.log("WorkflowMenu.renameWorkflow    Doing callback");
				console.log("WorkflowMenu.renameWorkflow    projectWidget: " + projectWidget);
				projectWidget.reload();
				
				// DOING standby.hide
				console.log("WorkflowMenu.renameWorkflow    Doing standby.hide()");
				standby.hide();
			});
			console.log("WorkflowMenu.renameWorkflow    callback: " + callback);

			// RELOAD RELEVANT DISPLAYS
			Agua.updater.update("updateProjects", {originator: this.parentWidget, reload: false});
			
			// RENAME WORKFLOW (AND STAGES, STAGEPARAMETERS, ETC.)
			Agua.renameWorkflow(workflowObject, newWorkflowName, callback, standby);
	
			// RELOAD RELEVANT DISPLAYS
			Agua.updater.update("updateProjects", {originator: this.parentWidget, reload: false});
		}
	);		

	// SHOW THE DIALOG
	this.loadInputDialog(title, message, enterCallback, cancelCallback);
	
},

openWorkflow : function () {
	console.log("WorkflowMenu.openWorkflow    plugins.files.WorkflowMenu.openWorkflow()");

	// LABEL THIS AS SELECTED WORKFLOW
	dojo.addClass(this.menu.currentTarget, 'dojoDndItemOver');

	// GET PROJECT WIDGET		
	var projectWidget = this.getProjectWidget();
	if ( projectWidget == null )	return;
	console.log("WorkflowMenu.openWorkflow     projectWidget: " + projectWidget);

	var projectName = this.getProjectName();
	console.log("WorkflowMenu.openWorkflow     projectName: " + projectName);

	var workflowName = this.getWorkflowName();
	console.log("WorkflowMenu.openWorkflow     workflowName: " + workflowName);

	// CHECK IF WORKFLOW CONTROLLER IS LOADED
	var workflowController = Agua.controllers["workflow"];
	console.log("WorkflowMenu.openWorkflow    workflowController: " + workflowController);

	// OPEN WORKFLOW TAB
	if ( Agua.controllers["workflow"] ) 
		Agua.controllers["workflow"].createTab({project: projectName, workflow: workflowName});
},

deleteWorkflow : function () {
// DELETE A WORKFLOW USING A DIALOG BOX FOR CONFIRMATION BY THE USER
	//////console.log("WorkflowMenu.deleteWorkflow    plugins.files.WorkflowMenu.deleteWorkflow()");

	// GET PROJECT WIDGET		
	var projectWidget = this.getProjectWidget();
	if ( projectWidget == null )	return;
	//////console.log("WorkflowMenu.deleteWorkflow     projectWidget: " + projectWidget);

	var projectName = this.getProjectName();
	//////console.log("WorkflowMenu.deleteWorkflow     projectName: " + projectName);

	var workflowName = this.getWorkflowName();
	//////console.log("WorkflowMenu.deleteWorkflow     workflowName: " + workflowName);

	// CALLBACKS
	var noCallback = function (){
		//////console.log("WorkflowMenu.deleteWorkflow    noCallback()");
	};
	var yesCallback = dojo.hitch(this, function ()
		{
			//////console.log("WorkflowMenu.deleteWorkflow    Doing yesCallback(workflowName)");
			//////console.log("WorkflowMenu.deleteWorkflow    workflowName: " + workflowName);
			
			// SANITY CHECK
			if ( workflowName == null || workflowName == '' )	return;
			workflowName = workflowName.replace(/\s+/, '');
			//////console.log("WorkflowMenu.deleteWorkflow    workflowName: " + workflowName);

			// QUIT IF WORKFLOW EXISTS ALREADY
			if ( Agua.isWorkflow({ project: projectName, name: workflowName }) == false )
			{
				//////console.log("WorkflowMenu.deleteWorkflow    workflow " + workflowName + " does not exist. Returning");
				return;
			}
			
			// REMOVE WORKFLOW
			var workflowObject = new Object;
			workflowObject.project = projectName;
			workflowObject.name = workflowName;
			Agua.removeWorkflow(workflowObject);
	
			// RELOAD THE PROJECTS TAB
			setTimeout(function(thisObj) { projectWidget.reload(); }, 1000, this);
		}
	);		

	// SET TITLE AND MESSAGE
	var title = "Delete workflow '" + workflowName + "'?";
	var message = "All files and data will be destroyed";

	// SHOW THE DIALOG
	this.loadConfirmDialog(title, message, yesCallback, noCallback);
},

deleteProject : function () {
// DELETE A PROJECT USING A DIALOG BOX FOR CONFIRMATION BY THE USER
	//////console.log("ProjectMenu.deleteProject    plugins.files.ProjectMenu.deleteProject()");

	// GET PROJECT WIDGET		
	var projectWidget = this.getProjectWidget();
	if ( projectWidget == null )	return;
	//////console.log("WorkflowMenu.deleteProject     projectWidget: " + projectWidget);

	var projectName = this.getProjectName();
	//////console.log("WorkflowMenu.deleteProject     projectName: " + projectName);

	// CALLBACKS
	var noCallback = function (){
		//////console.log("WorkflowMenu.deleteProject    noCallback()");
	};
	var yesCallback = dojo.hitch(this, function ()
		{
			//////console.log("WorkflowMenu.deleteProject    Doing yesCallback(workflowName)");
			
			// SANITY CHECK
			if ( Agua.isProject(projectName) == false )
			{
				//////console.log("WorkflowMenu.newProject    project '" + projectName + "' doesn't exist. Returning");
				return;
			}

			// REMOVE PROJECT
			Agua.removeProject({ name: projectName });
			
			// RELOAD THE PROJECTS TAB
			setTimeout(function(thisObj) { projectWidget.reload(); }, 1000, this);
		}
	);		

	// SET TITLE AND MESSAGE
	var title = "Delete project '" + projectName + "'?";
	var message = "All workflows and data will be destroyed";

	// SHOW THE DIALOG
	this.loadConfirmDialog(title, message, yesCallback, noCallback);
	
},

// UTILITIES
getProjectWidget : function () {
// RETURN THE PROJECT TAB WIDGET CONTAINING THIS FILE DRAG OBJECT

	// SANITY		
	if ( this.menu.currentTarget == null )	return null;

	// GET THE PROJECT WIDGET
	var item = this.menu.currentTarget.item;
	////////console.log("WorkflowMenu.newFolder     this.menu.currentTarget: " + this.menu.currentTarget);
	////////console.log("WorkflowMenu.newFolder     item: " + item);
	var widget = dijit.getEnclosingWidget(this.menu.currentTarget);
	var projectWidget = widget.parentWidget.parentWidget;
	////////console.log("WorkflowMenu.getProjectWidget     widget: " + widget);
	////////console.log("WorkflowMenu.getProjectWidget     widget.parentWidget: " + widget.parentWidget);
	////////console.log("WorkflowMenu.getProjectWidget     widget.parentWidget.parentWidget: " + widget.parentWidget.parentWidget);
	//////console.log("WorkflowMenu.getProjectWidget     projectWidget: " + projectWidget);

	return projectWidget;
},

getProjectName : function () {
// RETURN THE PROJECT NAME FOR THIS FILE DRAG OBJECT
	
	// SANITY		
	if ( this.menu.currentTarget == null )	return null;

	// GET THE PROJECT WIDGET
	var item = this.menu.currentTarget.item;
	////////console.log("WorkflowMenu.newFolder     this.menu.currentTarget: " + this.menu.currentTarget);
	////////console.log("WorkflowMenu.newFolder     item: " + item);
	var widget = dijit.getEnclosingWidget(this.menu.currentTarget);
	var projectName = widget.path;

	return projectName;
},

getWorkflowName : function () {
// RETURN THE WORKFLOW NAME FOR THIS GROUP DRAG PANE OBJECT
	//////console.log("WorkflowMenu.getWorkflowName     plugins.files.WorkflowMenu.getWorkflowName()");
	
	// SANITY		
	if ( this.menu.currentTarget == null )	return null;

	// GET THE PROJECT WIDGET
	var item = this.menu.currentTarget.item;
	////////console.log("WorkflowMenu.getWorkflowName     item: " + dojo.toJson(item));
	var workflowName = item.path;
	////////console.log("WorkflowMenu.getWorkflowName     workflowName: " + workflowName);

	return workflowName;
},

setSelectiveDialog : function () {
	var enterCallback = function (){};
	var cancelCallback = function (){};
	var title = "";
	var message = "";
	
	////console.log("Stages.setSelectiveDialog    plugins.files.Stages.setSelectiveDialog()");
	this.selectiveDialog = new plugins.dijit.SelectiveDialog(
		{
			title 				:	title,
			message 			:	message,
			inputMessage 		:	"",
			checkboxMessage 	:	"",
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
	////console.log("Stages.setSelectiveDialog    this.selectiveDialog: " + this.selectiveDialog);
},

loadSelectiveDialog : function (title, message, comboValues, inputMessage, comboMessage, checkboxMessage, enterCallback, cancelCallback) {
	////console.log("Stages.loadSelectiveDialog    plugins.files.Stages.loadSelectiveDialog()");
	////console.log("Stages.loadSelectiveDialog    enterCallback.toString(): " + enterCallback.toString());
	////console.log("Stages.loadSelectiveDialog    title: " + title);
	////console.log("Stages.loadSelectiveDialog    message: " + message);
	////console.log("Stages.loadSelectiveDialog    enterCallback: " + enterCallback);
	////console.log("Stages.loadSelectiveDialog    cancelCallback: " + cancelCallback);

	this.selectiveDialog.load(
		{
			title 				:	title,
			message 			:	message,
			comboValues 		:	comboValues,
			inputMessage 		:	inputMessage,
			comboMessage 		:	comboMessage,
			checkboxMessage		:	checkboxMessage,
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
},

getStandby : function () {
	console.log("WorkflowMenu.getStandby    WorkflowMenu.getStandby()");
	
	if ( this.standby )	return this.standby;

	var id = dijit.getUniqueId("dojox_widget_Standby");
	this.standby = new dojox.widget.Standby (
		{
			onClick: "reload",
			text: "",
			id : id,
			url: "plugins/core/images/agua-biwave-24.png"
		}
	);
	document.body.appendChild(this.standby.domNode);
	console.log("WorkflowMenu.getStandby    this.standby: " + this.standby);

	return this.standby;
}


}); // plugins.files.WorkflowMenu
