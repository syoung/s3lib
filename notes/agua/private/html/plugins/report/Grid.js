
dojo.provide("plugins.report.Grid");

dojo.require("dijit.dijit"); // optimize: load dijit layer

// TITLE PANE
dojo.require("dijit.TitlePane");

// GRID
dojo.require("dojo.data.ItemFileWriteStore");
dojo.require("dojox.grid.DataGrid");

dojo.require("dijit.Tooltip");
dojo.require("dijit.Menu");

// DEPTH NUMBER SPINNER
dojo.require("dijit.form.NumberSpinner");

// PARSER
dojo.require("dojo.parser");

// INHERITED CLASSES
dojo.require("plugins.core.Common");

dojo.declare(
    "plugins.report.Grid",
    [ dijit._Widget, dijit._Templated, plugins.core.Common ],
{
    //Path to the template of this widget. 
    templatePath: dojo.moduleUrl("plugins", "report/templates/grid.html"),

    // Calls dijit._Templated.widgetsInTemplate
    widgetsInTemplate : true,
    
    // OR USE @import IN HTML TEMPLATE
    cssFiles : [ "dojo-1.5.0/dojox/grid/resources/Grid.css", "dojo-1.5.0/dojox/grid/resources/tundraGrid.css", "plugins/report/css/grid.css" ],

	// MAX. NO. OF USERS TO DISPLAY AT ANY ONE TIME IN DRAG SOURCE
	maxResults : 40,

    // Any initialization code would go here in the constructor.
    // plugins.report.Template and its superclasses dijit._Widget and
    // dijit._Templated do not have parameters in their constructors, so
    // there wouldn't be any multiple-inheritance complications
    // if you were to include some paramters here.
    constructor : function (args)
    {
        console.log("Grid.constructor    plugins.report.Grid.constructor(args)");
    },

    //Inherited from dijit._Widget and called just before template
    //instantiation in buildRendering. This method is especially useful
    //for manipulating the template before it becomes visible.
    postMixInProperties: function()
    {
        //console.log("Grid.postMixInProperties    plugins.report.Grid.postMixInProperties()");
        //console.log("Grid.postMixInProperties    this.containerNode: " + this.containerNode);
    },

    //You can override this method to manipulate widget once it is
    //placed in the UI, but be warned that any child widgets contained
    //in it may not be ready yet.        
    postCreate: function()
    {
        //console.log("Grid.postCreate    plugins.report.Grid.postCreate()");
        //console.log("Grid.postCreate    this.containerNode: " + this.containerNode);
        //console.log("Grid.postCreate    this.domNode: " + this.domNode);
        
        this.startup();
    },

    // startup
    //
    //
    startup : function ()
    {
        console.log("Grid.startup    plugins.report.Grid.startup()");

        // SET UP THE ELEMENT OBJECTS AND THEIR VALUE FUNCTIONS
        this.inherited(arguments);

        // LOAD CSS STYLE FILES
        this.loadCSS();
        
        // ADD TO TAB CONTAINER		
        console.log("Grid.postCreate    this.containerNode: " + this.containerNode);
        console.log("Grid.postCreate    this.attachNode: " + this.attachNode);
        this.attachNode.appendChild(this.containerNode);

        this.setResultsSlider();
        this.setResultsSpinner();
        this.showMaxResults();
    },

    // INITIALISE SLIDER TO SELECT BOUNDARIES OF RESULTS RANGE
    setResultsSlider : function ()
    {
        console.log("Grid.setResultsSlider     plugins.admin.Grid.setResultsSlider()");
        console.log("Grid.setResultsSlider     this.gridSlider: " + this.gridSlider);

        // ONMOUSEUP
        var thisObject = this;
        dojo.connect(this.gridSlider, "onMouseUp", dojo.hitch(this, function(e)
        {
            var position = parseInt(this.gridSlider.getValue());
            thisObject.displayResults(position);
        }));
    },

	// INITIALISE SPINNER TO SELECT WIDTH OF RESULTS RANGE
	setResultsSpinner : function ()
	{
        console.log("Grid.setResultsSpinner     plugins.admin.Grid.setResultsSpinner()");
		this.gridSpinnerNode.id = '';
		this.gridSpinner = new dijit.form.NumberSpinner(
			{
                value: this.maxResults,
                smallDelta: "10",
				constraints: { min: 20, max: 500, places:0},
				size : 1
			},
			this.gridSpinnerNode
		);
		this.gridSpinner.domNode.setAttribute('style', "width: 50px;");

		//this.gridSpinner.downArrowNode.setAttribute('style', "background: transparent url(plugins/report/images/spriteArrows.png) no-repeat scroll !important; width: 15px;"); 

		//this.gridSpinner.downArrowNode.setAttribute('style', "background: transparent url(http://localhost/agua/0.4/plugins/view/images/spriteArrows.png) no-repeat scroll !important; width:17px;"); 
		//this.gridSpinner.downArrowNode.setAttribute('class', 'downArrow'); 

        dojo.connect(this.gridSpinner, "onBlur", dojo.hitch(this, function ()
        {
            this.maxResults = this.gridSpinner.value;
            console.log("Grid.setResultsSpinner    onBlur this.maxResults: " + this.maxResults);
            
            var position = this.resultStart.innerHTML;
            console.log("Grid.setResultsSpinner    onBlur position: " + position);
            
            this.displayResults(position);
        }));


	},

	// INITIALISE SPINNER TO SELECT WIDTH OF RESULTS RANGE
	updateResultsSpinner : function ()
	{
        console.log("Grid.setResultsSlider     plugins.admin.Grid.setResultsSlider()");
        console.log("Grid.setResultsSlider     this.gridSlider: " + this.gridSlider);
		if ( this.gridSpinner == null )
        {
            console.log("Grid.setResultsSlider     this.gridSlider is null. Returning");
            return;
        }
		
		//this.gridSpinner.domNode.setAttribute('style', "width: 50px;");
	},


    // SET INNERHTML OF this.showResults NODE TO this.maxResults
    showMaxResults : function ()
    {
        console.log("Grid.showMaxResults     plugins.report.Grid.showMaxResults(data)");
        console.log("Grid.showMaxResults     this.maxResults: " + this.maxResults);

        //this.showResults.innerHTML = this.maxResults;
    },


    // SET this.maxResults TO AN INTEGER
    setMaxResults : function (integer)
    {
        console.log("Grid.setMaxResults     plugins.report.Grid.setMaxResults(integer)");
        if ( integer == null || ! integer )
        {
            console.log("Grid.setMaxResults     integer null, empty or zero. Returning");
            return;
        }

        integer = parseInt(integer);
        
        if ( integer < 1 )
        {
            console.log("Grid.setMaxResults     integer < 0. Returning");
            return;
        }
        
        this.maxResults = integer;
        console.log("Grid.setMaxResults     Set this.maxResults: " + this.maxResults);
    },

    // SET INNERHTML OF this.totalResults NODE TO AN INTEGER
    showTotalResults : function (integer)
    {
        console.log("Grid.showTotalResults     plugins.report.Grid.showTotalResults(integer)");
        console.log("Grid.showTotalResults     integer: " + integer);

        this.totalResults.innerHTML = integer;
    },

    // SET INNERHTML OF this.resultStart NODE TO AN INTEGER
    showResultStart : function (integer)
    {
        console.log("Grid.showResultStart     plugins.report.Grid.showResultStart(integer)");
        console.log("Grid.showResultStart     integer: " + integer);

        this.resultStart.innerHTML = integer;
    },


    // SET INNERHTML OF this.resultStop NODE TO AN INTEGER
    showResultStop : function (integer)
    {
        console.log("Grid.showResultStop     plugins.report.Grid.showResultStop(integer)");
        console.log("Grid.showResultStop     integer: " + integer);

        this.resultStop.innerHTML = integer;
    },


    // LOAD DATA INTO this.data AND CALL displayResults
    load : function(data)
    {
        console.log("Grid.loadGrid     plugins.report.Grid.loadGrid(data)");
        //console.log("Grid.loadGrid     data Json: " + dojo.toJson(data));

        this.data = data;
        
        // DISPLAY RESULTS
        this.displayResults(null);
    },




	displayResults : function (position)
	{
		console.log("Grid.displayResults     plugins.admin.Grid.displayResults(position)");
		console.log("Grid.displayResults     position: " + position);

        if ( this.doingDisplay == true )
        {
    		console.log("Grid.displayResults     this.doingDisplay: " + this.doingDisplay + ". Returning");
            return;
        }
        this.doingDisplay = true;
        
        // DISABLE GRID SLIDER
        this.gridSlider.attr('disabled', true);
		console.log("Grid.displayResults     this.gridSlider.attr('disabled'): " + this.gridSlider.attr('disabled'));


		// REMOVE ALL EXISTING CONTENT
        // REMOVE EXISTING GRID NODE FROM GRID CONTAINER
        var gridContainer = this.outputResult;
        while(gridContainer.firstChild)
        {
           gridContainer.removeChild(gridContainer.firstChild);
        }

        // SET GRID ID AND REMOVE ANY EXISTING GRID
        var gridId = this.gridId;
        if ( dijit.byId(gridId) )
        {
            dijit.byId(gridId).destroy();
        }


		// SET position IF NOT DEFINED
		if ( position == null )	position = 0;
		console.log("Grid.displayResults     position: " + position);


		// RETURN IF this.data IS NULL OR EMPTY
		if ( this.data == null || this.data.length == 0 )
		{
			console.log("Grid.displayResults     this.data is null or empty. Returning.");
            this.doingDisplay = false;

            // ENABLE GRID SLIDER
            this.gridSlider.attr('disabled', false);

			return;
		}

		var MAXRESULTS = this.maxResults;
		var MULTIPLE = ( this.data.items.length - MAXRESULTS ) / 100;
		MULTIPLE = MULTIPLE ? MULTIPLE : 1;
		var start = parseInt(position * MULTIPLE);
        if ( start < 0 ) start = 0;
		var stop = parseInt( (position * MULTIPLE) + MAXRESULTS );
		if ( ! stop || stop > this.data.items.length )	stop = this.data.items.length;
		console.log("Grid.displayResults     start: " + start);
		console.log("Grid.displayResults     stop: " + stop);
		console.log("Grid.displayResults     this.data.items.length: " + this.data.items.length);

        // DISPLAY START AND STOP POINTS
        this.showTotalResults(this.data.items.length);
        this.showResultStart(start);
        this.showResultStop(stop);
        

		// GENERATE USER DATA TO INSERT INTO DND USER TABLE
        var tempData = new Object;
        tempData.identifier = this.data.identifier;
        tempData.label = this.data.label;
        
		var itemsArray = new Array;
        for ( var j = start; j < stop; j++ )
		{
			itemsArray.push(this.data.items[j]);
		}
        tempData.items = itemsArray;
        
        //console.log("Grid.displayResults     tempData: " + dojo.toJson(tempData));
        

        // SEE EXAMPLE:    
        //http://localhost:8080/Bioptic0.2.5/html/tests/report-snp3.html
        //console.log("Grid.loadGrid     data: " + dojo.toJson(data));

        // SET STORE USING DATA
        var gridStore = new dojo.data.ItemFileWriteStore({data: tempData});
        console.log("Grid.loadGrid     gridStore: " + gridStore);


        var layout = [
            {name: 'Entry', field: 'id', width: "30px"},
            {name: 'Name', field: 'name', width: "100px"},
            {name: 'Chr', field: 'chromosome', width: "40px"},
            {name: 'CCDS start', field: 'ccdsstart', width: "40px"},
            {name: 'CCDS stop', field: 'ccdsstop', width: "40px"},
            {name: 'Ref nt', field: 'referencenucleotide', width: "20px"},
            {name: 'Var nt', field: 'variantnucleotide', width: "20px"},
            {name: 'Depth', field: 'depth', width: "30px"},
            {name: 'Var freq', field: 'variantfrequency', width: "30px"},
            {name: 'Chr start', field: 'chromosomestart', width: "40px"},
            {name: 'Chr stop', field: 'chromosomestop', width: "40px"},
            {name: 'Sense', field: 'sense', width: "40px"},
            {name: 'Ref codon', field: 'referencecodon', width: "35px"},
            {name: 'Var codon', field: 'variantcodon', width: "35px"},
            {name: 'Ref aa', field: 'referenceaa', width: "50px"},
            {name: 'Var aa', field: 'variantaa', width: "50px"},
            {name: 'Strand', field: 'strand', width: "35px"},
            {name: 'SNP', field: 'snp', width: "40px"},
            {name: 'Score', field: 'score', width: "40px"},
            {name: 'dbSNP strand', field: 'dbsnpstrand', width: "40px"}
        ];

        var gridId = dojo.dnd.getUniqueId();
        console.log("Grid.loadGrid     gridId: " + gridId);

        grid = new dojox.grid.DataGrid({
            id: gridId,
            autoHeight: true,
            store: gridStore,
            structure: layout
        }, document.createElement('div'));
        console.log("Grid.loadGrid     grid: " + grid);
        
        // IMPORTANT: CLASS IS REQUIRED FOR PROPER DISPLAY
        dojo.addClass(grid.viewsHeaderNode, 'viewsHeaderNode');
        dojo.addClass(grid.domNode, 'reportSNPGrid');
        dojo.addClass(gridContainer, 'work-pane-split');


        grid.onCellContextMenu = function(e) {
                cellNode = e.cellNode;
        };
        grid.onHeaderContextMenu = function(e) {
            cellNode = e.cellNode;
        };    

//			console.log("Grid.loadGrid     grid.dojoxGridHeader: " + grid.dojoxGridHeader);
//            console.log("Grid.loadGrid     grid.dojoxGridMasterView: " + grid.dojoxGridMasterView);
//            console.log("Grid.loadGrid     grid.dojoxGridMasterHeader: " + grid.dojoxGridMasterHeader);
//            console.log("Grid.loadGrid     grid.dojoxGridView: " + grid.dojoxGridView);
//            console.log("Grid.loadGrid     grid.viewsNode: " + grid.viewsNode);
//            console.log("Grid.loadGrid     grid.viewsHeaderNode: " + grid.viewsHeaderNode);
//            console.log("Grid.loadGrid     grid.viewsNode.firstChild: " + grid.viewsNode.firstChild);
//            console.log("Grid.loadGrid     grid.viewsHeaderNode.firstChild: " + grid.viewsHeaderNode.firstChild);
//
//            var dojoxGridViewNode = grid.viewsNode.firstChild;
//            console.log("Grid.loadGrid     dojoxGridViewNode: " + dojoxGridViewNode);
//			//dojoxGridViewNode children
//			//0
//			//	input.dojoxGridHiddenFocus on
//			//1
//			//	input.dojoxGridHiddenFocus on
//			//2
//			//	div.dojoxGridScrollbox
//            var dojoxGridScrollbox = dojoxGridViewNode.childNodes[2];
//            console.log("Grid.loadGrid     dojoxGridScrollbox: " + dojoxGridScrollbox);

        
        //dojo.addClass(grid.headerContentNode, 'headerContentNode');
        //console.log("Grid.loadGrid     grid.model: " + grid.model);
        //console.log("Grid.loadGrid     grid.store: " + grid.store);
    


        // RESPONDS TO CLICKS ON THE GRID -- BUT CAN'T FIND GRID...
        this.grid = grid;
        
        var snpReport = this;
        dojo.connect(grid,'onClick', function getGridRow (n)
            {
                console.log("Grid.jjjj jjjj plugins.report.Grid.getGridRow(n)");
                var grid = snpReport.grid;
                console.log("Grid.jjjj jjjj grid: " + grid);
                
                var row = grid.selection.getSelected()[0];
                console.log("Grid.jjjj jjjj row: " + row);
                console.log("Grid.jjjj jjjj n.rowIndex: " + n.rowIndex);
                
                var datarow = grid.getItem(n.rowIndex);
                //console.log("Grid.jjjj jjjj datarow: " + datarow);

                
                var name = grid.store.getValue(datarow,"name");
                var chromosome = grid.store.getValue(datarow,"chromosome");
                var chromosomeStart = grid.store.getValue(datarow,"chromosomestart");
                var chromosomeStop = grid.store.getValue(datarow,"chromosomestop");

                console.log("Grid.jjjj jjjj " + name + ", " + chromosome + ", " + chromosomeStart + ", " + chromosomeStop);
                //var t = grid.store.getValue(row,"Title");
                //console.debug("jjjj jjjj f: " +f+" "+t);
            
                return;
            }
        );

//            // ADD CONTEXT MENU
        var gridMenu = this.createGridMenu(grid);
        gridMenu.bindDomNode(grid.domNode);

        // prevent grid methods from killing the context menu event by implementing our own handler
        grid.onCellContextMenu = function(e) {

            console.log("Grid.displayResults grid.onCellContextMenu(e)");
            cellNode = e.cellNode;
            console.log("Grid.displayResults     cellNode: " + cellNode);
            console.dir(cellNode);
        };

        grid.onHeaderContextMenu = function(e) {

            console.log("Grid.displayResults grid.onContextContextMenu(e)");
            cellNode = e.cellNode;
            console.log("Grid.displayResults     cellNode: " + cellNode);
            console.dir(cellNode);
        };


        // APPEND GRID TO GRID CONTAINER AND STARTUP
        gridContainer.appendChild(grid.domNode);
        console.log("Grid.loadGrid     BEFORE grid.startup()");
        grid.startup();
        console.log("Grid.loadGrid     AFTER grid.startup()");


        // ENABLE GRID SLIDER
        this.gridSlider.attr('disabled', false);
		console.log("Grid.displayResults     this.gridSlider.attr('disabled'): " + this.gridSlider.attr('disabled'));

        this.doingDisplay = false;

    },   // load



    // ADD PROGRAMMATIC CONTEXT MENU
    createGridMenu : function (grid)
    {
        var menuId = dojo.dnd.getUniqueId();
        var dynamicMenu = new dijit.Menu( { id: menuId } );
    
        // ADD MENU TITLE
        dynamicMenu.addChild(new dijit.MenuItem( { label:"Options", disabled:false} ));
        dynamicMenu.addChild(new dijit.MenuSeparator());
    
        //// ONE OF FOUR WAYS TO DO MENU CALLBACK WITH ACCESS TO THE MENU ITEM AND THE CURRENT TARGET 	
        // 4. dojo.connect CALL
        //	REQUIRES:
        //		ADDED menu.currentTarget SLOT TO dijit.menu
        var mItem1 = new dijit.MenuItem(
            {
                label: "View",
                disabled: false
            }
        );
        dynamicMenu.addChild(mItem1);


        var snpReport =this;
        dojo.connect(mItem1, "onClick", function(e)
            {
                console.log("Grid.createGridMenu    View.onclick    dojo.connect 'View' clicked");
                if( cellNode )
                {
                    //console.log("Grid.createGridMenu    View.onclick    Cell contents  " + cellNode.innerHTML);
                    var rowNode = cellNode.parentNode;
                    var tableNode = cellNode.parentNode.parentNode.parentNode;
                    var divNode = tableNode.parentNode;
                    var containerNode = tableNode.parentNode.parentNode;
    
                    //console.log("Grid.createGridMenu    View.onclick    cellNode: " + cellNode);
                    //console.log("Grid.createGridMenu    View.onclick    rowNode: " + rowNode);
                    //console.log("Grid.createGridMenu    View.onclick    rowNode.id: " + rowNode.id);
                    //console.log("Grid.createGridMenu    View.onclick    tableNode: " + tableNode);
                    //console.log("Grid.createGridMenu    View.onclick    divNode: " + divNode);
                    //console.log("Grid.createGridMenu    View.onclick    containerNode: " + containerNode);
                    //console.log("Grid.createGridMenu    View.onclick    containerNode.childNodes.length: " + containerNode.childNodes.length);
                    var rowIndex;
                    for ( rowIndex = 0; rowIndex < containerNode.childNodes.length; rowIndex++ )
                    {
                        if ( containerNode.childNodes[rowIndex] == divNode )
                        {
                            break;
                        }
                    }
                    console.log("Grid.createGridMenu    View.onclick    rowIndex: " + rowIndex);
    
                    var datarow = grid.getItem(rowIndex);
                    var name = grid.store.getValue(datarow,"name");
                    var chromosome = grid.store.getValue(datarow,"chromosome");
                    var chromosomeStart = grid.store.getValue(datarow,"chromosomestart");
                    var chromosomeStop = grid.store.getValue(datarow,"chromosomestop");
    
                    console.log("Grid.jjjj jjjj " + name + ", " + chromosome + ", " + chromosomeStart + ", " + chromosomeStop);

                    snpReport.viewRow(rowIndex, grid);
                }
            }
        );
    
        // SEPARATOR
        dynamicMenu.addChild(new dijit.MenuSeparator());

        //	ADD run MENU ITEM
        var mItem2 = new dijit.MenuItem(
            {
                label: "Edit",
                disabled: false
            }
        );
        dynamicMenu.addChild(mItem2);	

        dojo.connect(mItem2, "onClick", function()
            {
                console.log("Grid.++++ dojo.connect 'Edit' clicked");	

                var currentTarget = dynamicMenu.currentTarget; 
                var adminList = currentTarget.parentNode;
            }
        );
            
        return dynamicMenu;

    },   // createGridMenu
    
    
    // DISPLAY THE GRID ITEM IN THE 'View' TAB
    viewRow : function (rowIndex, grid)
    {
        console.log("Grid.viewRow    plugins.report.Grid.showView(rowIndex, grid)");   
        console.log("Grid.viewRow    rowIndex: " + rowIndex);   
        console.log("Grid.viewRow    grid: " + grid);   
        console.log("Grid.viewRow    grid.getItem(" + rowIndex + "): " + grid.getItem(rowIndex));   
        //var value = row[0];
        
        //var row = grid.selection.getSelected()[0];
        var datarow = grid.getItem(rowIndex);
        console.log("Grid.viewRow   * datarow: " + dojo.toJson(datarow.toString()));
        var name = grid.store.getValue(datarow,"name");
        var chromosome = grid.store.getValue(datarow,"chromosome");
        var chromosomeStart = grid.store.getValue(datarow,"chromosomestart");
        var chromosomeStop = grid.store.getValue(datarow,"chromosomestart");

        console.log("Grid.viewRow   " + name + ", " + chromosome + ", " + chromosomeStart + ", " + chromosomeStop);

        //var t = grid.store.getValue(row,"Title");
        //console.debug(f+" "+t);

        //var store = grid.store;
        //console.log("Grid.**** **** store: " + store);
        //console.log("Grid.**** **** store.data: " + store.data);

        //var row = store.fetch(
        //{
        //    query : { id : rowIndex }, 
        //    onComplete: function(items, request)
        //    {
        //        console.log("Grid.items.length: " + items.length);
        //        console.log("Grid.Items Json: " + items);
        //        console.log("Grid.request: " + request);
        //        
        //        console.log("Grid.items[0]: " + items[0]);
        //        return 1;
        //    }
        //});

        //var row = grid.getItem(rowIndex);
        //console.log("Grid.**** **** row: " + dojo.toJson(row));
        //
        //var value = row[0];
        //console.log("Grid.**** **** value = row[0] : " + dojo.toJson(row[0]));
        ////console.log("Grid.**** **** value = row[0] : " + dojo.toJson(row[0]));
        //
        //console.log("Grid.**** **** grid.selection: " + grid.selection);
        //var row = grid.selection.getSelected()[rowIndex];
        //console.debug("row:" + row);

        //var value = grid.model.data[row];
        //console.debug("value: " + value);

        //var erName = value.ER_Name;
        //console.debug("erName : " + erName);
        
        
    },

    // GRID REPORT GOES HERE
    output : function (widget, name)
    {
        var snpReport = this;
        console.log("Grid.output     output(widget, name)");
        
        // SET VALUE FUNCTION
        if ( ! this.elementObjects[name] )
        {
            console.log("Grid.output     No widget with name: " + name);
        }
        
        console.log("Grid.output     BEFORE this.elementObjects[name].value = function(widgetObject, value)");
        
        
        this.elementObjects[name].valueFunction = function(widgetObject, value)
        {
            console.log("Grid.output     this.elementObjects[name].value");
            console.log("Grid.output     this.elementObjects[" + name + "].id: " + snpReport.elementObjects[name].id);
            console.log("Grid.output     value: " + value);
            if ( widgetObject.widget )
            {
                console.log("Grid.output     widgetObject.widget is DEFINED");
                return value ? widgetObject.widget.setValue(value) : widgetObject.widget.getValue();
            }
            else if ( dojo.byId(widgetObject.id ) && ( value == null || ! value ) )
            {
                console.log("Grid.output     widgetObject.widget is NOT defined");
                return dojo.byId(widgetObject.id).value; 
            }
        }
    }

	
}); // plugins.report.Grid



//setMenu : function ()
//{
//    var showTooltip = function(e)
//    {
//        if(gridTooltipEnabled)
//        {
//            var msg = "This is cell " + e.rowIndex + ", " + e.cellIndex;
//            dijit.showTooltip(msg, e.cellNode);
//        }
//    },
//
//    hideTooltip = function(e) {
//        dijit.hideTooltip(e.cellNode);
//        // FIXME: make sure that pesky tooltip doesn't reappear!
//        // would be nice if there were a way to hide tooltip without regard to aroundNode.
//        dijit._masterTT._onDeck=null;
//    }
//			
//    // cell tooltip
//    dojo.connect(grid, "onCellMouseOver", showTooltip);
//    dojo.connect(grid, "onCellMouseOut", hideTooltip);
//    // header cell tooltip
//    dojo.connect(grid, "onHeaderCellMouseOver", showTooltip);
//    dojo.connect(grid, "onHeaderCellMouseOut", hideTooltip);
//
//    // grid menu
//    window["gridMenu"] = dijit.byId("gridMenu");
//    gridMenu.bindDomNode(grid.domNode);
//    // prevent grid methods from killing the context menu event by implementing our own handler
//    grid.onCellContextMenu = function(e) {
//            cellNode = e.cellNode;
//    };
//    grid.onHeaderContextMenu = function(e) {
//        cellNode = e.cellNode;
//    };    
//    
//    reportCell = function() {
//        if(cellNode){
//            alert("Cell contents:  " + cellNode.innerHTML);
//            cellNode = null;
//        }
//    }
//    
//    gridTooltipEnabled = true;
//    toggleTooltip = function (button){
//        gridTooltipEnabled = !gridTooltipEnabled;
//        button.value = gridTooltipEnabled ? "Disable Grid Tooltip" : "Enable Grid Tooltip";
//    }
//    
//    gridMenuEnabled = true;
//    toggleMenu = function (button){
//        gridMenuEnabled = !gridMenuEnabled;
//        button.value = gridMenuEnabled ? "Disable Grid Menu" : "Enable Grid Menu";
//        gridMenu[gridMenuEnabled ? "bindDomNode" : "unBindDomNode"](grid.domNode);
//    }
//
//}
//
