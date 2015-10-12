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


var setFileCaches = function () {

    console.clear();
    Agua.setFileCaches("t/json/fileCaches.json");

}


//reload();
setFileCaches();
