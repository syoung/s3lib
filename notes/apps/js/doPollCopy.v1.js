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

    var folders = location.split(/\//);
    var projectName = folders[0];
    var fileDrag = projectFiles.getFileDragByProject(projectName);
console.dir({fileDrag:fileDrag});    

    var dragPanes = fileDrag.getChildren();
    console.log("ProjectFiles.openLocation    dragPanes.length: " + dragPanes.length);
    console.dir({dragPanes:dragPanes});
    var dragPane = dragPanes[0];

    // DO pollCopy
    dragPane.pollCopy();
    


};


//dojo.reloadCss();

//reload();

doPollCopy();



