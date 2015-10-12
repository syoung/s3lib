
dojo.provide("plugins.report.Editor");

// BASED ON dijit.Editor
dojo.require("dijit.Editor");


dojo.declare("plugins.report.Editor",
    [ dijit.Editor ],
{
    alreadyStarted : false,

    startup : function ()
    {
        console.log("Editor.startup    plugins.report.Editor.startup()");
        
        this.alreadyStarted = true;
        console.log("Editor.startup    this.alreadyStarted: " + this.alreadyStarted);
        
    },


    constructor : function ()
    {
        console.log("Editor.constructor    plugins.report.Editor.constructor()");
        console.log("Editor.constructor    this.id: " + this.id);
    },




    postCreate : function ()
    {
    
        console.log("Editor.postCreate    plugins.report.Editor.postCreate()");
        console.log("Editor.postCreate    this.id: " + this.id);

        //for custom undo/redo
        if(this.customUndo){
            dojo['require']("dijit._editor.range");
            this._steps=this._steps.slice(0);
            this._undoedSteps=this._undoedSteps.slice(0);
//				this.addKeyHandler('z',this.KEY_CTRL,this.undo);
//				this.addKeyHandler('y',this.KEY_CTRL,this.redo);
        }

        if(dojo.isArray(this.extraPlugins)){
            this.plugins=this.plugins.concat(this.extraPlugins);
        }

//			try{
        this.inherited(arguments);
//			dijit.Editor.superclass.postCreate.apply(this, arguments);

        
        
        return;


//        this.commands = dojo.i18n.getLocalization("dijit._editor", "commands", this.lang);
//
//        if(!this.toolbar){
//            // if we haven't been assigned a toolbar, create one
//            this.toolbar = new dijit.Toolbar({});
//            dojo.place(this.toolbar.domNode, this.editingArea, "before");
//        }
//
//        dojo.forEach(this.plugins, this.addPlugin, this);
//        this.onNormalizedDisplayChanged(); //update toolbar button status
////			}catch(e){ console.debug(e); }
//
//        this.toolbar.startup();
//
//        console.log("Editor.postCreate    END");
    },



    destroy: function(){

        console.log("Editor.destroy    plugins.report.Editor.destroy()");
        console.log("Editor.destroy    this.id: " + this.id);

        dojo.forEach(this._plugins, function(p){
            // ADDED destroyRecursive TO TRY TO REMOVE FF ERROR:
            // "Component returned failure code: 0x80004005 (NS_ERROR_FAILURE) [nsIDOMNSHTMLDocument.queryCommandEnabled]"
            //if(p && p.destroy){
            //    p.destroy();
             if(p && p.destroyRecursive){
                p.destroyRecursive();
           }
        });
        this._plugins=[];
        
        //this.toolbar.destroy(); delete this.toolbar;
        
        this.toolbar.destroyRecursive();
        delete this.toolbar;

//        this.inherited(arguments);
    },


    postMixInProperties: function(){

        console.log("Editor.postMixInProperties     plugins.report.Editor.postMixInProperties()");
        console.log("Editor.postMixInProperties     this.id: " + this.id);
        console.log("Editor.postMixInProperties     dijit.byId(" + this.id + "): " + dijit.byId(this.id));

        console.log("Editor.postMixInProperties     this.alreadyStarted: " + this.alreadyStarted);
        

        if (dijit.byId(this.id)) {
            console.log("Editor.postMixInProperties     this.id: " + this.id);
            dijit.byId(this.id).destroyRecursive();
        }

        console.log("Editor.postMixInProperties    END");
    },


    destroyRecursive: function(){
        dojo.forEach(this.getDescendants(), function(widget){
            widget.destroyRecursive();
        });
        this.inherited(arguments);
    }

});
