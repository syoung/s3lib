var reload = function () {
console.clear();
dojo.reload("plugins.workflow.Stages");
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.workflow.FileManager");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};

var createTab = function () {
    setTimeout( function(){
    Agua.controllers["workflow"].createTab();
    }, 5000, this);
};


var refreshTabs = function () {

//setTimeout(function() {
    var workflowController = Agua.controllers["workflow"];
    console.dir({workflowController:workflowController});
    workflowController.refreshTabs();
//}, 4000, this);

};


var openFileManager = function () {
    Agua.setFileCaches("t/json/fileCaches.json");

    var workflow = Agua.controllers["workflow"].tabPanes[0];
    console.log("openFileManager    workflow: " + workflow);
    console.dir({workflow:workflow});
    console.log("openFileManager    workflow: " + workflow);
    console.dir({workflow:workflow});
      
    workflow.core.fileManager.show();
};


//console.clear();
//reload();
//createTab();
//refreshTabs();
//openFileManager();


dojo.reloadCss();