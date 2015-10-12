var reload = function () {
console.clear();
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.workflow.Stages");
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.workflow.FileManager");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};


workflowController.refreshTabs = function () {    
    console.log("workflow.Controller.refreshTabs    Populating this.tabPanes");
    console.log("workflow.Controller.refreshTabs    BEFORE this.tabPanes: ");
    console.dir({this_tabPanes:this.tabPanes});

var thisObject = this;
dijit.registry.byClass("plugins.workflow.Workflow").forEach(function(workflow) {
			console.log("workflow: " + workflow);
			console.dir({workflow:workflow});
	        thisObject.tabPanes.push(workflow);    
		});
    
    console.log("workflow.Controller.refreshTabs    AFTER this.tabPanes: ");
    console.dir({this_tabPanes:this.tabPanes});
};


var openFileManager = function () {
    console.clear();
    Agua.setFileCaches("t/json/fileCaches.json");

    var workflow = Agua.controllers["workflow"].tabPanes[0];
    console.log("openFileManager    workflow: " + workflow);
    console.dir({workflow:workflow});    
};


//reload();
refreshTabs();
//openFileManager();
