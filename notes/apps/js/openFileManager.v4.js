var reload = function () {
console.clear();
dojo.reload("plugins.files.FileManager");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
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


console.clear();
//reload();
//openFileManager();
dojo.reloadCss();