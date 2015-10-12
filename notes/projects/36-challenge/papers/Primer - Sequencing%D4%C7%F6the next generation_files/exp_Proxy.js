/* Generated: 10/10/2008  05:37 AM EST. EW Web Code Version: 14.1 */



//TRACKING VARIABLES

var cp1017460 = "http://cdn1.eyewonder.com/200125/755360/1017460/";



var ew1017460_startTime = ew_getTime1017460();


var ew_cacheBuster = new Date().getTime(); 
var ew_cacheBusterReplaceArray = new Array("\\[timestamp\\]", "\\[cachebuster\\]", "\\[random\\]", "\\[randnum\\]"); 	

var ew1017460_imgArray = new Array();
var ew1017460_imgArrayCounter = 0;
var ew1017460_realAdIdStr = '?ewadid=49554';

function ew_addImage1017460(img)
{
	ew1017460_imgArray[ew1017460_imgArrayCounter] = document.createElement("img");
	ew1017460_imgArray[ew1017460_imgArrayCounter].setAttribute("src", img);
	ew1017460_imgArrayCounter++;
}

function ew1017460_otrk(img, extra)
{
	ew_addImage1017460(cp1017460+img+ew1017460_realAdIdStr+'&ewbust='+new Date().getTime()+extra);
	return '';
}

function ew1017460_otrk_nobust(img, extra)
{
	ew_addImage1017460(cp1017460+img+ew1017460_realAdIdStr+'&ewbust=0'+extra);
	return '';
}


 
function ew_thirdpartytrackingcachebust1017460(trkURL)
{
	for(var i = 0; i < ew_cacheBusterReplaceArray.length; i++)
	{
		trkURL = trkURL.replace(new RegExp(ew_cacheBusterReplaceArray[i],"gi"), ew_cacheBuster); 
	}
	return trkURL;
}

function ew_getTime1017460() { var ew_t = new Date(); return ew_t.getTime();}


function onLoadTracker1017460() 
{
	var ew_t = (ew_getTime1017460()-ew1017460_startTime);
	if (!isNaN(ew_t))
		return ew1017460_otrk('ewtrack_onload.gif','&info='+ew_t);
	else
		return ew1017460_otrk('ewtrack_onload.gif','')
}
function flashTracker1017460() {  return ew1017460_otrk('ewtrack_v.gif',''); }
	
function impressionTracker1017460() {  return ew1017460_otrk('ewtrack.gif',''); }

function failoverTracker1017460() {   return ew1017460_otrk('ewtrack_f.gif',''); }

function failoverReasonBrowserTracker1017460() {  return ew1017460_otrk('ewtrack_rb.gif',''); }
function failoverReasonFlashTracker1017460() {  return ew1017460_otrk('ewtrack_rf.gif',''); }
function flashSupportTracker1017460(verStr) {  return ew1017460_otrk('ewtrack_'+verStr+'.gif',''); }
function weSupportTracker1017460() { var ew_t = ew_getTime1017460()-ew1017460_startTime;  return ew1017460_otrk('ewtrack_wesupport.gif','&info='+ew_t); }

function flashTrackerCache1017460(expCount) {  return ew1017460_otrk('ewtrack_v'+expCount+'.gif',''); }
function failoverTrackerCache1017460(expCount) {  return ew1017460_otrk('ewtrack_f'+expCount+'.gif',''); }





function ew1017460_outOfBandTrackRequest(url)
{
	ew_addImage1017460(url);
}


document.writeln(impressionTracker1017460());	




function ew_thirdpartytracking1017460()
{
	for (var i = 0; i < ew1017460_thirdPartyTrackers.length ; i++)
	{
		if (ew1017460_thirdPartyTrackers[i] != "")
		ew_addImage1017460(ew_thirdpartytrackingcachebust1017460(ew1017460_thirdPartyTrackers[i]));
	}
}

var ew1017460_thirdPartyTrackers = new Array("","","","","","");

ew_thirdpartytracking1017460();
	

//COMMON VARIABLES

var ew1017460_bannerWidth = 728;
var ew1017460_bannerHeight = 90;
var ew1017460_fullWidth = 728;
var ew1017460_fullHeight = 290;

function ew_getProtocol(cp) 
{
	if (cp.indexOf("https://") != -1)
		return "https://";
	else
		return "http://";
}
var ew1017460_protocol = ew_getProtocol("http://cdn1.eyewonder.com/200125/755360/1017460/");



function parseParam(name) {
	try {
	 	var query = window.location.search;
	 	var pos = query.indexOf(name+"=");	
		var pos2 = 0;
	 	if (pos != -1) {
	 	    pos = pos+name.length+1;
	 		pos2 = query.indexOf("&", pos);
	 		if (pos2 != -1) {
	 			return query.substring(pos, pos2);
	 		} else {
				return query.substring(pos);
	 		}
	 	} else { return null; }
	} catch(e) { return null; }
}
if (parseParam("ew_pubVars") != null) var ew_pubVars = parseParam("ew_pubVars");
if (parseParam("ew_clickPrepend") != null)
{
	var clickTagFramePrepend1017460 = parseParam("ew_clickPrepend") + "[ewclickthru]";
	if (clickTagFramePrepend1017460 == "[ewclickthru]") 
		clickTagFramePrepend1017460 = "[ewclickthru]";

}


//RESEARCH TAGS


//DESIGN VARIABLES
var ew_adFile_Proxy = cp1017460+"exp_interimDetect.html";

if (typeof(clickTagFramePrepend1017460) != 'undefined')
	clickTagFramePrepend = clickTagFramePrepend1017460;

if (typeof(clickTagFramePrepend) == "undefined")
	var clickTagFramePrepend = "[ewclickthru]";
clickTagFramePrepend = clickTagFramePrepend.replace("[%ewclickthru%]", "[ewclickthru]"); 

if (clickTagFramePrepend == "[ewclickthru]") 
	clickTagFramePrepend = "[ewclickthru]";

var ew_mpUsedClickthruMagic = false;


if (ew_mpUsedClickthruMagic == false)
{
var failclickTag = clickTagFramePrepend.replace("[ewclickthru]","http://marketing.appliedbiosystems.com/mk/get/SOLID_KNOWLEDGE_LANDING?utm_source=Nat-proll&utm_medium=point-roll&utm_campaign=SOLiDv2");
var	clickTag1 = clickTagFramePrepend.replace("[ewclickthru]","http://marketing.appliedbiosystems.com/mk/get/SOLID_KNOWLEDGE_LANDING?utm_source=Nat-proll&utm_medium=point-roll&utm_campaign=SOLiDv2");
}


function ew_clickTagCacheBust(_ct) 
{
if (typeof(_ct)=='undefined') return '';
	for(var i = 0; i < ew_cacheBusterReplaceArray.length; i++)
		_ct = _ct.replace(new RegExp(ew_cacheBusterReplaceArray[i],"gi"), ew_cacheBuster); 
	if (_ct.indexOf(";ord=") >= 0) _ct = _ct.split(";ord=")[0] + ";ord=" + ew_cacheBuster;
	return _ct;
}


clickTag1 = ew_clickTagCacheBust(clickTag1);
failclickTag = ew_clickTagCacheBust(failclickTag);


if (typeof(failclickTag) == "undefined")
	var failclickTag = "http://marketing.appliedbiosystems.com/mk/get/SOLID_KNOWLEDGE_LANDING?utm_source=Nat-proll&utm_medium=point-roll&utm_campaign=SOLiDv2";

if (typeof(ew_disableIFrameDetection) == "undefined" || ew_disableIFrameDetection != true)
{
	var ew_isIFrame = false;
if (window!=top && window!=parent)
	{
	var ew1017460_tagName = "";
		try { ew1017460_tagName = frameElement.tagName; }
		catch(e) { ew_isIFrame = true; }
		if (ew1017460_tagName.toUpperCase()=="IFRAME") ew_isIFrame = true;
	}
var ew_interimFile = "/eyewonder/interim.html";
	if (typeof(ew_interimFile) == "undefined" || ew_interimFile == "")
		var ew_interimFile = "/eyewonder/interim.html";
}
else
{
var ew_isIFrame = false;
var ew_interimFile = "";
}

var ew1017460_inFIF = false;

var inDapIF = false;



if (typeof(ew_qaInterimFileOverride) != "undefined")	// NEVER set ew_qaInterimFileOverride manually. EyeWonder QA use only.
	ew_interimFile = ew_qaInterimFileOverride;


if (ew_isIFrame)
	var ew1017460_iFrameQueryStringExtra = "";

if (ew_isIFrame)
{
	var ew_containsHTTP = (( ew_interimFile.indexOf("http://") > -1 ) || 
		( ew_interimFile.indexOf("https://") > -1 ));
	if (!ew_containsHTTP)
	{
		var ref = document.referrer;
		var host='';
		if(ref == '') {
			host = 'http://'+document.domain;
		} else {
			var pos1 = ref.indexOf("://");
			if (pos1 != -1) {
				pos2 = ref.indexOf("/", pos1+3);
				host = ref.substring(0, pos2);
			}
		}
		if(ew_interimFile.indexOf('/')==0)
			ew_interimFile = host+ew_interimFile; 
		else
			ew_interimFile = host+'/'+ew_interimFile;
	}
}


//AUTHENTICATION

var ua = ' ' + navigator.userAgent.toLowerCase();
var isIe = (ua.indexOf('msie') >= 0);
var isNav4 = ((ua.indexOf('mozilla') >= 0) && (ua.indexOf('compatible') == -1) && (parseInt(navigator.appVersion) < 5));
var isWin = (ua.indexOf('win') >= 0);
var isWinVista = false;
var isLinux = (ua.indexOf('linux') >= 0);
var isMac = (ua.indexOf('mac') >= 0);
var isOpera = (ua.indexOf('opera') > 0);
if (isOpera) isIe = false;
var ew_isSafari = (ua.indexOf('applewebkit') > 0);
var isKonqueror = (ua.indexOf('konqueror')>0);
var isGecko = (ua.indexOf('gecko/') > 0);
var isCamino = (ua.indexOf('camino/') > 0);
if(isWin) isWinVista = (ua.indexOf('windows nt 6.0') >= 0);
var ew1017460_operatingSystem = "other";
if (isMac) ew1017460_operatingSystem = "mac";
if (isLinux) ew1017460_operatingSystem = "linux";
if (isWin) ew1017460_operatingSystem = "windows";
if (isWinVista) ew1017460_operatingSystem = "winvista";
var geckoDate;
var geckoRevisionString;
var geckoRevision;
var geckoRevisionMajor;
var geckoRevisionMinor;
var ew1017460_browserEngineVersion = "-1";

var webkitVersion;
if (isGecko) {
	function ew_getGeckoRevisionString(ua)
	{
		var tempStr = ua.split("rv:");
		return tempStr[1].split(")")[0];
	}
	geckoRevisionString = ew_getGeckoRevisionString(ua);
	ew1017460_browserEngineVersion = geckoRevisionString;
	geckoRevision = parseFloat(geckoRevisionString);
	geckoRevisionMajor=parseFloat(geckoRevisionString.split(".")[0]);
	geckoRevisionMinor=parseFloat(geckoRevisionString.split(".")[1]+ "." + geckoRevisionString.split(".")[2]);
	geckoDate = parseInt(ua.substr(ua.indexOf('gecko/')+6,8));
}
var ieVersion;
if (isIe) {
	ieVersion = ua.substr(ua.indexOf('msie')+5,4);
	if (ieVersion.indexOf(';') > 0)
		ieVersion = ieVersion.substr(0,3);
	ew1017460_browserEngineVersion = ieVersion.toString();
}
var operaVersion;
if (isOpera) {
	operaVersion = ua.substr(ua.indexOf('opera')+6,4);
	ew1017460_browserEngineVersion = operaVersion.toString();
}
if (ew_isSafari) {
    webkitVersion = parseInt(ua.substr(ua.indexOf('applewebkit')+12,4));
	ew1017460_browserEngineVersion = webkitVersion.toString();
}

var ew1017460_weSupport = false;
var failReason = "browser";
 
var isFlash7up = false;
var isFlash8up = false;
var isFlash9up = false;
var isFlashFailover = false;
var isFlash9Pre28 = false;
var ew1017460_flashVersion = new Array(0,0,0);
var ew1017460_flashVersionMajor = 0;
var ew1017460_flashVersionMinor = 0;

function ew1017460_getFlashVersion() {
	if(isIe)
	{
		var checkStr = "ShockwaveFlash.ShockwaveFlash.7";
		if (isWinVista)
			checkStr = "ShockwaveFlash.ShockwaveFlash.9";
		try {
			var swf = new ActiveXObject(checkStr.toString()).GetVariable("$version");
			var ver = swf.substring(swf.indexOf(" "));
			ew1017460_flashVersion = ver.split(",");
		} catch ( e )
		{
			ew1017460_flashVersion = new Array(0,0,0);
		}
	} 
	else if (isGecko || isOpera || ew_isSafari || isKonqueror) {
		ver = new Array();
		var desc = navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin.description; 
		desc = desc.split(" ");
		ver[0] = desc[2].split(".")[0];
		ver[1] = desc[2].split(".")[1];
		ver[2] = desc[desc.length-1].split("r")[1];
		if( ver[0] >= 7 ) ew1017460_flashVersion = ver;
	}
	ew1017460_flashVersionMajor = ew1017460_flashVersion[0] + "." + ew1017460_flashVersion[1];
	ew1017460_flashVersionMinor = ew1017460_flashVersion[2];
}

if (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"])
	var navPlugin = (navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin);

if (navPlugin || (isIe && isWin)) {
	ew1017460_getFlashVersion();
	isFlash9up = (ew1017460_flashVersionMajor>=9);
	isFlash8up = (ew1017460_flashVersionMajor>=8);
	isFlash7up = (ew1017460_flashVersionMajor>=7);
	isFlashFailover = (ew1017460_flashVersionMajor>=6);
	isFlash9Pre28 = (ew1017460_flashVersionMajor == 9 && ew1017460_flashVersionMinor < 28);
	if( isWinVista && isFlash9up && isFlash9Pre28 && isIe) {
		ew1017460_weSupport = false;
		failReason = "flash";
	}
} else isFlash7up = false;



if(isGecko || ew_isSafari || isKonqueror || (isIe && isWin && ieVersion >= 6) || (isOpera && operaVersion >= 8)) {
	failReason = "none";
	ew1017460_weSupport = true;
	if (!isFlash7up) {
		ew1017460_weSupport = false;
		failReason = "flash";
	}
} else {
	failReason = "browser"; ew1017460_weSupport = false;
}

if (ew_isSafari) {
	if (webkitVersion < 400)
	{
		ew1017460_weSupport = false; failReason = "browser";
	}
}



var ew1017460_turnOffExecution = false;


if (!ew1017460_turnOffExecution && isFlash8up)
	document.writeln(flashSupportTracker1017460("8"));
if (!ew1017460_turnOffExecution && isFlash9up)
	document.writeln(flashSupportTracker1017460("9"));
if (!ew1017460_turnOffExecution && isFlash9up && (isFlash9Pre28==false))
	document.writeln(flashSupportTracker1017460("9_0_28_0"));
	
if (isOpera)
{
	failReason = "browser";
	ew1017460_weSupport = false;
	if ((operaVersion >= 8 && !ew_isIFrame) || (operaVersion >= 9.1))
		ew1017460_weSupport = true;
	if (operaVersion >= 9 && operaVersion <= 9.1)
	{
		ew1017460_weSupport = false;
		if ('9.3.0' != "")
		{
			if (parseFloat('9.3.0') >= 9.1 || parseFloat('9.3.0') >= 8.2)
				ew1017460_weSupport = true;
		}
		else if ('' != '' && 'solid2.0.swf' != '')
		{
			if (('').toLowerCase().substring(0,('').indexOf('_fl7.swf'))==('').toLowerCase().substring(0,('solid2.0.swf').indexOf('_fl8.swf')))
				ew1017460_weSupport = true;
		}
	}
	if (ew1017460_weSupport == true) 
		failReason = "none";
	else
		failReason = "browser";
}

if (!isWin && !isMac)
{

	failReason = "browser";
	ew1017460_weSupport = false;

}


var ew1017460_removeFromFlow = false;

var ew1017460_positionCorrect = "";
var ew1017460_centerCode = "";
var ew1017460_isOverflowHidden = false;
var ew1017460_forceLoad = false;
var ew1017460_isExpanded = false;
var ew1017460_afterLoadTimer = 1500;
var ew1017460_rffInterval = 0;
var ew1017460_rffTimer = null;



//ZINDEX


var ew_maxZIndex = 2147483647;


var ew1017460_isLeaderboard=true;
var ew1017460_isSkyscraper=false;
var ew1017460_isRectangle=false;


var ew1017460_minZIndex = 10000 + 25;


//CUSTOM FUNCTIONS


weSupport = ew1017460_weSupport; 
ew1017460_turnOffExecutionBackup = ew1017460_turnOffExecution; 



var ew1017460_localConnectionUUID;
function ew_setUpLocalConnectionUUID1017460()
{
	var ewwin;
	if (typeof(topWin) == "undefined")
		ewwin = window;
	else
		ewwin = topWin;
	if ( typeof( ewwin.ew_localConnectionUUID ) == "undefined")
		ewwin.ew_localConnectionUUID = (new Date().getTime());

	ew1017460_localConnectionUUID = ewwin.ew_localConnectionUUID;
}
ew_setUpLocalConnectionUUID1017460();

var ew1017460_context = window; 
var ew1017460_flashObjectWindow = window;
var ew1017460_mainFunctionWindow = window;	

function ew_getSWFTag1017460()
{
	if (isGecko || isOpera)
		return ew_getEmbedTag1017460();
	else
		return ew_getObjectTag1017460();
}

function ew_getObjectTag1017460()
{ 
	try {
		if (typeof(ew1017460_flashObjectWindow.document.getElementById("ewad1017460")) != 'undefined')
			return ew1017460_flashObjectWindow.document.getElementById("ewad1017460");
		else
			return null;
	} catch(e) { return null; }
}

function ew_getEmbedTag1017460() 
{
	try {
		if (typeof(ew1017460_flashObjectWindow.document.getElementById("ewembed1017460")) != 'undefined')
			return ew1017460_flashObjectWindow.document.getElementById("ewembed1017460");
		else
			return null;
	} catch(e) { return null; }
}

var ew1017460_debugShowErrors = false;


/* ###########				  BEGIN CUSTOM FUNCTIONS 					########### */
/* Ad-level custom functions */



/* Execution-level custom functions */



/* Site-level custom functions */

if (ew_isSafari){ew1017460_removeFromFlow = true;}

/* ###########					  END CUSTOM FUNCTIONS 					########### */


ew1017460_weSupport = weSupport; 
ew1017460_turnOffExecution = ew1017460_turnOffExecutionBackup;


var ew1017460_errorObject;

function ew_throwJSError1017460()
{
	var e = ew1017460_errorObject;
	var emsg = "";
	try	{
		if (isIe)
			emsg = e.name + ": " + e.description;
		if (isGecko)
			emsg = e.name + ": " + e.message + " in file " + e.fileName + " on line " + e.lineNumber + "\n Stack: \n " + e.stack;
		if (ew_isSafari)
			emsg = e.name + ": " +  e.message + " on line " + e.line;
		if (isOpera)
			emsg = e.message + " on line " + e["opera#sourceloc"];
		ew1017460_debugExternalInterfaceErrorMessage = emsg;
	}
	catch(e)
	{
		ew1017460_debugExternalInterfaceErrorMessage = "Failure in external interface";
	}

	if (ew1017460_debugShowErrors == true)
		throw(ew1017460_errorObject);	
}

function ew_delegate1017460( functionName )
{
	var ew_args = new Array();
	for( var i = 1; i < arguments.length; i++ )
		ew_args[i-1] = arguments[i];
	try
	{
		return ew1017460_mainFunctionWindow[functionName].apply( ew1017460_mainFunctionWindow, ew_args );
	}
	catch (e)
	{
		ew1017460_errorObject = e;
		var dummy = setTimeout(ew_throwJSError1017460, 1);
		return;
	}
}

var ew_externalInterfaceVerified1017460 = null;
function ew_isAvailableExternalInterface1017460()
{
	var flashObj = ew_getSWFTag1017460();
	try {
	if (typeof(flashObj)=="undefined" || flashObj==null || (flashObj.ew_isAvailable() != true)) return false;
	} catch(e) { return false; }
	return true;
}

function ew_callExternalInterface1017460(functionName)
{
	if (!ew_isAvailableExternalInterface1017460())
	{
		ew1017460_debugExternalInterfaceErrorMessage = "Object doesn't support External Interface.";
		return null;
	}

	var flashObj = ew_getSWFTag1017460();	
	if (typeof(flashObj[functionName]) == "undefined" || flashObj[functionName] == null)
	{
		ew1017460_debugExternalInterfaceErrorMessage = "Object doesn't support this method.";
		return null;
	}

	var ew_args = new Array();
	var ew_argsString = "";
	for( var i = 1; i < arguments.length; i++ )
	{
		if (i!=1)
			ew_argsString += ",";
		ew_argsString += "ew_args[" + (i-1) +  "]";
		ew_args[i-1] = arguments[i];
	}

	var execString = 'flashObj.'+functionName+'('+ew_argsString+')';
	try { return eval(execString); }
	catch (e)
	{
		ew1017460_errorObject = e;
		var dummy = setTimeout(ew_throwJSError1017460, 1);
		return null;
	}
}


// FLASH


var ew1017460_flvNames = "";
var ew1017460_creativeName = "";
var ew1017460_swfVersion = 7;


function ew_getfNames(flvvideos,flashBool)
{
	for(var i = 0; i < flashBool.length; i++)
	{
		if(flashBool[i] == "true")
			flvvideos[i] = "fl8_" + flvvideos[i];
	}
	return flvvideos.join(",");
}

function ew_setupCreative(flash7Creative, flash8Creative, flash9Creative)
{
	if (isFlash9up && flash9Creative != "" && !isFlash9Pre28)
	{
		ew1017460_swfVersion = 9;
		return flash9Creative;
	}
	else if (isFlash8up && flash8Creative != "")
	{
		ew1017460_swfVersion = 8;
		return flash8Creative;
	}
	else if (isFlash7up && flash7Creative != "")
	{
		ew1017460_swfVersion = 7;
		return flash7Creative;
	} else {
		ew1017460_weSupport=false;
		failReason = "flash";
		return flash7Creative;
	}
}


function ew_setupFlash8Videos()
{
	var flvvideos = new String("").split(',');
	var flashBool = new String("").split(',');
	ew1017460_flvNames = ew_getfNames(flvvideos,flashBool);
}

ew1017460_creativeName = ew_setupCreative("","solid2.0.swf","");
if (isFlash8up && (ew1017460_swfVersion >= 8))
	ew_setupFlash8Videos();

var ew1017460_adMode = "stream";


var ew1017460_videoPath = "fms2.eyewonder/video/";


var ew1017460_videoID = '';


if (typeof(isIFrameContent) != "undefined" && isIFrameContent)
	ew_qaReportUUID = topWin.ew_qaReportUUID;

if (typeof(ew_qaReportUUID)=="undefined")
{
	ew_qaReportUUID = parseParam("qaUUID");
	if(ew_qaReportUUID == null) ew_qaReportUUID = "common";
}




function ew_verifyPrepend(url)
{
	if (typeof(url) == 'undefined') return "";
	var newUrl = url;
	if (url.indexOf("http") != 0 || url.indexOf("ftp") != 0)
	{
		if (url.indexOf("http") != -1)
			newUrl = url.substr(url.indexOf("http"));
		else if (url.indexOf("ftp") != -1)
			newUrl = url.substr(url.indexOf("ftp"));
	}
	return newUrl;
}
var ewclicktags1017460 = ''
	+ '&clickTag1='+escape(ew_verifyPrepend(clickTag1));

if( typeof( ew1017460_flashvarsExtra ) == "undefined" )
	var ew1017460_flashvarsExtra = "";

if (typeof(ew1017460_setVideoMode) != "undefined") {
	if ((ew1017460_setVideoMode=='prog') || (ew1017460_setVideoMode=='stream')) {
		if (cp1017460.indexOf("cdn1") != -1) { var vp = "cdn1"; var fldr = "2"; } else { var vp = "cdn"; var fldr = "1"; }
		ew1017460_adMode = ew1017460_setVideoMode;
		if (ew1017460_setVideoMode=='prog') ew1017460_videoPath = "http://" + vp + ".eyewonder.com/" + fldr + "00125/video/";
		else ew1017460_videoPath = "fms2.eyewonder/video/";
	}
}

var ew1017460_browserEngine = "unknown";
if (isIe)
	ew1017460_browserEngine = "ie";
else if (isGecko)
	ew1017460_browserEngine = "gecko";
else if (isOpera || isKonqueror)
	ew1017460_browserEngine = "opera";
else if (ew_isSafari)
	ew1017460_browserEngine = "webkit";

var ew1017460_adTypeID = '27';
var ew1017460_adType = 'Expandable';
if (ew1017460_adTypeID=='22' || ew1017460_adType=="Interstitial")
	ew1017460_adTypeID = '5';

if (ew1017460_adTypeID=='30')
	ew1017460_adTypeID = '8';

ew1017460_adTypeID = '110';


var ew1017460_customFlashString = ''; 
if (ew1017460_customFlashString != '')
		ew1017460_customFlashString = '&' + ew1017460_customFlashString.replace(/\|/g, '&');
if (typeof(ew1017460_localConnectionUUID) == "undefined")
	ew1017460_localConnectionUUID = (new Date().getTime());

if (typeof(ew_pubVars)=='undefined' || ew_pubVars==null)
{

} else {
if (ew_pubVars.charAt(0)=="&")
	ew_pubVars = ew_pubVars.substring(1);
if (ew_pubVars.indexOf("bw=") != -1)
	ew_pubVars = ew_pubVars.replace("bw=", "bandWidth=");
}

var flashvarsClickTagPrepend = "[ewclickthru]";
if (typeof(clickTagFramePrepend) != 'undefined')
	flashvarsClickTagPrepend = clickTagFramePrepend;


var ewflashvars1017460 = 'ewbase='+cp1017460
+ '&bwfile=bwtest.swf'
+ '&creative=' + ew1017460_creativeName
+ '&vLength='
+ '&bw=56,90,135,300,450,600'
+ '&buf=5,4,3,2,2,2'
+ '&flv=' + ew1017460_flvNames
+ '&flvId=0'
+ '&formatId='+ew1017460_adTypeID
+ '&aInit='+''
+ '&vInit='
+ '&videoID='+ew1017460_videoID
+ '&videoPath='+ew1017460_videoPath
+ '&executionId=1017460&adId=49554'
+ '&adMode=' + ew1017460_adMode
+ '&trkUrl=http://cdn1.eyewonder.com/200125/'
+ '&siteID=1191'
+ '&swfVersion=' + ew1017460_swfVersion
+ '&browserEngine=' + ew1017460_browserEngine
+ '&browserEngineVersion=' + ew1017460_browserEngineVersion
+ '&opSys=' + ew1017460_operatingSystem
+ '&qaReportUUID=' + escape(ew_qaReportUUID)
+ '&localConnectionUUID=' + ew1017460_localConnectionUUID
+ '&edgeDetect=none'
+ '&clickTagPrepend=' + escape(flashvarsClickTagPrepend)
+ ew1017460_flashvarsExtra
+ ew1017460_customFlashString

+ ewclicktags1017460;
if (typeof(ew_pubVars) != 'undefined' && ew_pubVars != "")
	ewflashvars1017460 += '&' + ew_pubVars;


function findPosX(obj) {
	var curleft = obj.offsetLeft;
	if (obj.offsetParent) {
		while (obj.offsetParent) {
			obj = obj.offsetParent;
			if ((isIe || ew_isSafari || isOpera) && obj.tagName.toUpperCase() == "BODY") break;
			curleft += obj.offsetLeft;
		}
	}
	else if (obj.x)
		curleft += obj.x;
	return curleft;
}

function findPosY(obj) {
	var curtop = obj.offsetTop;
	if (obj.offsetParent) {
		while (obj.offsetParent) {
			obj = obj.offsetParent;
			if ((isIe || ew_isSafari || isOpera) && obj.tagName.toUpperCase() == "BODY") break;
			curtop += obj.offsetTop;
		}
	}
	else if (obj.y)
		curtop += obj.y;
	return curtop;
}


//EXPAND FUNCTIONS


function ew1017460_fixFlash(){
	parent.__flash__removeCallback = function(instance, name)
	{
		try { instance[name] = null; } catch(e) {  }
	}
	window.fixFlashTimeout = setTimeout(ew1017460_fixFlash,250);
}

function ew_checkOverflowHidden1017460(){

	if (ew1017460_inFIF || (ew_isSafari && webkitVersion < 520))
		return false;
 	var tempNode=ew1017460_flashObjectWindow.document.getElementById("ew_BannerDiv1017460").parentNode;
	while (tempNode!=null && (tempNode.tagName!="BODY")){
		var computedOverflow;
			try {
			computedOverflow=ew1017460_getStyle(tempNode, "overflow");
			if (computedOverflow=="hidden") return true;
			} catch(e) { return false; }
		tempNode=tempNode.parentNode;
	}
	return false;

}

function ew1017460_getStyle(tmpnode, style){
	var cStyle=null;
	if (tmpnode.currentStyle){ cStyle=tmpnode.currentStyle[style]; } else { try { cStyle=ew1017460_flashObjectWindow.document.defaultView.getComputedStyle(tmpnode,null).getPropertyValue(style); } catch(e) { } }
	return cStyle;
}

function ew_modifyOverflow1017460(){
	var tmpNode=ew1017460_flashObjectWindow.document.getElementById("ew_BannerDiv1017460").parentNode;
	while (tmpNode!=null && tmpNode.tagName!="BODY"){
		try {
			var dispStyle=ew1017460_getStyle(tmpNode, "display");
			if ((dispStyle=="block") || (dispStyle=="table-cell")){
				var dispOverflow=ew1017460_getStyle(tmpNode, "overflow");
				if (dispOverflow=="hidden") tmpNode.style.overflow="visible";
			}
			tmpNode=tmpNode.parentNode;
		} catch(e) { return; }
	}
}

var ew1017460_saveZIndex;
function ew_modifyZIndex1017460()
{

    if (isIe)
    {
		var count = 0;
		var tempElement = ew1017460_flashObjectWindow.document.getElementById("ew_BannerDiv1017460").parentElement; 

		if (tempElement!=null)
		{
			ew1017460_saveZIndex = new Array();
			while (tempElement!=null && tempElement.tagName != "BODY")
			{
				computedDisplay = tempElement.currentStyle.display;
				if ((computedDisplay == "block") || (computedDisplay == "table-cell"))
				{
					if (tempElement.currentStyle.zIndex==0)
					{ 
						var tempPair=new Array(2);
						tempPair[0] = tempElement;
						tempPair[1] = tempElement.currentStyle.zIndex;
						ew1017460_saveZIndex[count] = tempPair;
						count++;
						tempElement.style.zIndex=1; 
					}
				}
				tempElement=tempElement.parentElement;
			}
		}
	}
}

function ew_restoreZIndex1017460()
{

	if (ew1017460_saveZIndex != null) 
	{
		for (i = 0; i < ew1017460_saveZIndex.length; i++)
		{
			var tempPair = ew1017460_saveZIndex[i];
			var tempElement = tempPair[0];
			var tempZIndex = tempPair[1];
			if (tempElement != null)
				tempElement.style.zIndex = tempZIndex;
		}
		ew1017460_saveZIndex = null;	
	}
}



function ew_contract1017460()
{

	ew_resize1017460(728, 90, 0, 0);
}

function ew_expand1017460()
{

	ew_resize1017460(728, 290, 0, 0);
}

function ew_reset1017460()
{
	ew_changeHeight1017460(290);
}

function ew_resize1017460(newWidth, newHeight, offsetX, offsetY)
{
	ew_changeHeight1017460(290);

if (isIe) var ew1017460_shimObj = ew1017460_flashObjectWindow.document.getElementById('ew_shim1017460');
	if (newWidth > 728 || newHeight > 90)
	{

		ew1017460_isExpanded = true;
		if (isIe)
		{

			try {
			ew1017460_shimObj.style.top = '-0px';
			ew1017460_shimObj.style.left = '-0px';
			ew1017460_shimObj.style.height = '290px';
			ew1017460_shimObj.style.width = '728px';
			} catch(e) {  }

			ew_modifyZIndex1017460();
		}

	}
	else
	{

		ew1017460_isExpanded = false;
		if (isIe)
		{

			try {
			ew1017460_shimObj.style.height = '90px';
			ew1017460_shimObj.style.width = '728px';
			ew1017460_shimObj.style.top = "0px";
			ew1017460_shimObj.style.left = "0px";
			} catch(e) {  }

			ew_restoreZIndex1017460();
		}
	
	}

	ew1017460_flashObjectWindow.document.getElementById('ew_FlashDiv1017460').style.clip = "rect("+offsetY+"px "+(offsetX+newWidth)+"px "+(offsetY+newHeight)+"px "+offsetX+"px)";


}

function ew_onmouseout1017460()
{
	
	ew_changeHeight1017460(291);
}

var ew1017460_embed = null;
function ew_changeHeight1017460(newHeight)
{
	if (typeof(ew_externalInterfaceVerified1017460 == null))
		ew_externalInterfaceVerified1017460 = ew_isAvailableExternalInterface1017460();

	if (ew_externalInterfaceVerified1017460 && (newHeight > 290))
	{
		try {
			ew_getSWFTag1017460().ew_rolloff();
		} catch(e) {  }
	}

	if (typeof(ew1017460_embed) == "undefined" || ew1017460_embed == null)
		ew1017460_embed = ew_getSWFTag1017460(); 

	if (isIe || ew_isSafari)
		try { ew1017460_embed.style.height=newHeight + "px"; } catch(e) { return; }

	if (isGecko || isOpera)
	{
		try {
		ew1017460_embed.height = newHeight;
		ew1017460_embed.style.height = newHeight + "px";
		} catch(e) { return; }
	}
}


if (!isIe)
{
ew1017460_positionCorrect += " margin:auto; ";
ew1017460_centerCode = 'align="center" ';
}

var failoverHTML1017460 = '<a href="http://www.eyewonderlabs.com/ct.cfm?ewbust=0&file=http://cdn1.eyewonder.com/200125/755360/1017460/failover.gif&eid=1017460&name=Clickthru-failover&num=1&time=0&diff=0&click='+escape(failclickTag)+'" target="_blank"><img src="'+cp1017460+'failover.gif" border="0"></a>';

var flashHTML1017460='<div id="ew_BannerDiv1017460" '+ew1017460_centerCode+'style="visibility:visible; display:block; position:relative; '+ew1017460_positionCorrect+'overflow:visible; width:728px; height:90px; z-index: ' + ew1017460_minZIndex + '">';

flashHTML1017460 += '<img src="'+cp1017460+'dot.gif" border="0" id="ew_initFrame1017460">';

flashHTML1017460 +='</div>';

var flashHTMLonLoad1017460='<div id="ew_FlashDiv1017460" onmouseout="ew_onmouseout1017460()" style="visibility:visible; position:absolute; top:-0px; left:-0px; width:728px; height:290px; clip: rect(0px 728px 90px 0px); z-index: ' + (ew1017460_minZIndex+2) + '">'
+'<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="' + ew1017460_protocol + 'fpdownload.adobe.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="728" height="290" id="ewad1017460" align="middle">'
+'<param name="allowScriptAccess" value="always" />'
+'<param name="movie" value="'+cp1017460+ew1017460_creativeName+'" />'
+'<param name="quality" value="high" />'
+'<param name="bgcolor" value="#FFFFFF" />'
+'<param name="base" value="'+cp1017460+'" />'
+'<param name="wmode" value="transparent" />'
+'<param name="allowFullScreen" value="true" />'
+'<param name="FlashVars" value="'+ewflashvars1017460+'" />'
+'<embed id="ewembed1017460" src="'+cp1017460+ew1017460_creativeName+'" base="'+cp1017460+'" wmode="transparent" quality="high" bgcolor="#FFFFFF" width="728" height="290" name="ewad1017460" FlashVars="'+ewflashvars1017460+'" align="middle" allowScriptAccess="always" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="' + ew1017460_protocol + 'adobe.com/go/getflashplayer" />'
+'</object></div>'
+'<div style="position:absolute;top:0px;left:0px;z-index:0"><img src="'+cp1017460+'dot.gif" id="trackingImage1017460" width="1" height="1" border="0"></div>';

if(isIe)
	flashHTMLonLoad1017460 +='<iframe id="ew_shim1017460" src="about:blank" noresize="true" scrolling="no" display="none" frameborder=0 marginheight=0 marginwidth=0 style="filter:progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0); visibility:visible; position:absolute; top:0px; left:0px; width:728px; height:90px ;z-index:' + ew1017460_minZIndex + '"></iframe>';


var iframeHTML1017460 = "";

if(ew_isIFrame) {
	var mpTrkStr = "";

	var ew1017460_interimWidth = 1;
	var ew1017460_interimHeight = 1;

	var attributesExtra = "";
	var styleExtra = "";
	if (typeof(ew_pubInfo) == "undefined" || ew_pubInfo == null)
		ew_pubInfo = "";

	if (isIe)
		attributesExtra = 'allowtransparency="true"';
	iframeHTML1017460 = '<iframe id="ew_expAd" border="0"  width="'+ew1017460_interimWidth+'" height="'+ew1017460_interimHeight+'" noresize'
	+ ' style="position: absolute; top: 0px; left: 0px; ' + styleExtra + '" ' + attributesExtra
	+ ' scrolling="No" frameborder="0" marginheight="0" marginwidth="0" src="'
	+ ew_interimFile+'?url='+cp1017460+'exp_Inc.js'
	+ '?interim='+escape(ew_interimFile)
	+ '&clickTagFramePrepend='+escape(clickTagFramePrepend)
	+ '&iframeURL='+escape(document.URL)
	+ '&cp='+escape(cp1017460)
	+ '&extra='+escape(ew1017460_iFrameQueryStringExtra)
	+ '&stime='+escape(ew1017460_startTime)
	+ '&cb='+escape(ew_cacheBuster)
	+ '&pubinfo='+escape(ew_pubInfo)
	+ mpTrkStr

	+ '"></iframe>';
}


var ew1017460_onLoadWasCalled = false;
function ew_onLoad1017460()
{
	if (ew1017460_onLoadWasCalled == true)
		return;
	ew1017460_onLoadWasCalled = true;
	flashHTMLonLoad1017460 += onLoadTracker1017460();
	if (typeof(ew1017460_afterLoader) != 'undefined' && ew1017460_afterLoader != null)
		window.setTimeout(ew1017460_afterLoader, ew1017460_afterLoadTimer);



	if (isGecko && geckoRevisionMajor < 1)
	{
		failReason = "browser";
		ew1017460_weSupport = false;
	}


	if (ew1017460_weSupport)
		ew1017460_isOverflowHidden = ew_checkOverflowHidden1017460();
	
	if (ew1017460_isOverflowHidden && !(isGecko  || (isIe && (ieVersion >= 6.0)) || (isOpera && (operaVersion >= 8)) || (ew_isSafari && webkitVersion > 520)))
	{
		failReason = "browser";
		ew1017460_weSupport = false;
	}

	var mybannerDiv = ew1017460_flashObjectWindow.document.getElementById('ew_BannerDiv1017460');


	if (ew1017460_weSupport)
	{
		if (ew1017460_isOverflowHidden == true)	
			ew_modifyOverflow1017460();


		mybannerDiv.innerHTML=flashHTMLonLoad1017460;
        try
		{
		if (isCamino || ew_isSafari || (isGecko && isMac && parseFloat(geckoRevisionString) >= 1.9))
			mybannerDiv.addEventListener("mouseout",ew_onmouseout1017460,true);
		} catch(e) {  }


		if(ew1017460_removeFromFlow)
		{
			function ew_reposition1017460()
			{
				var mybannerDiv = ew1017460_flashObjectWindow.document.getElementById('ew_BannerDiv1017460');
				var positionDiv = ew1017460_flashObjectWindow.document.getElementById('ew1017460_positionDiv');
				mybannerDiv.style.position = "absolute";
				mybannerDiv.style.top = findPosY(positionDiv)+"px";
				mybannerDiv.style.left = findPosX(positionDiv)+"px";
				return mybannerDiv;
			}
			function ew1017460_reposAd()
			{
				if (typeof(ew_reposition1017460) != "undefined")	
					ew_reposition1017460();
			}
			document.body.appendChild( ew_reposition1017460() );

			if (window.attachEvent) ew1017460_flashObjectWindow.attachEvent("onresize",ew1017460_reposAd);
			else if (window.addEventListener) ew1017460_flashObjectWindow.addEventListener("resize",ew1017460_reposAd,false);
			if (ew1017460_rffInterval > 0) ew1017460_rffTimer = window.setInterval(ew1017460_reposAd, ew1017460_rffInterval);
		}

		if (isIe)
			ew1017460_flashObjectWindow.ewad1017460 = ew1017460_flashObjectWindow.document.getElementById('ewad1017460');
	 
	} else {
		var failReasonTracker = "";
		if (failReason == "browser")
			failReasonTracker = failoverReasonBrowserTracker1017460();
		else if (failReason == "flash")
			failReasonTracker = failoverReasonFlashTracker1017460();
		mybannerDiv.innerHTML=failoverHTML1017460+failoverTracker1017460()+failReasonTracker;
	}
	
	if (isIe) try { ew1017460_fixFlash(); } catch(e) {  }
}


if (ew1017460_weSupport) {
	document.writeln(weSupportTracker1017460());
	if(ew_isIFrame) {
		document.writeln(flashHTML1017460);
		document.writeln(iframeHTML1017460);
	} else {
		if (ew1017460_removeFromFlow || isLinux) document.writeln('<div id="ew1017460_positionDiv" name="ew1017460_positionDiv" style="position: relative; width:728px; height:90px; margin:auto; visibility:hidden;"></div>');
		
		document.writeln(flashHTML1017460);
		document.writeln(flashTracker1017460());

		if (isIe)
		{
			ew1017460_flashObjectWindow.ewad1017460 = new Object();
			ew1017460_flashObjectWindow.ewad1017460.SetReturnValue = function() {}
		}
		
		if (ew1017460_forceLoad)
		{
			if (typeof(ew1017460_forceLoadTimer) != 'undefined' && (!isNaN(ew1017460_forceLoadTimer)))
				setTimeout(ew_onLoad1017460, ew1017460_forceLoadTimer);
			else
				setTimeout(ew_onLoad1017460, 2000);
		}
		else if (isIe && document.readyState == 'complete')
			ew_onLoad1017460();
		else
		{
			if (window.addEventListener) ew1017460_flashObjectWindow.addEventListener("load",ew_onLoad1017460,false);
				else if (window.attachEvent) ew1017460_flashObjectWindow.attachEvent("onload",ew_onLoad1017460);
			if (ew1017460_inFIF)
				window.setTimeout(ew_onLoad1017460, 3000);

		}
	}
} else {
	
	if(!ew1017460_turnOffExecution)
		document.writeln(failoverTracker1017460());
	else
		document.writeln(failoverTurnOffExecutionTracker1017460());
	if (failReason == "browser")
		document.writeln(failoverReasonBrowserTracker1017460());
	else if (failReason == "flash")
		document.writeln(failoverReasonFlashTracker1017460());
	document.writeln(failoverHTML1017460);
}

if (ew1017460_inFIF) 
	document.close();

