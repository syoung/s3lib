agua.build.2

<entry [Sun Oct 17 23:46:04 EDT 2010] BUILD 006 TO TEST REFACTORS ON DOJO 1.5.0>

E:
cd E:\0.5\html\dojo-1.5.0\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/006 version="0.5" > E:/0.5/html/builds/006.agua.build.txt cssOptimize=comments.keepLines
	
	...
	release:  Interning strings for: ../../../builds/006/dojo/dojo
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/006/dojo/dojo/resources/dnd.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/006/dojo/dojo/resources/dojo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/006/dojo/dojo/_firebug/firebug.css
	release:  Interning strings for: ../../../builds/006/dojo/includes
	release:  Build is in directory: ../../../builds/006/dojo
	Build time: 473.75 seconds



WHERE agua.profile.js IS:

dependencies = {
    layers:  [

		{
			//This layer will be discarded, it is just used
			//to specify some modules that should not be included
			//in a later layer, but something that should not be
			//saved as an actual layer output. The important property
			//is the "discard" property. If set to true, then the layer
			//will not be a saved layer in the release directory.
			name: "string.discard",
			resourceName: "string.discard",
			discard: true,
			//Path to the copyright file must be relative to
			//the util/buildscripts directory, or an absolute path.
			copyrightFile: "myCopyright.txt",
			dependencies: [
					"dojo.string"
			]
		},

		{
	        name: "../agua.js",
            dependencies: [
				"plugins.admin.Access",
				"dijit.dijit",
				"dijit.form.CheckBox",
				"dijit.form.ValidationTextBox",
				"dijit.form.RadioButton",
				"dijit.form.ComboBox",
				"dijit.form.Slider",
				"dijit.form.FilteringSelect",
				"dijit.form.Button",
				"dijit.form.NumberSpinner",
				"dijit.Editor",
				"dijit.form.DateTextBox",
				"dijit.form.Textarea",
				"dijit.form.TextBox",
				"dijit.form.NumberTextBox",
				"dijit.form.CurrencyTextBox",
				"dojo.currency",
				"dijit.Dialog",
				"dojo.data.ItemFileWriteStore",
				"dojox.grid.Grid",
				"dojo.parser",
				"dojox.grid._data.model",
				"plugins.core.form.Template",
				"plugins.admin.Admin",
				"dojo.dnd.Source",
				"dojo.dnd.Moveable",
				"dojo.dnd.Mover",
				"dojo.dnd.move",
				"dojo.data.ItemFileReadStore",
				"plugins.core.BorderContainer",
				"plugins.core.ExpandoPane",
				"plugins.admin.Parameters",
				"plugins.admin.Apps",
				"plugins.admin.Projects",
				"plugins.admin.GroupProjects",
				"plugins.admin.Users",
				"plugins.admin.GroupUsers",
				"plugins.admin.Sources",
				"plugins.admin.GroupSources",
				"plugins.admin.Groups",
				"plugins.core.Common",
				"plugins.admin.AppRow",
				"plugins.admin.ConfirmDialogue",
				"dojox.layout.FloatingPane",
				"dijit.TitlePane",
				"dijit.layout.TabContainer",
				"plugins.admin.Controller",
				"plugins.core.WidgetFramework",
				"plugins.core.ComboBox",
				"dijit.Tooltip",
				"plugins.admin.GroupProjectRow",
				"plugins.admin.GroupRow",
				"plugins.admin.GroupSourceRow",
				"plugins.admin.GroupUserRow",
				"plugins.admin.ParameterRow",
				"plugins.admin.ProjectRow",
				"plugins.admin.SourceRow",
				"dijit.Toolbar",
				"dojox.widget.Standby",
				"plugins.core.PluginManager",
				"dijit.layout.BorderContainer",
				"dojo.cookie",
				"plugins.core.BorderContainerStatic",
				"plugins.core.Controls",
				"dojox.layout.ResizeHandle",
				"dijit.layout.LayoutContainer",
				"plugins.core.DataManager",
				"plugins.core.DropTarget",
				"dojox.layout.ExpandoPane",
				"plugins.core.Plugin",
				"plugins.core.Test",
				"dijit.layout.AccordionContainer",
				"dijit.layout.ContentPane",
				"dijit.layout.SplitContainer",
				"plugins.dnd.Target",
				"plugins.files.Dialog",
				"dojox.widget.Dialog",
				"dojo.fx.easing",
				"dojox.timing.Sequence",
				"plugins.files.FileDrag",
				"dojox.widget.RollingList",
				"dojo.i18n",
				"plugins.files._GroupDragPane",
				"plugins.files.FileManager",
				"plugins.files.FileSelector",
				"dojox.data.FileStore",
				"dojox.widget.FileInput",
				"dojox.widget.FileInputAuto",
				"plugins.files.FileMenu",
				"plugins.menu.Menu",
				"plugins.core.InputDialog",
				"plugins.core.ConfirmDialog",
				"dojox.form.FileInputAuto",
				"plugins.files.FileSystem",
				"plugins.files.FolderMenu",
				"plugins.files.WorkflowMenu",
				"plugins.files.FileSelectorMenu",
				"dijit.Menu",
				"plugins.files.FileUpload",
				"dojox.form.FileInput",
				"dojox.form.FileUploader",
				"dojox.layout.ContentPane",
				"plugins.files.SelectorMenu",
				"plugins.files.TitlePane",
				"plugins.files.WorkflowSelectorMenu",
				"dijit.InlineEditBox",
				"dojo._base.fx",
				"dojo._base.html",
				"plugins.help.Controller",
				"plugins.help.Help",
				"includes.js",
				"dojox.widget.FisheyeLite",
				"plugins.admin.Login",
				"plugins.projects.Projects",
				"dojo.io.iframe",
				"dijit.form._FormWidget",
				"dijit._Templated",
				"dojox.widget.FilePicker",
				"dojo.dnd.Manager",
				"dojo.dnd.Selector",
				"plugins.project.Dialog",
				"plugins.project.Project",
				"plugins.project._GroupDragPane",
				"plugins.project.FileSelector",
				"plugins.project._GroupSelectorPane",
				"plugins.project.FileDrag",
				"plugins.report.Report",
				"plugins.view.View",
				"plugins.workflow.Workflow",
				"plugins.project.FileManager",
				"plugins.login.Controller"
				,
				"plugins.login.Login",
				"plugins.login.LoginStatus",
				"plugins.workflow.Controller",
				"plugins.project.Controller",
				"plugins.report.Controller",
				"plugins.project.API.EntrezAPI.EntrezAPI",
				"dojo._base.json",
				"dojo.collections.*",
				"plugins.report.Template",
				"plugins.project.FileInput",
				"plugins.project.FileInputAuto",
				"plugins.project.ProjectFiles",
				"plugins.project.SharedProjectFiles",
				"plugins.project.SourceFiles",
				"plugins.project.SharedSourceFiles",
				"plugins.report.Common",
				"plugins.report.Editor",
				"plugins.report.Grid",
				"dojox.grid.DataGrid",
				"plugins.report.SNP",
				"dijit.Tree",
				"dojox.rpc.Service",
				"dojo.io.script",
				"plugins.upload.FileUp",
				"plugins.upload.FileUpload",
				"dijit.ColorPalette",
				"plugins.workflow.FileManager",
				"plugins.workflow.FileSelector",
				"plugins.upload.FileInput",
				"plugins.workflow.Apps",
				"plugins.workflow.AppType",
				"plugins.workflow.AppRow",
				"plugins.workflow.AppsMenu",
				"plugins.workflow._GroupSelectorPane",
				"plugins.workflow.History",
				"plugins.workflow.HistoryRow",
				"plugins.workflow.HistoryPane",
				"plugins.workflow.HistoryPaneRow",
				"plugins.workflow.Parameters",
				"plugins.workflow.ParametersRow",
				"plugins.workflow.RunStatus",
				"plugins.workflow.Shared",
				"plugins.workflow.SharedRow",
				"plugins.workflow.Status",
				"dojox.timing",
				"plugins.workflow.Stages",
				"plugins.workflow.StageRow",
				"plugins.workflow.StagesMenu",
				"plugins.workflow.WorkflowIO",
				"plugins.core.Confirm",
				"plugins.workflow._GroupDragPane"

            ]
        }
    ]

	,

    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "plugins", "../../plugins" ]
    ]
};


</entry>

<entry [Sat Oct 16 11:02:46 EDT 2010] REFACTORED CHECK INPUTS FOR INFOPANE>

1. RENAMED InfoPane TO Parameters

2. RENAMED Workflows TO Stages

3. COMMENTED OUT InfoPane.js LINE 103:

		//// CHECK IF THE INPUT IS VALID, E.G., FILE OR DIRECTORY IS PRESENT
		//var inputValue = this.getInputValue();
		//this.checkInput(this.valueNode, inputValue);

ADDED TO 



</entry>


<entry [Thurs Sep 16 12:29:08 EDT 2010] BUILD AGUA ON 1.5.0>

E:
cd E:\0.5\html\dojo-1.5.0\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/005 version="0.5" > E:/0.5/html/builds/005.agua.build.txt cssOptimize=comments.keepLines
	
	...
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/005/dojo/plugins/workflow/FileSelector/RollingList.css
	release:  Interning strings for: ../../../builds/005/dojo/dojo
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/005/dojo/dojo/resources/dnd.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/005/dojo/dojo/resources/dojo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/005/dojo/dojo/_firebug/firebug.css
	release:  Interning strings for: ../../../builds/005/dojo/includes
	release:  Build is in directory: ../../../builds/005/dojo
	Build time: 309.594 seconds


	####release:  ../../../builds/004/dojo/plugins/workflow/FileSelector/FilePicker.css
	####Cannot inline css import, skipping: ../RollingList/RollingList.css
	####release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/RollingList.css
	####release:  Interning strings for: ../../../builds/004/dojo/dojo
	####release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/resources/dnd.css
	####release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/resources/dojo.css
	####release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/_firebug/firebug.css
	####release:  Interning strings for: ../../../builds/004/dojo/includes
	####release:  Build is in directory: ../../../builds/004/dojo
	####Build time: 435.657 seconds




NOTES
-----


PROBLEM

The application failed to initialize properly (0xc0000142). Click on OK to terminate the application.





PROBLEM

ERROR WHILE LOADING builds/005:

Bundle not found: loading in dijit , locale=en-us
http://localhost/agua/0.5/builds/005/dojo/agua.js.uncompressed.js
Line 7641


SOLUTION

ADD en-us.js TO THIS DIRECTORY:

E:\0.5\html\dojo-1.5.0\dojo\nls





PROBLEM

dojo.foo ERROR MESSAGE:

	js: uncaught JavaScript runtime exception: TypeError: Cannot read property "dojo.foo" from undefined
	js: uncaught JavaScript runtime exception: TypeError: Cannot find function registerModulePath in object [object Object].

	

DIAGNOSIS

IN THE 1.5.0 NIGHTLY BUILD, THERE IS A REFERENCE TO dojo.foo IN _loader.js



SOLUTION

USED STANDARD 1.5.0 RELEASE - BUILDS OK.



</entry>

<entry [Tue Sep 21 15:34:25 EDT 2010] 600 GB OF SPACE FREE FOR GROUP hihg ON KRONOS /mihg/users>

Disk quotas for group mihg (gid 1041):
							Block Limits                                    |     File Limits
Filesystem type             KB      quota      limit   in_doubt    grace |    files   quota    limit in_doubt    grace  Remarks
homelv     GRP       381268576 1073741824 1180696576          0     none |      945       0        0        0     none 


			KB
size	 381,268,576
quota	1,073,741,824
limit	1,180,696,576          


</entry>



<entry [Thurs Sep 16 12:29:08 EDT 2010] BUILD ONLY WORKFLOW REQUIRED MODULES>

E:
cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/004 version="0.5" > E:/0.5/html/builds/004.agua.build.txt cssOptimize=comments.keepLines


END OF E:/0.5/html/builds/004.agua.build.txt:


	Cannot inline css import, skipping: RollingList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/FileDrag.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/FileManager.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/FilePicker.css
	release:  ../../../builds/004/dojo/plugins/workflow/FileSelector/FilePicker.css
	Cannot inline css import, skipping: ../RollingList/RollingList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/RollingList.css
	release:  Interning strings for: ../../../builds/004/dojo/dojo
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/resources/dnd.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/resources/dojo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/_firebug/firebug.css
	release:  Interning strings for: ../../../builds/004/dojo/includes
	release:  Build is in directory: ../../../builds/004/dojo
	Build time: 435.657 seconds





</entry>

<entry [Thurs Sep 16 12:29:08 EDT 2010] SUCCESSFUL BUILD 004>


E:
cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/004 version="0.5" > E:/0.5/html/builds/004.agua.build.txt cssOptimize=comments.keepLines


END OF E:/0.5/html/builds/004.agua.build.txt:


	Cannot inline css import, skipping: RollingList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/FileDrag.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/FileManager.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/FilePicker.css
	release:  ../../../builds/004/dojo/plugins/workflow/FileSelector/FilePicker.css
	Cannot inline css import, skipping: ../RollingList/RollingList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/plugins/workflow/FileSelector/RollingList.css
	release:  Interning strings for: ../../../builds/004/dojo/dojo
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/resources/dnd.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/resources/dojo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/004/dojo/dojo/_firebug/firebug.css
	release:  Interning strings for: ../../../builds/004/dojo/includes
	release:  Build is in directory: ../../../builds/004/dojo
	Build time: 435.657 seconds



</entry>





<entry [Tues Jul  13 22:15:02 EDT 2010] RAN BUILD 004 TO CONFIRM BUILD 003 FIXES>


BUILD COMMANDS
--------------

E:
cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/004 version="0.5" > E:/0.5/html/builds/004.agua.build.txt 

	####...
	####release:      ../../../builds/003/dojo/plugins/workflow/templates/workflows.html
	####release:  Interning strings for : ../../../builds/003/dojo/plugins/workflow/WorkflowsMenu.js
	####release:      ../../../builds/003/dojo/plugins/workflow/templates/workflowsmenu.html
	####release:  Interning strings for: ../../../builds/003/dojo/dojo
	####release:  Interning strings for: ../../../builds/003/dojo/includes
	####release:  Build is in directory: ../../../builds/003/dojo
	####Build time: 351.047 seconds


FOR LATER:

cssOptimize=comments.keepLines



CURRENT AGUA PROFILE
--------------------
dependencies = {
    layers:  [
        {
	        name: "../agua.js",
            dependencies: [
				"plugins.admin.Access",
				"dijit.dijit",
				"dijit.form.CheckBox",
				"dijit.form.ValidationTextBox",
				"dijit.form.RadioButton",
				"dijit.form.ComboBox",
				"dijit.form.Slider",
				"dijit.form.FilteringSelect",
				"dijit.form.Button",
				"dijit.form.NumberSpinner",
				"dijit.Editor",
				"dijit.form.DateTextBox",
				"dijit.form.Textarea",
				"dijit.form.TextBox",
				"dijit.form.NumberTextBox",
				"dijit.form.CurrencyTextBox",
				"dojo.currency",
				"dijit.Dialog",
				"dojo.data.ItemFileWriteStore",
				"dojox.grid.Grid",
				"dojo.parser",
				"dojox.grid._data.model",
				"plugins.core.form.Template",
				"plugins.admin.Admin",
				"dojo.dnd.Source",
				"dojo.dnd.Moveable",
				"dojo.dnd.Mover",
				"dojo.dnd.move",
				"dojo.data.ItemFileReadStore",
				"plugins.core.BorderContainer",
				"plugins.core.ExpandoPane",
				"plugins.admin.Parameters",
				"plugins.admin.Apps",
				"plugins.admin.Projects",
				"plugins.admin.GroupProjects",
				"plugins.admin.Users",
				"plugins.admin.GroupUsers",
				"plugins.admin.Sources",
				"plugins.admin.GroupSources",
				"plugins.admin.Groups",
				"plugins.core.Common",
				"plugins.admin.AppRow",
				"plugins.admin.ConfirmDialogue",
				"dojox.layout.FloatingPane",
				"dijit.TitlePane",
				"dijit.layout.TabContainer",
				"plugins.admin.Controller",
				"plugins.core.WidgetFramework",
				"plugins.core.ComboBox",
				"dijit.Tooltip",
				"plugins.admin.GroupProjectRow",
				"plugins.admin.GroupRow",
				"plugins.admin.GroupSourceRow",
				"plugins.admin.GroupUserRow",
				"plugins.admin.ParameterRow",
				"plugins.admin.ProjectRow",
				"plugins.admin.SourceRow",
				"dijit.Toolbar",
				"dojox.widget.Standby",
				"plugins.core.PluginManager",
				"dijit.layout.BorderContainer",
				"dojo.cookie",
				"plugins.core.BorderContainerStatic",
				"plugins.core.Controls",
				"dojox.layout.ResizeHandle",
				"dijit.layout.LayoutContainer",
				"plugins.core.DataManager",
				"plugins.core.DropTarget",
				"dojox.layout.ExpandoPane",
				"plugins.core.Plugin",
				"plugins.core.Test",
				"dijit.layout.AccordionContainer",
				"dijit.layout.ContentPane",
				"dijit.layout.SplitContainer",
				"plugins.dnd.Target",
				"plugins.files.Dialog",
				"dojox.widget.Dialog",
				"dojo.fx.easing",
				"dojox.timing.Sequence",
				"plugins.files.FileDrag",
				"dojox.widget.RollingList",
				"dojo.i18n",
				"plugins.files._GroupDragPane",
				"plugins.files.FileManager",
				"plugins.files.FileSelector",
				"dojox.data.FileStore",
				"dojox.widget.FileInput",
				"dojox.widget.FileInputAuto",
				"plugins.files.FileMenu",
				"plugins.menu.Menu",
				"plugins.core.InputDialog",
				"plugins.core.ConfirmDialog",
				"dojox.form.FileInputAuto",
				"plugins.files.FileSystem",
				"plugins.files.FolderMenu",
				"plugins.files.WorkflowMenu",
				"plugins.files.FileSelectorMenu",
				"dijit.Menu",
				"plugins.files.FileUpload",
				"dojox.form.FileInput",
				"dojox.form.FileUploader",
				"dojox.layout.ContentPane",
				"plugins.files.SelectorMenu",
				"plugins.files.TitlePane",
				"plugins.files.WorkflowSelectorMenu",
				"dijit.InlineEditBox",
				"dojo._base.fx",
				"dojo._base.html",
				"plugins.help.Controller",
				"plugins.help.Help",
				"includes.js",
				"dojox.widget.FisheyeLite",
				"plugins.admin.Login",
				"plugins.projects.Projects",
				"dojo.io.iframe",
				"dijit.form._FormWidget",
				"dijit._Templated",
				"dojox.widget.FilePicker",
				"dojo.dnd.Manager",
				"dojo.dnd.Selector",
				"plugins.project.Dialog",
				"plugins.project.Project",
				"plugins.project._GroupDragPane",
				"plugins.project.FileSelector",
				"plugins.project._GroupSelectorPane",
				"plugins.project.FileDrag",
				"plugins.report.Report",
				"plugins.view.View",
				"plugins.workflow.Workflow",
				"plugins.project.FileManager",
				"plugins.login.Controller"
				,
				"plugins.login.Login",
				"plugins.login.LoginStatus",
				"plugins.workflow.Controller",
				"plugins.project.Controller",
				"plugins.report.Controller",
				"plugins.project.API.EntrezAPI.EntrezAPI",
				"dojo._base.json",
				"dojo.collections.*",
				"plugins.report.Template",
				"plugins.project.FileInput",
				"plugins.project.FileInputAuto",
				"plugins.project.ProjectFiles",
				"plugins.project.SharedProjectFiles",
				"plugins.project.SourceFiles",
				"plugins.project.SharedSourceFiles",
				"plugins.report.Common",
				"plugins.report.Editor",
				"plugins.report.Grid",
				"dojox.grid.DataGrid",
				"plugins.report.SNP",
				"dijit.Tree",
				"dojox.rpc.Service",
				"dojo.io.script",
				"plugins.upload.FileUp",
				"plugins.upload.FileUpload",
				"dijit.ColorPalette",
				"plugins.workflow.FileManager",
				"plugins.workflow.FileSelector",
				"plugins.upload.FileInput",
				"plugins.workflow.Apps",
				"plugins.workflow.AppType",
				"plugins.workflow.AppRow",
				"plugins.workflow.AppsMenu",
				"plugins.workflow._GroupSelectorPane",
				"plugins.workflow.History",
				"plugins.workflow.HistoryRow",
				"plugins.workflow.HistoryPane",
				"plugins.workflow.HistoryPaneRow",
				"plugins.workflow.InfoPane",
				"plugins.workflow.InfoPaneRow",
				"plugins.workflow.RunStatus",
				"plugins.workflow.Shared",
				"plugins.workflow.SharedRow",
				"plugins.workflow.Status",
				"dojox.timing",
				"plugins.workflow.Workflows",
				"plugins.workflow.StageRow",
				"plugins.workflow.WorkflowsMenu",
				"plugins.workflow.WorkflowIO",
				"plugins.core.Confirm",
				"plugins.workflow._GroupDragPane"

            ]
        }
    ]

	,

    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "plugins", "../../plugins" ]
    ]
};






</entry>


<entry [Sat Aug 28 00:58:03 EDT 2010] BUILD 003 - ALL MODULES WORKING CORRECTLY AFTER FIXES>


1. CREATED agua.profile.js WITH MODIFIED buildConfig.pl TO REMOVE DUPLICATES:

cd E:\22-agua\dojo.1.4.2-src\dojo.1.4.2\util\buildscripts

perl E:\0.5\bin\scripts\buildConfig.pl --inputdir E:\0.5\html\plugins --outputfile E:\0.5\html\dojo.1.4.2\util\buildscripts\profiles\agua.profile.js --name "../agua.js"



E:\0.5\html\dojo.1.4.2\util\buildscripts\profiles\agua.profile.js
		
		dependencies = {
			layers:  [
				{
					name: "../agua.js",
					dependencies: [
						"plugins.admin.Access",
						"dijit.dijit",
						"dijit.form.CheckBox",
						"dijit.form.ValidationTextBox",
						"dijit.form.RadioButton",
						"dijit.form.ComboBox",
						"dijit.form.Slider",
						"dijit.form.FilteringSelect",
						"dijit.form.Button",
						"dijit.form.NumberSpinner",
						"dijit.Editor",
						"dijit.form.DateTextBox",
						"dijit.form.Textarea",
						"dijit.form.TextBox",
						"dijit.form.NumberTextBox",
						"dijit.form.CurrencyTextBox",
						"dojo.currency",
						"dijit.Dialog",
						"dojo.data.ItemFileWriteStore",
						"dojox.grid.Grid",
						"dojo.parser",
						"dojox.grid._data.model",
						"plugins.core.form.Template",
						"plugins.admin.Admin",
						"dojo.dnd.Source",
						"dojo.dnd.Moveable",
						"dojo.dnd.Mover",
						"dojo.dnd.move",
						"dojo.data.ItemFileReadStore",
						"plugins.core.BorderContainer",
						"plugins.core.ExpandoPane",
						"plugins.admin.Parameters",
						"plugins.admin.Apps",
						"plugins.admin.Projects",
						"plugins.admin.GroupProjects",
						"plugins.admin.Users",
						"plugins.admin.GroupUsers",
						"plugins.admin.Sources",
						"plugins.admin.GroupSources",
						"plugins.admin.Groups",
						"plugins.core.Common",
						"plugins.admin.AppRow",
						"plugins.admin.ConfirmDialogue",
						"dojox.layout.FloatingPane",
						"dijit.TitlePane",
						"dijit.layout.TabContainer",
						"plugins.admin.Controller",
						"plugins.core.WidgetFramework",
						"plugins.core.ComboBox",
						"dijit.Tooltip",
						"plugins.admin.GroupProjectRow",
						"plugins.admin.GroupRow",
						"plugins.admin.GroupSourceRow",
						"plugins.admin.GroupUserRow",
						"plugins.admin.ParameterRow",
						"plugins.admin.ProjectRow",
						"plugins.admin.SourceRow",
						"dijit.Toolbar",
						"dojox.widget.Standby",
						"plugins.core.PluginManager",
						"dijit.layout.BorderContainer",
						"dojo.cookie",
						"plugins.core.BorderContainerStatic",
						"plugins.core.Controls",
						"dojox.layout.ResizeHandle",
						"dijit.layout.LayoutContainer",
						"plugins.core.DataManager",
						"plugins.core.DropTarget",
						"dojox.layout.ExpandoPane",
						"plugins.core.Plugin",
						"plugins.core.Test",
						"dijit.layout.AccordionContainer",
						"dijit.layout.ContentPane",
						"dijit.layout.SplitContainer",
						"plugins.dnd.Target",
						"plugins.files.Dialog",
						"dojox.widget.Dialog",
						"dojo.fx.easing",
						"dojox.timing.Sequence",
						"plugins.files.FileDrag",
						"dojox.widget.RollingList",
						"dojo.i18n",
						"plugins.files._GroupDragPane",
						"plugins.files.FileManager",
						"plugins.files.FileSelector",
						"dojox.data.FileStore",
						"dojox.widget.FileInput",
						"dojox.widget.FileInputAuto",
						"plugins.files.FileMenu",
						"plugins.menu.Menu",
						"plugins.core.InputDialog",
						"plugins.core.ConfirmDialog",
						"dojox.form.FileInputAuto",
						"plugins.files.FileSystem",
						"plugins.files.FolderMenu",
						"plugins.files.WorkflowMenu",
						"plugins.files.FileSelectorMenu",
						"dijit.Menu",
						"plugins.files.FileUpload",
						"dojox.form.FileInput",
						"dojox.form.FileUploader",
						"dojox.layout.ContentPane",
						"plugins.files.SelectorMenu",
						"plugins.files.TitlePane",
						"plugins.files.WorkflowSelectorMenu",
						"dijit.InlineEditBox",
						"dojo._base.fx",
						"dojo._base.html",
						"plugins.help.Controller",
						"plugins.help.Help",
						"includes.js",
						"dojox.widget.FisheyeLite",
						"plugins.admin.Login",
						"plugins.projects.Projects",
						"dojo.io.iframe",
						"dijit.form._FormWidget",
						"dijit._Templated",
						"dojox.widget.FilePicker",
						"dojo.dnd.Manager",
						"dojo.dnd.Selector",
						"plugins.project.Dialog",
						"plugins.project.Project",
						"plugins.project._GroupDragPane",
						"plugins.project.FileSelector",
						"plugins.project._GroupSelectorPane",
						"plugins.project.FileDrag",
						"plugins.report.Report",
						"plugins.view.View",
						"plugins.workflow.Workflow",
						"plugins.project.FileManager",
						"plugins.login.Controller",
						"plugins.login.Login",
						"plugins.login.LoginStatus",
						"plugins.workflow.Controller",
						"plugins.project.Controller",
						"plugins.report.Controller",
						"plugins.project.API.EntrezAPI.EntrezAPI",
						"dojo._base.json",
						"dojo.collections.*",
						"plugins.report.Template",
						"plugins.project.FileInput",
						"plugins.project.FileInputAuto",
						"plugins.project.ProjectFiles",
						"plugins.project.SharedProjectFiles",
						"plugins.project.SourceFiles",
						"plugins.project.SharedSourceFiles",
						"plugins.report.Common",
						"plugins.report.Editor",
						"plugins.report.Grid",
						"dojox.grid.DataGrid",
						"plugins.report.SNP",
						"dijit.Tree",
						"dojox.rpc.Service",
						"dojo.io.script",
						"plugins.upload.FileUp",
						"plugins.upload.FileUpload",
						"dijit.ColorPalette",
						"plugins.workflow.FileManager",
						"plugins.workflow.FileSelector",
						"plugins.upload.FileInput",
						"plugins.workflow.Apps",
						"plugins.workflow.AppType",
						"plugins.workflow.AppRow",
						"plugins.workflow.AppsMenu",
						"plugins.workflow._GroupSelectorPane",
						"plugins.workflow.History",
						"plugins.workflow.HistoryRow",
						"plugins.workflow.HistoryPane",
						"plugins.workflow.HistoryPaneRow",
						"plugins.workflow.InfoPane",
						"plugins.workflow.InfoPaneRow",
						"plugins.workflow.RunStatus",
						"plugins.workflow.Shared",
						"plugins.workflow.SharedRow",
						"plugins.workflow.Status",
						"dojox.timing",
						"plugins.workflow.Workflows",
						"plugins.workflow.StageRow",
						"plugins.workflow.WorkflowsMenu",
						"plugins.workflow.WorkflowIO",
						"plugins.core.Confirm",
						"plugins.workflow._GroupDragPane"
		
					]
				}
			],
		
			prefixes: [
				[ "dijit", "../dijit" ],
				[ "dojox", "../dojox" ],
				[ "plugins", "../../plugins" ]
			]
		};
	

2. RAN BUILD WITH agua.profile.js 


e:
cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/003 version="0.5" > E:/0.5/html/builds/003.agua.build.txt 

	...
	release:      ../../../builds/003/dojo/plugins/workflow/templates/workflows.html
	release:  Interning strings for : ../../../builds/003/dojo/plugins/workflow/WorkflowsMenu.js
	release:      ../../../builds/003/dojo/plugins/workflow/templates/workflowsmenu.html
	release:  Interning strings for: ../../../builds/003/dojo/dojo
	release:  Interning strings for: ../../../builds/003/dojo/includes
	release:  Build is in directory: ../../../builds/003/dojo
	Build time: 351.047 seconds


FOR LATER:

cssOptimize=comments.keepLines



</entry>


<entry [Tues Jul  13 22:15:02 EDT 2010] BUILD WORKFLOW MODULES>


1. CREATE agua.profile.js WITH MODIFIED buildConfig.pl TO REMOVE DUPLICATES:

cd E:\22-agua\dojo.1.4.2-src\dojo.1.4.2\util\buildscripts

perl E:\0.5\bin\scripts\buildConfig.pl --inputdir E:\0.5\html\plugins --outputfile E:\0.5\html\dojo.1.4.2\util\buildscripts\profiles\agua.profile.js --name "../agua.js"

	OK!!!
	

	
2. RERAN BUILD WITH agua.profile.js 

e:
cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/002 version="0.5" > E:/0.5/html/builds/002.agua.build.txt 

cssOptimize=comments.keepLines



cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt

####java -jar ..\shrinksafe\custom_rhino.jar build.js profile="aqwa04" action="release" version="0.4" cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt



	
	./../../../build001/dojo/dijit/Dialog.js
	./../../../build001/dojo/dojo/data/ItemFileReadStore.js
	./../../../build001/dojo/dojo/data/ItemFileWriteStore.js
	./../../../build001/dojo/dojo/dnd/Container.js
	./../../../build001/dojo/dojo/dnd/Selector.js
	./../../../build001/dojo/dojo/dnd/Avatar.js
	./../../../build001/dojo/dojo/dnd/Manager.js
	./../../../build001/dojo/dojo/dnd/Source.js
	./../../../build001/dojo/dojox/html/_base.js
	./../../../build001/dojo/dojox/layout/ContentPane.js
	./../../../build001/dojo/dojox/layout/ResizeHandle.js
	./../../../build001/dojo/dojox/layout/FloatingPane.js
	./../../../build001/dojo/dijit/TitlePane.js
	./../../../build001/dojo/dojo/cookie.js
	./../../../build001/dojo/dijit/layout/StackController.js
	./../../../build001/dojo/dijit/layout/StackContainer.js
	./../../../build001/dojo/dijit/layout/_TabContainerBase.js
	./../../../build001/dojo/dijit/MenuItem.js
	./../../../build001/dojo/dijit/PopupMenuItem.js
	./../../../build001/dojo/dijit/CheckedMenuItem.js
	./../../../build001/dojo/dijit/MenuSeparator.js
	./../../../build001/dojo/dijit/Menu.js
	./../../../build001/dojo/dijit/layout/TabController.js
	./../../../build001/dojo/dijit/layout/ScrollingTabController.js
	./../../../build001/dojo/dijit/layout/TabContainer.js
	./../../../build001/dojo/dijit/layout/BorderContainer.js
	./../../../build001/dojo/dijit/layout/LayoutContainer.js
	./../../../build001/dojo/dojox/layout/ExpandoPane.js
	./../../../build001/dojo/dijit/layout/AccordionPane.js
	./../../../build001/dojo/dijit/layout/AccordionContainer.js
	./../../../build001/dojo/dijit/layout/SplitContainer.js
	./../../../build001/dojo/dojox/fx/_base.js
	./../../../build001/dojo/dojox/fx.js
	./../../../build001/dojo/dojox/widget/Dialog.js
	./../../../build001/dojo/dojo/fx/easing.js
	./../../../build001/dojo/dojox/timing/Sequence.js
	./../../../build001/dojo/dojox/html/metrics.js
	./../../../build001/dojo/dojox/widget/RollingList.js
	./../../../build001/dojo/dojox/data/FileStore.js
	./../../../build001/dojo/dojox/form/FileInput.js
	./../../../build001/dojo/dojo/io/iframe.js
	./../../../build001/dojo/dojox/form/FileInputAuto.js
	./../../../build001/dojo/dojox/embed/Flash.js
	./../../../build001/dojo/dojox/html/styles.js
	./../../../build001/dojo/dojox/embed/flashVars.js
	./../../../build001/dojo/dojox/form/FileUploader.js
	./../../../build001/dojo/dijit/InlineEditBox.js
	./../../../build001/dojo/dojox/widget/FisheyeLite.js
	./../../../build001/dojo/dojox/widget/FilePicker.js
	./../../../build001/dojo/dojox/grid/util.js
	./../../../build001/dojo/dojox/grid/_Scroller.js
	./../../../build001/dojo/dojox/grid/cells/_base.js
	./../../../build001/dojo/dojox/grid/cells.js
	./../../../build001/dojo/dojox/grid/_Builder.js
	./../../../build001/dojo/dojox/grid/_View.js
	./../../../build001/dojo/dojox/grid/_RowSelector.js
	./../../../build001/dojo/dojox/grid/_Layout.js
	./../../../build001/dojo/dojox/grid/_ViewManager.js
	./../../../build001/dojo/dojox/grid/_RowManager.js
	./../../../build001/dojo/dojox/grid/_FocusManager.js
	./../../../build001/dojo/dojox/grid/_EditManager.js
	./../../../build001/dojo/dojox/grid/Selection.js
	./../../../build001/dojo/dojox/grid/_Events.js
	./../../../build001/dojo/dojox/grid/_Grid.js
	./../../../build001/dojo/dojox/grid/DataSelection.js
	./../../../build001/dojo/dojox/grid/DataGrid.js
	./../../../build001/dojo/dojo/DeferredList.js
	./../../../build001/dojo/dijit/tree/TreeStoreModel.js
	./../../../build001/dojo/dijit/tree/ForestStoreModel.js
	./../../../build001/dojo/dijit/Tree.js
	./../../../build001/dojo/dojox/rpc/Service.js
	./../../../build001/dojo/dojo/io/script.js
	./../../../build001/dojo/dojo/colors.js
	./../../../build001/dojo/dijit/_PaletteMixin.js
	./../../../build001/dojo/dijit/ColorPalette.js
	./../../../build001/dojo/dojox/timing/_base.js
	./../../../build001/dojo/dojox/timing.js
	
	release:  Interning strings for: ../../../build001/dojo/dijit
	release:  Interning strings for : ../../../build001/dojo/dijit/Calendar.js
	release:      ../../../build001/dojo/dijit/templates/Calendar.html
	release:  Interning strings for : ../../../build001/dojo/dijit/CheckedMenuItem.j
	s
	release:      ../../../build001/dojo/dijit/templates/CheckedMenuItem.html
	release:  Interning strings for : ../../../build001/dojo/dijit/ColorPalette.js
	release:      ../../../build001/dojo/dijit/templates/ColorPalette.html
	release:  Interning strings for : ../../../build001/dojo/dijit/Dialog.js
	release:      ../../../build001/dojo/dijit/templates/Dialog.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/Button.js
	release:      ../../../build001/dojo/dijit/form/templates/Button.html
	release:      ../../../build001/dojo/dijit/form/templates/DropDownButton.html
	release:      ../../../build001/dojo/dijit/form/templates/ComboButton.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/CheckBox.js
	release:      ../../../build001/dojo/dijit/form/templates/CheckBox.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/ComboBox.js
	release:      ../../../build001/dojo/dijit/form/templates/ComboBox.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/HorizontalSl
	ider.js
	release:      ../../../build001/dojo/dijit/form/templates/HorizontalSlider.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/Select.js
	release:      ../../../build001/dojo/dijit/form/templates/Select.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/TextBox.js
	release:      ../../../build001/dojo/dijit/form/templates/TextBox.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/ValidationTe
	xtBox.js
	release:      ../../../build001/dojo/dijit/form/templates/ValidationTextBox.html
	
	release:  Interning strings for : ../../../build001/dojo/dijit/form/VerticalSlid
	er.js
	release:      ../../../build001/dojo/dijit/form/templates/VerticalSlider.html
	release:  Interning strings for : ../../../build001/dojo/dijit/form/_Spinner.js
	release:      ../../../build001/dojo/dijit/form/templates/Spinner.html
	release:  Interning strings for : ../../../build001/dojo/dijit/InlineEditBox.js
	release:      ../../../build001/dojo/dijit/templates/InlineEditBox.html
	release:  Interning strings for : ../../../build001/dojo/dijit/layout/AccordionC
	ontainer.js
	release:      ../../../build001/dojo/dijit/layout/templates/AccordionButton.html
	
	release:  Interning strings for : ../../../build001/dojo/dijit/layout/ScrollingT
	abController.js
	release:      ../../../build001/dojo/dijit/layout/templates/ScrollingTabControll
	er.html
	release:      ../../../build001/dojo/dijit/layout/templates/_ScrollingTabControl
	lerButton.html
	release:  Interning strings for : ../../../build001/dojo/dijit/layout/TabControl
	ler.js
	release:      ../../../build001/dojo/dijit/layout/templates/_TabButton.html
	release:  Interning strings for : ../../../build001/dojo/dijit/layout/_TabContai
	nerBase.js
	release:      ../../../build001/dojo/dijit/layout/templates/TabContainer.html
	release:  Interning strings for : ../../../build001/dojo/dijit/Menu.js
	release:      ../../../build001/dojo/dijit/templates/Menu.html
	release:  Interning strings for : ../../../build001/dojo/dijit/MenuBar.js
	release:      ../../../build001/dojo/dijit/templates/MenuBar.html
	release:  Interning strings for : ../../../build001/dojo/dijit/MenuBarItem.js
	release:      ../../../build001/dojo/dijit/templates/MenuBarItem.html
	release:  Interning strings for : ../../../build001/dojo/dijit/MenuItem.js
	release:      ../../../build001/dojo/dijit/templates/MenuItem.html
	release:  Interning strings for : ../../../build001/dojo/dijit/MenuSeparator.js
	release:      ../../../build001/dojo/dijit/templates/MenuSeparator.html
	release:  Interning strings for : ../../../build001/dojo/dijit/ProgressBar.js
	release:      ../../../build001/dojo/dijit/templates/ProgressBar.html
	release:  Interning strings for : ../../../build001/dojo/dijit/TitlePane.js
	release:      ../../../build001/dojo/dijit/templates/TitlePane.html
	release:  Interning strings for : ../../../build001/dojo/dijit/Tooltip.js
	release:      ../../../build001/dojo/dijit/templates/Tooltip.html
	release:  Interning strings for : ../../../build001/dojo/dijit/TooltipDialog.js
	release:      ../../../build001/dojo/dijit/templates/TooltipDialog.html
	release:  Interning strings for : ../../../build001/dojo/dijit/Tree.js
	release:      ../../../build001/dojo/dijit/templates/TreeNode.html
	release:      ../../../build001/dojo/dijit/templates/Tree.html
	release:  Interning strings for : ../../../build001/dojo/dijit/_TimePicker.js
	release:      ../../../build001/dojo/dijit/templates/TimePicker.html
	release:  Interning strings for: ../../../build001/dojo/dojox
	release:  Interning strings for : ../../../build001/dojo/dojox/atom/widget/FeedE
	ntryEditor.js
	release:      ../../../build001/dojo/dojox/atom/widget/templates/FeedEntryEditor
	.html
	release:      ../../../build001/dojo/dojox/atom/widget/templates/PeopleEditor.ht
	ml
	release:  Interning strings for : ../../../build001/dojo/dojox/atom/widget/FeedE
	ntryViewer.js
	release:      ../../../build001/dojo/dojox/atom/widget/templates/FeedEntryViewer
	.html
	release:      ../../../build001/dojo/dojox/atom/widget/templates/EntryHeader.htm
	l
	release:  Interning strings for : ../../../build001/dojo/dojox/atom/widget/FeedV
	iewer.js
	release:      ../../../build001/dojo/dojox/atom/widget/templates/FeedViewer.html
	
	release:      ../../../build001/dojo/dojox/atom/widget/templates/FeedViewerEntry
	.html
	release:      ../../../build001/dojo/dojox/atom/widget/templates/FeedViewerGroup
	ing.html
	release:  Interning strings for : ../../../build001/dojo/dojox/av/widget/PlayBut
	ton.js
	release:      ../../../build001/dojo/dojox/av/widget/resources/PlayButton.html
	release:  Interning strings for : ../../../build001/dojo/dojox/av/widget/Player.
	js
	release:      ../../../build001/dojo/dojox/av/widget/resources/Player.html
	release:  Interning strings for : ../../../build001/dojo/dojox/av/widget/Progres
	sSlider.js
	release:      ../../../build001/dojo/dojox/av/widget/resources/ProgressSlider.ht
	ml
	release:  Interning strings for : ../../../build001/dojo/dojox/av/widget/Status.
	js
	release:      ../../../build001/dojo/dojox/av/widget/resources/Status.html
	release:  Interning strings for : ../../../build001/dojo/dojox/av/widget/VolumeB
	utton.js
	release:      ../../../build001/dojo/dojox/av/widget/resources/VolumeButton.html
	
	release:  Interning strings for : ../../../build001/dojo/dojox/editor/plugins/Ta
	blePlugins.js
	release:      ../../../build001/dojo/dojox/editor/plugins/resources/insertTable.
	html
	release:      ../../../build001/dojo/dojox/editor/plugins/resources/modifyTable.
	html
	release:  Interning strings for : ../../../build001/dojo/dojox/form/CheckedMulti
	Select.js
	release:      ../../../build001/dojo/dojox/form/resources/_CheckedMultiSelectIte
	m.html
	release:      ../../../build001/dojo/dojox/form/resources/CheckedMultiSelect.htm
	l
	release:  Interning strings for : ../../../build001/dojo/dojox/form/FileInput.js
	
	release:      ../../../build001/dojo/dojox/form/resources/FileInput.html
	release:  Interning strings for : ../../../build001/dojo/dojox/form/FileInputAut
	o.js
	release:      ../../../build001/dojo/dojox/form/resources/FileInputAuto.html
	release:  Interning strings for : ../../../build001/dojo/dojox/form/FilePickerTe
	xtBox.js
	release:      ../../../build001/dojo/dojox/form/resources/FilePickerTextBox.html
	
	release:  Interning strings for : ../../../build001/dojo/dojox/form/PasswordVali
	dator.js
	release:      ../../../build001/dojo/dojox/form/resources/PasswordValidator.html
	
	release:  Interning strings for : ../../../build001/dojo/dojox/form/RangeSlider.
	js
	release:      ../../../build001/dojo/dojox/form/resources/HorizontalRangeSlider.
	html
	release:      ../../../build001/dojo/dojox/form/resources/VerticalRangeSlider.ht
	ml
	release:  Interning strings for : ../../../build001/dojo/dojox/grid/_Grid.js
	release:      ../../../build001/dojo/dojox/grid/resources/_Grid.html
	release:  Interning strings for : ../../../build001/dojo/dojox/grid/_TreeView.js
	
	release:      ../../../build001/dojo/dojox/grid/resources/Expando.html
	release:  Interning strings for : ../../../build001/dojo/dojox/grid/_View.js
	release:      ../../../build001/dojo/dojox/grid/resources/View.html
	release:  Interning strings for : ../../../build001/dojo/dojox/image/Gallery.js
	release:      ../../../build001/dojo/dojox/image/resources/Gallery.html
	release:  Interning strings for : ../../../build001/dojo/dojox/image/Lightbox.js
	
	release:      ../../../build001/dojo/dojox/image/resources/Lightbox.html
	release:  Interning strings for : ../../../build001/dojo/dojox/image/SlideShow.j
	s
	release:      ../../../build001/dojo/dojox/image/resources/SlideShow.html
	release:  Interning strings for : ../../../build001/dojo/dojox/image/ThumbnailPi
	cker.js
	release:      ../../../build001/dojo/dojox/image/resources/ThumbnailPicker.html
	release:  Interning strings for : ../../../build001/dojo/dojox/layout/ExpandoPan
	e.js
	release:      ../../../build001/dojo/dojox/layout/resources/ExpandoPane.html
	release:  Interning strings for : ../../../build001/dojo/dojox/layout/FloatingPa
	ne.js
	release:      ../../../build001/dojo/dojox/layout/resources/FloatingPane.html
	release:  Interning strings for : ../../../build001/dojo/dojox/layout/GridContai
	nerLite.js
	release:      ../../../build001/dojo/dojox/layout/resources/GridContainer.html
	release:  Interning strings for : ../../../build001/dojo/dojox/layout/ScrollPane
	.js
	release:      ../../../build001/dojo/dojox/layout/resources/ScrollPane.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/Calendar.j
	s
	release:      ../../../build001/dojo/dojox/widget/Calendar/Calendar.html
	release:      ../../../build001/dojo/dojox/widget/Calendar/CalendarDay.html
	release:      ../../../build001/dojo/dojox/widget/Calendar/CalendarMonthYear.htm
	l
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/CalendarVi
	ews.js
	release:      ../../../build001/dojo/dojox/widget/Calendar/CalendarMonth.html
	release:      ../../../build001/dojo/dojox/widget/Calendar/CalendarYear.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/ColorPicke
	r.js
	release:      ../../../build001/dojo/dojox/widget/ColorPicker/ColorPicker.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/Dialog.js
	release:      ../../../build001/dojo/dojox/widget/Dialog/Dialog.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/DocTester.
	js
	release:      ../../../build001/dojo/dojox/widget/DocTester/DocTester.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/FilePicker
	.js
	release:      ../../../build001/dojo/dojox/widget/FilePicker/_FileInfoPane.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/gauge/_Gau
	ge.js
	release:      ../../../build001/dojo/dojox/widget/gauge/_Gauge.html
	release:      ../../../build001/dojo/dojox/widget/gauge/_Indicator.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/Pager.js
	release:      ../../../build001/dojo/dojox/widget/Pager/Pager.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/RollingLis
	t.js
	release:      ../../../build001/dojo/dojox/widget/RollingList/RollingList.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/SortList.j
	s
	release:      ../../../build001/dojo/dojox/widget/SortList/SortList.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/UpgradeBar
	.js
	release:      ../../../build001/dojo/dojox/widget/UpgradeBar/UpgradeBar.html
	release:  Interning strings for : ../../../build001/dojo/dojox/widget/Wizard.js
	release:      ../../../build001/dojo/dojox/widget/Wizard/Wizard.html
	release:  Interning strings for : ../../../build001/dojo/dojox/xmpp/widget/ChatS
	ession.js
	release:      ../../../build001/dojo/dojox/xmpp/widget/templates/ChatSession.htm
	l
	release:  Interning strings for: ../../../build001/dojo/dojo
	release:  Build is in directory: ../../../build001/dojo
	Build time: 183.109 seconds





	#...
	#release:      ../../release/dojo/dojox/widget/RollingList/RollingList.html
	#release:  Interning strings for : ../../release/dojo/dojox/widget/SortList.js
	#release:      ../../release/dojo/dojox/widget/SortList/SortList.html
	#release:  Interning strings for : ../../release/dojo/dojox/widget/UpgradeBar.js
	#release:      ../../release/dojo/dojox/widget/UpgradeBar/UpgradeBar.html
	#release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
	#release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
	#release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
	#on.js
	#release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
	#release:  Interning strings for: ../../release/dojo/plugins
	#release:  Interning strings for : ../../release/dojo/plugins/files/FileDrag.js
	#release:      ../../release/dojo/plugins/files/FileDrag/_FileInfoPane.html
	#release:      ../../release/dojo/dojox/widget/RollingList/RollingList.html
	#release:  Interning strings for : ../../release/dojo/plugins/files/TitlePane.js
	#release:      ../../release/dojo/plugins/files/templates/titlepane.html
	#release:  Interning strings for : ../../release/dojo/plugins/upload/FileInput.js
	#
	#release:      ../../release/dojo/plugins/upload/templates/FileInput.html
	#release:  Interning strings for : ../../release/dojo/plugins/workflow/FileDrag.j
	#s
	#release:      ../../release/dojo/plugins/files/FileDrag/_FileInfoPane.html
	#release:  Interning strings for : ../../release/dojo/plugins/workflow/FileSelect
	#or.js
	#release:      ../../release/dojo/plugins/workflow/FileSelector/_FileInfoPane.htm
	#l
	#release:  Interning strings for: ../../release/dojo/dojo
	#release:  Build is in directory: ../../release/dojo
	#Build time: 223.047 seconds
	#
	#
	#OK!!!


5. ADD NLS _en-gb.js FILE


http://localhost/agua/0.5/dojo.1.4.2/release/dojo/dojo/nls/_en-gb.js

cat _en-gb.js

	dojo.provide("dojo.nls._en-gb");dojo.provide("dijit.nls.common");dijit.nls.common._built=true;dojo.provide("dijit.nls.common.en_gb");dijit.nls.common.en_gb={"buttonOk":"OK","buttonCancel":"Cancel","buttonSave":"Save","itemClose":"Close"};do...



</entry>



<entry [Fri Jul  23 14:16:02 EDT 2010] CHANGES TO workflow CLASSES TO ENABLE BUILD>

workflow.js.uncompressed.js

13686
//			this._showAnim.play();



dojo.1.4.2/dijit/themes/tundra/tundra.css

.dijitEditorIconView { background-position: -828px; }
.dijitEditorIconWorkflow { background-position: -846px; }
.dijitEditorIconProject { background-position: -864px; }
.dijitEditorIconReport { background-position: -882px; }
.dijitEditorIconAdmin { background-position: -900px; }
.dijitEditorIconHelp { background-position: -918px; }
.dijitEditorIconAgua { background-position: -936px; }


plugins.core.Agua, LINE 3067 COMMENTED OUT *.play() STATEMENTS:

	// HIDE LOADING SCREEN
	hideLoader : function()
	{
		//console.log("Agua.hideLoader    plugins.core.Agua.hideLoader()");		
	
		//dojo.fadeOut({
		//
		//	node:"splashNode",
		//	duration:300,
		//	onEnd: function(){
		//		dojo.style("splashNode", "display", "none");
		//	}
		//}).play();

		//dojo.fadeOut({
		//
		//	node:"backgroundNode",
		//	duration:300,
		//	onEnd: function(){
		//		dojo.style("backgroundNode", "display", "none");
		//	}
		//}).play();

	},



</entry>


<entry [Tues Jul  13 22:15:02 EDT 2010] BUILD WORKFLOW MODULES>


COPIED NIGHTLY SRC util DIRECTORY OVER TO dojo.1.4.2 AND RAN THE BUILD:

cd E:\0.5\html\dojo.1.4.2\util\buildscripts


java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release


	release:  Using profile: profiles/agua.profile.js
	release:  Using version number: 0.0.0.dev for the release.
	release:  Deleting: ../../release/dojo
	release:  Copying: ../../dojo/../dijit to: ../../release/dojo/dijit
	release:  Copying: ../../dojo/../dojox to: ../../release/dojo/dojox
	release:  Copying: ../../dojo to: ../../release/dojo/dojo
	release:  Building dojo.js and layer files
	js: uncaught JavaScript runtime exception: ReferenceError: "window" is not defin
	ed.
	
	js: "./../../dojo/dojo.js", line 16: exception from uncaught JavaScript throw: E
	rror: Could not load 'dojo.i18n'; last tried '../../release/dojo/dojo/i18n.js'



IT SEEMS THE PROBLEM LIES WITH THE WHOLE DISTRIBUTION OF ORIGINAL dojo.1.4.2 SO RERAN BUILD WITH NIGHTLY SOURCE DOWNLOAD:



1. RENAMED FILEPATH

E:\22-agua\dojo.1.4.2-src\dojo-toolkit-readonly\util\builscripts

TO

E:\22-agua\dojo.1.4.2-src\dojo.1.4.2\util\buildscripts



2. COPIED plugins/workflow TO

E:\22-agua\dojo.1.4.2-src


3. RAN BUILD WITH agua.profile.js:

cd E:\22-agua\dojo.1.4.2-src\dojo.1.4.2\util\buildscripts
perl buildConfig.pl --inputdir E:\0.5\html\plugins\workflow --outputfile E:\0.5\html\dojo.1.4.2\util\buildscripts\profiles\agua-workflow.profile.js --name "../agua-workflow.js"

	OK!!!
	
	
4. RERAN BUILD WITH workflow.profile.js 

cd E:\0.5\html\dojo.1.4.2\util\buildscripts
java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=workflow action=release

	...
	release:      ../../release/dojo/dojox/widget/RollingList/RollingList.html
	release:  Interning strings for : ../../release/dojo/dojox/widget/SortList.js
	release:      ../../release/dojo/dojox/widget/SortList/SortList.html
	release:  Interning strings for : ../../release/dojo/dojox/widget/UpgradeBar.js
	release:      ../../release/dojo/dojox/widget/UpgradeBar/UpgradeBar.html
	release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
	release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
	release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
	on.js
	release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
	release:  Interning strings for: ../../release/dojo/plugins
	release:  Interning strings for : ../../release/dojo/plugins/files/FileDrag.js
	release:      ../../release/dojo/plugins/files/FileDrag/_FileInfoPane.html
	release:      ../../release/dojo/dojox/widget/RollingList/RollingList.html
	release:  Interning strings for : ../../release/dojo/plugins/files/TitlePane.js
	release:      ../../release/dojo/plugins/files/templates/titlepane.html
	release:  Interning strings for : ../../release/dojo/plugins/upload/FileInput.js
	
	release:      ../../release/dojo/plugins/upload/templates/FileInput.html
	release:  Interning strings for : ../../release/dojo/plugins/workflow/FileDrag.j
	s
	release:      ../../release/dojo/plugins/files/FileDrag/_FileInfoPane.html
	release:  Interning strings for : ../../release/dojo/plugins/workflow/FileSelect
	or.js
	release:      ../../release/dojo/plugins/workflow/FileSelector/_FileInfoPane.htm
	l
	release:  Interning strings for: ../../release/dojo/dojo
	release:  Build is in directory: ../../release/dojo
	Build time: 223.047 seconds


	OK!!!


5. ADD NLS _en-gb.js FILE


http://localhost/agua/0.5/dojo.1.4.2/release/dojo/dojo/nls/_en-gb.js

cat _en-gb.js

	dojo.provide("dojo.nls._en-gb");dojo.provide("dijit.nls.common");dijit.nls.common._built=true;dojo.provide("dijit.nls.common.en_gb");dijit.nls.common.en_gb={"buttonOk":"OK","buttonCancel":"Cancel","buttonSave":"Save","itemClose":"Close"};do...








TROUBLESHOOTING
---------------

SOLUTION

MUST LOAD DOJO FROM THE BUILD IN ORDER FOR IT TO FIND THE MODULES IN THE BUILT JS FILE:

<!-- LOAD DOJO -->

<script type="text/javascript" src="builds/agua/dojo/dojo/dojo.js"
	djConfig="isDebug: false, parseOnLoad: false, useCommentedJson: true"></script>

<!-- LOAD LAYER FILES -->
<script type="text/javascript" src="builds/agua/dojo/agua.js"></script>


PROBLEM

... TO AVOID THIS ERROR:

	release:  Using profile: profiles/workflow.profile.js
	release:  Using version number: 0.0.0.dev for the release.
	release:  Deleting: ../../release/dojo
	release:  Copying: ../../dojo/../../plugins to: ../../release/dojo/plugins
	release:  Copying: ../../dojo to: ../../release/dojo/dojo
	release:  Building dojo.js and layer files
	error loading uri: ./../../release/dojo/plugins/workflow/Apps.js, exception: Err
	or: Could not load 'dijit.form.Button'; last tried '../dijit/form/Button.js'


DIAGNOSIS

THIS IS BECAUSE dojo.js MUST FIND THE MODULES IN ITS PATH ***INSIDE THE BUILD DIR***



##release:      ../../release/dojo/dojox/widget/SortList/SortList.html
##release:  Interning strings for : ../../release/dojo/dojox/widget/UpgradeBar.js
##release:      ../../release/dojo/dojox/widget/UpgradeBar/UpgradeBar.html
##release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
##release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
##release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
##on.js
##release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
##release:  Build is in directory: ../../release/dojo
##Build time: 100.906 seconds







1. CREATED PROFILE FOR Workflow PLUGIN:


cd E:\22-agua\dojo.1.4.2-src\dojo.1.4.2\util\buildscripts

perl buildConfig.pl --inputdir E:\0.5\html\plugins\workflow --outputfile E:\0.5\html\dojo.1.4.2\util\buildscripts\profiles\agua-workflow.profile.js --name "../agua-workflow.js"



2. REMOVED ALL DEPENDENCIES EXCEPT FOR THE "plugins.workflow.*" ONES:

workflow.profile.js


dependencies = {
    layers:  [

		//{
		//	// This layer will be discarded, it is just used
		//	// to specify some modules that should not be included
		//	// in a later layer, but something that should not be
		//	// saved as an actual layer output. The important property
		//	// is the "discard" property. If set to true, then the layer
		//	// will not be a saved layer in the release directory.
		//	name: "plugins.discard",
		//	resourceName: "plugins.discard",
		//	discard: true,
		//	// Path to the copyright file must be relative to
		//	// the util/buildscripts directory, or an absolute path.
		//	copyrightFile: "myCopyright.txt",
		//	dependencies: [
		//			//"dojo.string"
		//	]
		//},
		//
		//{
		//	// one of the stock layers. It builds a "roll up" for
		//	// dijit.dijit which includes most of the infrastructure needed to
		//	// build widgets in a single file. We explicitly ignore the string
		//	// stuff via the previous exclude layer.
		//	
		//	// where the output file goes, relative to the dojo dir
		//	name: "../dijit/dijit.js",
		//
		//	// what the module's name will be, i.e., what gets generated
		//	// for dojo.provide(<name here>);
		//	resourceName: "dijit.dijit",
		//
		//	// modules not to include code for
		//	layerDependencies: [
		//		//"string.discard"
		//	],
		//
		//	// modules to use as the "source" for this layer
		//	dependencies: [
		//			"dijit.dijit"
		//	]
		//},
		//
		//
		//{
		//	// This layer will be discarded, it is just used
		//	// to specify some modules that should not be included
		//	// in a later layer, but something that should not be
		//	// saved as an actual layer output. The important property
		//	// is the "discard" property. If set to true, then the layer
		//	// will not be a saved layer in the release directory.
		//	name: "plugins.view",
		//	resourceName: "plugins.view",
		//	discard: true,
		//
		//	// modules not to include code for
		//	layerDependencies: [
		//		"plugins.view"
		//	],
		//
		//	// modules to use as the "source" for this layer
		//	dependencies: [
		//		"plugins.view"
		//	]
		//	
		//},

        {
	        name: "../workflow.js",
            dependencies: [
				"plugins.workflow.Apps"
				,
				"plugins.workflow.AppType",
				"plugins.workflow.AppRow",
				"plugins.workflow.AppsMenu",
				"plugins.workflow.AppsMenu",
				"plugins.workflow.Controller",
				"plugins.workflow.Workflow",
				"plugins.workflow.FileManager",
				"plugins.workflow.FileSelector",
				"plugins.workflow._GroupSelectorPane",
				"plugins.workflow.History",
				"plugins.workflow.HistoryRow",
				"plugins.workflow.HistoryPane",
				"plugins.workflow.HistoryPaneRow",
				"plugins.workflow.InfoPane",
				"plugins.workflow.InfoPaneRow",
				"plugins.workflow.RunStatus",
				"plugins.workflow.Shared",
				"plugins.workflow.SharedRow",
				"plugins.workflow.Status",
				"plugins.workflow.RunStatus",
				"plugins.workflow.Workflow",
				"plugins.workflow.FileManager",
				"plugins.workflow.FileSelector",
				"plugins.workflow.RunStatus",
				"plugins.workflow.History",
				"plugins.workflow.HistoryPane",
				"plugins.workflow.Shared",
				"plugins.workflow.InfoPane",
				"plugins.workflow.AppRow",
				"plugins.workflow.Apps",
				"plugins.workflow.Workflows",
				"plugins.workflow.Workflows",
				"plugins.workflow.StageRow",
				"plugins.workflow.WorkflowsMenu",
				"plugins.workflow.WorkflowIO",
				"plugins.workflow.WorkflowsMenu",
				"plugins.workflow._GroupDragPane",
				"plugins.workflow._GroupSelectorPane",
            ]
        }
    ],
	
    prefixes : [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ]
		,
        [ "plugins", "../../plugins" ]
    ]
};

####3. COPIED workflow.profile.js TO
####
####E:\0.5\html\dojo.1.4.2\util-1.4.2-orig\buildscripts\profiles
####
####
####
####3. RAN THE BUILD
####
####cd E:\0.5\html\dojo.1.4.2\util\buildscripts
####
####E:\22-agua\dojo.1.4.2-src\dojo-toolkit-readonly\release\dojo
####
####java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=workflow action=release



</entry>

<entry [Thu Jul  1 17:15:02 EDT 2010] RETAKE ON BUILDING DOJO 1.4.2>


Create optimized Dojo builds for your custom Dojo artifacts
http://www.ibm.com/developerworks/web/library/wa-aj-custom/index.html


1) Copy the custom folder under <dojoRootDir> where <dojoRootDir> is the location to which the Dojo source distribution was extracted to. Now, the directory structure should be as follows:
   
   <dojoRootDir>/
                 custom/
				        ibm/
						    modA.js modB.js modC.js
                 dojo/
				 dijit/
				 dojox/
				 util/



2)Copy the file test.profile.js to <dojoRootDir>.

<dojoRootDir> = E:\0.5\html\dojo.1.4.2


dependencies = {
   layers : [
	//modules to be eliminated from the dojo package
	{
	name : "dojo.js",
	customBase : true,
	discard : true,
	dependencies : [
		"dojo._base"
	]
   },
   
   //modules to be elimiated from the dijit package
   {
	 name : "../dijit/dijit.js",
	 discard : true,
	 dependencies : [
	   "dijit.dijit",
	   "dijit.dijit-all"
	 ],
	 layerDependencies : [
		"dojo.js"
	 ]
   },
   
   //modules to be elimiated from the dojox package
   {
	 name : "../dojox/dojox.js",
	 discard : true,
	 dependencies : [
	   "dojox.fx"
	 ],
	 layerDependencies : [
		"dojo.js"
	 ]
   },
   
   //modules to be elimiated from the custom package
	{
	  name: "discardLayer",
	  discard: true,
	  dependencies: [
		"custom.ibm.modB",
		"custom.ibm.modC"
	  ]
	},
	
	//Our target layer
	{
	  name: "../../../mydojo.js",//the layer file will be place under <dojoRootDir>
	  dependencies: [
		   "custom.ibm.modA"
	  ],
	  layerDependencies:[
	  "discardLayer",
	  "dojo.js",
	  "../dijit/dijit.js",
	  "../dojox/dojox.js"
	  ]
	}
   ], 
prefixes : [ 
	   ["dijit" , "../dijit" ],
	   ["custom" , "../custom"],
	   ["dojox", "../dojox"]
	 ]				
}


3)From the command prompt, switch to the following directory : <dojoRootDir>/util/buildscripts and run the build:

####./build.sh profileFile=../../test.profile.js action=clean,release releaseName=myRelease


cd E:\0.5\html\dojo.1.4.2\util\buildscripts
build.bat profileFile=../../test.profile.js action=clean,release releaseName=myRelease


	java -classpath ../shrinksafe/js.jar;..
	/shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js buil
	d.bat-profileFile=../../test.profile.js action=clean,release releaseName=myRelea
	se
	clean:  Deleting: ../../release/myRelease
	release:  Using profile:
	release:  Using version number: 0.0.0.dev for the release.
	release:  Deleting: ../../release/myRelease
	js: uncaught JavaScript runtime exception: TypeError: Cannot read property "dependencies" from undefined




4)Now the layer file mydojo.js should be available under <dojoRootDir>	



TEST BUILD OF custom.modA
-------------------------

1. WRITE FILE modA.profile.js TO <dojoRootDir>


dependencies: {

	layers: [
		{
		  "name": "../discardLayer.js",
		  "discard" : "true",
		  "dependencies": 
			 [
			  "custom.modB",
			  "custom.modC"
			 ]
		},

		{
		  "name": "layerA",
		  "layerDependencies" : 
			 [
			  "discardLayer"                             ],
		  "dependencies" :
			 [
			  "custom.modA"
			 ]
		}
	],

	prefixes: 
	[
		["custom": "../custom"]
	]
}               



2. RUN BUILD

cd E:\0.5\html\dojo.1.4.2\util\buildscripts
build.bat profileFile=../../modA.profile.js action=clean,release releaseName=myRelease

SAME dojo.foo ERROR



TRIED WITH NEWLY-DOWNLOADED SOURCE 1.4.2:

http://download.dojotoolkit.org/release-1.4.2/dojo-release-1.4.2-src.zip

cd E:\0.5\html\dojo.1.4.2\util\buildscripts
build.bat profileFile=../../modA.profile.js action=clean,release releaseName=myRelease

SAME dojo.foo ERROR




TRIED WITH NEWLY-DOWNLOADED SOURCE 1.3.2:

http://download.dojotoolkit.org/release-1.3.2/dojo-release-1.3.2-src.zip

cd E:\0.5\html\dojo.1.4.2\util\buildscripts
build.bat profileFile=../../modA.profile.js action=clean,release releaseName=myRelease

SAME dojo.foo ERROR



TRIED WITH util DIRECTORY FROM DOJO 1.2.2:

cd E:\0.5\html\dojo.1.4.2\util\buildscripts
build.bat profileFile=../../modA.profile.js action=clean,release releaseName=myRelease

SAME dojo.foo ERROR


TRIED WITH util DIRECTORY FROM DOJO 1.2.2 BUT WITH custom_rhino.jar:


java -jar ..\shrinksafe\custom_rhino.jar build.js profile="modA" action="release" version="0.5"

	js: uncaught JavaScript runtime exception: TypeError: Cannot read property "dojo
	.foo" from undefined
	js: uncaught JavaScript runtime exception: TypeError: Cannot find function regis
	terModulePath.



cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt



####java -jar ..\shrinksafe\custom_rhino.jar build.js profile="aqwa04" action="release" version="0.4" cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt



	
	



DO IT OLD SCHOOL
----------------

cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="agua" action="release" version="0.5" cssOptimize=comments.keepLines releaseDir=../../../builds/agua/ > ..\..\..\builds\agua\agua-build-output2.txt


####java -jar ..\shrinksafe\custom_rhino.jar build.js profile="aqwa04" action="release" version="0.4" cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt &> build_log14.txt



STILL GIVES THE dojo.foo ERROR, SO ITS A PROBLEM WITH DISTRIB 1.4.2 ITSELF, NOT THE LATER util DIRECTORY'S BUILD EXECUTABLES.


SO EDITED TOP OF dojo/_loader/_loader.js TO REMOVE REFERENCES TO dojo.foo


//if(!dojo._hasResource["dojo.foo"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
//dojo._hasResource["dojo.foo"] = true;


	... loader.js FUNCTION GOES HERE


//}


... AND TRIED AGAIN:




E:\0.5\html\dojo.1.4.2\util\buildscripts>java -jar ..\shrinksafe\custom_rhino.jar build.js profile="agua" action="release" version="0.5" cssOptimize=comments.keepLines releaseDir=../../../builds/agua/ > ..\..\..\builds\agua\agua-build-output3.txt


BUT GOT THIS dijit.dijit NOT LOADING ERROR:

	error loading uri: ./../../../builds/agua/dojo/dojox/grid/_Grid.js, exception: Error: Could not load 'dijit.dijit'; last tried '../../../builds/agua/dojo/dijit/dijit.js'


SO ADDED dojo.provide("dijit.dijit") TO TOP OF dijit.js FILE AND ERROR DISAPPEARED. BUT GOT THIS NEW ERROR:

	
	js: uncaught JavaScript runtime exception: ReferenceError: "window" is not defined.
	js: "../../dojo/dojo.js", line 16: exception from uncaught JavaScript throw: Error: Could not load 'dojo.i18n'; last tried '../../../builds/agua/dojo/dojo/i18n.js'


SO ADDED

dojo.provide("dojo.i18n");

TO THE TOP OF THE il8n.js FILE BUT GOT THE SAME ERROR:


	js: uncaught JavaScript runtime exception: ReferenceError: "window" is not defined.
	js: "../../dojo/dojo.js", line 16: exception from uncaught JavaScript throw: Error: Could not load 'dojo.i18n'; last tried '../../../builds/agua/dojo/dojo/i18n.js'





SO TRIED GETTING THE LATEST NIGHTLY BUILD OF src  **** SOLUTION ****
-------------------------------------------------

1. DOWNLOAD THE NIGHTLY


svn checkout http://svn.dojotoolkit.org/src/view/anon/all/trunk dojo-toolkit-readonly


Getting the Nightly Build

For the truly dedicated: you can get the latest and greatest code directly from the nightly archives, or directly from the Subversion repository. Use this repository URL: http://svn.dojotoolkit.org/src/view/anon/all/trunk, like this:

svn checkout http://svn.dojotoolkit.org/src/view/anon/all/trunk dojo-toolkit-readonly

The README in the link explains why the directory looks empty: It is a collection of svn:externals pointing to the various project root folders. For instance, if you desire only the Dojo project (excluding Dijit, DojoX, and util/), use this URL http://svn.dojotoolkit.org/src/dojo/trunk:

svn checkout http://svn.dojotoolkit.org/src/dojo/trunk dojo-only-readonly

It is worth noting: when working from Subversion, the code is not optimized or otherwise built. For optimum performance, download the source files from SVN, and run a build. FIXME: link



RAN THE BUILD WHERE THE SRC WAS UNZIPPED TO TEST IT:


cd E:\22-agua\dojo.1.4.2-src\dojo-toolkit-readonly\util\buildscripts


java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release


YESSSS!!!!!


./../../release/dojo/dijit/_editor/RichText.js
./../../release/dojo/dijit/_KeyNavContainer.js
./../../release/dojo/dijit/ToolbarSeparator.js
./../../release/dojo/dijit/Toolbar.js
./../../release/dojo/dijit/_editor/_Plugin.js
./../../release/dojo/dijit/_editor/plugins/EnterKeyHandling.js
./../../release/dojo/dijit/Editor.js
./../../release/dojo/dojo/cldr/supplemental.js
./../../release/dojo/dojo/date.js
./../../release/dojo/dojo/date/locale.js
./../../release/dojo/dijit/Calendar.js
./../../release/dojo/dijit/form/_DateTimeTextBox.js
./../../release/dojo/dijit/form/DateTextBox.js
./../../release/dojo/dijit/form/SimpleTextarea.js
./../../release/dojo/dijit/form/Textarea.js
./../../release/dojo/dojo/cldr/monetary.js
./../../release/dojo/dojo/currency.js
./../../release/dojo/dijit/form/CurrencyTextBox.js
./../../release/dojo/dojo/dnd/TimedMoveable.js
./../../release/dojo/dojo/fx/Toggler.js
./../../release/dojo/dojo/fx.js
./../../release/dojo/dijit/form/_FormMixin.js
./../../release/dojo/dijit/_DialogMixin.js
./../../release/dojo/dijit/DialogUnderlay.js
./../../release/dojo/dojo/html.js
./../../release/dojo/dijit/layout/ContentPane.js
./../../release/dojo/dijit/TooltipDialog.js
./../../release/dojo/dijit/Dialog.js
./../../release/dojo/dojo/data/ItemFileReadStore.js
./../../release/dojo/dojo/data/ItemFileWriteStore.js
./../../release/dojo/dojo/dnd/Container.js
./../../release/dojo/dojo/dnd/Selector.js
./../../release/dojo/dojo/dnd/Avatar.js
./../../release/dojo/dojo/dnd/Manager.js
./../../release/dojo/dojo/dnd/Source.js
./../../release/dojo/dojox/html/_base.js
./../../release/dojo/dojox/layout/ContentPane.js
./../../release/dojo/dojox/layout/ResizeHandle.js
./../../release/dojo/dojox/layout/FloatingPane.js
./../../release/dojo/dijit/TitlePane.js
./../../release/dojo/dojo/cookie.js
./../../release/dojo/dijit/layout/StackController.js
./../../release/dojo/dijit/layout/StackContainer.js
./../../release/dojo/dijit/layout/_TabContainerBase.js
./../../release/dojo/dijit/MenuItem.js
./../../release/dojo/dijit/PopupMenuItem.js
./../../release/dojo/dijit/CheckedMenuItem.js
./../../release/dojo/dijit/MenuSeparator.js
./../../release/dojo/dijit/Menu.js
./../../release/dojo/dijit/layout/TabController.js
./../../release/dojo/dijit/layout/ScrollingTabController.js
./../../release/dojo/dijit/layout/TabContainer.js
./../../release/dojo/dijit/layout/BorderContainer.js
./../../release/dojo/dijit/layout/LayoutContainer.js
./../../release/dojo/dojox/layout/ExpandoPane.js
./../../release/dojo/dijit/layout/AccordionPane.js
./../../release/dojo/dijit/layout/AccordionContainer.js
./../../release/dojo/dijit/layout/SplitContainer.js
./../../release/dojo/dojox/fx/_base.js
./../../release/dojo/dojox/fx.js
./../../release/dojo/dojox/widget/Dialog.js
./../../release/dojo/dojo/fx/easing.js
./../../release/dojo/dojox/timing/Sequence.js
./../../release/dojo/dojox/html/metrics.js
./../../release/dojo/dojox/widget/RollingList.js
./../../release/dojo/dojox/data/FileStore.js
./../../release/dojo/dojox/form/FileInput.js
./../../release/dojo/dojo/io/iframe.js
./../../release/dojo/dojox/form/FileInputAuto.js
./../../release/dojo/dojox/embed/Flash.js
./../../release/dojo/dojox/html/styles.js
./../../release/dojo/dojox/embed/flashVars.js
./../../release/dojo/dojox/form/FileUploader.js
./../../release/dojo/dijit/InlineEditBox.js
./../../release/dojo/dojox/widget/FisheyeLite.js
./../../release/dojo/dojox/widget/FilePicker.js
./../../release/dojo/dojox/grid/util.js
./../../release/dojo/dojox/grid/_Scroller.js
./../../release/dojo/dojox/grid/cells/_base.js
./../../release/dojo/dojox/grid/cells.js
./../../release/dojo/dojox/grid/_Builder.js
./../../release/dojo/dojox/grid/_View.js
./../../release/dojo/dojox/grid/_RowSelector.js
./../../release/dojo/dojox/grid/_Layout.js
./../../release/dojo/dojox/grid/_ViewManager.js
./../../release/dojo/dojox/grid/_RowManager.js
./../../release/dojo/dojox/grid/_FocusManager.js
./../../release/dojo/dojox/grid/_EditManager.js
./../../release/dojo/dojox/grid/Selection.js
./../../release/dojo/dojox/grid/_Events.js
./../../release/dojo/dojox/grid/_Grid.js
./../../release/dojo/dojox/grid/DataSelection.js
./../../release/dojo/dojox/grid/DataGrid.js
./../../release/dojo/dojo/DeferredList.js
./../../release/dojo/dijit/tree/TreeStoreModel.js
./../../release/dojo/dijit/tree/ForestStoreModel.js
./../../release/dojo/dijit/Tree.js
./../../release/dojo/dojox/rpc/Service.js
./../../release/dojo/dojo/io/script.js
./../../release/dojo/dojo/colors.js
./../../release/dojo/dijit/_PaletteMixin.js
./../../release/dojo/dijit/ColorPalette.js
./../../release/dojo/dojox/timing/_base.js
./../../release/dojo/dojox/timing.js

release:  Interning strings for: ../../release/dojo/dijit
release:  Interning strings for : ../../release/dojo/dijit/Calendar.js
release:      ../../release/dojo/dijit/templates/Calendar.html
release:  Interning strings for : ../../release/dojo/dijit/CheckedMenuItem.js
release:      ../../release/dojo/dijit/templates/CheckedMenuItem.html
release:  Interning strings for : ../../release/dojo/dijit/ColorPalette.js
release:      ../../release/dojo/dijit/templates/ColorPalette.html
release:  Interning strings for : ../../release/dojo/dijit/Dialog.js
release:      ../../release/dojo/dijit/templates/Dialog.html
release:  Interning strings for : ../../release/dojo/dijit/form/Button.js
release:      ../../release/dojo/dijit/form/templates/Button.html
release:      ../../release/dojo/dijit/form/templates/DropDownButton.html
release:      ../../release/dojo/dijit/form/templates/ComboButton.html
release:  Interning strings for : ../../release/dojo/dijit/form/CheckBox.js
release:      ../../release/dojo/dijit/form/templates/CheckBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/ComboBox.js
release:      ../../release/dojo/dijit/form/templates/ComboBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/HorizontalSlider
.js
release:      ../../release/dojo/dijit/form/templates/HorizontalSlider.html
release:  Interning strings for : ../../release/dojo/dijit/form/Select.js
release:      ../../release/dojo/dijit/form/templates/Select.html
release:  Interning strings for : ../../release/dojo/dijit/form/TextBox.js
release:      ../../release/dojo/dijit/form/templates/TextBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/ValidationTextBo
x.js
release:      ../../release/dojo/dijit/form/templates/ValidationTextBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/VerticalSlider.j
s
release:      ../../release/dojo/dijit/form/templates/VerticalSlider.html
release:  Interning strings for : ../../release/dojo/dijit/form/_Spinner.js
release:      ../../release/dojo/dijit/form/templates/Spinner.html
release:  Interning strings for : ../../release/dojo/dijit/InlineEditBox.js
release:      ../../release/dojo/dijit/templates/InlineEditBox.html
release:  Interning strings for : ../../release/dojo/dijit/layout/AccordionConta
iner.js
release:      ../../release/dojo/dijit/layout/templates/AccordionButton.html
release:  Interning strings for : ../../release/dojo/dijit/layout/ScrollingTabCo
ntroller.js
release:      ../../release/dojo/dijit/layout/templates/ScrollingTabController.h
tml
release:      ../../release/dojo/dijit/layout/templates/_ScrollingTabControllerB
utton.html
release:  Interning strings for : ../../release/dojo/dijit/layout/TabController.
js
release:      ../../release/dojo/dijit/layout/templates/_TabButton.html
release:  Interning strings for : ../../release/dojo/dijit/layout/_TabContainerB
ase.js
release:      ../../release/dojo/dijit/layout/templates/TabContainer.html
release:  Interning strings for : ../../release/dojo/dijit/Menu.js
release:      ../../release/dojo/dijit/templates/Menu.html
release:  Interning strings for : ../../release/dojo/dijit/MenuBar.js
release:      ../../release/dojo/dijit/templates/MenuBar.html
release:  Interning strings for : ../../release/dojo/dijit/MenuBarItem.js
release:      ../../release/dojo/dijit/templates/MenuBarItem.html
release:  Interning strings for : ../../release/dojo/dijit/MenuItem.js
release:      ../../release/dojo/dijit/templates/MenuItem.html
release:  Interning strings for : ../../release/dojo/dijit/MenuSeparator.js
release:      ../../release/dojo/dijit/templates/MenuSeparator.html
release:  Interning strings for : ../../release/dojo/dijit/ProgressBar.js
release:      ../../release/dojo/dijit/templates/ProgressBar.html
release:  Interning strings for : ../../release/dojo/dijit/TitlePane.js
release:      ../../release/dojo/dijit/templates/TitlePane.html
release:  Interning strings for : ../../release/dojo/dijit/Tooltip.js
release:      ../../release/dojo/dijit/templates/Tooltip.html
release:  Interning strings for : ../../release/dojo/dijit/TooltipDialog.js
release:      ../../release/dojo/dijit/templates/TooltipDialog.html
release:  Interning strings for : ../../release/dojo/dijit/Tree.js
release:      ../../release/dojo/dijit/templates/TreeNode.html
release:      ../../release/dojo/dijit/templates/Tree.html
release:  Interning strings for : ../../release/dojo/dijit/_TimePicker.js
release:      ../../release/dojo/dijit/templates/TimePicker.html
release:  Interning strings for: ../../release/dojo/dojox
release:  Interning strings for : ../../release/dojo/dojox/atom/widget/FeedEntry
Editor.js
release:      ../../release/dojo/dojox/atom/widget/templates/FeedEntryEditor.htm
l
release:      ../../release/dojo/dojox/atom/widget/templates/PeopleEditor.html
release:  Interning strings for : ../../release/dojo/dojox/atom/widget/FeedEntry
Viewer.js
release:      ../../release/dojo/dojox/atom/widget/templates/FeedEntryViewer.htm
l
release:      ../../release/dojo/dojox/atom/widget/templates/EntryHeader.html
release:  Interning strings for : ../../release/dojo/dojox/atom/widget/FeedViewe
r.js
release:      ../../release/dojo/dojox/atom/widget/templates/FeedViewer.html
release:      ../../release/dojo/dojox/atom/widget/templates/FeedViewerEntry.htm
l
release:      ../../release/dojo/dojox/atom/widget/templates/FeedViewerGrouping.
html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/PlayButton.
js
release:      ../../release/dojo/dojox/av/widget/resources/PlayButton.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/Player.js
release:      ../../release/dojo/dojox/av/widget/resources/Player.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/ProgressSli
der.js
release:      ../../release/dojo/dojox/av/widget/resources/ProgressSlider.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/Status.js
release:      ../../release/dojo/dojox/av/widget/resources/Status.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/VolumeButto
n.js
release:      ../../release/dojo/dojox/av/widget/resources/VolumeButton.html
release:  Interning strings for : ../../release/dojo/dojox/editor/plugins/TableP
lugins.js
release:      ../../release/dojo/dojox/editor/plugins/resources/insertTable.html

release:      ../../release/dojo/dojox/editor/plugins/resources/modifyTable.html

release:  Interning strings for : ../../release/dojo/dojox/form/CheckedMultiSele
ct.js
release:      ../../release/dojo/dojox/form/resources/_CheckedMultiSelectItem.ht
ml
release:      ../../release/dojo/dojox/form/resources/CheckedMultiSelect.html
release:  Interning strings for : ../../release/dojo/dojox/form/FileInput.js
release:      ../../release/dojo/dojox/form/resources/FileInput.html
release:  Interning strings for : ../../release/dojo/dojox/form/FileInputAuto.js

release:      ../../release/dojo/dojox/form/resources/FileInputAuto.html
release:  Interning strings for : ../../release/dojo/dojox/form/FilePickerTextBo
x.js
release:      ../../release/dojo/dojox/form/resources/FilePickerTextBox.html
release:  Interning strings for : ../../release/dojo/dojox/form/PasswordValidato
r.js
release:      ../../release/dojo/dojox/form/resources/PasswordValidator.html
release:  Interning strings for : ../../release/dojo/dojox/form/RangeSlider.js
release:      ../../release/dojo/dojox/form/resources/HorizontalRangeSlider.html

release:      ../../release/dojo/dojox/form/resources/VerticalRangeSlider.html
release:  Interning strings for : ../../release/dojo/dojox/grid/_Grid.js
release:      ../../release/dojo/dojox/grid/resources/_Grid.html
release:  Interning strings for : ../../release/dojo/dojox/grid/_TreeView.js
release:      ../../release/dojo/dojox/grid/resources/Expando.html
release:  Interning strings for : ../../release/dojo/dojox/grid/_View.js
release:      ../../release/dojo/dojox/grid/resources/View.html
release:  Interning strings for : ../../release/dojo/dojox/image/Gallery.js
release:      ../../release/dojo/dojox/image/resources/Gallery.html
release:  Interning strings for : ../../release/dojo/dojox/image/Lightbox.js
release:      ../../release/dojo/dojox/image/resources/Lightbox.html
release:  Interning strings for : ../../release/dojo/dojox/image/SlideShow.js
release:      ../../release/dojo/dojox/image/resources/SlideShow.html
release:  Interning strings for : ../../release/dojo/dojox/image/ThumbnailPicker
.js
release:      ../../release/dojo/dojox/image/resources/ThumbnailPicker.html
release:  Interning strings for : ../../release/dojo/dojox/layout/ExpandoPane.js

release:      ../../release/dojo/dojox/layout/resources/ExpandoPane.html
release:  Interning strings for : ../../release/dojo/dojox/layout/FloatingPane.j
s
release:      ../../release/dojo/dojox/layout/resources/FloatingPane.html
release:  Interning strings for : ../../release/dojo/dojox/layout/GridContainerL
ite.js
release:      ../../release/dojo/dojox/layout/resources/GridContainer.html
release:  Interning strings for : ../../release/dojo/dojox/layout/ScrollPane.js
release:      ../../release/dojo/dojox/layout/resources/ScrollPane.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Calendar.js
release:      ../../release/dojo/dojox/widget/Calendar/Calendar.html
release:      ../../release/dojo/dojox/widget/Calendar/CalendarDay.html
release:      ../../release/dojo/dojox/widget/Calendar/CalendarMonthYear.html
release:  Interning strings for : ../../release/dojo/dojox/widget/CalendarViews.
js
release:      ../../release/dojo/dojox/widget/Calendar/CalendarMonth.html
release:      ../../release/dojo/dojox/widget/Calendar/CalendarYear.html
release:  Interning strings for : ../../release/dojo/dojox/widget/ColorPicker.js

release:      ../../release/dojo/dojox/widget/ColorPicker/ColorPicker.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Dialog.js
release:      ../../release/dojo/dojox/widget/Dialog/Dialog.html
release:  Interning strings for : ../../release/dojo/dojox/widget/DocTester.js
release:      ../../release/dojo/dojox/widget/DocTester/DocTester.html
release:  Interning strings for : ../../release/dojo/dojox/widget/FilePicker.js
release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
release:  Interning strings for : ../../release/dojo/dojox/widget/gauge/_Gauge.j
s
release:      ../../release/dojo/dojox/widget/gauge/_Gauge.html
release:      ../../release/dojo/dojox/widget/gauge/_Indicator.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Pager.js
release:      ../../release/dojo/dojox/widget/Pager/Pager.html
release:  Interning strings for : ../../release/dojo/dojox/widget/RollingList.js

release:      ../../release/dojo/dojox/widget/RollingList/RollingList.html
release:  Interning strings for : ../../release/dojo/dojox/widget/SortList.js
release:      ../../release/dojo/dojox/widget/SortList/SortList.html
release:  Interning strings for : ../../release/dojo/dojox/widget/UpgradeBar.js
release:      ../../release/dojo/dojox/widget/UpgradeBar/UpgradeBar.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
on.js
release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
release:  Interning strings for: ../../release/dojo/dojo
release:  Build is in directory: ../../release/dojo
Build time: 142.406 seconds



WHICH CREATED THIS:


E:\22-agua\dojo.1.4.2-src\dojo-toolkit-readonly\release\dojo\agua.js


AND THIS:

E:\22-agua\dojo.1.4.2-src\dojo-toolkit-readonly\release\dojo\agua.js.uncompressed.js




</entry>



<entry [Wed Jun 23 18:45:04 EDT 2010] FIRST BUILD OF AGUA 0.5 LAYER FILE>


video by Dante
http://dojocampus.org/content/2008/05/03/dojo-build-101-basics/



http://oshyn.com/_blog/General/post/Dojo-14-Custom-Build/


Dojo 1.4 Custom Build
Dario Mora... - Tuesday, March 30, 2010
 
Dojo's default configuration loads javascript resources from the server only as they're required, Dojo, in its source distribution, contains many separate files and resources. Normally each 'dojo.require' statement results in a synchronous HTTP call to the server to retrieve a resource


Large applications that have many dependencies can take a very long time to load when a build isn't used and because browsers wait for each synchronous call to complete before continuing with anything else the large series of requests performed by Dojo may significantly degrade page-load times. Dojo does not include a single file containing every possible dojo function, to compensate this common issue, Dojo includes functionality to create a custom build that meets the needs of your particular web site and configure which resources are bundled directly to dojo.js


A Dojo custom build groups together modules into layers. A layer, which is one big .js file, loads faster than the individual .js modules that comprise it.


A layer is a single, minified JavaScript file which combines all of the JavaScript code from multiple source files, including dependencies. This file can then be included on the site using standard HTML script tags.


The following instructions describe how to create a Custom Profile for Dojo:

Prerequisites

A source code version of Dojo, it can be downloaded from download.dojotoolkit.org, be sure to select the source code build, which has -src in its file name:  dojo-release-1.4.2-src.zip

Java 1.4.2 or later
Creating a Custom Profile

A Dojo profile controls how the build system creates the custom layers . This file defines exactly what the build system will include to create the custom Dojo layer.


We use dojo.require to specify modules that an application needs, but larger Dojo applications put this list of requirements into a single file that only includes a list of dependencies. You specify, via a build profile, exactly which resources to include in the layers that you build.


Dojo build profile structure:

dependencies = {
  layers : [ ],
  prefixes : [ ]
}; 

The layers section is an array of layer files you want to create.


The prefixes section is an array of individual prefix objects. Each prefix object describes where a particular top-level module's source is found relative to dojoRootDir/dojo.


The profile should be a file named something.profile.js, and should be located in dojoRootDir/util/buildscripts/ profiles


This is an example of dojo layer that includes the functionality for dojo.fx, dojo.xml.parser

dependencies ={
    layers:  [
        {
        name: "mynewdojo.js",
        dependencies: [
            "dojox.xml.parser",
            "dojo.fx"            
        ]
        }
    ],
    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ]
    ]
};



Custom build
------------

The Dojo build script is located in the dojoRootDir/util/buildscripts directory, to begin your build, you use the build.sh or build.bat on Windows.

build.bat profileFile = < profile_file> action=< actions>

The build system has a command line parameters, the most important are:


profile

The profile to be used for the build.


action

The list of actions to perform. The most common one is release which does the default build magic. The clean option removes previous build artifacts.


version

Optional. The version number of the build. When you interrogate dojo.version, this is the number that will be reported.

Use  a Custom Build

Include the calls to the javascript files in your HEADER section:


dojo.js provides the package system and base utilities
mylayer.js includes the rest of the modules we need

<!--
<script  type="text/javascript"  src="/js/dojo/dojo.js"></script>
<script type="text/javascript" src="/js/dojo/mylayer.js"></script>
-->

Summary

This small 'how to' show you how to use Dojo build functionality to create a custom build that meets a specific requirements. A custom build ensures that we does not include unneeded modules and can achieve a fast Dojo load without tricks or hacks, just the use of


<!--
<script src=''>
-->    

to load your custom build of Dojo.


The Dojo Build System
http://o.dojotoolkit.org/book/export/html/18



RSS Feed
Darktalker Darktalker's Fantasy World
http://darktalker.com/?p=138



[DOJO]Custom builder command
APR 15
Posted on Thursday, April 15, 2010 in Programming

dojo is a powerful javascript framework, but it has a poor documentation, to generate custom build of dojo, there are several commands very useful but you just can't find any doc other than searching in the code. I gathered the doc from their code:

To run the build, you must have Java 1.4.2 or later installed.
To run a build run the following command from this directory:

> java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js [name=value...]

Here is an example of a typical release build:

> java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main  build.js profile=base action=release

If you get a java.lang.OutOfMemoryError: Java heap space' error, try increasing the memory Java can use for the command:

> java -Xms256m -Xmx256m -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=base action=release

Change the 256 number to the number of megabytes you want to give Java.

The possible name=value build options are shown below with the defaults as their values:

cssImportIgnore=
If using cssOptimize='comments', then you can force the @import inlining step to
 ignore a set of files by using this option. The value of this option should be
a comma separated list of CSS files names to ignore. The file names should match
 whatever strings are used for the @import calls.

xdScopeArgs=
If the loader=xdomain build option is used, then the value of this option will be used as the arguments to the function that defines the modules in the .xd.js files. This allows for more than one version of the same module to be in a page.
See documentation on djConfig.scopeMap for more information.

cssOptimize=
Specifies how to optimize CSS files. If 'comments' is specified, then code comments and line returns are stripped, and files referenced via @import are inlined.
If 'comments.keepLines' is specified, then code comments are stripped and @import calls are inlined, but line returns are preserved.

releaseName=dojo
The name of the release. A directory inside releaseDir' will be created with this name.

localeList=ar,ca,cs,da,de-de,el,en-gb,en-us,es-es,fi-fi,fr-fr,he-il,hu,it-it,ja-jp,ko-kr,nl-nl,nb,pl,pt-br,pt-pt,ru,sk,sl,sv,th,tr,zh-tw,zh-cn
The set of locales to use when flattening i18n bundles.

releaseDir=../../release/
The top level release directory where builds end up. The releaseName' directories will  be placed inside this directory.

copyTests=false
Turn on or off copying of test files.

action=help
The build action(s) to run. Can be a comma-separated list, like action=clean,release. The possible build actions are: clean, release.

symbol=
Inserts function symbols as global references so that anonymous functions will show up in all debuggers (esp. IE which does not attempt to infer function names from the context of their definition). Valid values are 'long' and 'short'. If 'short' is used, then a symboltables.txt file will be generated in each module prefix's release directory which maps the short symbol names to more descriptive names.

internStrings=true
Turn on or off widget template file interning.

removeDefaultNameSpaces=false
Removes the default com', org' and net' namespaces that are present in Rhino.
This is hazardous to use if the build system is used as part of a Rhino-based server-side solution, so use with caution. Weird build errors might occur. Only use if your own code includes things in a com, org or net namespace.

scopeMap=
Change the default dojo, dijit and dojox scope names to something else. Useful if you want to use Dojo as part of a JS library, but want to make a self-contained library with no external dojo/dijit/dojox references. Format is a string that contains no spaces, and is similar to the djConfig.scopeMap value (note that the backslashes below are required to avoid shell escaping):
scopeMap=[[\"dojo\",\"mydojo\"],[\"dijit\",\"mydijit\"],[\"dojox\",\"mydojox\"]]

mini=true
Removes files like tests, demos dijit/bench, unfinished themes, and interned Dijit templates from the build. Overrides the value set for copyTests.

optimize=
Specifies how to optimize module files. If 'comments' is specified, then code comments are stripped. If 'shrinksafe' is specified, then Dojo Shrinksafe will be used on the files, and line returns will be removed. If 'shrinksafe.keepLines' is specified, then Dojo Shrinksafe will be used on the files, and line returns will be preserved.  See also 'stripConsole'. Google Closure's compiler can be used by specifying 'closure' as the value. It does not use the stripConsole build option, and it REQUIRES Java 6 to run, and it may make some complaints about the code and print out error's, but if the build completes, then the code should work. Do not taunt happy Closure compiler. To use Closure compiler, download it from here:
http://code.google.com/p/closure-compiler/downloads/list
And place the compiler.jar file somewhere you can easily reference. Then use the following to execute the build (remember Java 6):
java -classpath ../shrinksafe/js.jar:../closurecompiler/compiler.jar org.mozilla.javascript.tools.shell.Main build.js
and place your build arguments on the same line after that text. Change the ../closurecompiler path to the path where you keep Closure's compiler.jar.

loader=default
The type of dojo loader to use. 'default' or 'xdomain' are acceptable values.

log=0
Sets the logging verbosity. See jslib/logger.js for possible integer values.

profileFile=
A file path to the the profile file. Use this if your profile is outside of the profiles directory. Do not specify the 'profile' build option if you use 'profileFile'.

expandProvide=false
Expands dojo.provide calls with faster calls at the expense of a larger file size. Only use the option if your profiling reveals that dojo.provide calls are taking a noticeable amount of time. Even then, it could cause errors in the built files. If you find an error after building, turn this option off. It replaces dojo.provide('foo.bar') statements with the shortest valid programmatic equivalent:

if(typeof foo=='undefined'){foo={};};foo.bar=foo.bar||{};
Ignored for xdomain builds.

xdDojoPath=
If the loader=xdomain build option is used, then the value of this option will be used to call dojo.registerModulePath() for dojo, dijit and dojox. The xdDojoPath should be the directory that contains the dojo, dijit and dojox directories, and it should NOT end in a slash. For instance: http://some.domain.com/path/to/dojo090?.

stripConsole=undefined
Strips console method calls from JS source. Applied to layers and individual modules resource files. Valid values are 'none' (leaves all console calls alone, same as default ''), 'normal' (strips all but console.warn and console.error calls), 'warn' (strips all but console.error calls), 'all' (strips all console calls).  NOTE: only has effect if optimize includes use of shrinksafe.

query=default
Select a DOM query engine. Default value is the normal dojo.query engine. Using query=sizzle will use the Sizzle engine.Normal Dojo tests are not run routinely with the Sizzle engine. See dojo/_base/sizzle.js for the version of Sizzle.

version=0.0.0.dev
The build will be stamped with this version string.

profile=base
The name of the profile to use for the build. It must be the first part of the profile file name in the profiles/ directory. For instance, to use base.profile.js, specify profile=base.

layerOptimize=shrinksafe
Specifies how to optimize the layer files. If 'comments' is specified, then code comments are stripped. If 'shrinksafe' is specified, then Dojo Shrinksafe will be used on the files, and line returns will be removed. If 'shrinksafe.keepLines' is specified, then Dojo Shrinksafe will be used on the layer files, and line returns will be preserved. Google Closure's compiler can be used by specifying 'closure' as the value. It does not use the stripConsole build option, and it REQUIRES Java 6 to run, and it may make some complaints about the code and print out error's, but if the build completes, then the code should work. Do not taunt happy Closure compiler. To use Closure compiler, download it from here: http://code.google.com/p/closure-compiler/downloads/list 
And place the compiler.jar file somewhere you can easily reference. Then use the following to execute the build (remember Java 6):
java -classpath ../shrinksafe/js.jar:../closurecompiler/compiler.jar org.mozilla.javascript.tools.shell.Main build.js
and place your build arguments on the same line after that text. Change the ../closurecompiler path to the path where you keep Closure's compiler.jar.

scopeDjConfig=
Burn in a djConfig object into the built dojo.js file. Useful if you are making your own scoped dojo and you want a djConfig object local to your version that will not be affected by any globally declared djConfig object in the page. Value must be a string that will look like a javascript object literal once it is placed in the built source. use Dojo as part of a JS library, but want to make a self-contained library with no external dojo/dijit/dojox. Example (note that the backslashes below are required to avoid shell escaping if you type this on the command line):
scopeDjConfig={isDebug:true,scopeMap:[[\"dojo\",\"mydojo\"],[\"dijit\",\"mydijit\"],[\"dojox\",\"mydojox\"]]}

xdDojoScopeName=dojo
If the loader=xdomain build option is used, then the value of this option will be used instead of dojo' for the dojo._xdResourceLoaded()' calls that are done in the .xd.js files. This allows for dojo to be under a different scope name but still allow xdomain loading with that scope name.

buildLayers=
A comma-separated list of layer names to build. Using this option means that only those layers will be built. This helps if you are doing quick development and test cycles with layers. If you have problems using this option, try removing it and doing a full build with action=clean,release. This build option assumes you have done at least one full build first.

Possible generation command: build.bat profile=fx action=clean,release cssOptimize=comments localeList=en-gb,en-us,fr,zh-cn optimize=shrinksafe cssImportIgnore=comments






1. RAN buildConfig.pl

cd E:\0.5\bin\scripts

perl buildConfig.pl --inputdir E:\0.5\html\plugins --outputfile E:\0.5\html\dojo.1.4.2\util\buildscripts\profiles\agua.profile.js --name "../agua.js"


THEN MANUALLY REMOVED ALL THE plugins.* FILES (DO EACH PLUGIN INDIVIDUALLY FOR DEVELOPMENT PURPOSES):

dependencies ={
    layers:  [
        {
	        name: "../agua.js",
            dependencies: [

				"dijit.dijit",
				"dijit.form.CheckBox",
				"dijit.form.ValidationTextBox",
				"dijit.form.RadioButton",
				"dijit.form.ComboBox",
				"dijit.form.Slider",
				"dijit.form.FilteringSelect",
				"dijit.form.Button",
				"dijit.form.NumberSpinner",
				"dijit.Editor",
				"dijit.form.DateTextBox",
				"dijit.form.Textarea",
				"dijit.form.TextBox",
				"dijit.form.ValidationTextBox",
				"dijit.form.NumberTextBox",
				"dijit.form.CurrencyTextBox",
				"dojo.currency",
				"dijit.Dialog",
				"dojo.data.ItemFileWriteStore",
				"dojox.grid.Grid",
				"dojo.parser",
				"dojox.grid._data.model",


				"dojo.dnd.Source",
				"dojo.dnd.Moveable",
				"dojo.dnd.Mover",
				"dojo.dnd.move",
				"dojo.data.ItemFileReadStore",
				"dijit.form.ComboBox",
				"dijit.form.Button",


				...
				"dojo._base.html",
            ]
        }
    ]
            
    //prefixes: [
    //    [ "dijit", "../dijit" ],
    //    [ "dojox", "../dojox" ],
    //    [ "plugins", "../../plugins" ]
    //]
};







####
####2. REMOVED nls FILES HERE
####
####E:\0.5\html\dojo.1.2.2\dijit\nls
####
####NB: MOVE FILES FROM dijit-all_ar.js TO dijit-all_zh-tw.js TO A SAFE DIRECTORY
####
####LEAVE THESE FILES:
####
####common.js
####loading.js





3. RUN THE BUILD TO GENERATE THE LAYER FILE

CREATED OUTPUT DIRECTORY 

mkdir E:\0.5\html\builds\agua


RUN THE BUILD (TAKES A FEW MINS)

cd E:\0.5\html\dojo.1.4.2\util\buildscripts
build.bat profile=agua action=release

cd /data/agua/0.5/html/dojo.1.4.2/util/buildscripts
./build.sh build.bat profile=agua action=release

BOTH ON WINDOWS AND LINUX GIVES THE SAME ERROR:
	
	release:  Using profile: profiles/agua.profile.js
	release:  Using version number: 0.0.0.dev for the release.
	release:  Deleting: ../../release/dojo
	release:  Copying: ../../dojo to: ../../release/dojo/dojo
	release:  Copying: ../../dojo/../dijit to: ../../release/dojo/dijit
	release:  Copying: ../../dojo/../dojox to: ../../release/dojo/dojox
	release:  Copying: ../../dojo/../toonetown to: ../../release/dojo/toonetown
	release:   ********** Not Copied: ../../dojo/../toonetown
	release:  Copying: ../../dojo/../Agua to: ../../release/dojo/Agua
	release:   ********** Not Copied: ../../dojo/../Agua
	release:  Copying: ../../dojo/../includes to: ../../release/dojo/includes
	release:   ********** Not Copied: ../../dojo/../includes
	release:  Building dojo.js and layer files
	js: uncaught JavaScript runtime exception: TypeError: Cannot read property "dojo.foo" from undefined
	
	js: uncaught JavaScript runtime exception: TypeError: Cannot find function registerModulePath in object [object Object].







cd E:\0.5\html\dojo.1.4.2\util\buildscripts
java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release



java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.dojotookit.shrinksafe.Main build.js profile=agua action=release



CONTENTS OF build.sh SCRIPT:

	#!/bin/sh
	
	java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js "$@"
	
	# if you experience an "Out of Memory" error, you can increase it as follows:
	#java -Xms256m -Xmx256m -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main  build.js "$@"



RUN BUILD SCRIPT:

java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release


FAILS WITH ERROR 'Could not find the main class: org.mozilla.javascript.tools.shell.Main':

	E:\0.5\html\dojo.1.4.2\util\buildscripts>java -classpath ../shrinksafe/js.jar:..
	/shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js prof
	ile=agua action=release
	Exception in thread "main" java.lang.NoClassDefFoundError: org/mozilla/javascrip
	t/tools/shell/Main
	Caused by: java.lang.ClassNotFoundException: org.mozilla.javascript.tools.shell.
	Main
			at java.net.URLClassLoader$1.run(Unknown Source)
			at java.security.AccessController.doPrivileged(Native Method)
			at java.net.URLClassLoader.findClass(Unknown Source)
			at java.lang.ClassLoader.loadClass(Unknown Source)
			at sun.misc.Launcher$AppClassLoader.loadClass(Unknown Source)
			at java.lang.ClassLoader.loadClass(Unknown Source)
	Could not find the main class: org.mozilla.javascript.tools.shell.Main.  Program
	 will exit.


build.sh profile=agua action=release

GIVES 'Cannot read property "dojo.foo" from undefined' ERROR:
	
	E:\0.5\html\dojo.1.4.2\util\buildscripts>build.bat profile=agua action=release
	
	E:\0.5\html\dojo.1.4.2\util\buildscripts>java -classpath ../shrinksafe/js.jar;..
	/shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js prof
	ile=agua action=release
	release:  Using profile: profiles/agua.profile.js
	release:  Using version number: 0.0.0.dev for the release.
	release:  Deleting: ../../release/dojo
	release:  Copying: ../../dojo to: ../../release/dojo/dojo
	release:  Copying: ../../dojo/../dijit to: ../../release/dojo/dijit
	release:  Copying: ../../dojo/../dojox to: ../../release/dojo/dojox
	release:  Copying: ../../dojo/../toonetown to: ../../release/dojo/toonetown
	release:   ********** Not Copied: ../../dojo/../toonetown
	release:  Copying: ../../dojo/../Agua to: ../../release/dojo/Agua
	release:   ********** Not Copied: ../../dojo/../Agua
	release:  Copying: ../../dojo/../includes to: ../../release/dojo/includes
	release:   ********** Not Copied: ../../dojo/../includes
	release:  Building dojo.js and layer files
	js: uncaught JavaScript runtime exception: TypeError: Cannot read property "dojo
	.foo" from undefined
	
	js: uncaught JavaScript runtime exception: TypeError: Cannot find function regis
	terModulePath in object [object Object].


java -classpath ../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar  build.js profile="agua" action="release" version="0.5" cssOptimize=comments.keepLines releaseDir=../../../builds/agua/ > ..\..\..\builds\agua\agua-build-output.txt


java -jar ..\shrinksafe\custom_rhino.jar build.js profile="agua" action="release" version="0.5" cssOptimize=comments.keepLines releaseDir=../../../builds/agua/ > ..\..\..\builds\agua\agua-build-output.txt


NB: HAD TO DOWNLOAD custom_rhino.jar FROM

http://bugs.dojotoolkit.org/browser/trunk/buildscripts/lib/custom_rhino.jar?rev=5877

USING shrinksafe.jar DOESN'T WORK THE SAME AS USING custom_rhino.jar


E:\0.5\html\dojo.1.4.2\util\shrinksafe>java -jar ..\shrinksafe\shrinksafe.jar build.js profile="agua" action="release" version="0.5" cssOptimize=comments.keepLines releaseDir=../../../builds/agua/ > ..\..\..\builds\agua\agua-build-output.tx

js: Couldn't open file "build.js".
js: Couldn't open file "profile=agua".
js: Couldn't open file "action=release".
js: Couldn't open file "version=0.5".
js: Couldn't open file "cssOptimize=comments.keepLines".
js: Couldn't open file "releaseDir=../../../builds/agua/".






4. WE HAVE CREATED THIS FILE

E:\0.5\html\builds\agua\dojo\agua.js


SO NOW CALL IT FROM THE PAGE BY ADDING THESE LINES TO index.html




<script type="text/javascript" src="builds\aqwa04\dojo\aqwa.js"
	djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>


<script type="text/javascript" src="dojo.1.2.2/dijit/nls/en-us.js"></script>
<script type="text/javascript" src="dojo.1.2.2/dijit/nls/common.js"></script>

<script type="text/javascript" src="builds/plugins/dojo/plugins.js.uncompressed.js"></script>


5. PUT BACK THE en-us.js FILE INTO THE nls DIRECTORY

E:\0.4\html\dojo.1.2.2\dijit\nls




ET VOILA!



java -jar ..\shrinksafe\custom_rhino.jar build.js profile="aqwa04" action="release" version="0.4" cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt &> build_log14.txt

	...
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/wire/demos/TableContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/xml/tests/mail/mail.css

	release:  Interning strings for: ../../../builds/aqwa04/dojo/toonetown
	release:  Interning strings for: ../../../builds/aqwa04/dojo/includes
	release:  Interning strings for: ../../../builds/aqwa04/dojo/Aqwa
	release:  Build is in directory: ../../../builds/aqwa04/dojo
	Build time: 235.828 seconds


FULL BUILD OUTPUT:
(IN FILE E:\0.4\html\builds\aqwa04\aqwa04-build-output.txt)

	release:  Using profile: profiles/aqwa04.profile.js
	release:  Using version number: 0.4 for the release.
	release:  Deleting: ../../../builds/aqwa04/dojo
	release:  Copying: ../../dojo to: ../../../builds/aqwa04/dojo/dojo
	release:  Copying: ../../dojo/../plugins to: ../../../builds/aqwa04/dojo/plugins
	release:  Copying: ../../dojo/../dijit to: ../../../builds/aqwa04/dojo/dijit
	release:  Copying: ../../dojo/../dojox to: ../../../builds/aqwa04/dojo/dojox
	release:  Copying: ../../dojo/../toonetown to: ../../../builds/aqwa04/dojo/toonetown
	release:  Copying: ../../dojo/../includes to: ../../../builds/aqwa04/dojo/includes
	release:  Copying: ../../dojo/../Aqwa to: ../../../builds/aqwa04/dojo/Aqwa
	release:  Building dojo.js and layer files
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/lang.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/declare.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/connect.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/Deferred.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/json.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/array.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/Color.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/browser.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/window.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/event.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/html.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/NodeList.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/query.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/xhr.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/fx.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/dijit.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/focus.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/manager.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/place.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/AdapterRegistry.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/popup.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/window.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/scroll.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/sniff.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/typematic.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_base/wai.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/parser.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/date/stamp.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_Widget.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_Templated.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/string.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_Container.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/_LayoutWidget.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/_FormWidget.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/CheckBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/Button.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/ValidationTextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/i18n.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/TextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/Tooltip.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/ComboBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/data/util/simpleFetch.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/data/util/sorter.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/data/util/filter.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/Slider.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/move.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Mover.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/common.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/autoscroll.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Moveable.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/number.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/regexp.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/fx.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/Color.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/array.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/lang.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/connect.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/declare.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/html.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/FilteringSelect.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/NumberSpinner.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/_Spinner.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/NumberTextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/Editor.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_editor/RichText.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_editor/selection.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_editor/range.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_editor/html.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/Toolbar.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_editor/_Plugin.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_editor/plugins/EnterKeyHandling.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/DateTextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_Calendar.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/cldr/supplemental.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/date.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/date/locale.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/_DateTimeTextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/Textarea.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/CurrencyTextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/currency.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/cldr/monetary.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/Dialog.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/TimedMoveable.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/fx.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/ContentPane.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/html.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/Form.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/data/ItemFileWriteStore.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/data/ItemFileReadStore.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/Grid.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/Grid.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/VirtualGrid.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/lib.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/scroller.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/view.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/builder.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/drag.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/views.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/layout.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/cell.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/rows.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/focus.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/selection.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/edit.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/rowbar.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/publicEvents.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/model.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/fields.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/editors.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/dijitEditors.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/form/TimeTextBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/_TimePicker.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Source.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Selector.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Container.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Manager.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/dnd/Avatar.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/layout/FloatingPane.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/layout/ContentPane.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/html/_base.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/layout/ResizeHandle.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/TitlePane.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/TabContainer.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/StackContainer.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/Menu.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/BorderContainer.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/cookie.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/LayoutContainer.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/layout/ExpandoPane.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/AccordionContainer.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/layout/SplitContainer.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/widget/FisheyeLite.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/fx/easing.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/timing/Sequence.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/widget/Dialog.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/fx.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/fx/_base.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/widget/RollingList.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/html/metrics.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/io/iframe.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/widget/FileInput.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/data/FileStore.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/widget/FileInputAuto.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/widget/FilePicker.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/_base/json.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/form/FileInput.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/form/FileInputAuto.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/form/FileUploader.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/embed/Flash.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/html/styles.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/InlineEditBox.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/DataGrid.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_Grid.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/util.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_Scroller.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_Layout.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/cells.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/cells/_base.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_RowSelector.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_View.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_ViewManager.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_RowManager.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_FocusManager.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_EditManager.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/Selection.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/_Events.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/grid/DataSelection.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/ColorPalette.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/colors.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dijit/Tree.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/rpc/Service.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojo/io/script.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/timing.js
	release:  buildUtil. load (uri): ./../../../builds/aqwa04/dojo/dojox/timing/_base.js
	release:  Interning strings for file: ../../../builds/aqwa04/dojo/dojo/dojo.js
	release:  Optimizing (shrinksafe) file: ../../../builds/aqwa04/dojo/dojo/dojo.js
	release:  Interning strings for file: ../../../builds/aqwa04/dojo/dojo/../aqwa.js
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojo/../aqwa.js.uncompressed.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/Button.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/DropDownButton.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ComboButton.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/CheckBox.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/TextBox.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/Tooltip.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ValidationTextBox.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ComboBox.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/HorizontalSlider.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/VerticalSlider.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/Spinner.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/Calendar.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/Dialog.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/TooltipDialog.html
	release:      ../../../builds/aqwa04/dojo/dojox/grid/compat/resources/GridView.html
	release:      ../../../builds/aqwa04/dojo/dojox/grid/compat/resources/VirtualGrid.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/TimePicker.html
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/FloatingPane.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/TitlePane.html
	release:      ../../../builds/aqwa04/dojo/dijit/layout/templates/TabContainer.html
	release:      ../../../builds/aqwa04/dojo/dijit/layout/templates/_TabButton.html
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/ExpandoPane.html
	release:      ../../../builds/aqwa04/dojo/dijit/layout/templates/AccordionPane.html
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Dialog/Dialog.html
	release:      ../../../builds/aqwa04/dojo/dojox/widget/FilePicker/_FileInfoPane.html
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/FileInput.html
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/FileInputAuto.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/InlineEditBox.html
	release:      ../../../builds/aqwa04/dojo/dojox/grid/resources/View.html
	release:      ../../../builds/aqwa04/dojo/dojox/grid/resources/_Grid.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/ColorPalette.html
	release:      ../../../builds/aqwa04/dojo/dijit/_tree/Node.html
	release:      ../../../builds/aqwa04/dojo/dijit/_tree/Tree.html
	release:  Optimizing (shrinksafe) file: ../../../builds/aqwa04/dojo/dojo/../aqwa.js
	release:  Files baked into this build:
	
	dojo.js:
	./jslib/dojoGuardStart.jsfrag
	./../../dojo/_base/_loader/bootstrap.js
	./../../dojo/_base/_loader/loader.js
	./../../dojo/_base/_loader/hostenv_browser.js
	./../../../builds/aqwa04/dojo/dojo/_base/lang.js
	./../../../builds/aqwa04/dojo/dojo/_base/declare.js
	./../../../builds/aqwa04/dojo/dojo/_base/connect.js
	./../../../builds/aqwa04/dojo/dojo/_base/Deferred.js
	./../../../builds/aqwa04/dojo/dojo/_base/json.js
	./../../../builds/aqwa04/dojo/dojo/_base/array.js
	./../../../builds/aqwa04/dojo/dojo/_base/Color.js
	./../../../builds/aqwa04/dojo/dojo/_base.js
	./../../../builds/aqwa04/dojo/dojo/_base/window.js
	./../../../builds/aqwa04/dojo/dojo/_base/event.js
	./../../../builds/aqwa04/dojo/dojo/_base/html.js
	./../../../builds/aqwa04/dojo/dojo/_base/NodeList.js
	./../../../builds/aqwa04/dojo/dojo/_base/query.js
	./../../../builds/aqwa04/dojo/dojo/_base/xhr.js
	./../../../builds/aqwa04/dojo/dojo/_base/fx.js
	./../../../builds/aqwa04/dojo/dojo/_base/browser.js
	./jslib/dojoGuardEnd.jsfrag
	
	../aqwa.js:
	./../../../builds/aqwa04/dojo/dijit/_base/focus.js
	./../../../builds/aqwa04/dojo/dijit/_base/manager.js
	./../../../builds/aqwa04/dojo/dojo/AdapterRegistry.js
	./../../../builds/aqwa04/dojo/dijit/_base/place.js
	./../../../builds/aqwa04/dojo/dijit/_base/window.js
	./../../../builds/aqwa04/dojo/dijit/_base/popup.js
	./../../../builds/aqwa04/dojo/dijit/_base/scroll.js
	./../../../builds/aqwa04/dojo/dijit/_base/sniff.js
	./../../../builds/aqwa04/dojo/dijit/_base/typematic.js
	./../../../builds/aqwa04/dojo/dijit/_base/wai.js
	./../../../builds/aqwa04/dojo/dijit/_base.js
	./../../../builds/aqwa04/dojo/dojo/date/stamp.js
	./../../../builds/aqwa04/dojo/dojo/parser.js
	./../../../builds/aqwa04/dojo/dijit/_Widget.js
	./../../../builds/aqwa04/dojo/dojo/string.js
	./../../../builds/aqwa04/dojo/dijit/_Templated.js
	./../../../builds/aqwa04/dojo/dijit/_Container.js
	./../../../builds/aqwa04/dojo/dijit/layout/_LayoutWidget.js
	./../../../builds/aqwa04/dojo/dijit/form/_FormWidget.js
	./../../../builds/aqwa04/dojo/dijit/dijit.js
	./../../../builds/aqwa04/dojo/dijit/form/Button.js
	./../../../builds/aqwa04/dojo/dijit/form/CheckBox.js
	./../../../builds/aqwa04/dojo/dojo/i18n.js
	./../../../builds/aqwa04/dojo/dijit/form/TextBox.js
	./../../../builds/aqwa04/dojo/dijit/Tooltip.js
	./../../../builds/aqwa04/dojo/dijit/form/ValidationTextBox.js
	./../../../builds/aqwa04/dojo/dojo/data/util/sorter.js
	./../../../builds/aqwa04/dojo/dojo/data/util/simpleFetch.js
	./../../../builds/aqwa04/dojo/dojo/data/util/filter.js
	./../../../builds/aqwa04/dojo/dijit/form/ComboBox.js
	./../../../builds/aqwa04/dojo/dojo/dnd/common.js
	./../../../builds/aqwa04/dojo/dojo/dnd/autoscroll.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Mover.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Moveable.js
	./../../../builds/aqwa04/dojo/dojo/dnd/move.js
	./../../../builds/aqwa04/dojo/dojo/regexp.js
	./../../../builds/aqwa04/dojo/dojo/number.js
	./../../../builds/aqwa04/dojo/dijit/form/Slider.js
	./../../../builds/aqwa04/dojo/dijit/form/FilteringSelect.js
	./../../../builds/aqwa04/dojo/dijit/form/_Spinner.js
	./../../../builds/aqwa04/dojo/dijit/form/NumberTextBox.js
	./../../../builds/aqwa04/dojo/dijit/form/NumberSpinner.js
	./../../../builds/aqwa04/dojo/dijit/_editor/selection.js
	./../../../builds/aqwa04/dojo/dijit/_editor/range.js
	./../../../builds/aqwa04/dojo/dijit/_editor/html.js
	./../../../builds/aqwa04/dojo/dijit/_editor/RichText.js
	./../../../builds/aqwa04/dojo/dijit/Toolbar.js
	./../../../builds/aqwa04/dojo/dijit/_editor/_Plugin.js
	./../../../builds/aqwa04/dojo/dijit/_editor/plugins/EnterKeyHandling.js
	./../../../builds/aqwa04/dojo/dijit/Editor.js
	./../../../builds/aqwa04/dojo/dojo/cldr/supplemental.js
	./../../../builds/aqwa04/dojo/dojo/date.js
	./../../../builds/aqwa04/dojo/dojo/date/locale.js
	./../../../builds/aqwa04/dojo/dijit/_Calendar.js
	./../../../builds/aqwa04/dojo/dijit/form/_DateTimeTextBox.js
	./../../../builds/aqwa04/dojo/dijit/form/DateTextBox.js
	./../../../builds/aqwa04/dojo/dijit/form/Textarea.js
	./../../../builds/aqwa04/dojo/dojo/cldr/monetary.js
	./../../../builds/aqwa04/dojo/dojo/currency.js
	./../../../builds/aqwa04/dojo/dijit/form/CurrencyTextBox.js
	./../../../builds/aqwa04/dojo/dojo/dnd/TimedMoveable.js
	./../../../builds/aqwa04/dojo/dojo/fx.js
	./../../../builds/aqwa04/dojo/dojo/html.js
	./../../../builds/aqwa04/dojo/dijit/layout/ContentPane.js
	./../../../builds/aqwa04/dojo/dijit/form/Form.js
	./../../../builds/aqwa04/dojo/dijit/Dialog.js
	./../../../builds/aqwa04/dojo/dojo/data/ItemFileReadStore.js
	./../../../builds/aqwa04/dojo/dojo/data/ItemFileWriteStore.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/lib.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/scroller.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/drag.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/builder.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/view.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/views.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/cell.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/layout.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/rows.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/focus.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/selection.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/edit.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/rowbar.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/publicEvents.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/VirtualGrid.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/fields.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/model.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/editors.js
	./../../../builds/aqwa04/dojo/dijit/_TimePicker.js
	./../../../builds/aqwa04/dojo/dijit/form/TimeTextBox.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/_data/dijitEditors.js
	./../../../builds/aqwa04/dojo/dojox/grid/compat/Grid.js
	./../../../builds/aqwa04/dojo/dojox/grid/Grid.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Container.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Selector.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Avatar.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Manager.js
	./../../../builds/aqwa04/dojo/dojo/dnd/Source.js
	./../../../builds/aqwa04/dojo/dojox/html/_base.js
	./../../../builds/aqwa04/dojo/dojox/layout/ContentPane.js
	./../../../builds/aqwa04/dojo/dojox/layout/ResizeHandle.js
	./../../../builds/aqwa04/dojo/dojox/layout/FloatingPane.js
	./../../../builds/aqwa04/dojo/dijit/TitlePane.js
	./../../../builds/aqwa04/dojo/dijit/Menu.js
	./../../../builds/aqwa04/dojo/dijit/layout/StackContainer.js
	./../../../builds/aqwa04/dojo/dijit/layout/TabContainer.js
	./../../../builds/aqwa04/dojo/dojo/cookie.js
	./../../../builds/aqwa04/dojo/dijit/layout/BorderContainer.js
	./../../../builds/aqwa04/dojo/dijit/layout/LayoutContainer.js
	./../../../builds/aqwa04/dojo/dojox/layout/ExpandoPane.js
	./../../../builds/aqwa04/dojo/dijit/layout/AccordionContainer.js
	./../../../builds/aqwa04/dojo/dijit/layout/SplitContainer.js
	./../../../builds/aqwa04/dojo/dojo/fx/easing.js
	./../../../builds/aqwa04/dojo/dojox/widget/FisheyeLite.js
	./../../../builds/aqwa04/dojo/dojox/timing/Sequence.js
	./../../../builds/aqwa04/dojo/dojox/fx/_base.js
	./../../../builds/aqwa04/dojo/dojox/fx.js
	./../../../builds/aqwa04/dojo/dojox/widget/Dialog.js
	./../../../builds/aqwa04/dojo/dojox/html/metrics.js
	./../../../builds/aqwa04/dojo/dojox/widget/RollingList.js
	./../../../builds/aqwa04/dojo/dojo/io/iframe.js
	./../../../builds/aqwa04/dojo/dojox/widget/FileInput.js
	./../../../builds/aqwa04/dojo/dojox/data/FileStore.js
	./../../../builds/aqwa04/dojo/dojox/widget/FileInputAuto.js
	./../../../builds/aqwa04/dojo/dojox/widget/FilePicker.js
	./../../../builds/aqwa04/dojo/dojox/form/FileInput.js
	./../../../builds/aqwa04/dojo/dojox/form/FileInputAuto.js
	./../../../builds/aqwa04/dojo/dojox/embed/Flash.js
	./../../../builds/aqwa04/dojo/dojox/html/styles.js
	./../../../builds/aqwa04/dojo/dojox/form/FileUploader.js
	./../../../builds/aqwa04/dojo/dijit/InlineEditBox.js
	./../../../builds/aqwa04/dojo/dojox/grid/util.js
	./../../../builds/aqwa04/dojo/dojox/grid/_Scroller.js
	./../../../builds/aqwa04/dojo/dojox/grid/cells/_base.js
	./../../../builds/aqwa04/dojo/dojox/grid/cells.js
	./../../../builds/aqwa04/dojo/dojox/grid/_View.js
	./../../../builds/aqwa04/dojo/dojox/grid/_RowSelector.js
	./../../../builds/aqwa04/dojo/dojox/grid/_Layout.js
	./../../../builds/aqwa04/dojo/dojox/grid/_ViewManager.js
	./../../../builds/aqwa04/dojo/dojox/grid/_RowManager.js
	./../../../builds/aqwa04/dojo/dojox/grid/_FocusManager.js
	./../../../builds/aqwa04/dojo/dojox/grid/_EditManager.js
	./../../../builds/aqwa04/dojo/dojox/grid/Selection.js
	./../../../builds/aqwa04/dojo/dojox/grid/_Events.js
	./../../../builds/aqwa04/dojo/dojox/grid/_Grid.js
	./../../../builds/aqwa04/dojo/dojox/grid/DataSelection.js
	./../../../builds/aqwa04/dojo/dojox/grid/DataGrid.js
	./../../../builds/aqwa04/dojo/dojo/colors.js
	./../../../builds/aqwa04/dojo/dijit/ColorPalette.js
	./../../../builds/aqwa04/dojo/dijit/Tree.js
	./../../../builds/aqwa04/dojo/dojox/rpc/Service.js
	./../../../builds/aqwa04/dojo/dojo/io/script.js
	./../../../builds/aqwa04/dojo/dojox/timing/_base.js
	./../../../builds/aqwa04/dojo/dojox/timing.js
	
	release:  Interning strings for: ../../../builds/aqwa04/dojo/dojo
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojo/resources/dnd.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojo/resources/dojo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojo/tests/dnd/dndDefault.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojo/_firebug/firebug.css
	release:  Interning strings for: ../../../builds/aqwa04/dojo/plugins
	release:  Interning strings for: ../../../builds/aqwa04/dojo/dijit
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/ColorPalette.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/ColorPalette.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/Dialog.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/Dialog.html
	release:      ../../../builds/aqwa04/dojo/dijit/templates/TooltipDialog.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/Button.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/Button.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/DropDownButton.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ComboButton.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/CheckBox.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/CheckBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/ComboBox.added.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ComboBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/ComboBox.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ComboBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/ComboBox.orig.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ComboBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/Slider.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/HorizontalSlider.html
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/VerticalSlider.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/TextBox.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/TextBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/ValidationTextBox.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/ValidationTextBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/form/_Spinner.js
	release:      ../../../builds/aqwa04/dojo/dijit/form/templates/Spinner.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/InlineEditBox.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/InlineEditBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/layout/AccordionContainer.js
	release:      ../../../builds/aqwa04/dojo/dijit/layout/templates/AccordionPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/layout/TabContainer.js
	release:      ../../../builds/aqwa04/dojo/dijit/layout/templates/TabContainer.html
	release:      ../../../builds/aqwa04/dojo/dijit/layout/templates/_TabButton.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/ProgressBar.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/ProgressBar.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/TitlePane.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/TitlePane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/Tooltip.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/Tooltip.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/Tree.js
	release:      ../../../builds/aqwa04/dojo/dijit/_tree/Node.html
	release:      ../../../builds/aqwa04/dojo/dijit/_tree/Tree.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/_Calendar.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/Calendar.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dijit/_TimePicker.js
	release:      ../../../builds/aqwa04/dojo/dijit/templates/TimePicker.html
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/tests/css/dijitTests.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/tests/_editor/test_richtext.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Calendar_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/ColorPalette.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Dialog_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Editor.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Editor_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Button.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Button_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Checkbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/ComboBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Common_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/RadioButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Slider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/Slider_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/form/TimeTextBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/AccordionContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/AccordionContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/BorderContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/ContentPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/SplitContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/TabContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/layout/TabContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Menu.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Menu_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/ProgressBar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/soria.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/soria_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/TimePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/TitlePane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/TitlePane_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Toolbar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Tree.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/aqwa/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/dijit.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/dijit_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Calendar_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/ColorPalette.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Dialog_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Editor.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Editor_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Button.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Button_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Checkbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/ComboBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Common_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/RadioButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Slider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/Slider_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/form/TimeTextBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/AccordionContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/AccordionContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/BorderContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/ContentPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/SplitContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/TabContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/layout/TabContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Menu.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Menu_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/nihilo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/nihilo_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/ProgressBar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/TimePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/TitlePane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/TitlePane_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Toolbar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Tree.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/nihilo/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Calendar_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/ColorPalette.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Dialog_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Editor.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Editor_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Button.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Button_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Checkbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/ComboBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Common_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/RadioButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Slider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/Slider_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/form/TimeTextBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/AccordionContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/AccordionContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/BorderContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/ContentPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/SplitContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/TabContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/layout/TabContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Menu.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Menu_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/ProgressBar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/soria.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/soria_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/TimePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/TitlePane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/TitlePane_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Toolbar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Tree.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/soria/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Calendar_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/ColorPalette.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Dialog_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Editor.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Editor_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/Button.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/Checkbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/Common_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/RadioButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/Slider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/form/Slider_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/layout/AccordionContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/layout/BorderContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/layout/ContentPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/layout/SplitContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/layout/TabContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/layout/TabContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Menu.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Menu_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/ProgressBar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/TimePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/TitlePane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/TitlePane_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Toolbar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Tree.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/tundra/tundra.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Calendar_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/ColorPalette.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Dialog_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Editor.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Editor_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Button.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Button_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Checkbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/ComboBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Common_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/RadioButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Slider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/Slider_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/form/TimeTextBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/AccordionContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/AccordionContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/BorderContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/ContentPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/SplitContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/TabContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/layout/TabContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Menu.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Menu_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/ProgressBar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/TimePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/TitlePane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/TitlePane_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Toolbar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Tree.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/UMtheme.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme1/UMtheme_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Calendar_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/ColorPalette.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Dialog_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/dojoextended.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Editor.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Editor_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Button.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Button_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Checkbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/ComboBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Common.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Common_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/RadioButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Slider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/Slider_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/form/TimeTextBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/AccordionContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/AccordionContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/BorderContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/ContentPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/SplitContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/TabContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/layout/TabContainer_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Menu.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Menu_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/ProgressBar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/TimePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/TitlePane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/TitlePane_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Toolbar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Tree.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/UMtheme.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dijit/themes/UMtheme2/UMtheme_rtl.css
	release:  Interning strings for: ../../../builds/aqwa04/dojo/dojox
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/av/widget/PlayButton.js
	release:      ../../../builds/aqwa04/dojo/dojox/av/widget/resources/PlayButton.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/av/widget/Player.js
	release:      ../../../builds/aqwa04/dojo/dojox/av/widget/resources/Player.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/av/widget/ProgressSlider.js
	release:      ../../../builds/aqwa04/dojo/dojox/av/widget/resources/ProgressSlider.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/av/widget/Status.js
	release:      ../../../builds/aqwa04/dojo/dojox/av/widget/resources/Status.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/av/widget/VolumeButton.js
	release:      ../../../builds/aqwa04/dojo/dojox/av/widget/resources/VolumeButton.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/FileView.js
	release:      ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/templates/FileView.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/FlickrViewList.js
	release:      ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/templates/FlickrViewList.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/PicasaView.js
	release:      ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/templates/PicasaView.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/PicasaViewList.js
	release:      ../../../builds/aqwa04/dojo/dojox/data/demos/widgets/templates/PicasaViewList.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/editor/plugins/TablePlugins.js
	release:      ../../../builds/aqwa04/dojo/dojox/editor/plugins/resources/insertTable.html
	release:      ../../../builds/aqwa04/dojo/dojox/editor/plugins/resources/modifyTable.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/CheckedMultiSelect.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/_CheckedMultiSelectItem.html
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/CheckedMultiSelect.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/DropDownSelect.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/DropDownSelect.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/FileInput.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/FileInput.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/FileInputAuto.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/FileInputAuto.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/FilePickerTextBox.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/FilePickerTextBox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/PasswordValidator.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/PasswordValidator.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/form/RangeSlider.js
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/HorizontalRangeSlider.html
	release:      ../../../builds/aqwa04/dojo/dojox/form/resources/VerticalRangeSlider.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/grid/compat/VirtualGrid.js
	release:      ../../../builds/aqwa04/dojo/dojox/grid/compat/resources/VirtualGrid.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/view.js
	release:      ../../../builds/aqwa04/dojo/dojox/grid/compat/resources/GridView.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/grid/_Grid.js
	release:      ../../../builds/aqwa04/dojo/dojox/grid/resources/_Grid.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/grid/_View.js
	release:      ../../../builds/aqwa04/dojo/dojox/grid/resources/View.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/image/Gallery.js
	release:      ../../../builds/aqwa04/dojo/dojox/image/resources/Gallery.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/image/Lightbox.js
	release:      ../../../builds/aqwa04/dojo/dojox/image/resources/Lightbox.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/image/SlideShow.js
	release:      ../../../builds/aqwa04/dojo/dojox/image/resources/SlideShow.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/image/ThumbnailPicker.js
	release:      ../../../builds/aqwa04/dojo/dojox/image/resources/ThumbnailPicker.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/layout/ExpandoPane.bkp.js
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/ExpandoPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/layout/ExpandoPane.js
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/ExpandoPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/layout/FloatingPane.js
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/FloatingPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/layout/GridContainer.js
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/GridContainer.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/layout/ScrollPane.js
	release:      ../../../builds/aqwa04/dojo/dojox/layout/resources/ScrollPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/presentation/_base.js
	release:      ../../../builds/aqwa04/dojo/dojox/presentation/resources/Show.html
	release:      ../../../builds/aqwa04/dojo/dojox/presentation/resources/Slide.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/Calendar.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Calendar/Calendar.html
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Calendar/CalendarDay.html
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Calendar/CalendarMonth.html
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Calendar/CalendarYear.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/ColorPicker.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/ColorPicker/ColorPicker.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/Dialog-add.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Dialog/Dialog.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/Dialog-orig.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Dialog/Dialog.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/Dialog.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Dialog/Dialog.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/DocTester.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/DocTester/DocTester.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/FilePicker.bkp.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/FilePicker/_FileInfoPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/FilePicker.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/FilePicker/_FileInfoPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/FilePicker.layout8-7.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/FilePicker/_FileInfoPane.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/Pager.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Pager/Pager.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/SortList.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/SortList/SortList.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/widget/Wizard.js
	release:      ../../../builds/aqwa04/dojo/dojox/widget/Wizard/Wizard.html
	release:  Interning strings for : ../../../builds/aqwa04/dojo/dojox/xmpp/widget/ChatSession.js
	release:      ../../../builds/aqwa04/dojo/dojox/xmpp/widget/templates/ChatSession.html
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/av/widget/resources/Player.css
	release:  ../../../builds/aqwa04/dojo/dojox/av/widget/resources/Player.css
	  Cannot inline css import, skipping: ../../../dojo/resources/dojo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/data/demos/picasaDemo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/data/tests/stores/test1.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/data/tests/stores/test2.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/editor/plugins/resources/editorPlugins.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/BusyButton.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/CheckedMultiSelect.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/DropDownSelect.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/FileInput.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/FilePickerTextBox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/RangeSlider.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/form/resources/Rating.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/fx/tests/_animation.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/Grid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/Grid_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/nihiloGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/soriaGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/compat/_grid/tundraGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/resources/Grid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/resources/Grid_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/resources/nihiloGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/resources/soriaGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/resources/tundraGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/_grid/Grid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/_grid/Grid_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/_grid/nihiloGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/_grid/soriaGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/grid/_grid/tundraGrid.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/highlight.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/autumn.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/borland.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/colorful.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/default.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/emacs.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/friendly.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/fruity.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/manni.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/murphy.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/native.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/pastie.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/perldoc.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/highlight/resources/pygments/trac.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/Badge.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/Gallery.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/image.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/Lightbox.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/Magnifier.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/SlideShow.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/image/resources/ThumbnailPicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/DndGridContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/ExpandoPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/FloatingPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/GridContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/RadioGroup.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/ResizeHandle.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/RotatorContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/ScrollPane.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/resources/ToggleSplitter.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/layout/tests/_expando.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/off/resources/offline-widget.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/presentation/resources/Show.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/sketch/resources/sketch.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/Calendar/Calendar.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/ColorPicker/ColorPicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/Dialog/Dialog.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/DocTester/DocTester.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/FilePicker/FilePicker.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/FisheyeList/FisheyeList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/Loader/Loader.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/Pager/Pager.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/RollingList/RollingList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/SortList/SortList.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/Toaster/Toaster.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/widget/Wizard/Wizard.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/wire/demos/markup/flickrDemo.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/wire/demos/TableContainer.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/aqwa04/dojo/dojox/xml/tests/mail/mail.css
	release:  Interning strings for: ../../../builds/aqwa04/dojo/toonetown
	release:  Interning strings for: ../../../builds/aqwa04/dojo/includes
	release:  Interning strings for: ../../../builds/aqwa04/dojo/Aqwa
	release:  Build is in directory: ../../../builds/aqwa04/dojo
	Build time: 235.828 seconds


</entry>


