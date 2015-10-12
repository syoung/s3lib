console.clear();
var layoutpane = Agua.fileManager.atomic.dialog;
var filemanager = Agua.fileManager;


var menu = filemanager.fileMenu.menu;
console.log("menu: " + menu);
console.dir({menu:menu});
var items = menu.getChildren();
console.log("items: " + items);
console.dir({items:items});


var select = items[1];
console.log("select: " + select);
console.dir({select:select});
select.disabled = true;

Agua.fileManager.fileMenu.disableMenuItem = function (name) {
	console.log("FileMenu.disableMenuItem    name: " + name);
	console.log("FileMenu.disableMenuItem    this: " + this);
	if ( this.menu[name] )
		this.menu[name].disabled = true;
};


Agua.fileManager.fileMenu.disableMenuItem('select');
Agua.fileManager.fileMenu.disableMenuItem('add');



//dojo.reloadCss();