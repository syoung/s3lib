agua.build.archive.1

<entry [Sat Feb 13 01:48:16 EST 2010] BUILT **CLEAN** AQWA 0.4>

1. RAN comment.pl TO REMOVE ALL COMMENTS IN ALL PLUGINS

FIRST, BACKED UP plugins TO

E:\0.4\html\plugins.100213.bkp


THEN GO PLUGIN-BY-PLUGIN, CLEANING WITH comment.pl AND CHECKING TO SEE IF THERE ARE ANY LOAD OR
FUNCTIONALITY PROBLEMS (OF COURSE, RUNNING THE NON-COMPRESSED VERSION)


perl E:/0.4/bin/scripts/comment.pl --inputdir E:\0.4\html\plugins\admin --outputdir E:\0.4\html\plugins\admin --action clean --type js --recursive 


perl E:/0.4/bin/scripts/comment.pl \
--inputdir E:\0.4\html\plugins\admin \
--outputdir E:\0.4\html\plugins\admin \
--action clean \
--type js \
--recursive 


</entry>
<entry [Sat Feb 13 01:48:16 EST 2010] BUILT DIRTY AQWA 0.4 LAYER FILE>


1. RAN buildConfig.pl

perl buildConfig.pl --inputdir E:\0.4\html\plugins --outputfile E:\0.4\html\dojo.1.2.2\util\buildscripts\profiles\aqwa04.profile.js --name "../aqwa.js"


2. REMOVED nls FILES HERE

E:\0.4\html\dojo.1.2.2\dijit\nls

NB: MOVE FILES FROM dijit-all_ar.js TO dijit-all_zh-tw.js TO A SAFE DIRECTORY

LEAVE THESE FILES:

common.js
loading.js


3. BUILT LAYER FILE

CREATED OUTPUT DIRECTORY 

mkdir E:\0.4\html\builds\aqwa04

RUN THE BUILD (TAKES A FEW MINS)

cd E:\0.4\html\dojo.1.2.2\util\buildscripts


4. WE HAVE CREATED THIS FILE

E:\0.4\html\builds\aqwa04\dojo\aqwa.js


SO NOW CALL IT FROM THE PAGE BY ADDING THESE LINES TO index.html


<script type="text/javascript" src="builds\aqwa04\dojo\aqwa.js"
	djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>


<script type="text/javascript" src="dojo.1.2.2/dijit/nls/en-us.js"></script>
<script type="text/javascript" src="dojo.1.2.2/dijit/nls/common.js"></script>

<script type="text/javascript" src="builds/plugins/dojo/plugins.js.uncompressed.js"></script>


5. PUT BACK THE en-us.js FILE INTO THE nls DIRECTORY

E:\0.4\html\dojo.1.2.2\dijit\nls




ET VOILA!



java -jar ..\shrinksafe\custom_rhino.jar build.js profile="aqwa04" action="release" version="0.4" cssOptimize=comments.keepLines releaseDir=../../../builds/aqwa04/ > ..\..\..\builds\aqwa04\aqwa04-build-output.txt

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

<entry [Tue Feb  9 21:14:50 EST 2010] CHECK GROUP QUOTA ON KRONOS>

You can check your disk usage status by 'mmlsquota -g GROUPNAME'.

</entry>

<entry [Tue Tues 2 14:32:03 PST 2010] CREATED saveDb.pl TO DUMP MYSQL DATABASE TO TSV FILE>

ON WINDOWS:

perl saveDb.pl --db aqwa --outputdir E:/0.4/bin/sql/04

ON LINUX:


/data/aqwa/0.4/bin/scripts/saveDb.pl --db aqwa --outputdir /data/aqwa/0.4/bin/sql/04



</entry>





<entry [Wed Mar 11 16:54:00 EDT 2009] BUILD 7 (AS BUILD 2 BUT WITH UPDATED 0.2.5 CODE)>

1. CREATE BUILD.PROFILE.JS FILE

E.G.: C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts\profiles\build7.profile.js

dependencies ={
    layers:  [
        {
        name: "../bioptic.js",
            dependencies: [
                "plugins.admin.Controller",
                "plugins.projects.Controller",
                "plugins.report.Controller",
                "plugins.workflow.Controller",
                "plugins.view.Controller"
            ]
        }
    ],

    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "plugins", "../../plugins" ]
    ]
};


2. CREATE THE OUTPUT DIRECTORY FOR YOUR BUILD

mkdir C:\DATA\base\html\Bioptic0.2.5\html\build7


3. RUN THE BUILD (TAKES ~2 MINS)

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="build7" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build7/ > ..\..\..\build7\build7-output.txt

    OK

</entry>
<entry [Wed Mar 11 16:04:00 EDT 2009] FIXED SQLITED ERROR: DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once>

# NB: C CODE TO GET RID OF THIS ERROR: DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once: possible typo at C:/Perl/lib/DynaLoader.pm line 225.
#
# if ( sv = get_sv("DBD::SQLite::sqlite_version", TRUE | GV_ADDMULTI) );


</entry>
<entry [Tue Mar 10 13:04:00 EDT 2009] ERROR USING bioptic.js: mixin #undefined is null>

PROBLEM:

require COMPRESSED bioptic.js FILE IN HTML WORKS BUT...:
    
    <script type="text/javascript" src="dojo/dojo/dojo.js"
        djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>    
    <script type="text/javascript" src="dojo/dojo/bioptic.js"></script>    
    <script type="text/javascript">    
        
        // LOAD BIOPTIC
        dojo.require("bioptic");
        
        var cgiurl = "../../../cgi-bin/ngs/Bioptic0.2.5/";
        // REGISTER module path FOR PLUGINS
        dojo.registerModulePath("plugins","../../plugins");	        
        // LOAD PLUGINS
        dojo.require("plugins.core.PluginManager");
        //console.log("++++ index.html After load PluginManager");    
    </script>

... GET FAILED LOADING ERROR:

failed loading dojo/dojo/../bioptic.js with error: plugins.project.FileManager: mixin #undefined is null


DIAGNOSIS:


1. INSIDE bioptic.js THE FileManager MODULE IS DEFINED AS:

	dojo.declare( "plugins.project.FileManager",
		[ plugins.core.WidgetFramework, plugins.project.Project ],
	{


2. The error disappears if I remove either of the 'plugins.core.WidgetFramework' and 'plugins.project.Project'

(Instead, I get a new error:

    Error: Could not load 'dojo.nls._en-us'; last tried './nls/_en-us.js')
    
    Solution: Comment out 'requireLocalization' line on line 14 of plugins/project/FileDrag.js
    
    //dojo.requireLocalization("dojox.widget", "FileDrag", null, "");
)
    

3. Found error in bioptic.profile.js of build2:

           dependencies: [
                "plugins.admin.Controller",
                "plugins.projects.Controller",
 
    SHOULD READ 'project' NOT 'projects'.
 


SOLUTION:
        

Corrected profile, saved as 'build5.profile.js' and ran as build5:


RUN BUILD 5 WITH CSS OPTIMISATION
=================================

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="build5" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build5/ > ..\..\..\build5\build5-output.txt

OK


BUT BUILD 5 SEEMS TO BE MISSING THE dijit.nls.common FILE (dijit/nls/common.js).

RUN BUILD 6 WITH dijit.nls.common
=================================


dependencies ={
    layers:  [
        {
        name: "../bioptic.js",
            dependencies: [
                "dijit.nls.common",
                "plugins.admin.Controller",
                "plugins.project.Controller",
                "plugins.report.Controller",
                "plugins.workflow.Controller",
                "plugins.view.Controller"
            ]
        }
    ],
    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "plugins", "../../plugins" ]
    ]
};



C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts>

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="build6" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build6/ > ..\..\..\build6\build6-output.txt


BUT STILL GET ERROR:

[Exception... "'Error: Bundle not found: common in dijit , locale=en-us' when calling method: [nsIDOMEventListener::handleEvent]" nsresult: "0x8057001c (NS_ERROR_XPC_JS_THREW_JS_OBJECT)" location: "<unknown>" data: no]


WHERE dijit.common _IS_ REQUIRED

mmmmmmmmmmmmmmmmmmmmmmmm dojo.i18n.getLocalization
mmmmmmmmmmmmmmmmmmmmmmmm bundle: 1


WHERE dijit.common IS _NOT_ REQUIRED

mmmmmmmmmmmmmmmmmmmmmmmm dojo.i18n.getLocalization
mmmmmmmmmmmmmmmmmmmmmmmm bundle: undefined


LOOKS LIKE IT ONLY DOESN'T THROW AN ERROR IF buffer: {}, I.E., dijit.common IS INCLUDED IN AND REQUIRED IN THE bioptic.js FILE

mmmmmmmmmmmmmmmmmmmmmmmm dojo.i18n.getLocalization
mmmmmmmmmmmmmmmmmmmmmmmm bundle: undefined








</entry>

<entry [Mon Mar 09 23:12:00 EST 2008] 5-MINUTE Custom Build>

http://www.dojotoolkit.org/2008/06/04/5-minute-custom-build


1. CREATE 'includes.js' FILE FROM 'require' STATEMENTS IN PLUGINS

cd /var/www/html/ngs/Bioptic0.2.5/plugins
echo 'dojo.provide("includes.js");' > includes.js 
grep "^dojo.require" -R  * | sort | uniq >> includes.js

head plugins.js
    dojo.provide("includes.js");
    admin/Admin.js:dojo.require("dijit.form.Button");
    admin/Admin.js:dojo.require("dijit.form.ComboBox");
    admin/Admin.js:dojo.require("dojo.data.ItemFileReadStore");
    admin/Admin.js:dojo.require("dojo.dnd.move");
    admin/Admin.js:dojo.require("dojo.dnd.Moveable");
    admin/Admin.js:dojo.require("dojo.dnd.Mover");
    admin/Admin.js:dojo.require("dojo.dnd.Source"); // Source & Target
    admin/Admin.js:dojo.require("dojox.widget.FisheyeLite");
    admin/Admin.js:dojo.require("plugins.core.WidgetFramework");
    admin/Controller.js:dojo.require("plugins.admin.Admin");



2. Source the includes file from your html page:

<script type="text/javascript" src="includes.js"></script>

This won't change anything right now, but it gets us prepared for later on. 



3. Next we need to create a profile so the build system knows what to look for.
We'll call it my.profile.js:

dependencies = {
    layers: [
        {
            name: "../mystuff/includes.js",
            dependencies: [
                "mystuff.includes"
            ]
        }
    ],
    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "mystuff", "../mystuff"   ]
    ]
}

We create one layer, with the name ../mystuff/includes.js. The path is relative to
the dojo directory, so the build system will put the compressed file in the same
place the includes file currently resides.

The only dependency for this layer is includes.js, which we created earlier.
It's full of more dojo.require dependencies that the build system will trace
for us.

The prefixes array tells the build system what directories we want to include
in our build version. These directories will be copied over to the build site.
You need to list any modules that you use, even if they're not directly
referenced in a layer. See the dojobook for more info. 



4. Now we're ready to start building. cd to util/buildscripts, where you'll
find a bunch of different build scripts. We want to use build.sh. The
incantation is

./build.sh profileFile=/path/to/my.profile.js action=release \
           cssOptimize=comments optimize=shrinkSafe

Give profileFile the correct path to the profile created above, and leave the
rest of the parameters as is. They tell the build system to crank the
optimizations up to 11, removing comments, newlines, spaces, and turning on
shrinkSafe.

After a bit of churning, you'll have a shiny compressed version ready to stream
over the wires. My transfer size was cut by 56% (down to 9 requests), reducing
browser latency and making my app much more responsive. 










THIS REDUCED DOJO BUT DID NOT CONCATENATE THE REQUIRED FILES 

TEST BUILD TO MINIMISE dijit AND dojox


1. DOWNLOADED DOJO 1.2.2

http://download.dojotoolkit.org/release-1.2.2/


2. RAN mini.sh 

(FULL OUTPUT BELOW)

    ...
    release:  Build is in directory: ../../release/dojo
    Build time: 896.537 seconds
    minify: build success. removing uncompressed files, and optimizing themes
    Removing *uncompressed.js and *uncommented.js...
    Removing templatePath files...
    minify: creating archive(s)
    ./mini.sh: line 117: .: -m: invalid option
    .: usage: . filename [arguments]
    




release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/curry.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/object.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/sequence.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/linrec.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/util.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/array.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/reversed.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/lambda.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/tailrec.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/scan.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/multirec.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/fold.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/numrec.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/listcomp.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/zip.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional/binrec.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/mix.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/aspect.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/utils.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/lang/functional.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/robot/recorder.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/off.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/fx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/sketch.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/flash/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/sql/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/sql/_crypto.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/timing.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/string/sprintf.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/string/Builder.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/string/tokenize.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/string/BidiComplex.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/flash.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/off/_common.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/off/sync.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/off/ui.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/off/resources/learnhow.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/off/files.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/presentation/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/BinaryTree.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/Queue.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/Dictionary.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/Stack.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/ArrayList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/Set.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/collections/SortedList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/storage.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/Context.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/render/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/contrib/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/contrib/data.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/contrib/objects.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/contrib/dijit.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/utils/date.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/strings.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/misc.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/logic.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/htmlstrings.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/lists.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/dates.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/filter/integers.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/_Templated.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/ext-dojo/NodeList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/tag/loader.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/tag/loop.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/tag/misc.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/tag/date.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/tag/logic.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/dtl/_HtmlTemplated.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Loader.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/FisheyeLite.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/ColorPicker.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Toaster.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/SortList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/PlaceholderMenuItem.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Iterator.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/DocTester.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Pager.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Roller.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Dialog.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/RollingList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/CalendarFx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Calendar.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/FilePicker.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/FisheyeList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/widget/Wizard.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/JsonRest.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/ProxiedPath.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/Rest.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/Client.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/JsonRPC.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/OfflineRest.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/rpc/Service.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/matrix.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/attach.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/arc.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/move.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/VectorText.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/canvas.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/fx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/decompose.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/silverlight_attach.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/vml_attach.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/svg_attach.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/Mover.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/Moveable.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/path.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/silverlight.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/vml.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/canvas_attach.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/svg.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/shape.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx/utils.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/math/matrix.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/math/curves.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/math/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/jsonPath.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/math.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/html/metrics.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/html/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/html/styles.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/TextAdapter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/Wire.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/XmlWire.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/TableAdapter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/CompositeWire.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/Transfer.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/DataStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/Data.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/Invocation.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/Action.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/util.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/ml/Service.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/DataWire.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/wire/TreeAdapter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/CsvStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/AndOrReadStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/XmlStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/ServiceStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/PicasaStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/QueryReadStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/GoogleSearchStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/restListener.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/WikipediaStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/OpmlStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/ClientFilter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/FlickrRestStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/FlickrStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/css.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/HtmlTableStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/CssRuleStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/S3Store.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/KeyValueStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/jsonPathStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/AtomReadStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/PersevereStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/GoogleFeedStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/dom.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/HtmlStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/CouchDBRestStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/JsonRestStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/AndOrWriteStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/CssClassStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/SnapLogicStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/data/FileStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/FloatingPane.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/ToggleSplitter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/RadioGroup.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/ResizeHandle.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/ContentPane.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/BorderContainer.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/DragPane.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/GridContainer.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/dnd/Avatar.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/dnd/PlottedDnd.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/RotatorContainer.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/ScrollPane.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/layout/ExpandoPane.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/date/php.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/date/HebrewDate.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/date/IslamicDate.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/date/posix.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/uuid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_ViewManager.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_RowSelector.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/Grid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/lib.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/view.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/layout.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/drag.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/focus.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/cell.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/selection.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/scroller.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/edit.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/builder.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/rows.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/rowbar.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/views.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_grid/publicEvents.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/VirtualGrid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_data/fields.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_data/editors.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_data/dijitEditors.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/compat/_data/model.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_View.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_FocusManager.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_Layout.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/util.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_EditManager.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/DataSelection.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/DataGrid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_Scroller.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_Grid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/Selection.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/Grid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/cells/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/cells/dijit.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/VirtualGrid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_RowManager.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/cells.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/grid/_Events.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/jsonPath/query.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/editor/plugins/UploadImage.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/editor/plugins/TablePlugins.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/timing/Sequence.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/timing/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/timing/ThreadPool.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/timing/Streamer.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/plugins/mouseOver.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/plugins/window.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/plugins/consoleMessages.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/plugins/idle.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/plugins/mouseClick.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/Urchin.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/profiles/analytics.profile.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/profiles/analyticsInBase.profile.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/analytics/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/help/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/help/console.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/xml/Script.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/xml/DomParser.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/xml/parser.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/xml/widgetParser.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/_FormSelectWidget.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/PasswordValidator.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/_SelectStackMixin.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/FileUploader.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/BusyButton.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/DropDownStack.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/MultiComboBox.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/Rating.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/RadioStack.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/_HasDropDown.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/FileInputAuto.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/FilePickerTextBox.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/DateTextBox.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/DropDownSelect.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/TimeSpinner.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/RangeSlider.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/FileInput.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/form/CheckedMultiSelect.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/uuid/Uuid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/uuid/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/uuid/generateTimeBasedUuid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/uuid/generateRandomUuid.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/FLVideo.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/widget/ProgressSlider.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/widget/Player.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/widget/PlayButton.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/widget/Status.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/widget/VolumeButton.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/av/_Media.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/proxy/xip.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/windowName.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/xhrWindowNamePlugin.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/httpParse.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/scriptFrame.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/xhrMultiPart.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/io/xhrPlugins.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/delphi.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/_static.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/javascript.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/_all.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/css.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/pygments/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/pygments/javascript.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/pygments/css.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/pygments/xml.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/pygments/_html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/pygments/_www.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/sql.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/xml.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/python.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/cpp.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/django.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/_dynamic.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/highlight/languages/_www.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/sql.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/resources/_modules.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/resources/manualTests.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/RestChannels.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/longPollTransportFormEncoded.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/HttpChannels.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/timesync.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/longPollTransportJsonEncoded.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/callbackPollTransport.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/longPollTransport.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/cometd/timestamp.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/matrix.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/lighting.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/object.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/gradient.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/scheduler.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/gfx3d/vector.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/embed/Object.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/embed/Quicktime.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/embed/Flash.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojox/embed/IE/flash.js
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/Gallery.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/Lightbox.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/Magnifier.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/SlideShow.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/ThumbnailPicker.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/Badge.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/image/resources/image.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/sketch/resources/sketch.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/off/resources/offline-widget.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/presentation/resources/Show.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/Toaster/Toaster.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/SortList/SortList.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/FisheyeList/FisheyeList.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/Dialog/Dialog.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/Wizard/Wizard.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/Loader/Loader.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/Calendar/Calendar.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/ColorPicker/ColorPicker.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/FilePicker/FilePicker.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/DocTester/DocTester.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/Pager/Pager.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/widget/RollingList/RollingList.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/GridContainer.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/ToggleSplitter.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/RadioGroup.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/ResizeHandle.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/RotatorContainer.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/DndGridContainer.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/ExpandoPane.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/ScrollPane.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/layout/resources/FloatingPane.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/compat/_grid/nihiloGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/compat/_grid/tundraGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/compat/_grid/Grid_rtl.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/compat/_grid/soriaGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/compat/_grid/Grid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/_grid/nihiloGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/_grid/soriaGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/_grid/tundraGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/_grid/Grid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/_grid/Grid_rtl.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/resources/nihiloGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/resources/soriaGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/resources/tundraGrid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/resources/Grid.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/grid/resources/Grid_rtl.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/editor/plugins/resources/editorPlugins.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/FilePickerTextBox.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/DropDownSelect.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/RangeSlider.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/FileInput.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/CheckedMultiSelect.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/BusyButton.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/form/resources/Rating.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/av/widget/resources/Player.css
release:  ../../release/dojo/dojox/av/widget/resources/Player.css
  Cannot inline css import, skipping: ../../../dojo/resources/dojo.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/emacs.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/perldoc.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/autumn.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/trac.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/friendly.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/borland.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/fruity.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/manni.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/default.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/murphy.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/colorful.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/pastie.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/pygments/native.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojox/highlight/resources/highlight.css
release:  Interning strings for: ../../release/dojo/dojo
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_firebug/firebug.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/AdapterRegistry.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/cldr/supplemental.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/cldr/monetary.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/rpc/RpcService.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/rpc/JsonService.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/rpc/JsonpService.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/NodeList-html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/regexp.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/parser.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/html.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/query.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/window.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/json.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/fx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/array.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/Color.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/Deferred.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/lang.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/event.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/NodeList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/browser.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/connect.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/hostenv_rhino.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/loader.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/hostenv_browser.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/loader_debug.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/bootstrap.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/hostenv_spidermonkey.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/_loader/loader_xd.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/declare.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base/xhr.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/ItemFileWriteStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/ItemFileReadStore.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/api/Notification.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/api/Request.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/api/Identity.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/api/Write.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/api/Read.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/util/filter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/util/sorter.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/data/util/simpleFetch.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/back.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/fx/easing.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/date/stamp.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/date/locale.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/OpenAjax.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/string.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/jaxer.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/_base.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/cookie.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/DeferredList.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/fx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/date.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/robotx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/i18n.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/robot.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/number.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/move.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/autoscroll.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Mover.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/common.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Manager.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Moveable.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/TimedMoveable.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Avatar.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Selector.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Source.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/dnd/Container.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/currency.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/io/script.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/io/iframe.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/NodeList-fx.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/resources/_modules.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/behavior.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/gears.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/colors.js
release:  Optimizing (shrinksafe.keepLines, stripConsole=normal) file: ../../release/dojo/dojo/tests.js
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojo/_firebug/firebug.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojo/resources/dojo.css
release:  Optimizing (comments.keepLines) CSS file: ../../release/dojo/dojo/resources/dnd.css
release:  Build is in directory: ../../release/dojo
Build time: 896.537 seconds
minify: build success. removing uncompressed files, and optimizing themes
Removing *uncompressed.js and *uncommented.js...
Removing templatePath files...
minify: creating archive(s)

OK




NOTES
=====

WHEN FIRST RAN mini.sh AS COPIED FROM



 GOT THIS ERROR AT BUILD STAGE:

mini.sh SCRIPT

    # run an optimized build
    echo "minify: running build"
    cd util/buildscripts
    # we keepLines because otherwise debugging is really hard
    # , and it's a minimal size diff
    ./build.sh profile=standard optimize=shrinksafe.keepLines version=1.1.0mini
      cssOptimize=comments.keepLines cssImportIgnore=../dijit.css action=release


ERROR:

To run the build, you must have Java 1.4.2 or later installed.
To run a build run the following command from this directory:

> java -jar ../shrinksafe/custom_rhino.jar build.js [name=value...]

Here is an example of a typical release build:

> java -jar ../shrinksafe/custom_rhino.jar build.js profile=base action=release


SOLUTION:

CHANGED LINE IN mini.sh TO


java -jar ../shrinksafe/custom_rhino.jar build.js profile=standard optimize=shrinksafe.keepLines version=1.2.2mini cssOptimize=comments.keepLines cssImportIgnore=../dijit.css action=release



FULL build.sh OUTPUT (WITH OPTIONS):

To run the build, you must have Java 1.4.2 or later installed.
To run a build run the following command from this directory:

> java -jar ../shrinksafe/custom_rhino.jar build.js [name=value...]

Here is an example of a typical release build:

> java -jar ../shrinksafe/custom_rhino.jar build.js profile=base action=release

If you get a 'java.lang.OutOfMemoryError: Java heap space' error, try increasing the memory Java can use for the command:

> java -Xms256m -Xmx256m -jar ../shrinksafe/custom_rhino.jar build.js profile=base action=release

Change the 256 number to the number of megabytes you want to give Java.

The possible name=value build options are shown below with the defaults as their values:

cssImportIgnore=
If using cssOptimize="comments", then you can force the @import inlining step to ignore a set of files by using this option. The value of this option should be a comma separated list of CSS files names to ignore. The file names should match whatever strings are used for the @import calls.

xdScopeArgs=
If the loader=xdomain build option is used, then the value of this option will be used as the arguments to the function that defines the modules in the .xd.js files. This allows for more than one version of the same module to be in a page. See documentation on djConfig.scopeMap for more information.

cssOptimize=
Specifies how to optimize CSS files. If "comments" is specified, then code comments and line returns are stripped, and files referenced via @import are inlined. If "comments.keepLines" is specified, then code comments are stripped and @import calls are inlined, but line returns are preserved.

releaseName=dojo
The name of the release. A directory inside 'releaseDir' will be created with this name.

localeList=ar,ca,cs,da,de-de,el,en-gb,en-us,es-es,fi-fi,fr-fr,he-il,hu,it-it,ja-jp,ko-kr,nl-nl,no,pl,pt-br,pt-pt,ru,sk,sl,sv,th,tr,zh-tw,zh-cn
The set of locales to use when flattening i18n bundles.

releaseDir=../../release/
The top level release directory where builds end up. The 'releaseName' directories will  be placed inside this directory.

copyTests=true
Turn on or off copying of test files.

action=help
The build action(s) to run. Can be a comma-separated list, like action=clean,release. The possible build actions are: clean, release.

symbol=
Inserts function symbols as global references so that anonymous functions will show up in all debuggers (esp. IE which does not attempt to infer function names from the context of their definition). Valid values are "long" and "short". If "short" is used, then a symboltables.txt file will be generated in each module prefix's release directory which maps the short symbol names to more descriptive names.

internStrings=true
Turn on or off widget template file interning.

scopeMap=
Change the default dojo, dijit and dojox scope names to something else. Useful if you want to use Dojo as part of a JS library, but want to make a self-contained library with no external dojo/dijit/dojox references. Format is a string that contains no spaces, and is similar to the djConfig.scopeMap value (note that the backslashes below are required to avoid shell escaping):
scopeMap=[[\"dojo\",\"mydojo\"],[\"dijit\",\"mydijit\"],[\"dojox\",\"mydojox\"]]

mini=false
Removes files like tests, demos dijit/bench, unfinished themes, and interned Dijit templates from the build. Overrides the value set for copyTests.

optimize=
Specifies how to optimize module files. If "comments" is specified, then code comments are stripped. If "shrinksafe" is specified, then the Dojo compressor will be used on the files, and line returns will be removed. If "shrinksafe.keepLines" is specified, then the Dojo compressor will be used on the files, and line returns will be preserved. If "packer" is specified, Then Dean Edwards' Packer will be used.

loader=default
The type of dojo loader to use. "default" or "xdomain" are acceptable values.

log=0
Sets the logging verbosity. See jslib/logger.js for possible integer values.

profileFile=
A file path to the the profile file. Use this if your profile is outside of the profiles directory. Do not specify the "profile" build option if you use "profileFile".

xdDojoPath=
If the loader=xdomain build option is used, then the value of this option will be used to call dojo.registerModulePath() for dojo, dijit and dojox. The xdDojoPath should be the directory that contains the dojo, dijit and dojox directories, and it should NOT end in a slash. For instance: 'http://some.domain.com/path/to/dojo090'.

stripConsole=
Strips console method calls from JS source. Applied to layers and individual modules resource files. Valid values are "normal" (strips all but console.warn and console.error calls), "all" (strips all console calls), "normal,warn" (strips all but console.error calls), "normal,error" (strips all but console.warn errors).

version=0.0.0.dev
The build will be stamped with this version string.

profile=base
The name of the profile to use for the build. It must be the first part of the profile file name in the profiles/ directory. For instance, to use base.profile.js, specify profile=base.

layerOptimize=shrinksafe
Specifies how to optimize the layer files. If "comments" is specified, then code comments are stripped. If "shrinksafe" is specified, then the Dojo compressor will be used on the files, and line returns will be removed. If "shrinksafe.keepLines" is specified, then the Dojo compressor will be used on the layer files, and line returns will be preserved. If "packer" is specified, Then Dean Edwards' Packer will be used.

scopeDjConfig=
Burn in a djConfig object into the built dojo.js file. Useful if you are making your own scoped dojo and you want a djConfig object local to your version that will not be affected by any globally declared djConfig object in the page. Value must be a string that will look like a javascript object literal once it is placed in the built source. use Dojo as part of a JS library, but want to make a self-contained library with no external dojo/dijit/dojox. Example (note that the backslashes below are required to avoid shell escaping if you type this on the command line):
scopeDjConfig={isDebug:true,scopeMap:[[\"dojo\",\"mydojo\"],[\"dijit\",\"mydijit\"],[\"dojox\",\"mydojox\"]]}

xdDojoScopeName=dojo
If the loader=xdomain build option is used, then the value of this option will be used instead of 'dojo' for the 'dojo._xdResourceLoaded()' calls that are done in the .xd.js files. This allows for dojo to be under a different scope name but still allow xdomain loading with that scope name.

buildLayers=
A comma-separated list of layer names to build. Using this option means that only those layers will be built. This helps if you are doing quick development and test cycles with layers. If you have problems using this option, try removing it and doing a full build with action=clean,release. This build option assumes you have done at least one full build first.


Build time: 0.785 seconds









Running The Build

After specifying a profile file as shown above that statically specifies the resources you want to include, and saving it as /buildscripts/profiles/foo.profile.js, you run the Rhino interpreter on it and specify the profile name as a parameter. For example, from the buildscripts directory:
$ cd util/buildscripts
$ build.sh profile=foo action=release

On Windows PC's, substitute build.bat for build.sh. For both platforms, you may also specify additional build options. Run build.sh to see a list of all supported options. Here is a sample of the supported options:
profile 	The name of the profile to use for the build. It must be the first part of the profile file name in the profiles/ directory. For instance, to use base.profile.js, specify profile=base. Default: base
profileFile 	A file path to the the profile file. Use this if your profile is outside of the profiles directory. Do not specify the "profile" build option if you use "profileFile" Default: "",
action 	The build action(s) to run. Can be a comma-separated list, like action=clean,release. The possible build actions are: clean, release Default: "help",
version 	The build will be stamped with this version string Default: "0.0.0.dev",
localeList 	The set of locales to use when flattening i18n bundles Default: "en-gb,en-us,de-de,es-es,fr-fr,it-it,pt-br,ko-kr,zh-tw,zh-cn,ja-jp",
releaseName 	The name of the release. A directory inside 'releaseDir' will be created with this name Default: "dojo",
releaseDir 	The top level release directory where builds end up. The 'releaseName' directories will be placed inside this directory Default: "../../release/",
loader 	The type of dojo loader to use. "default" or "xdomain" are acceptable values." defaultValue: "default",
internStrings 	Turn on or off widget template/dojo.uri.cache() file interning Default: true,
optimize 	Specifies how to optimize module files. If "comments" is specified, then code comments are stripped. If "shrinksafe" is specified, then the Dojo compressor will be used on the files, and line returns will be removed. If "shrinksafe.keepLines" is specified, then the Dojo compressor will be used on the files, and line returns will be preserved. If "packer" is specified, Then Dean Edwards' Packer will be used Default: "",
layerOptimize 	Specifies how to optimize the layer files. If "comments" is specified, then code comments are stripped. If "shrinksafe" is specified, then the Dojo compressor will be used on the files, and line returns will be removed. If "shrinksafe.keepLines" is specified, then the Dojo compressor will be used on the layer files, and line returns will be preserved. If "packer" is specified, Then Dean Edwards' Packer will be used Default: "shrinksafe",
copyTests 	Turn on or off copying of test files Default: true,
log 	Sets the logging verbosity. See jslib/logger.js for possible integer values Default: logger.TRACE,
xdDojoPath 	If the loader=xdomain build option is used, then the value of this option will be used for the path to Dojo modules. The dijit and dojox paths will be assumed to be sibilings of this path. The xdDojoPath should end in '/dojo' Default: "",


cd /nethome/syoung/base/html/Bioptic0.2.5/dojo.1.2.2/util/buildscripts


cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build2/ > ..\..\..\build2-output.txt

OK



</entry>


<entry [Mon Mar 2 17:12:00 EST 2008] COMPRESSED Bioptic0.2.5>


FIX ERROR:

C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts>java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build1/ > ..\..\..\build1-output.txt


js: "../../../build1/dojo/dojo/../bioptic.js", line 37078: missing name after . operator
js:                 var value = this.value(parameterValues, resources[resource].params, resources[resource].function);
js: ................................................................................................................^
js: "../../../build1/dojo/dojo/../bioptic.js", line 1: Compilation produced 1 syntax errors.
js: "../../../build1/dojo/dojo/../bioptic.js", line 1: org.mozilla.javascript.EvaluatorException: Compilation produced 1 syntax errors. (../../../build1/dojo/dojo/../bioptic.js#1)


BY REPLACING 

        var value = this.value(parameterValues, resources[resource].params, resources[resource].function);

WITH

        var value = this.value(parameterValues, resources[resource].params, resources[resource].paramFunction);


RUN BUILD 2 WITH CSS OPTIMISATION
=================================

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build2/ > ..\..\..\build2-output.txt

OK



BUILD 3: TEST PROFILE FILE
==========================

REMOVED dijit AND dojox PREFIXES.

dependencies ={
    layers:  [
        {
        name: "../bioptic.js",
            dependencies: [
                "plugins.admin.Controller",
                "plugins.projects.Controller",
                "plugins.report.Controller",
                "plugins.workflow.Controller",
                "plugins.view.Controller"
            ]
        }
    ],
    prefixes: [
        [ "plugins", "../../plugins" ]
    ]
};



cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profileFile=..\..\..\build3\bioptic.profile.js action="release" version="0.2.5"  releaseDir=../../../build3/ > ..\..\..\build3-output.txt

ERROR:

error loading uri: ./../../../build3/dojo/plugins/core/WidgetFramework.js, exception: Error: Could not load 'dijit.layout.BorderContainer'; last tried '../dijit/layout/BorderContainer.js'




</entry>

<entry [Mon Mar 2 17:12:00 EST 2008] COMPRESSED Bioptic0.2.5>


COMPRESSED FILES WILL BE OUTPUT TO HERE:

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\release\dojo\dojo

bioptic.js
bioptic.js.uncompressed.js


1. MOVE TO buildscripts DIRECTORY

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts


2. CREATE profile FILE IN profiles DIRECTORY

dependencies ={
    layers:  [
        {
        name: "../bioptic.js",
            dependencies: [
                "plugins.admin.Controller",
                "plugins.projects.Controller",
                "plugins.report.Controller",
                "plugins.workflow.Controller",
                "plugins.view.Controller"
            ]
        }
    ],
    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "plugins", "../../plugins" ]
    ]
};


3. RUN BUILD

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build1/ > ..\..\..\build1-output.txt


java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build2/ > ..\..\..\build2-output.txt



    release:  Using profile: profiles/bioptic.profile.js
    release:  Using version number: 0.2.5 for the release.
    release:  Deleting: ../../release/dojo
    ...
    release:  Build is in directory: ../../release/dojo
    Build time: 88.881 seconds

    (FULL BUILD OUTPUT COPIED BELOW)
    
    
4. OUTPUT FILES ARE HERE:

C:\DATA\base\html\build1\\Bioptic0.2.5\html\build1\dojo\dojo
C:\DATA\base\html\build1\Bioptic0.2.5\html\build1\dojo\dijit
C:\DATA\base\html\build1\Bioptic0.2.5\html\build1\dojo\dojox
C:\DATA\base\html\build1\Bioptic0.2.5\html\build1\plugins\bioptic.js.uncompressed.js
C:\DATA\base\html\build1\Bioptic0.2.5\html\build1\plugins\bioptic.js


THE bioptic.js FILE CONTAINS ALL THE DOJO DEPENDENCIES AND THE plugins MODULES CODE ALSO.


5. REFER TO THE NEW FILES IN index.html

   1.  dojo.js and djconfig - load the basic Dojo functionality
   2. registerModulePath - set the custom module namespace correctly
   ### NOT NECESSARY 3. my-all.js - load the layer file
   4. require - load the classes normally, if the layer wasn't found 


// ACCESS COMPRESSED DOJO AND LOAD dojo OBJECT
<script type="text/javascript" src="dojo/dojo/dojo.js"
	djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>

<script type="text/javascript">

// REGISTER module path FOR PLUGINS
dojo.registerModulePath("plugins","../../plugins");	

// LOAD PLUGINS
dojo.require("plugins.core.PluginManager");

</script>


See the following snippet:

    <script type="text/javascript" src="/js/dojo-1.1.1/dojo/dojo.js"
    djconfig="parseOnLoad: true, isDebug: true"></script>
    
    <script language="JavaScript" type="text/javascript">
      dojo.registerModulePath("my", "/js/my");
    </script>
    
    <script type="text/javascript" src="/js/my/my-all.js"></script>
    
    <script language="JavaScript" type="text/javascript">
      dojo.require("my.Widget1");
      // ...
    </script>
    






FULL BUILD OUTPUT:

    release:  Using profile: profiles/bioptic.profile.js
    release:  Using version number: 0.2.5 for the release.
    release:  Deleting: ../../release/dojo
    release:  Copying: ../../dojo/../dijit to: ../../release/dojo/dijit
    release:  Copying: ../../dojo/../dojox to: ../../release/dojo/dojox
    release:  Copying: ../../dojo/../../plugins/core to: ../../release/dojo/plugins/
    core
    release:  Copying: ../../dojo to: ../../release/dojo/dojo
    release:  Copying: ../../dojo/../plugins to: ../../release/dojo/plugins
    release:  Building dojo.js and layer files
    release:  XXXX HERE
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/lang.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/declare.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/connect.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/Deferred.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/json.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/array.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/Color.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/browser.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/window.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/event.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/html.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/NodeList.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/query.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/xhr.js
    release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/fx.js
    release:  Interning strings for file: ../../release/dojo/dojo/dojo.js
    release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/dojo.js
    release:  Interning strings for file: ../../release/dojo/dojo/bioptic.js
    release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/bioptic.js
    release:  Files baked into this build:
    
    dojo.js:
    ./jslib/dojoGuardStart.jsfrag
    ./../../dojo/_base/_loader/bootstrap.js
    ./../../dojo/_base/_loader/loader.js
    ./../../dojo/_base/_loader/hostenv_browser.js
    ./../../release/dojo/dojo/_base/lang.js
    ./../../release/dojo/dojo/_base/declare.js
    ./../../release/dojo/dojo/_base/connect.js
    ./../../release/dojo/dojo/_base/Deferred.js
    ./../../release/dojo/dojo/_base/json.js
    ./../../release/dojo/dojo/_base/array.js
    ./../../release/dojo/dojo/_base/Color.js
    ./../../release/dojo/dojo/_base.js
    ./../../release/dojo/dojo/_base/window.js
    ./../../release/dojo/dojo/_base/event.js
    ./../../release/dojo/dojo/_base/html.js
    ./../../release/dojo/dojo/_base/NodeList.js
    ./../../release/dojo/dojo/_base/query.js
    ./../../release/dojo/dojo/_base/xhr.js
    ./../../release/dojo/dojo/_base/fx.js
    ./../../release/dojo/dojo/_base/browser.js
    ./jslib/dojoGuardEnd.jsfrag
    
    bioptic.js:
    
    
    release:  Interning strings for: ../../release/dojo/dijit
    release:  Interning strings for : ../../release/dojo/dijit/ColorPalette.js
    release:      ../../release/dojo/dijit/templates/ColorPalette.html
    release:  Interning strings for : ../../release/dojo/dijit/Dialog.js
    release:      ../../release/dojo/dijit/templates/Dialog.html
    release:      ../../release/dojo/dijit/templates/TooltipDialog.html
    release:  Interning strings for : ../../release/dojo/dijit/form/Button.js
    release:      ../../release/dojo/dijit/form/templates/Button.html
    release:      ../../release/dojo/dijit/form/templates/DropDownButton.html
    release:      ../../release/dojo/dijit/form/templates/ComboButton.html
    release:  Interning strings for : ../../release/dojo/dijit/form/CheckBox.js
    release:      ../../release/dojo/dijit/form/templates/CheckBox.html
    release:  Interning strings for : ../../release/dojo/dijit/form/ComboBox.js
    release:      ../../release/dojo/dijit/form/templates/ComboBox.html
    release:  Interning strings for : ../../release/dojo/dijit/form/Slider.js
    release:      ../../release/dojo/dijit/form/templates/HorizontalSlider.html
    release:      ../../release/dojo/dijit/form/templates/VerticalSlider.html
    release:  Interning strings for : ../../release/dojo/dijit/form/TextBox.js
    release:      ../../release/dojo/dijit/form/templates/TextBox.html
    release:  Interning strings for : ../../release/dojo/dijit/form/ValidationTextBo
    x.js
    release:      ../../release/dojo/dijit/form/templates/ValidationTextBox.html
    release:  Interning strings for : ../../release/dojo/dijit/form/_Spinner.js
    release:      ../../release/dojo/dijit/form/templates/Spinner.html
    release:  Interning strings for : ../../release/dojo/dijit/InlineEditBox.js
    release:      ../../release/dojo/dijit/templates/InlineEditBox.html
    release:  Interning strings for : ../../release/dojo/dijit/layout/AccordionConta
    iner.js
    release:      ../../release/dojo/dijit/layout/templates/AccordionPane.html
    release:  Interning strings for : ../../release/dojo/dijit/layout/TabContainer.j
    s
    release:      ../../release/dojo/dijit/layout/templates/TabContainer.html
    release:      ../../release/dojo/dijit/layout/templates/_TabButton.html
    release:  Interning strings for : ../../release/dojo/dijit/ProgressBar.js
    release:      ../../release/dojo/dijit/templates/ProgressBar.html
    release:  Interning strings for : ../../release/dojo/dijit/TitlePane.js
    release:      ../../release/dojo/dijit/templates/TitlePane.html
    release:  Interning strings for : ../../release/dojo/dijit/Tooltip.js
    release:      ../../release/dojo/dijit/templates/Tooltip.html
    release:  Interning strings for : ../../release/dojo/dijit/Tree.js
    release:      ../../release/dojo/dijit/_tree/Node.html
    release:      ../../release/dojo/dijit/_tree/Tree.html
    release:  Interning strings for : ../../release/dojo/dijit/_Calendar.js
    release:      ../../release/dojo/dijit/templates/Calendar.html
    release:  Interning strings for : ../../release/dojo/dijit/_TimePicker.js
    release:      ../../release/dojo/dijit/templates/TimePicker.html
    release:  Interning strings for: ../../release/dojo/dojox
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
    release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Fi
    leView.js
    release:      ../../release/dojo/dojox/data/demos/widgets/templates/FileView.htm
    l
    release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Fl
    ickrViewList.js
    release:      ../../release/dojo/dojox/data/demos/widgets/templates/FlickrViewLi
    st.html
    release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Pi
    casaView.js
    release:      ../../release/dojo/dojox/data/demos/widgets/templates/PicasaView.h
    tml
    release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Pi
    casaViewList.js
    release:      ../../release/dojo/dojox/data/demos/widgets/templates/PicasaViewLi
    st.html
    release:  Interning strings for : ../../release/dojo/dojox/editor/plugins/TableP
    lugins.js
    release:      ../../release/dojo/dojox/editor/plugins/resources/insertTable.html
    
    release:      ../../release/dojo/dojox/editor/plugins/resources/modifyTable.html
    
    release:  Interning strings for : ../../release/dojo/dojox/form/CheckedMultiSele
    ct.js
    release:      ../../release/dojo/dojox/form/resources/_CheckedMultiSelectItem.ht
    ml
    release:      ../../release/dojo/dojox/form/resources/CheckedMultiSelect.html
    release:  Interning strings for : ../../release/dojo/dojox/form/DropDownSelect.j
    s
    release:      ../../release/dojo/dojox/form/resources/DropDownSelect.html
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
    release:  Interning strings for : ../../release/dojo/dojox/grid/compat/VirtualGr
    id.js
    release:      ../../release/dojo/dojox/grid/compat/resources/VirtualGrid.html
    release:  Interning strings for : ../../release/dojo/dojox/grid/compat/_grid/vie
    w.js
    release:      ../../release/dojo/dojox/grid/compat/resources/GridView.html
    release:  Interning strings for : ../../release/dojo/dojox/grid/_Grid.js
    release:      ../../release/dojo/dojox/grid/resources/_Grid.html
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
    release:  Interning strings for : ../../release/dojo/dojox/layout/GridContainer.
    js
    release:      ../../release/dojo/dojox/layout/resources/GridContainer.html
    release:  Interning strings for : ../../release/dojo/dojox/layout/ScrollPane.js
    release:      ../../release/dojo/dojox/layout/resources/ScrollPane.html
    release:  Interning strings for : ../../release/dojo/dojox/presentation/_base.js
    
    release:      ../../release/dojo/dojox/presentation/resources/Show.html
    release:      ../../release/dojo/dojox/presentation/resources/Slide.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/Calendar.js
    release:      ../../release/dojo/dojox/widget/Calendar/Calendar.html
    release:      ../../release/dojo/dojox/widget/Calendar/CalendarDay.html
    release:      ../../release/dojo/dojox/widget/Calendar/CalendarMonth.html
    release:      ../../release/dojo/dojox/widget/Calendar/CalendarYear.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/ColorPicker.js
    
    release:      ../../release/dojo/dojox/widget/ColorPicker/ColorPicker.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/Dialog.js
    release:      ../../release/dojo/dojox/widget/Dialog/Dialog.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/DocTester.js
    release:      ../../release/dojo/dojox/widget/DocTester/DocTester.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/FilePicker.bkp
    .js
    release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/FilePicker.js
    release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/FilePicker.lay
    out8-7.js
    release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/Pager.js
    release:      ../../release/dojo/dojox/widget/Pager/Pager.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/SortList.js
    release:      ../../release/dojo/dojox/widget/SortList/SortList.html
    release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
    release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
    release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
    on.js
    release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
    release:  Interning strings for: ../../release/dojo/plugins/core
    release:  Interning strings for: ../../release/dojo/dojo
    release:  Interning strings for: ../../release/dojo/plugins
    release:  Build is in directory: ../../release/dojo
    Build time: 88.881 seconds
    


</entry>


<entry [Fri Dec 12 23:12:00 EST 2008] DOH ROBOT TESTS>


http://localhost:8080/Bioptic0.2.3/html/dojo.1.2.2/dojo/tests/dnd/robot/test_dnd.html


</entry>

<entry [Wed Dec 10 10:12:00 EST 2008] COMPRESSED Bioptic2 USING rhino>

1. MOVE TO buildscripts DIRECTORY

cd C:\DATA\base\html\Bioptic2\html\dojo.1.2.2\util\buildscripts


2. CREATE profile FILE IN profiles DIRECTORY

dependencies ={
    layers:  [
        {
        name: "bioptic.js",
            dependencies: [
                "plugins.core.PluginManager"
            ]
        }
    ],
    prefixes: [
        [ "dijit", "../dijit" ],
        [ "dojox", "../dojox" ],
        [ "plugins.core", "../../plugins/core" ],
        [ "plugins.admin", "../../plugins/admin" ],
        [ "plugins.projects", "../../plugins/projects" ],
        [ "plugins.workflow", "../../plugins/workflow" ],
        [ "plugins.report", "../../plugins/report" ],
        [ "plugins.core", "../../plugins/core" ]
    ]
};


3. RUN BUILD

cd C:\DATA\base\html\Bioptic2\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.3"


PLUGINS THAT CAUSE NO ERROR:

                "plugins.core.WidgetFramework",
                "plugins.core.Controls",
                "plugins.workflow.Controller",
                "plugins.admin.Controller"


PLUGINS THAT CAUSE THE ERROR org.mozilla.javascript.WrappedException: Wrapped java.lang.RuntimeException
        at org.mozilla.javascript.Context.throwAsScriptRuntimeEx(Context.java:1812)
        at org.mozilla.javascript.MemberBox.invoke(MemberBox.java:170)
        at org.mozilla.javascript.NativeJavaMethod.call(NativeJavaMethod.java:243)
        at org.mozilla.javascript.optimizer.OptRuntime.callN(OptRuntime.java:86) (SEE BUILD ERROR 1: 'org.mozilla.javascript.WrappedException' BELOW):


                "plugins.core.Plugin",
                "plugins.core.PluginManager",


PLUGINS THAT CAUSE THE ERROR

error loading uri: ./../../release/dojo/plugins/core/Plugin.js, exception: Error:
Could not load ' + this.name+ '; last tried '../ + this/name+ .js' :


                "plugins.projects.Controller"
                "plugins.report.Controller"


CREATED Bioptic0.2.3 REMOVING ALL EXTRANEOUS FILES AND RERAN COMPRESSION WITH ADDED plugins.core.Plugin BUT FAILED WITH SAME 'error loading uri' AS BEFORE:

cd C:\DATA\base\html\Bioptic0.2.3\html\dojo.1.2.2\util\buildscripts
java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.3" > build_log8.txt


RERAN COMPRESSION WITH ADDED plugins.projects.Controller WITH dojo.require("plugins.projects.Projects") COMMENTED OUT AND WORKED OKAY:

cd C:\DATA\base\html\Bioptic0.2.3\html\dojo.1.2.2\util\buildscripts
java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.3" > build_log11.txt


RERAN COMPRESSION WITH plugins.projects.Projects ADDED BACK IN BUT UPLOAD JAVASCRIPT COMMENTED OUT AND WORKED OKAY WITH ALL requires IN Projects.js EXCEPT FOR THE dojo.require('dojox.widget.RollingList') in dojox.widget.FilePicker:

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.3" > build_log12.txt


FIXED dojox.widget.RollingList.js, LINE 309:

    // CAUSES ERROR ON COMPRESSING:
    // this.parentWidget.(this);

    this.parentWidget(this);
    this.parentWidget._onItemClick(null, this, selectMenuItem.item, selectMenuItem.children);





NOTES
=====

1. BUILD ERROR org.mozilla.javascript.WrappedException


release:      ../../release/dojo/dijit/layout/templates/_TabButton.html
release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
release:      ../../release/dojo/dojox/grid/compat/resources/GridView.html
release:      ../../release/dojo/dojox/grid/compat/resources/VirtualGrid.html
release:      ../../release/dojo/dijit/templates/Calendar.html
release:      ../../release/dojo/dijit/form/templates/TextBox.html
release:      ../../release/dojo/dijit/templates/Tooltip.html
release:      ../../release/dojo/dijit/form/templates/ValidationTextBox.html
release:      ../../release/dojo/dijit/templates/TimePicker.html
release:      ../../release/dojo/dijit/form/templates/ComboBox.html
release:      ../../release/dojo/dijit/form/templates/CheckBox.html
release:      ../../release/dojo/dijit/form/templates/Spinner.html
release:      ../../release/dojo/dijit/form/templates/HorizontalSlider.html
release:      ../../release/dojo/dijit/form/templates/VerticalSlider.html
release:      ../../release/dojo/dijit/templates/Dialog.html
release:      ../../release/dojo/dijit/templates/TooltipDialog.html
release:      ../../release/dojo/dojox/widget/Dialog/Dialog.html
release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/bioptic.js
org.mozilla.javascript.WrappedException: Wrapped java.lang.RuntimeException
        at org.mozilla.javascript.Context.throwAsScriptRuntimeEx(Context.java:18
12)
        at org.mozilla.javascript.MemberBox.invoke(MemberBox.java:170)
        at org.mozilla.javascript.NativeJavaMethod.call(NativeJavaMethod.java:24
3)
        at org.mozilla.javascript.optimizer.OptRuntime.callN(OptRuntime.java:86)

        at org.mozilla.javascript.gen.c4._c32(Unknown Source)
        at org.mozilla.javascript.gen.c4.call(Unknown Source)
        at org.mozilla.javascript.optimizer.OptRuntime.callN(OptRuntime.java:86)

        at org.mozilla.javascript.gen.c1._c3(Unknown Source)
        at org.mozilla.javascript.gen.c1.call(Unknown Source)
        at org.mozilla.javascript.optimizer.OptRuntime.call0(OptRuntime.java:57)

        at org.mozilla.javascript.gen.c1._c0(Unknown Source)
        at org.mozilla.javascript.gen.c1.call(Unknown Source)
        at org.mozilla.javascript.ContextFactory.doTopCall(ContextFactory.java:3
93)
        at org.mozilla.javascript.ScriptRuntime.doTopCall(ScriptRuntime.java:283
7)
        at org.mozilla.javascript.gen.c1.call(Unknown Source)
        at org.mozilla.javascript.gen.c1.exec(Unknown Source)
        at org.mozilla.javascript.tools.shell.Main.evaluateScript(Main.java:599)

        at org.mozilla.javascript.tools.shell.Main.processFileSecure(Main.java:4
90)
        at org.mozilla.javascript.tools.shell.Main.processFile(Main.java:431)
        at org.mozilla.javascript.tools.shell.Main.processSource(Main.java:422)
        at org.mozilla.javascript.tools.shell.Main.processFiles(Main.java:184)
        at org.mozilla.javascript.tools.shell.Main$IProxy.run(Main.java:105)
        at org.mozilla.javascript.Context.call(Context.java:577)
        at org.mozilla.javascript.ContextFactory.call(ContextFactory.java:503)
        at org.mozilla.javascript.tools.shell.Main.exec(Main.java:167)
        at org.mozilla.javascript.tools.shell.Main.main(Main.java:145)
Caused by: java.lang.RuntimeException
        at org.mozilla.javascript.Decompiler.compress(Decompiler.java:1048)
        at org.mozilla.javascript.NativeFunction.compress(NativeFunction.java:94
)
        at org.mozilla.javascript.Context.compressScript(Context.java:1452)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
        at java.lang.reflect.Method.invoke(Unknown Source)
        at org.mozilla.javascript.MemberBox.invoke(MemberBox.java:155)
        ... 24 more



2. NO BUILD ERROR WITH JUST "plugins.core.WidgetFramework", "plugins.core.Controls" BUT THE FILES ARE JUST TRANSFERRED TO THE release FOLDER, NONE ARE COMPRESSED:

release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/event.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/html.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/NodeList.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/query.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/xhr.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/fx.js
release:  buildUtil. load (uri): ./../../release/dojo/plugins/core/WidgetFramewo
rk.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/BorderContain
er.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/_LayoutWidget
.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_Widget.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/focus.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/manager.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/place.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/AdapterRegistry.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/popup.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/window.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/scroll.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/sniff.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/typematic.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_base/wai.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_Container.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/cookie.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/regexp.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/_Templated.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/string.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/parser.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/date/stamp.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/LayoutContain
er.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/AccordionCont
ainer.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/fx.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/StackContaine
r.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/form/Button.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/form/_FormWidget.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/Menu.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/i18n.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/ContentPane.j
s
release:  buildUtil. load (uri): ./../../release/dojo/dojo/html.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/SplitContaine
r.js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/layout/TabContainer.
js
release:  buildUtil. load (uri): ./../../release/dojo/dijit/Toolbar.js
release:  buildUtil. load (uri): ./../../release/dojo/plugins/core/Controls.js
release:  Interning strings for file: ../../release/dojo/dojo/dojo.js
release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/dojo.js
release:  Interning strings for file: ../../release/dojo/dojo/bioptic.js
release:  Interning strings for : ../../release/dojo/dojo/bioptic.js.uncompresse
d.js
release:      ../../release/dojo/dijit/form/templates/Button.html
release:      ../../release/dojo/dijit/form/templates/DropDownButton.html
release:      ../../release/dojo/dijit/form/templates/ComboButton.html
release:      ../../release/dojo/dijit/layout/templates/AccordionPane.html
release:      ../../release/dojo/dijit/layout/templates/TabContainer.html
release:      ../../release/dojo/dijit/layout/templates/_TabButton.html
release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/bioptic.js
release:  Files baked into this build:

dojo.js:
./jslib/dojoGuardStart.jsfrag
./../../dojo/_base/_loader/bootstrap.js
./../../dojo/_base/_loader/loader.js
./../../dojo/_base/_loader/hostenv_browser.js
./../../release/dojo/dojo/_base/lang.js
./../../release/dojo/dojo/_base/declare.js
./../../release/dojo/dojo/_base/connect.js
./../../release/dojo/dojo/_base/Deferred.js
./../../release/dojo/dojo/_base/json.js
./../../release/dojo/dojo/_base/array.js
./../../release/dojo/dojo/_base/Color.js
./../../release/dojo/dojo/_base.js
./../../release/dojo/dojo/_base/window.js
./../../release/dojo/dojo/_base/event.js
./../../release/dojo/dojo/_base/html.js
./../../release/dojo/dojo/_base/NodeList.js
./../../release/dojo/dojo/_base/query.js
./../../release/dojo/dojo/_base/xhr.js
./../../release/dojo/dojo/_base/fx.js
./../../release/dojo/dojo/_base/browser.js
./jslib/dojoGuardEnd.jsfrag

bioptic.js:
./../../release/dojo/dijit/_base/focus.js
./../../release/dojo/dijit/_base/manager.js
./../../release/dojo/dojo/AdapterRegistry.js
./../../release/dojo/dijit/_base/place.js
./../../release/dojo/dijit/_base/window.js
./../../release/dojo/dijit/_base/popup.js
./../../release/dojo/dijit/_base/scroll.js
./../../release/dojo/dijit/_base/sniff.js
./../../release/dojo/dijit/_base/typematic.js
./../../release/dojo/dijit/_base/wai.js
./../../release/dojo/dijit/_base.js
./../../release/dojo/dijit/_Widget.js
./../../release/dojo/dijit/_Container.js
./../../release/dojo/dijit/layout/_LayoutWidget.js
./../../release/dojo/dojo/regexp.js
./../../release/dojo/dojo/cookie.js
./../../release/dojo/dojo/string.js
./../../release/dojo/dojo/date/stamp.js
./../../release/dojo/dojo/parser.js
./../../release/dojo/dijit/_Templated.js
./../../release/dojo/dijit/layout/BorderContainer.js
./../../release/dojo/dijit/layout/LayoutContainer.js
./../../release/dojo/dojo/fx.js
./../../release/dojo/dijit/form/_FormWidget.js
./../../release/dojo/dijit/form/Button.js
./../../release/dojo/dijit/Menu.js
./../../release/dojo/dojo/i18n.js
./../../release/dojo/dijit/layout/StackContainer.js
./../../release/dojo/dojo/html.js
./../../release/dojo/dijit/layout/ContentPane.js
./../../release/dojo/dijit/layout/AccordionContainer.js
./../../release/dojo/dijit/layout/SplitContainer.js
./../../release/dojo/dijit/layout/TabContainer.js
./../../release/dojo/dijit/Toolbar.js
./../../release/dojo/plugins/core/WidgetFramework.js
./../../release/dojo/plugins/core/Controls.js

release:  Interning strings for: ../../release/dojo/dijit
release:  Interning strings for : ../../release/dojo/dijit/ColorPalette.js
release:      ../../release/dojo/dijit/templates/ColorPalette.html
release:  Interning strings for : ../../release/dojo/dijit/Dialog.js
release:      ../../release/dojo/dijit/templates/Dialog.html
release:      ../../release/dojo/dijit/templates/TooltipDialog.html
release:  Interning strings for : ../../release/dojo/dijit/form/Button.js
release:      ../../release/dojo/dijit/form/templates/Button.html
release:      ../../release/dojo/dijit/form/templates/DropDownButton.html
release:      ../../release/dojo/dijit/form/templates/ComboButton.html
release:  Interning strings for : ../../release/dojo/dijit/form/CheckBox.js
release:      ../../release/dojo/dijit/form/templates/CheckBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/ComboBox.js
release:      ../../release/dojo/dijit/form/templates/ComboBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/Slider.js
release:      ../../release/dojo/dijit/form/templates/HorizontalSlider.html
release:      ../../release/dojo/dijit/form/templates/VerticalSlider.html
release:  Interning strings for : ../../release/dojo/dijit/form/TextBox.js
release:      ../../release/dojo/dijit/form/templates/TextBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/ValidationTextBo
x.js
release:      ../../release/dojo/dijit/form/templates/ValidationTextBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/_Spinner.js
release:      ../../release/dojo/dijit/form/templates/Spinner.html
release:  Interning strings for : ../../release/dojo/dijit/InlineEditBox.js
release:      ../../release/dojo/dijit/templates/InlineEditBox.html
release:  Interning strings for : ../../release/dojo/dijit/layout/AccordionConta
iner.js
release:      ../../release/dojo/dijit/layout/templates/AccordionPane.html
release:  Interning strings for : ../../release/dojo/dijit/layout/TabContainer.js
release:      ../../release/dojo/dijit/layout/templates/TabContainer.html
release:      ../../release/dojo/dijit/layout/templates/_TabButton.html
release:  Interning strings for : ../../release/dojo/dijit/ProgressBar.js
release:      ../../release/dojo/dijit/templates/ProgressBar.html
release:  Interning strings for : ../../release/dojo/dijit/TitlePane.js
release:      ../../release/dojo/dijit/templates/TitlePane.html
release:  Interning strings for : ../../release/dojo/dijit/Tooltip.js
release:      ../../release/dojo/dijit/templates/Tooltip.html
release:  Interning strings for : ../../release/dojo/dijit/Tree.js
release:      ../../release/dojo/dijit/_tree/Node.html
release:      ../../release/dojo/dijit/_tree/Tree.html
release:  Interning strings for : ../../release/dojo/dijit/_Calendar.js
release:      ../../release/dojo/dijit/templates/Calendar.html
release:  Interning strings for : ../../release/dojo/dijit/_TimePicker.js
release:      ../../release/dojo/dijit/templates/TimePicker.html
release:  Interning strings for: ../../release/dojo/dojox
release:  Interning strings for : ../../release/dojo/dojox/av/widget/PlayButton.js
release:      ../../release/dojo/dojox/av/widget/resources/PlayButton.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/Player.js
release:      ../../release/dojo/dojox/av/widget/resources/Player.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/ProgressSlider.js
release:      ../../release/dojo/dojox/av/widget/resources/ProgressSlider.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/Status.js
release:      ../../release/dojo/dojox/av/widget/resources/Status.html
release:  Interning strings for : ../../release/dojo/dojox/av/widget/VolumeButton.js
release:      ../../release/dojo/dojox/av/widget/resources/VolumeButton.html
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/FileView.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/FileView.html
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/FlickrViewList.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/FlickrViewList.html
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/PicasaView.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/PicasaView.html
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/PicasaViewList.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/PicasaViewList.html
release:  Interning strings for : ../../release/dojo/dojox/editor/plugins/TablePlugins.js
release:      ../../release/dojo/dojox/editor/plugins/resources/insertTable.html
release:      ../../release/dojo/dojox/editor/plugins/resources/modifyTable.html
release:  Interning strings for : ../../release/dojo/dojox/form/CheckedMultiSelect.js
release:      ../../release/dojo/dojox/form/resources/_CheckedMultiSelectItem.html
release:      ../../release/dojo/dojox/form/resources/CheckedMultiSelect.html
release:  Interning strings for : ../../release/dojo/dojox/form/DropDownSelect.js
release:      ../../release/dojo/dojox/form/resources/DropDownSelect.html
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
release:  Interning strings for : ../../release/dojo/dojox/grid/compat/VirtualGr
id.js
release:      ../../release/dojo/dojox/grid/compat/resources/VirtualGrid.html
release:  Interning strings for : ../../release/dojo/dojox/grid/compat/_grid/vie
w.js
release:      ../../release/dojo/dojox/grid/compat/resources/GridView.html
release:  Interning strings for : ../../release/dojo/dojox/grid/_Grid.js
release:      ../../release/dojo/dojox/grid/resources/_Grid.html
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
release:  Interning strings for : ../../release/dojo/dojox/layout/GridContainer.
js
release:      ../../release/dojo/dojox/layout/resources/GridContainer.html
release:  Interning strings for : ../../release/dojo/dojox/layout/ScrollPane.js
release:      ../../release/dojo/dojox/layout/resources/ScrollPane.html
release:  Interning strings for : ../../release/dojo/dojox/presentation/_base.js

release:      ../../release/dojo/dojox/presentation/resources/Show.html
release:      ../../release/dojo/dojox/presentation/resources/Slide.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Calendar.js
release:      ../../release/dojo/dojox/widget/Calendar/Calendar.html
release:      ../../release/dojo/dojox/widget/Calendar/CalendarDay.html
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
release:  Interning strings for : ../../release/dojo/dojox/widget/FilePicker.lay
out8-7.js
release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Pager.js
release:      ../../release/dojo/dojox/widget/Pager/Pager.html
release:  Interning strings for : ../../release/dojo/dojox/widget/SortList.js
release:      ../../release/dojo/dojox/widget/SortList/SortList.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
on.js
release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
release:  Interning strings for: ../../release/dojo/plugins
release:  Interning strings for : ../../release/dojo/plugins/workflow/js/workflo
w.js
release:      ../../release/dojo/plugins/workflow/templates/newWorkflowTab.tmpl
release:  Interning strings for: ../../release/dojo/dojo
release:  Build is in directory: ../../release/dojo
Build time: 93.891 seconds

C:\DATA\base\html\Bioptic2\html\dojo.1.2.2\util\buildscripts>


BUILD FAILED WITH ERROR:

build plugins:

                "plugins.core.WidgetFramework",
                "plugins.core.Controls",
                "plugins.projects.Controller",
                "plugins.workflow.Controller"

error:

    org.mozilla.javascript.WrappedException: Wrapped java.lang.RuntimeException
        at org.mozilla.javascript.Context.throwAsScriptRuntimeEx(Context.java:1812)


C:\DATA\base\html\Bioptic2\html\dojo.1.2.2\util\buildscripts>java -jar ..\shrink
safe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.3
" > build_log1.txt

org.mozilla.javascript.WrappedException: Wrapped java.lang.RuntimeException
        at org.mozilla.javascript.Context.throwAsScriptRuntimeEx(Context.java:18
12)
        at org.mozilla.javascript.MemberBox.invoke(MemberBox.java:170)
        at org.mozilla.javascript.NativeJavaMethod.call(NativeJavaMethod.java:24
3)
        at org.mozilla.javascript.optimizer.OptRuntime.callN(OptRuntime.java:86)

        at org.mozilla.javascript.gen.c4._c32(Unknown Source)
        at org.mozilla.javascript.gen.c4.call(Unknown Source)
        at org.mozilla.javascript.optimizer.OptRuntime.callN(OptRuntime.java:86)

        at org.mozilla.javascript.gen.c1._c3(Unknown Source)
        at org.mozilla.javascript.gen.c1.call(Unknown Source)
        at org.mozilla.javascript.optimizer.OptRuntime.call0(OptRuntime.java:57)

        at org.mozilla.javascript.gen.c1._c0(Unknown Source)
        at org.mozilla.javascript.gen.c1.call(Unknown Source)
        at org.mozilla.javascript.ContextFactory.doTopCall(ContextFactory.java:3
93)
        at org.mozilla.javascript.ScriptRuntime.doTopCall(ScriptRuntime.java:283
7)
        at org.mozilla.javascript.gen.c1.call(Unknown Source)
        at org.mozilla.javascript.gen.c1.exec(Unknown Source)
        at org.mozilla.javascript.tools.shell.Main.evaluateScript(Main.java:599)

        at org.mozilla.javascript.tools.shell.Main.processFileSecure(Main.java:4
90)
        at org.mozilla.javascript.tools.shell.Main.processFile(Main.java:431)
        at org.mozilla.javascript.tools.shell.Main.processSource(Main.java:422)
        at org.mozilla.javascript.tools.shell.Main.processFiles(Main.java:184)
        at org.mozilla.javascript.tools.shell.Main$IProxy.run(Main.java:105)
        at org.mozilla.javascript.Context.call(Context.java:577)
        at org.mozilla.javascript.ContextFactory.call(ContextFactory.java:503)
        at org.mozilla.javascript.tools.shell.Main.exec(Main.java:167)
        at org.mozilla.javascript.tools.shell.Main.main(Main.java:145)
Caused by: java.lang.RuntimeException
        at org.mozilla.javascript.Decompiler.compress(Decompiler.java:1048)
        at org.mozilla.javascript.NativeFunction.compress(NativeFunction.java:94
)
        at org.mozilla.javascript.Context.compressScript(Context.java:1452)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
        at java.lang.reflect.Method.invoke(Unknown Source)
        at org.mozilla.javascript.MemberBox.invoke(MemberBox.java:155)
        ... 24 more

C:\DATA\base\html\Bioptic2\html\dojo.1.2.2\util\buildscripts>



BUILD OUTPUT (DOJO ONLY, NO PLUGINS):


C:\DATA\base\html\Bioptic2\html\dojo.1.2.2\util\buildscripts>java -jar ..\shrink
safe\custom_rhino.jar build.js profile="bioptic" action="release" version="0.2.3
"
release:  Using profile: profiles/bioptic.profile.js
release:  Using version number: 0.2.3 for the release.
release:  Deleting: ../../release/dojo
release:  Copying: ../../dojo/../dijit to: ../../release/dojo/dijit
release:  Copying: ../../dojo/../dojox to: ../../release/dojo/dojox
release:  Copying: ../../dojo/../../plugins to: ../../release/dojo/plugins
release:  Copying: ../../dojo to: ../../release/dojo/dojo
release:  Building dojo.js and layer files
release:  XXXX HERE
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/lang.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/declare.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/connect.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/Deferred.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/json.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/array.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/Color.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/browser.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/window.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/event.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/html.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/NodeList.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/query.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/xhr.js
release:  buildUtil. load (uri): ./../../release/dojo/dojo/_base/fx.js
release:  Interning strings for file: ../../release/dojo/dojo/dojo.js
release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/dojo.js
release:  Interning strings for file: ../../release/dojo/dojo/bioptic.js
release:  Optimizing (shrinksafe) file: ../../release/dojo/dojo/bioptic.js
release:  Files baked into this build:

dojo.js:
./jslib/dojoGuardStart.jsfrag
./../../dojo/_base/_loader/bootstrap.js
./../../dojo/_base/_loader/loader.js
./../../dojo/_base/_loader/hostenv_browser.js
./../../release/dojo/dojo/_base/lang.js
./../../release/dojo/dojo/_base/declare.js
./../../release/dojo/dojo/_base/connect.js
./../../release/dojo/dojo/_base/Deferred.js
./../../release/dojo/dojo/_base/json.js
./../../release/dojo/dojo/_base/array.js
./../../release/dojo/dojo/_base/Color.js
./../../release/dojo/dojo/_base.js
./../../release/dojo/dojo/_base/window.js
./../../release/dojo/dojo/_base/event.js
./../../release/dojo/dojo/_base/html.js
./../../release/dojo/dojo/_base/NodeList.js
./../../release/dojo/dojo/_base/query.js
./../../release/dojo/dojo/_base/xhr.js
./../../release/dojo/dojo/_base/fx.js
./../../release/dojo/dojo/_base/browser.js
./jslib/dojoGuardEnd.jsfrag

bioptic.js:


release:  Interning strings for: ../../release/dojo/dijit
release:  Interning strings for : ../../release/dojo/dijit/ColorPalette.js
release:      ../../release/dojo/dijit/templates/ColorPalette.html
release:  Interning strings for : ../../release/dojo/dijit/Dialog.js
release:      ../../release/dojo/dijit/templates/Dialog.html
release:      ../../release/dojo/dijit/templates/TooltipDialog.html
release:  Interning strings for : ../../release/dojo/dijit/form/Button.js
release:      ../../release/dojo/dijit/form/templates/Button.html
release:      ../../release/dojo/dijit/form/templates/DropDownButton.html
release:      ../../release/dojo/dijit/form/templates/ComboButton.html
release:  Interning strings for : ../../release/dojo/dijit/form/CheckBox.js
release:      ../../release/dojo/dijit/form/templates/CheckBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/ComboBox.js
release:      ../../release/dojo/dijit/form/templates/ComboBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/Slider.js
release:      ../../release/dojo/dijit/form/templates/HorizontalSlider.html
release:      ../../release/dojo/dijit/form/templates/VerticalSlider.html
release:  Interning strings for : ../../release/dojo/dijit/form/TextBox.js
release:      ../../release/dojo/dijit/form/templates/TextBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/ValidationTextBo
x.js
release:      ../../release/dojo/dijit/form/templates/ValidationTextBox.html
release:  Interning strings for : ../../release/dojo/dijit/form/_Spinner.js
release:      ../../release/dojo/dijit/form/templates/Spinner.html
release:  Interning strings for : ../../release/dojo/dijit/InlineEditBox.js
release:      ../../release/dojo/dijit/templates/InlineEditBox.html
release:  Interning strings for : ../../release/dojo/dijit/layout/AccordionConta
iner.js
release:      ../../release/dojo/dijit/layout/templates/AccordionPane.html
release:  Interning strings for : ../../release/dojo/dijit/layout/TabContainer.j
s
release:      ../../release/dojo/dijit/layout/templates/TabContainer.html
release:      ../../release/dojo/dijit/layout/templates/_TabButton.html
release:  Interning strings for : ../../release/dojo/dijit/ProgressBar.js
release:      ../../release/dojo/dijit/templates/ProgressBar.html
release:  Interning strings for : ../../release/dojo/dijit/TitlePane.js
release:      ../../release/dojo/dijit/templates/TitlePane.html
release:  Interning strings for : ../../release/dojo/dijit/Tooltip.js
release:      ../../release/dojo/dijit/templates/Tooltip.html
release:  Interning strings for : ../../release/dojo/dijit/Tree.js
release:      ../../release/dojo/dijit/_tree/Node.html
release:      ../../release/dojo/dijit/_tree/Tree.html
release:  Interning strings for : ../../release/dojo/dijit/_Calendar.js
release:      ../../release/dojo/dijit/templates/Calendar.html
release:  Interning strings for : ../../release/dojo/dijit/_TimePicker.js
release:      ../../release/dojo/dijit/templates/TimePicker.html
release:  Interning strings for: ../../release/dojo/dojox
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
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Fi
leView.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/FileView.htm
l
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Fl
ickrViewList.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/FlickrViewLi
st.html
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Pi
casaView.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/PicasaView.h
tml
release:  Interning strings for : ../../release/dojo/dojox/data/demos/widgets/Pi
casaViewList.js
release:      ../../release/dojo/dojox/data/demos/widgets/templates/PicasaViewLi
st.html
release:  Interning strings for : ../../release/dojo/dojox/editor/plugins/TableP
lugins.js
release:      ../../release/dojo/dojox/editor/plugins/resources/insertTable.html

release:      ../../release/dojo/dojox/editor/plugins/resources/modifyTable.html

release:  Interning strings for : ../../release/dojo/dojox/form/CheckedMultiSele
ct.js
release:      ../../release/dojo/dojox/form/resources/_CheckedMultiSelectItem.ht
ml
release:      ../../release/dojo/dojox/form/resources/CheckedMultiSelect.html
release:  Interning strings for : ../../release/dojo/dojox/form/DropDownSelect.j
s
release:      ../../release/dojo/dojox/form/resources/DropDownSelect.html
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
release:  Interning strings for : ../../release/dojo/dojox/grid/compat/VirtualGr
id.js
release:      ../../release/dojo/dojox/grid/compat/resources/VirtualGrid.html
release:  Interning strings for : ../../release/dojo/dojox/grid/compat/_grid/vie
w.js
release:      ../../release/dojo/dojox/grid/compat/resources/GridView.html
release:  Interning strings for : ../../release/dojo/dojox/grid/_Grid.js
release:      ../../release/dojo/dojox/grid/resources/_Grid.html
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
release:  Interning strings for : ../../release/dojo/dojox/layout/GridContainer.
js
release:      ../../release/dojo/dojox/layout/resources/GridContainer.html
release:  Interning strings for : ../../release/dojo/dojox/layout/ScrollPane.js
release:      ../../release/dojo/dojox/layout/resources/ScrollPane.html
release:  Interning strings for : ../../release/dojo/dojox/presentation/_base.js

release:      ../../release/dojo/dojox/presentation/resources/Show.html
release:      ../../release/dojo/dojox/presentation/resources/Slide.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Calendar.js
release:      ../../release/dojo/dojox/widget/Calendar/Calendar.html
release:      ../../release/dojo/dojox/widget/Calendar/CalendarDay.html
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
release:  Interning strings for : ../../release/dojo/dojox/widget/FilePicker.lay
out8-7.js
release:      ../../release/dojo/dojox/widget/FilePicker/_FileInfoPane.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Pager.js
release:      ../../release/dojo/dojox/widget/Pager/Pager.html
release:  Interning strings for : ../../release/dojo/dojox/widget/SortList.js
release:      ../../release/dojo/dojox/widget/SortList/SortList.html
release:  Interning strings for : ../../release/dojo/dojox/widget/Wizard.js
release:      ../../release/dojo/dojox/widget/Wizard/Wizard.html
release:  Interning strings for : ../../release/dojo/dojox/xmpp/widget/ChatSessi
on.js
release:      ../../release/dojo/dojox/xmpp/widget/templates/ChatSession.html
release:  Interning strings for: ../../release/dojo/plugins
release:  Interning strings for : ../../release/dojo/plugins/workflow/js/workflo
w.js
release:      ../../release/dojo/plugins/workflow/templates/newWorkflowTab.tmpl
release:  Interning strings for: ../../release/dojo/dojo
release:  Build is in directory: ../../release/dojo
Build time: 72.391 seconds





</entry>
