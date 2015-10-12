console.clear();
var layoutpane = Agua.fileManager.atomic.dialog;
var filemanager = Agua.fileManager;


var menu = filemanager.fileMenu.menu;
console.log("menu: " + menu);
console.dir({menu:menu});
var items = menu.getChildren();
console.log("items: " + items);
console.dir({items:items});

Agua.fileManager.fileMenu.disableMenuItem = function (name) {
	console.log("FileMenu.disableMenuItem    name: " + name);



    // THIS WORKS!!
	if ( this[name + "Node"] )

		this[name + "Node"].disabled = true;

};


//Agua.fileManager.fileMenu.disableMenuItem('select');
Agua.fileManager.fileMenu.disableMenuItem('add');



//dojo.reloadCss();