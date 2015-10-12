agua.archive.3

<entry [Thu 2011:07:21 05:38:03 EST] FIXED BACKSLASH IN plugins.form.EditRow/EditForm>

Fixed backslash escape for plugins.form.EditRow/EditForm.

editRow : function (rowWidget, node) {
/*
	EDIT PARAMETER ROW FUNCTIONALITY:
	
		1. SAVE IF 'RETURN' PRESSED,
	
		2. EXIT WITHOUT CHANGES IF 'ESCAPE' PRESSED

	
	CONVERSION OF BACKSLASHES:
		
		1. EVERY '\' VISIBLE IN HTML IS ACTUALLY '\\'
		
		2. THIS '\\' DISPLAYS AS A '\' WHEN INSERTED INTO THE TEXTAREA

		3. CONVERT INTO A '\\\\' IN THE MYSQL INSERT COMMAND

*/


Refactored ParameterRow to inherit from plugins.form modules.

REM: Implementing class must do conversion from '\\\\' to '\\' of all values from MySQL on server

I.E., IN Parameters.loadTiltlePane ADDED THIS .replace:


    // USE String TO CONVERT '\\\\' INTO '\\'
    parameter[key] = parameters[i][key].replace(/\\\\/g, '\\');

    
</entry>
<entry [Wed 2011:07:20 19:12:19 EST] DEBUGGING ON CHROME>

Web Developer toolbar for FF or Chrome and Pendule for Chrome all have the ability to reload CSS and JS from the source without reloading the HTM .
    
http://stackoverflow.com/questions/5481197/browser-debugging-how-can-i-get-the-browser-to-reload-the-response-from-the-ser


</entry>
<entry [Wed 2011:07:20 02:59:20 EST] DOJOX HIGHLIGHT>

dojox.highlight

client-side syntax highlighting for a number of languages.

NOTE: All languages listed here have working language definitions, though not all exist in the release or dojo subversion. The missing packs are not publically available.
    
</entry>
<entry [Wed 2011:07:20 02:39:16 EST] dojoc.util.reloader - DYNAMIC DEBUGGING WITHOUT RELOADING WHOLE PAGE>

***NB***: MODIFIED dojo._base._loader.hostenv_browser._getText 

FLASHCARDS:
http://www.yoyobrain.com/flashcards/show/149769


RELOAD PARAMETER ROW
dojo.reload("plugins.workflow.ParameterRow");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();


RELOAD APPS
dojo.reload("plugins.workflow.SharedApps");
dojo.reload("plugins.core.Data");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();



NB: HAD TO MODIFY THE DOJO SOURCE CODE BY ADDING TO dojo._base._loader.hostenv_browser._getText AT LINE 160:

			if ( d == null ) 	d = dojo;

THE FULL TEXT:


		d._getText = function(/*URI*/ uri, /*Boolean*/ fail_ok){
			// summary: Read the contents of the specified uri and return those contents.
			// uri:
			//		A relative or absolute uri. If absolute, it still must be in
			//		the same "domain" as we are.
			// fail_ok:
			//		Default false. If fail_ok and loading fails, return null
			//		instead of throwing.
			// returns: The response text. null is returned when there is a
			//		failure and failure is okay (an exception otherwise)

			// NOTE: must be declared before scope switches ie. this._xhrObj()


			//console.log("dojo._base.loader.hostenv_browser._getText   dojo._base.loader.hostenv_browser._getText(uri, fail_ok)");
			//console.log("dojo._base.loader.hostenv_browser._getText   uri: " + uri);
			//console.log("dojo._base.loader.hostenv_browser._getText   fail_ok: " + fail_ok);
			//console.log("dojo._base.loader.hostenv_browser._getText   d: " + d);
			if ( d == null ) 	d = dojo;

			var http = d._xhrObj();

			if(!hasBase && dojo._Url){
				uri = (new dojo._Url(owloc, uri)).toString();
			}

			if(d.config.cacheBust){
				//Make sure we have a string before string methods are used on uri
				uri += "";
				uri += (uri.indexOf("?") == -1 ? "?" : "&") + String(d.config.cacheBust).replace(/\W+/g,"");
			}

			http.open('GET', uri, false);
			try{
				http.send(null);
				if(!d._isDocumentOk(http)){
					var err = Error("Unable to load "+uri+" status:"+ http.status);
					err.status = http.status;
					err.responseText = http.responseText;
					throw err;
				}
			}catch(e){
				if(fail_ok){ return null; } // null
				// rethrow the exception
				throw e;
			}
			return http.responseText; // String
		}




DOJOC

http://svn.dojotoolkit.org/dojoc/

DojoC¶
DojoC is DojoCampus’s “personal” subversion repository, also known as DojoCommunity repo. It acts as a sandbox for committers and contributors to work together in a public area.

There is no ‘versioning’ taking place in DojoC, it is all provided via subversion from a single url:

http://svn.dojotoolkit.org/dojoc/

All work in DojoC is still covered under Contributor License Agreement (CLA), so if you would like write access and have a CLA on file, contact a Campus Editor in #dojo (irc.freenode.net) - Nikolai (nonken) Onken, or Peter (phiggins) Higgins are usually lurking about to answer any questions you might have.

What’s in DojoC?

Lots of experimental code, and all the DojoCampus widgets and code. For instance, the FeatureExplorer source is available in explorer/ ... There are several partially working Adobe AIR demos in demos/air/, and several widgets in sandbox/







http://www.liucougar.net/blog/archives/90

You can find the code in dojoc.util.loader, the function is actually called dojo.reloadPage(). The normal use case for this is:

dojo.reload any modules you modified and want to test;
dojo.reloadPage to actually test them without waiting for reloading all js files/reloading your browser window.
Note: dojo.reloadPage only works if it is included in the initial page load, if you dojo.require dojoc.util.loader after the page is loaded, dojo.reloadPage won’t work (see comment at the beginning of the file to know why)

dojo.reload now also resides in dojoc.util.loader, and compared to the previous version, two additional features are add:

DojoC\u00b6
DojoC is DojoCampus\u2019s \u201cpersonal\u201d subversion repository, also known as DojoCommunity repo. It acts as a sandbox for committers and contributors to work together in a public area.

There is no \u2018versioning\u2019 taking place in DojoC, it is all provided via subversion from a single url:

http://svn.dojotoolkit.org/dojoc/

All work in DojoC is still covered under Contributor License Agreement (CLA), so if you would like write access and have a CLA on file, contact a Campus Editor in #dojo (irc.freenode.net) - Nikolai (nonken) Onken, or Peter (phiggins) Higgins are usually lurking about to answer any questions you might have.

What\u2019s in DojoC?

Lots of experimental code, and all the DojoCampus widgets and code. For instance, the FeatureExplorer source is available in explorer/ ... There are several partially working Adobe AIR demos in demos/air/, and several widgets in sandbox/Partial module name match: now you just need to type in a partial name of the module you want to reload, if it only matches one module already loaded, that module will be reloaded. If there are multiple matches, it will list all possible modules and error out.
Automatically remove cache of dijit template: if a module references widget template files (using templatePath), these cached templates will be cleared automatically, so next time you create such a dijit, the new template will be loaded from your sever directly.
A new function to reload css files is also included in dojoc.util.loader, dojo.reloadCss, which also supports partial name match. If it is given no argument, it will reload all css files in the page (with a href attribute, of course), similar to ReCSS feature in the firebug lite shipped with dojo core.

Warning: use at your own risk.



THIS DOES NOT ALLOW ME TO ACCESS THE WIDGET CREATED BY THE INITALLY LOADED MODULE:

dojo.require("dojo.io.script");
function reload (moduleName) {

    var path = moduleName;
    path = path.replace(/\./g, "/");
    var localtime = new Date().getTime();
    var url = "http://localhost/agua/0.6/" + path + ".js";
    
    console.log("url: " + url);
    var args = {
        url: url,
        callbackParamName: "callback",
        content: {
            localtime: localtime
        },
        load: function(data) {
            console.log("loaded data: " + dojo.toJson(data));

        },
        error: function(error) {
            console.log("An unexpected error occurred: " + error);
        }
    };

    console.log("Doing dojo.io.script.get(args)");
    dojo.io.script.get(args);
}

reload("plugins.workflow.ParameterRow");






1. USE PHOENIX PLUGIN FOR FIREFOX

2. RELOAD THE .js FILE ONLY USING A script TAG

Add a string at the end of your URL to break the cache. I usually do (with PHP):

< script src="/my/js/file.js?< ?=time()?>">< /script>

OR

< script src="/my/js/file.js?version=2.1.3" >< /script>

So that it reloads every time while I'm working on it, and then take it off when it goes into production. In reality I abstract this out a little more but the idea remains the same.

If you check out the source of this website, they append the revision number at the end of the URL in a similar fashion to force the changes upon us whenever they update the javascript files.

dojo.io.script
--------------

This is an alternate IO mechanism to dojo.xhrGet that has the capability of doing cross-site data access. It accomplishes this feat by doing an IO call via a dynamically inserted < SCRIPT> tag into your web page.


function searchGoogle() {
        //Look up the node we'll stick the text under.
        var targetNode = dojo.byId("results");

        //The parameters to pass to xhrGet, the url, how to handle it, and the callbacks.
        var jsonpArgs = {
            url: "http://ajax.googleapis.com/ajax/services/search/web",
            callbackParamName: "callback",
            content: {
                v: "1.0",
                q: "dojo toolkit"
            },
            load: function(data) {
                //Set the data from the search into the viewbox in nicely formatted JSON
                targetNode.innerHTML = "<pre>" + dojo.toJson(data, true) + "</pre>";
            },
            error: function(error) {
                targetNode.innerHTML = "An unexpected error occurred: " + error;
            }
        };
        dojo.io.script.get(jsonpArgs);
    }
    dojo.addOnLoad(searchGoogle);






HTML:

<!--

<b>
    Google Search Results for 'dojo toolkit' (In JSON):
</b>
<div id="results" style="height: 200px;">
</div>

-->



    
</entry>
<entry [Wed 2011:07:20 01:17:19 EST] HANDLE BACKSLASH AND OTHER HTML/TEXT ISSUES>

plugins.admin.Parameter AND plugins.form.EditForm DO THE FOLLOWING:

plugins.admin.Parameter.checkInputs

    value = this.convertAngleBrackets(value, "htmlToText");
    value = this.convertBackslash(value, "textToHtml");


plugins.form.EditForm.editRow

	// GET THE TEXT VALUE
	var text = node.innerHTML;
	text = this.convertString(text, "htmlToText");

    
</entry>
<entry [Wed 2011:07:20 01:16:00 EST] WEB SERVICES - REST, ETC.>

http://en.wikipedia.org/wiki/Web_service
    
</entry>
<entry [Tue 2011:07:19 19:20:35 EST] DOWNLOAD REFERENCE FILES>

1. DOWNLOAD GZIP FILES

/nethome/bioinfo/apps/agua/0.4/bin/apps/utils/deepvac.pl
--url http://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/
--regex chr[0-9MYX]+.fa.gz
--type text

2. UNZIP FILES AND MOVE TO REFERENCE DIR

./unzipFiles.pl \
--type gunzip \
--inputdir /nethome/syoung/agua/Project1/Workflow1/downloads \
--outputdir /data/sequence/reference/human/hg19/fasta \
--regex chr[0-9MYX]+.fa.gz 



    
</entry>
<entry [Tue 2011:07:19 08:25:51 EST] CONVERT ALIGNER MODULES TO NEW ENVARS SYSTEM>

1. ADD TO TOP OF CLASS THE FOLLOWING VARIABLES:

# BOOLEAN
has 'clean'		=> ( isa => 'Bool|Undef', is => 'rw', default => '' );

# INTS
has 'walltime'	=> ( isa => 'Int|Undef', is => 'rw', default => 24 );

# STRINGS
has 'username'  => ( isa => 'Str|Undef', is => 'rw' );
has 'cluster'	=> ( isa => 'Str|Undef', is => 'rw' );
has 'splitfile'		=> ( isa => 'Str|Undef', is => 'rw', default => '' );


# OBJECTS
has 'splitfiles'=> ( isa => 'ArrayRef|Undef', is => 'rw' );
has 'conf' 	=> (
	is =>	'rw',
	'isa' => 'Conf::Agua',
	default	=>	sub { Conf::Agua->new(	backup	=>	1, separator => "\t"	);	}
);
has 'dbobject'	=> ( isa => 'Maybe;', is => 'rw', required => 0 );


NB: REMOVE THIS:

has 'conf'		=> ( isa => 'HashRef', is => 'rw', default => '' );


3. ADD TO TOP:

use Agua::DBaseFactory;
use Agua::DBase::MySQL;




REMOVE THE FOLLOWING COMMENTED-OUT SUBROUTINE CALLS FROM ELAND.pm

	################################################
	#######        FILTER SAM HITS          ######
	################################################
	#print "ELAND::run    Doing chromosomeHits        ", Timer::current_datetime(), "\n";
	#$self->chromosomeHits($outputdir, $references, $splitfiles, "out.sam", "hit.sam", "miss.sam");
	#print "ELAND::run    After chromosomeHits        ", Timer::current_datetime(), "\n";


#### READ HIT STATS

	###############################################
	###########        READ HITS         ##########
	###############################################
	#if ( defined $readhits )
	#{
	#	print "ELAND::runReadHits    Doing readHits()   ", Timer::current_datetime(), "\n";
	#	$self->readHits($outputdir, $references, $splitfiles, "eland-readHits", "hit.sam");
	#	print "ELAND::runReadHits    After readHits()   ", Timer::current_datetime(), "\n";
	#}
	
#### SNP CALLING

	###############################################
	#####     PREDICT SNPs WITH SAMTOOLS     ######
	###############################################
	#print "ELAND::run    Doing samtoolSnps      ", Timer::current_datetime(), "\n";
	#$self->samtoolSnps($splitfiles, $references, $outputdir, "hit.sam");
	#print "ELAND::run    After samtoolSnps      ", Timer::current_datetime(), "\n";


#### USAGE STATS

	###############################################
	#####          PRINT USAGE STATS         ######
	###############################################
	#print "ELAND::run    Doing printUsage       ", Timer::current_datetime(), "\n";
	#my $usagefile = "$outputdir/ELAND-USAGE.txt";
	#$self->printUsage($usagefile);
	#print "ELAND::run    After printUsage       ", Timer::current_datetime(), "\n";

   
    
</entry>
<entry [Mon 2011:07:18 04:46:33 EST] LIST OF BAD TRACKS IN JBROWSE hg19.mini>

REMOVED THE FOLLOWING FROM trackInfo.js BECAUSE THEY WERE VERTICALLY ALIGNED:

Assembly
Alt Events
Chromosome band (ideogram)
CpG islands
Gap
GWAS catalog
OMIM genes
Segmental Dups
tRNA genes



    
</entry>
<entry [Mon 2011:07:18 04:28:44 EST] POSSIBLE COUNTDOWN FOR VIEW ACTIVATION>

http://sam-i-am.com/work/sandbox/simplClock/test_DojoClock.html


    
    
</entry>
<entry [Sun 2011:07:17 22:21:21 EST] FAKE A RIGHT CLICK>
    
http://stackoverflow.com/questions/433919/javascript-simulate-right-click-through-code


I did some research, and it seems like you can fire a mouse event like is shown here, and make it a right-click by setting the button or which property to 2 (documented here).

Perhaps this code will work:

function rightClick(element){
  var evt = element.ownerDocument.createEvent('MouseEvents');

  var RIGHT_CLICK_BUTTON_CODE = 2; // the same for FF and IE

  evt.initMouseEvent('click', true, true,
      element.ownerDocument.defaultView, 1, 0, 0, 0, 0, false,
      false, false, false, RIGHT_CLICK_BUTTON_CODE, null);

  if (document.createEventObject){
    // dispatch for IE
    return element.fireEvent('onclick', evt)
  }
  else{
    // dispatch for firefox + others
    return !element.dispatchEvent(evt);
  }
}


Here is a more correct version if you do not care about where the context menu gets fired up

function fireContextMenu(el) {
  var evt = el.ownerDocument.createEvent("HTMLEvents")
  evt.initEvent('contextmenu', true, true) // bubbles = true, cancelable = true

  if (document.createEventObject) {
    return el.fireEvent('oncontextmenu', evt)
  }
  else {
    return !el.dispatchEvent(evt)
  }
}
If you do, we may have to use the previous one, fix up it's behaviour in IE, and populate the screenX, screenY, clientX, clientY etc appropriately



If you are using jQuery, right-clicking an element is even simpler: $(your_element).trigger('contextmenu'); – sunaku Jan 19 at 5:58
feedback
up vote
1
down vote
Just for good measure, here is a bit of doco on the parameters:

var myEvt = document.createEvent('MouseEvents');
myEvt.initMouseEvent(
   'click'          // event type
   ,true           // can bubble?
   ,true           // cancelable?
   ,window      // the event's abstract view (should always be window)
   ,1              // mouse click count (or event "detail")
   ,100           // event's screen x coordinate
   ,200           // event's screen y coordinate
   ,100           // event's client x coordinate
   ,200           // event's client y coordinate
   ,false         // whether or not CTRL was pressed during event
   ,false         // whether or not ALT was pressed during event
   ,false         // whether or not SHIFT was pressed during event
   ,false         // whether or not the meta key was pressed during event
   ,1             // indicates which button (if any) caused the mouse event (1 = primary button)
   ,null          // relatedTarget (only applicable for mouseover/mouseout events)
);


FRAMEWORK-AGNOSTIC FAKE RIGHT CLICK

http://stackoverflow.com/questions/6157929/how-to-simulate-mouse-click-using-javascript/6158050#6158050

 function simulate(element, eventName)
    {
        var options = extend(defaultOptions, arguments[2] || {});
        var oEvent, eventType = null;

        for (var name in eventMatchers)
        {
            if (eventMatchers[name].test(eventName)) { eventType = name; break; }
        }

        if (!eventType)
            throw new SyntaxError('Only HTMLEvents and MouseEvents interfaces are supported');

        if (document.createEvent)
        {
            oEvent = document.createEvent(eventType);
            if (eventType == 'HTMLEvents')
            {
                oEvent.initEvent(eventName, options.bubbles, options.cancelable);
            }
            else
            {
                oEvent.initMouseEvent(eventName, options.bubbles, options.cancelable, document.defaultView,
          options.button, options.pointerX, options.pointerY, options.pointerX, options.pointerY,
          options.ctrlKey, options.altKey, options.shiftKey, options.metaKey, options.button, element);
            }
            element.dispatchEvent(oEvent);
        }
        else
        {
            options.clientX = options.pointerX;
            options.clientY = options.pointerY;
            var evt = document.createEventObject();
            oEvent = extend(evt, options);
            element.fireEvent('on' + eventName, oEvent);
        }
        return element;
    }

    function extend(destination, source) {
        for (var property in source)
          destination[property] = source[property];
        return destination;
    }

var eventMatchers = {
    'HTMLEvents': /^(?:load|unload|abort|error|select|change|submit|reset|focus|blur|resize|scroll)$/,
    'MouseEvents': /^(?:click|dblclick|mouse(?:down|up|over|move|out))$/
}
var defaultOptions = {
    pointerX: 0,
    pointerY: 0,
    button: 0,
    ctrlKey: false,
    altKey: false,
    shiftKey: false,
    metaKey: false,
    bubbles: true,
    cancelable: true
}
You can use it like this:

simulate(document.getElementById("btn"), "click");
Credits should go to kangax. Here's the original source (prototype.js specific).




AND ANOTHER


1
down vote
Here's a pure JS function which will simulate a click (or any mouse event) on a target element:

    function simulatedClick(target, options) {

            var event = target.ownerDocument.createEvent('MouseEvents'),
                options = options || {};

            //Set your default options to the right of ||
            var opts = {
                type: options.click                     || 'click',
                canBubble:options.canBubble             || true,
                cancelable:options.cancelable           || true,
                view:options.view                       || target.ownerDocument.defaultView, 
                detail:options.detail                   || 1,
                screenX:options.screenX                 || 0, //The coordinates within the entire page
                screenY:options.screenY                 || 0,
                clientX:options.clientX                 || 0, //The coordinates within the viewport
                clientY:options.clientY                 || 0,
                ctrlKey:options.ctrlKey                 || false,
                altKey:options.altKey                   || false,
                shiftKey:options.shiftKey               || false,
                metaKey:options.metaKey                 || false, //I *think* 'meta' is 'Cmd/Apple' on Mac, and 'Windows key' on Win. Not sure, though!
                button:options.button                   || 0, //0 = left, 1 = middle, 2 = right
                relatedTarget:options.relatedTarget     || null,
            }

            //Pass in the options
            event.initMouseEvent(
                opts.type,
                opts.canBubble,
                opts.cancelable,
                opts.view, 
                opts.detail,
                opts.screenX,
                opts.screenY,
                opts.clientX,
                opts.clientY,
                opts.ctrlKey,
                opts.altKey,
                opts.shiftKey,
                opts.metaKey,
                opts.button,
                opts.relatedTarget
            );

            //Fire the event
            target.dispatchEvent(event);
        }
Here's a working example: http://www.spookandpuff.com/examples/clickSimulation.html

You can simulate a click on any element in the DOM. Something like simulatedClick(document.getElementById('yourButtonId')) would work.

You can pass in an object into options to override the defaults (to simulate which mouse button you want, whether shift/alt/ctrl are held, etc.

I've tested in FF, Safari and Chrome. IE might need special treatment, I'm not sure.




</entry>
<entry [Sun 2011:07:17 21:19:25 EST] RIGHTCLICK MENU>


http://stackoverflow.com/questions/2195063/how-to-enable-the-browser-context-menu-in-dojox-grid-datagrid

DISABLE RIGHT CLICK

<!-- http://www.spacegun.co.uk -->

<!--

<SCRIPT language=JavaScript>

	var message = "function disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;
</SCRIPT>


-->

    
</entry>
<entry [Sat 2011:07:16 15:05:42 EST] FIXED DOWNLOAD USING plugins.UploadDialog>

http://en.wikipedia.org/wiki/MIME

Multipart messages

A MIME multipart message contains a boundary in the "Content-Type: " header; this boundary, which must not occur in any of the parts, is placed between the parts, and at the beginning and end of the body of the message, as follows:
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="frontier"

This is a message with multiple parts in MIME format.
--frontier
Content-Type: text/plain

This is the body of the message.
--frontier
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPHA+VGhpcyBpcyB0aGUg
Ym9keSBvZiB0aGUgbWVzc2FnZS48L3A+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--frontier--


Each part consists of its own content header (zero or more Content- header fields) and a body. Multipart content can be nested. The content-transfer-encoding of a multipart type must always be "7bit", "8bit" or "binary" to avoid the complications that would be posed by multiple levels of decoding. The multipart block as a whole does not have a charset; non-ASCII characters in the part headers are handled by the Encoded-Word system, and the part bodies can have charsets specified if appropriate for their content-type.
Notes:
Before the first boundary is an area that is ignored by MIME-compliant clients. This area is generally used to put a message to users of old non-MIME clients.
It is up to the sending mail client to choose a boundary string that doesn't clash with the body text. Typically this is done by inserting a long random string.
The last boundary must have two hyphens at the end.

    
</entry>
<entry [Fri 2011:07:15 05:39:40 EST] SHADOW ON SHAPE WITH -moz-box-shadow>

.claro .dijitDialog {
    -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    border: 1px solid #769DC0;
}
    
</entry>
<entry [Fri 2011:07:15 02:33:22 EST] FIXED CRON '/bin/sh: root: not found' PROBLEM>


tail -n 20 /var/mail/root

From root@Satellite-L355  Fri Jul 15 02:31:06 2011
Return-Path: <root@Satellite-L355>
X-Original-To: root
Delivered-To: root@Satellite-L355
Received: by Satellite-L355 (Postfix, from userid 0)
	id A2E87DC86BF; Fri, 15 Jul 2011 02:31:06 -0400 (EDT)
From: root@Satellite-L355 (Cron Daemon)
To: root@Satellite-L355
Subject: Cron <root@Satellite-L355> root    export MAILTO=""; /agua/0.6/bin/scripts/checkBalancers.pl > /tmp/loadbalancers.out
Content-Type: text/plain; charset=ANSI_X3.4-1968
X-Cron-Env: <SHELL=/bin/sh>
X-Cron-Env: <HOME=/root>
X-Cron-Env: <PATH=/usr/bin:/bin>
X-Cron-Env: <LOGNAME=root>
Message-Id: <20110715063106.A2E87DC86BF@Satellite-L355>
Date: Fri, 15 Jul 2011 02:31:06 -0400 (EDT)

/bin/sh: root: not found

    
</entry>
<entry [Thu 2011:07:14 21:31:29 EST] FIXED UPLOADER>

The New HTML5 Multi-File Uploader

http://dojotoolkit.org/documentation/tutorials/1.6/uploader/

Included with Dojo 1.6 is a completely new HTML5 multi-file uploader, a widget that creates a stylable file-input button, with optional multi-file selection, using only HTML elements. Non-HTML5 browsers have fallback options of Flash or an iframe.









NOTES
-----

http://wirehopper.com/dojo.io.php

<!--

HTML CODE:

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd"> 
<html> 
	<head> 
		<title>dojo AJAX file upload demonstration</title> 
		<script type="text/javascript" src="../../dojo-1.6.1/dojo/dojo.js"
			djConfig="dojoBlankHtmlUrl: 'blank.html',parseOnLoad: true"></script> 
		<script type="text/javascript"> 
		dojo.require("dojo.parser");
		dojo.require("dojo.io.iframe");
		function ioIframeGetJson(x){
			var td = dojo.io.iframe.send({
				url: "dojo.io.json.php5",
				form: "frmIO",
				method: "post",
				content: {fnx:x},
				timeoutSeconds: 5,
				preventCache: true,
				handleAs: "json",
				handle: function(res, ioArgs){
					if(res.status=='Good')
					{
						dojo.byId('status').innerHTML=res.status;
						dojo.byId('textdisplay').value=res.textdata;
					}
					else
						alert('Error1');
					},							
				error: function (res,ioArgs) {alert('Error2')}
			});
		}
		</script> 
		<style type="text/css"> 
		body
		{
			font-family:Verdana,arial,sans-serif;
			font-size:smaller;
			width:1024px;
			margin-left:auto;
			margin-right:auto;
		}
		h1
		{
			padding-bottom:5px;
			border-bottom: 2px dotted #000;
			text-align:center;
		}
		div
		{
		        border:1px dashed #999;
                        background-color:#eee;
			padding:5px;
			margin:5px;
		}
		#dText
		{
			margin-right:425px;
			height:515px;
		}
		#dForm
		{
			float:right;
			width:403px;
			margin-top:0px;
			height:515px;
		}
		blockquote
		{
			font-family:Courier,"Times Roman",serif;
			font-size:.9em;
			border:1px dotted #555;
			background-color:#fefefe;
		}
		
		
		</style> 
	</head> 
	<body> 
	<h1>dojo AJAX file upload demonstration</h1> 
	<div id="dForm"> 
	<h3>Form</h3> 
        <form name="frmIO" id="frmIO" enctype="multipart/form-data" method="post"> 
                <label for="fFile">Choose file</label> 
                <input type="file" name="fFile" id="fFile" /><br /> 
                <button onclick="ioIframeGetJson(1)" type="submit">Go</button> 
        </form> 
        <br /> 
        <strong>Status</strong>&nbsp;
        <span id="status">None</span> 
        <br /> 
	<strong>Response Text</strong> (formatted)<br /> 
        <textarea id="textdisplay" name="textdisplay" rows="10" cols="40"> 
        </textarea> 
        </div> 
	</body>
</htm >
	
	
    
Server-Side Code

<?php
ini_set('upload_max_filesize','1M');
ini_set('post_max_size','1M');

$sText='';
foreach ($_FILES as $k => $v)
{
$sText.=$k.'\n';
foreach ($v as $kk => $vv)
if ($kk != 'tmp_name')
$sText.=' '.$kk.'='.$vv.'\n';
}
?>
<html>
<head>
<script>isLoaded = true;</script>
</head>
<body>
<textarea>{'status':'Good','textdata':'<?php echo $sText; ?>'}</textarea>
</body>
</html>


-->
    
</entry>
<entry [Sun 2011:07:10 00:12:23 EST] FIX DND PROBLEM '_872.getItem(this.manager.nodes[i].id) is undefined'>

IN ADMIN TAB PARAMETERS PANEL WHEN CLICK ON DND NODES AFTER CREATING A NEW PARAMETER:

_872.getItem(this.manager.nodes[i].id) is undefined

    
    
</entry>
<entry [Fri 2011:07:08 23:56:22 EST] CLEANED OUT IMAGES AND SNAPSHOTS>


CLEAN UP SNAPSHOTS EXCEPT FOR
/data   snap-1f4f6770

starcluster-8 (MINUS /data AND /nethome)




CURRENT WORKING CLUSTER IMAGE

    # AMI for cluster nodes.
    # ami-b07985d9: EBS-BACKED 64-BIT U10.04 with HADOOP (CAN RUN t1.micro)
    NODE_IMAGE_ID=ami-b07985d9


LIST OF CURRENT IMAGES

ec2dim
IMAGE	ami-d08b75b9	558277860346/aquarius-8-cluster	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-7bf9d514	15	
IMAGE	ami-8e8678e7	558277860346/aquarius-8-cluster.2	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-79775916	15	
IMAGE	ami-38847a51	558277860346/aquarius-8-cluster.3	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-9df9d7f2	15	
IMAGE	ami-8e827ce7	558277860346/aquarius-8-cluster.4	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-1f4f6770	15	
IMAGE	ami-94f30cfd	558277860346/aquarius-8e-post-init	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-a9bf24c6	15	
BLOCKDEVICEMAPPING	/dev/sdh		snap-a7bf24c8	40	
BLOCKDEVICEMAPPING	/dev/sdi		snap-a5bf24ca	40	
IMAGE	ami-6688760f	558277860346/aquarius-8e-prefix-reboot	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-19daf676	15	
BLOCKDEVICEMAPPING	/dev/sdi		snap-1bdaf674	40	
BLOCKDEVICEMAPPING	/dev/sdh		snap-1ddaf672	40	
IMAGE	ami-c4e619ad	558277860346/aquarius-8e-presge	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-9ba8c9f4	15	
BLOCKDEVICEMAPPING	/dev/sdh		snap-99a8c9f6	40	
BLOCKDEVICEMAPPING	/dev/sdi		snap-97a8c9f8	40	
IMAGE	ami-fc847a95	558277860346/aquarius-8f	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-edd9f782	15	
BLOCKDEVICEMAPPING	/dev/sdi		snap-11d9f77e	40	
BLOCKDEVICEMAPPING	/dev/sdh		snap-13d9f77c	40	
IMAGE	ami-b07985d9	558277860346/starcluster-u10.04-64bit-hadoop	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-c54ef9aa	15	
IMAGE	ami-3a847a53	558277860346/starcluster-u10.04-hadoop.2	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-17f6d878	15	



REMOVE ami-d08b75b9 (moose mysql ec2) IMAGE AND SNAPSHOTS


    
</entry>
<entry [Fri 2011:07:08 22:08:37 EST] CONSOLIDATED AND EXPANDED /data/sequence VOLUME TO 100 GB>


VOLUMES
-------
/data       BLOCKDEVICE	/dev/sdh	vol-15599e7e	2011-05-20T14:30:54.000Z	
/nethome    BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-20T14:30:54.000Z	
/ AGUA      BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-20T14:30:54.000Z	


ec2din
RESERVATION	r-476e942b	558277860346	default
INSTANCE	i-b63811d9	ami-b07985d9	ec2-174-129-137-49.compute-1.amazonaws.com	ip-10-122-13-145.ec2.internal	running	aquarius	0		m1.large	2011-05-20T14:30:24+0000us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.137.49	10.122.13.145			ebs		
BLOCKDEVICE	/dev/sdh	vol-15599e7e	2011-05-20T14:30:54.000Z	
BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-20T14:30:54.000Z	
BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-20T14:30:54.000Z	
RESERVATION	r-53e4d83f	558277860346	@sc-syoung-smallcluster
INSTANCE	i-e35b7a8d	ami-8e827ce7	ec2-72-44-32-123.compute-1.amazonaws.com	ip-10-122-231-105.ec2.internal	running	id_rsa-admin-key	0		t1.micro	2011-06-24T08:24:49+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	72.44.32.123	10.122.231.105			ebs		
BLOCKDEVICE	/dev/sda1	vol-cb175aa0	2011-06-24T08:25:20.000Z	

root@ip-10-122-13-145:/data# df -a
    /dev/sdb1             414G  199M  393G   1% /mnt
    /dev/sdi               40G  7.0G   31G  19% /nethome
    /dev/sdh               40G   21G   18G  54% /data


1. MAKE SNAPSHOT OF /data VOLUME

ec2addsnap -d "Snapshot of 40G /data pre-consolidation" vol-15599e7e

    SNAPSHOT	snap-73997212	vol-15599e7e	pending	2011-07-09T02:16:57+0000		558277860346	40	Snapshot of 40G /data pre-consol


2. CREATE 100G VOLUME USING 40G SNAPSHOT

ec2addvol -s 100 snap-73997212 -z us-east-1a

    VOLUME	vol-71b9941a	100		us-east-1a	creating	2011-07-09T04:09:12+0000


3. DETACH OLD 40G VOLUME FROM HEADNODE

umount -l /data
ec2-detach-volume -f vol-15599e7e -i i-b63811d9

    ATTACHMENT	vol-15599e7e	i-b63811d9	/dev/sdh	detaching	2011-05-20T14:30:54+0000

CONFIRM ITS STATUS IS available:

ec2dvol vol-15599e7e

    VOLUME	vol-15599e7e	40	snap-55fe4a3f	us-east-1a	available	2011-04-30T08:32:18+0000


CONFIRM ITS NOT STILL ATTACHED TO THE INSTANCE:

ec2din
    RESERVATION	r-476e942b	558277860346	default
    INSTANCE	i-b63811d9	ami-b07985d9	ec2-174-129-137-49.compute-1.amazonaws.com	ip-10-122-13-145.ec2.internal	running	aquarius	0		m1.large	2011-05-20T14:30:24+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.137.49	10.122.13.145			ebs
    BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-20T14:30:54.000Z	
    BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-20T14:30:54.000Z	
    RESERVATION	r-53e4d83f	558277860346	@sc-syoung-smallcluster
    INSTANCE	i-e35b7a8d	ami-8e827ce7	ec2-72-44-32-123.compute-1.amazonaws.com	ip-10-122-231-105.ec2.internal	running	id_rsa-admin-key	0	t1.micro	2011-06-24T08:24:49+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	72.44.32.123	10.122.231.105			ebs
    BLOCKDEVICE	/dev/sda1	vol-cb175aa0	2011-06-24T08:25:20.000Z	



4. ATTACH NEW 100G VOLUME TO HEADNODE

ec2-attach-volume vol-71b9941a -i i-b63811d9 -d /dev/sdh
mount -t ext3 /dev/sdh /data

    OK

CONFIRM IS MOUNTED:

ll /data
   total 47M
   drwxr-xr-x 10 root   root 4.0K 2011-07-06 05:18 .
   drwxr-xr-x 25 root   root 4.0K 2011-06-24 03:56 ..
   drwxr-xr-x  8 root   root 4.0K 2011-05-13 11:49 0.6
   drwxr-xr-x 54 root   root 4.0K 2011-07-06 05:19 apps
   drwxr-xr-x  3 root   root 4.0K 2010-10-11 01:50 base
   drwxr-xr-x  4 root   root 4.0K 2011-05-24 17:57 jbrowse
   drwx------  2 root   root  16K 2010-10-10 23:43 lost+found
   drwxr-xr-x  5 root   root 4.0K 2010-10-11 01:07 mysql
   drwxrwxr-x  3 ubuntu root 4.0K 2011-07-08 21:22 sequence
   -rw-r--r--  1 root   root  47M 2011-05-01 02:07 sequence.tar.gz
   drwxr-xr-x  7 root   root 4.0K 2011-06-18 10:52 starcluster


*********************************************
REDO WITH SNAPSHOT ***AFTER*** DETACHING VOLUME:
*********************************************

DETACH old VOLUME
ec2-detach-volume vol-71b9941a -i i-b63811d9

    VOLUME	vol-71b9941a	100		us-east-1a	available	2011-07-09T04:09:12+0000

CREATE SNAPSHOT
ec2addsnap -d "2nd Snapshot of 40G /data pre-consolidation" vol-15599e7e
    
    SNAPSHOT	snap-f759b296	vol-15599e7e	pending	2011-07-09T04:53:29+0000		558277860346	40	2nd Snapshot of 40G /data pre-consolidation

CONFIRM SNAPSHOT
ec2-describe-snapshots snap-f759b296

    SNAPSHOT	snap-f759b296	vol-15599e7e	completed	2011-07-09T04:53:29+0000	100%	558277860346	40	2nd Snapshot of 40G /data pre-consolidation

CREATE VOLUME
ec2addvol -s 100 snap-f759b296 -z us-east-1a

    VOLUME	vol-378ba65c	100		us-east-1a	creating	2011-07-09T04:59:00+0000

CONFIRM VOLUME
ec2dvol vol-378ba65c	

    VOLUME	vol-378ba65c	100		us-east-1a	available	2011-07-09T04:59:00+0000


ATTACH VOLUME
ec2-attach-volume vol-378ba65c -i i-b63811d9 -d /dev/sdh

    ATTACHMENT	vol-378ba65c	i-b63811d9	/dev/sdh	attached	2011-07-09T05:06:38+0000


MOUNT VOLUME
mount -t ext3 /dev/sdh /data

    mount: wrong fs type, bad option, bad superblock on /dev/sdh,
           missing codepage or helper program, or other error
           In some cases useful info is found in syslog - try
           dmesg | tail  or so




*********************************************
RE-ATTACH OLD VOLUME AND COPY TO NEW VOLUME AT /dev/sdg
*********************************************

DETACH NEW VOLUME
ec2-detach-volume vol-378ba65c -i i-b63811d9 -d /dev/sdh
    
    VOLUME	vol-378ba65c	100		us-east-1a	available	2011-07-09T04:59:00+0000

RE-ATTACH OLD VOLUME
ec2-attach-volume vol-15599e7e -i i-b63811d9 -d /dev/sdh

    ATTACHMENT	vol-15599e7e	i-b63811d9	/dev/sdh	attached	2011-07-09T05:48:39+0000

MOUNT VOLUME
mount -t ext3 /dev/sdh /data

CONFIRM VOLUME IS MOUNTED
ll /data
    drwxr-xr-x  8 root   root 4.0K 2011-05-13 11:49 0.6
    drwxr-xr-x 54 root   root 4.0K 2011-07-06 05:19 apps
    drwxr-xr-x  3 root   root 4.0K 2010-10-11 01:50 base
    drwxr-xr-x  4 root   root 4.0K 2011-05-24 17:57 jbrowse
    drwx------  2 root   root  16K 2010-10-10 23:43 lost+found
    drwxr-xr-x  5 root   root 4.0K 2010-10-11 01:07 mysql
    drwxrwxr-x  3 ubuntu root 4.0K 2011-07-08 21:22 sequence
    -rw-r--r--  1 root   root  47M 2011-05-01 02:07 sequence.tar.gz
    drwxr-xr-x  7 root   root 4.0K 2011-06-18 10:52 starcluster

CREATE NEW 100GB VOLUME 
ec2addvol -s 100 -z us-east-1a

    VOLUME	vol-7f96bb14	100		us-east-1a	available	2011-07-09T05:51:24+0000
    
    
ATTACH NEW VOLUME
ec2-attach-volume vol-7f96bb14 -i i-b63811d9 -d /dev/sdg

    ATTACHMENT	vol-7f96bb14	i-b63811d9	/dev/sdg	attached	2011-07-09T05:52:47+0000


FORMAT NEW VOLUME
mkfs.ext3 /dev/sdg
    mke2fs 1.41.11 (14-Mar-2010)
    /dev/sdg is entire device, not just one partition!
    Proceed anyway? (y,n) y
    Filesystem label=
    ...
    


COPY DATA
cp -r /data/* /data2

    OK
    

DETACH OLD VOLUME
umount /data
ec2-detach-volume -f vol-15599e7e -i i-b63811d9
    ATTACHMENT	vol-15599e7e	i-b63811d9	/dev/sdh	detaching	2011-07-09T05:48:39+0000

ec2dvol vol-15599e7e
    VOLUME	vol-15599e7e	40	snap-55fe4a3f	us-east-1a	available	2011-04-30T08:32:18+0000


DETACH NEW VOLUME
umount /data2
ec2-detach-volume -f vol-7f96bb14 -i i-b63811d9

    ATTACHMENT	vol-7f96bb14	i-b63811d9	/dev/sdg	detaching	2011-07-09T05:52:47+0000

ec2dvol vol-7f96bb14
    VOLUME	vol-7f96bb14	100		us-east-1a	available	2011-07-09T05:51:24+0000


REATTACH NEW VOLUME AT /dev/sdh

ec2-attach-volume vol-7f96bb14 -i i-b63811d9 -d /dev/sdh

    ATTACHMENT	vol-7f96bb14	i-b63811d9	/dev/sdh	attached	2011-07-09T06:39:05+0000


MOUNT NEW VOLUME AT /dev/sdh
mount -t ext3 /dev/sdh /data

    OK!!
    
ll /data
    drwxr-xr-x  8 root root 4.0K 2011-07-09 01:57 0.6
    drwxr-xr-x 54 root root 4.0K 2011-07-09 02:08 apps
    drwxr-xr-x  3 root root 4.0K 2011-07-09 02:11 base
    drwxr-xr-x  4 root root 4.0K 2011-07-09 02:12 jbrowse
    drwx------  2 root root  16K 2011-07-09 01:55 lost+found
    drwxr-xr-x  5 root root 4.0K 2011-07-09 02:12 mysql
    drwxr-xr-x  3 root root 4.0K 2011-07-09 02:12 sequence
    -rw-r--r--  1 root root  47M 2011-07-09 02:12 sequence.tar.gz
    drwxr-xr-x  7 root root 4.0K 2011-07-09 02:12 starcluster

df -a
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1              15G  6.7G  7.5G  48% /
    proc                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /sys/kernel/debug
    none                     0     0     0   -  /sys/kernel/security
    devtmpfs              3.7G  124K  3.7G   1% /dev
    none                     0     0     0   -  /dev/pts
    none                  3.8G     0  3.8G   0% /dev/shm
    none                  3.8G   80K  3.8G   1% /var/run
    none                  3.8G     0  3.8G   0% /var/lock
    none                  3.8G     0  3.8G   0% /lib/init/rw
    /dev/sdb1             414G  199M  393G   1% /mnt
    /dev/sdi               40G  7.0G   31G  19% /nethome
    /nethome/mysql/etc/mysql
                           40G  7.0G   31G  19% /etc/mysql
    /nethome/mysql/lib/mysql
                           40G  7.0G   31G  19% /var/lib/mysql
    /nethome/mysql/log/mysql
                           40G  7.0G   31G  19% /var/log/mysql
    rpc_pipefs               0     0     0   -  /var/lib/nfs/rpc_pipefs
    nfsd                     0     0     0   -  /proc/fs/nfsd
    /dev/sdh               99G   21G   74G  22% /data

</entry>
<entry [Fri 2011:07:08 16:49:21 EST] FUNCTIONAL PROGRAMMING WITH DOJO + EXT JS4 DOCUMENTATION>

FUNCTIONAL PROGRAMMING
http://lazutkin.com/blog/2008/jan/12/functional-fun-javascript-dojo/

reviewed here
http://ajaxian.com/archives/functional-programming-with-javascript-and-dojo

EXTJS4 DOCUMENTATION
http://docs.sencha.com/ext-js/4-0/#

    
</entry>
<entry [Thu 2011:07:07 15:52:38 EST] TATAMI CHARTING DOCS FOR GOOGLE WEB TOOLKIT>

http://tatami.googlecode.com/svn/trunk/docs/TatamiUserDocumentation.html.LyXconv/TatamiUserDocumentation.html
    
</entry>
<entry [Wed 2011:07:06 19:08:48 EST] FIX ERROR 'TypeError: itemArray is undefined' ETC. IN "dojox.data.FileStore">

OVERRIDE TO RETURN [] IF itemArray IS NULL to AVOID ERROR

TypeError: itemArray is undefined


_processItemArray: function(itemArray){
37008 // summary:
37009 // Internal function for processing an array of items for return.
37010 var i;
37011 for(i = 0; i < itemArray.length; i++){
37012 this._processItem(itemArray[i]);
37013 }
37014 return itemArray;
37015 },


AND OVERRIDE _assertIsItem TO AVOID ERROR:

Error: dojox.data.FileStore: a function was passed an item argument that was not an item


_assertIsItem: function(/* item */ item){
36707 // summary:
36708 // This function tests whether the item passed in is indeed an item in the store.
36709 // item:
36710 // The item to test for being contained by the store.
36711 if(!this.isItem(item)){
36712 throw new Error("dojox.data.FileStore: a function was passed an item argument that was not an item");
36713 }
36714 },


    
</entry>
<entry [Wed 2011:07:06 04:03:33 EST] TEST DISC PERFORMANCE USING 'iostat -x'>

On linux to see the disc I/0 performance use 

iostat -x
    
</entry>
<entry [Tue 2011:07:05 03:07:03 EST] FORK - MESSAGE AND QUIT, DO THE WORK>

USED IN View.pm, Common/Cluster.pm, ETC.

	#### FORK: PARENT MESSAGES AND QUITS, CHILD DOES THE WORK
	if ( my $child_pid = fork() ) 
	{
		#### PARENT
	
		#### SET InactiveDestroy ON DATABASE HANDLE
		$self->dbobject()->dbh()->{InactiveDestroy} = 1;
		my $dbh = $self->dbobject()->dbh();
		undef $dbh;
	
		#### MESSAGE AND EXIT
		print "{ error: 'Agua::View::addView    Could not add view $json->{view} to view table' }" and exit(0) if not defined $success or not $success;
		print "{ status: 'Agua::View::addView    Added view $json->{view} to view table' }";
		exit(0);
	}
	else
	{
		#### CHILD
		exit if not defined $success or not $success;
	
		#### CLOSE OUTPUT SO CGI SCRIPT WILL QUIT
		close(STDOUT);  
		close(STDERR);
		close(STDIN);
	
		#### ENSURE DB HANDLE STAYS ALIVE
		$self->setDbh();
	
		#### CREATE STARCLUSTER config FILE
		print "Agua::Common::Cluster::addCluster    Doing Agua::StarCluster->new(json)\n";
		my $starcluster = Agua::StarCluster->new($json);
		$starcluster->writeConfigfile();
	}

    
</entry>
<entry [Tue 2011:07:05 01:13:56 EST] FIXED DOTTED LINE/DOTTED BORDER ON SELECTED Admin TAB>    

FROM workflow/css/filemanager.css

/* NO DOTTED BORDER AROUND TITLE PANE TITLE */
.tundra .dijitTitlePaneTitleFocus,
.soria .dijitTitlePaneTitleFocus {
	outline: 0 !important;
	/*border: solid 2px transparent !important;*/
	/*/*border: 0 none !important;*/*/
	/*background-color: #FFD !important;*/
}


AND admin/css/admin.css LINE 120

.admin .dijitFocused .tabLabel {
	padding: 3px;
	border: solid 2px #0F0;
	-moz-background-clip:border;
	-moz-background-inline-policy:continuous;
	-moz-background-origin:padding;
	-moz-border-radius-bottomleft:3pt;
	-moz-border-radius-bottomright:3pt;
	-moz-border-radius-topleft:3pt;
	-moz-border-radius-topright:3pt;
	-moz-outline-style: none;
}


COMBINED INTO GLOBAL AGUA STYLES IN core/css/agua.css





</entry>
<entry [Sat 2011:07:02 23:26:45 EST] MOTHBALLED fileExists METHODS REMOVED FROM Agua.js>

// FILE METHODS
/*getFileExists : function (stageParameterObject, booleanValue) {
// GET THE BOOLEAN fileExists VALUE FOR A STAGE PARAMETER

	//console.log("Agua.getFileExists    plugins.core.Agua.getFileExists()");
	//console.log("Agua.getFileExists    stageParameterObject: " + dojo.toJson(stageParameterObject));
	//console.log("Agua.getFileExists    booleanValue: " + booleanValue);

	if ( booleanValue != null )
	{
		console.log("Agua.getFileExists    booleanValue parameter is present. Should you be using 'setFileExists' instead?. Returning null.");
		return null;
	}
	
	return this._fileExists(stageParameterObject, booleanValue);
},


setFileExists : function (stageParameterObject, booleanValue) {
// SET THE BOOLEAN fileExists VALUE FOR A STAGE PARAMETER

	//console.log("Agua.setFileExists    plugins.core.Agua.setFileExists()");
	//console.log("Agua.setFileExists    stageParameterObject: " + dojo.toJson(stageParameterObject));
	//console.log("Agua.setFileExists    booleanValue: " + booleanValue);

	if ( booleanValue == null )
	{
		console.log("Agua.setFileExists    booleanValue is null. Returning null.");
		return null;
	}

	return this._fileExists(stageParameterObject, booleanValue);
},

_fileExists : function (stageParameterObject, booleanValue) {
// RETURN THE fileExists BOOLEAN FOR A STAGE PARAMETER
// OR SET IT IF A VALUE IS SUPPLIED

	//console.log("Agua._fileExists    plugins.core.Agua._fileExists()");
	//console.log("Agua._fileExists    stageParameterObject: " + dojo.toJson(stageParameterObject, true));
	//console.log("Agua._fileExists    booleanValue: " + booleanValue);

	//var filtered = this._getStageParameters();
	//var keys = ["appname"];
	//var values = ["image2eland.pl"];
	//filtered = this.filterByKeyValues(filtered, keys, values);
	//console.log("Agua._fileExists    filtered: " + dojo.toJson(filtered, true));


	var uniqueKeys = ['username', 'project', 'workflow', 'appname', 'appnumber', 'name'];
	var valueArray = new Array;
	for ( var i = 0; i < uniqueKeys.length; i++ )
	{
		valueArray.push(stageParameterObject[uniqueKeys[i]]);
	}
	var stageParameter = this.getEntry(this.stageparameters, uniqueKeys, valueArray);
	//console.log("Agua._fileExists    stageParameter found: " + dojo.toJson(stageParameter, true));
	if ( stageParameter == null )
	{
		console.log("Agua._fileExists    stageParameter is null. Returning null");
		return null;
	}
	
	if ( booleanValue != null )
	{
		//console.log("Agua._fileExists    booleanValue != null");

		// SET exists BOOLEAN VALUE
		stageParameter.exists = booleanValue;

//console.log("Agua._fileExists    console.dir(stageParameter):");
//console.dir(stageParameter);
		
		var success = this._removeStageParameter(stageParameter);
		if ( success == false )
		{
			console.log("Agua._fileExists    Could not remove stage parameter. Returning null");
			return null;
		}

		//console.log("Agua._fileExists    	BEFORE success = this._addStageParameter(stageParameter)");

			
		success = this._addStageParameter(stageParameter);			
		if ( success == false )
		{
			console.log("Agua._fileExists    Could not add stage parameter. Returning null");
			return null;
		}

		return true;
	}
	else
	{
		return stageParameter.exists;
	}
},
*/
    
    
</entry>

<entry [Sat 2011:07:02 23:00:18 EST] AVAILABILITY ZONE LIST>

http://smartbear.com/support/articles/testcomplete/cloud-testing-using-different-regions/

http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?using-regions-availability-zones.html


LIST AVAILABLE REGIONS AND ZONES:

ec2-describe-regions
ec2-describe-availability-zones --region us-east-1


ec2-describe-regions

REGION	us-east-1	ec2.us-east-1.amazonaws.com
REGION	us-west-1	ec2.us-west-1.amazonaws.com
REGION	eu-west-1	ec2.eu-west-1.amazonaws.com
REGION	ap-northeast-1	ec2.ap-northeast-1.amazonaws.com
REGION	ap-southeast-1	ec2.ap-southeast-1.amazonaws.com

{
    "ap-northeast-1"	=>	[
        "ap-northeast-1a",
        "ap-northeast-1b",
    ],
    "ap-southeast-1"	=>	[
        "ap-southeast-1a",
        "ap-southeast-1b",
    ],
    "eu-west-1"	    =>	[
        "eu-west-1a",
        "eu-west-1b",
        "eu-west-1c",
    ],
    "us-east-1"	    =>	[
        "us-east-1a",
        "us-east-1b",
        "us-east-1c",
        "us-east-1d",
    ],
    "us-west-1"	    =>	[
        "us-west-1a",
        "us-west-1b",
        "us-west-1c",
    ]
}
    
</entry>
