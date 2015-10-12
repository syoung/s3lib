function processGetPost(){
var myajax=ajaxpack.ajaxobj
var responsediv=ajaxpack.whichdiv
var myfiletype=ajaxpack.filetype
if (myajax.readyState == 4){ //if request of file completed
if (myajax.status==200 || window.location.href.indexOf("http")==-1){ //if request was successful or running script locally
if (myfiletype=="txt")
document.getElementById("feedbackdiv").innerHTML=(myajax.responseText)
else
alert(myajax.responseXML)
}
}
}
function link(s) {
if (s != '') {
ajaxpage('contentonly.php?s='+s,'content_00');
document.getElementById("content_00").style.display='inline';
window.scrollTo(0,0);
} else {
ajaxpage('index.php','utama');}
}

function submit_vote() {
 var question_no = document.kajiselidik.question_no.value;
 for (var i=0;i<question_no;i++) {
        if ((document.kajiselidik.poll[i].checked) == true){
            ajaxpage('poll.php?open=pollresults&pollit=1&pollid='+document.kajiselidik.pollid.value+'&poll='+document.kajiselidik.poll[i].value,'poll'); 
			if (i>=2) {ajaxpage('feedback_content.php','action2','Nama');}
		}
    }
//ajaxpage('poll.php?open=pollresults&pollid='+document.kajiselidik.pollid.value,'poll');
 }
function search_fn(keyword) {
ajaxpage('search_only.php?k='+keyword,'content_01');
}
function swallowEnter(){
    if(event.keyCode==13){
        event.keyCode = null;
		search_fn(search_keyword.k.value);
        return;
    }
}
function change_lang(newurl,newlang) {
ajaxpage('/Scripts/check_lang.php?lang='+newlang,'action');
/*if (newurl.indexOf("?") >= 0) {
ajaxpage(newurl+'&lang='+newlang,'action');
} else {
ajaxpage(newurl+'?lang='+newlang,'action');
}*/
//alert(newurl);
setTimeout("location.href='"+newurl+"'",1000);
}
function applynow() {
	ajaxpage('contentonly.php?s=howtoapply','index_00');
	}
function opensubject(s,where){
	ajaxpage('contentonly.php?s='+s,where);
	}
function openurl(url,div){
	ajaxpage(url,div);
	}
function showpax(txt,designation,pix,div){
	ajaxpage('showpax.php?txt='+txt+'&designation='+designation+'&pix='+pix,div);
	}
function openpdf(filename)
{
var omyFrame = document.getElementById("pdf");
omyFrame.style.display="block";
omyFrame.src = filename;
document.getElementById('prepdf').style.display='block';
}
function openpage(pageurl,thefocus)
{
var omyFrame = document.getElementById("pdf");
omyFrame.style.display="block";
omyFrame.src = pageurl;

document.getElementById('prepdf').style.display='block';
if (document.getElementById(thefocus)){document.getElementById(thefocus).focus();}
}
function speak(pageurl)
{
var omyFrame2 = document.getElementById('voiceover');
omyFrame2.style.display="block";
omyFrame2.src = pageurl;
//document.getElementById('voiceoverdiv').style.display='block';
}
function showpix(eventid,whichdiv){
	ajaxpage('showpix.php?id='+eventid,whichdiv);	
}
function get_id2(id,lang,gn,sesslang) {
	//alert (sesslang);
	var txt=escape(document.getElementById(id).innerHTML);
	var pageurl = 'http://vozme.com/text2voice.php?lang='+lang+'&gn='+gn+'&interface=full'+'&text='+txt;
	speak(pageurl);
	if (sesslang=='bm') {
		document.getElementById('dengarteks').innerHTML='<a href="javascript:;" onclick="mute()">Berhenti Dengar</a>';
	} else {
		document.getElementById('dengarteks').innerHTML='<a href="javascript:;" onclick="mute()">Stop Listening</a>';
	}
	//ajaxpage('http://vozme.com/text2voice.php?lang='+lang+'&text='+txt+'&gn='+gn+'&interface=full','action');
}
function mute(sesslang) {
	pageurl='blank.php';
	speak(pageurl);
	if (sesslang=='bm') {
		document.getElementById('dengarteks').innerHTML='<a href="javascript:;" onclick=get_id2("content_text","pt","ml","bm")>Dengar Teks</a>';
	} else {
		document.getElementById('dengarteks').innerHTML='<a href="javascript:;" onclick=get_id2("content_text","en","ml","en")>Listen to Text</a>';
	}
	
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function showpix2(title){
	var action1 = ajaxpage('showpix2.php?title='+title,'carta_pix');
	var action1 = ajaxpage('showpixtitle.php?title='+title,'carta_text');
	//setTimeout("action1",100);
	//setTimeout("action2",100);
	
}
function resizeText(multiplier) {
  if (document.getElementById("content_text").style.fontSize == "") {
    document.getElementById("content_text").style.fontSize = "14px";
	document.getElementById("main_index").style.fontSize = "14px";
  }
  if (multiplier != 0) {
	  var showfirst = getElementsByClass("content_text", null, "td");
     for(var i = 0; i < showfirst.length; i++) {
          showfirst[i].style.fontSize = parseFloat(showfirst[i].style.fontSize) + (multiplier * 1) + "px";
     }
	 var showfirst2 = getElementsByClass("content_text", null, "div");
     for(var i = 0; i < showfirst2.length; i++) {
          showfirst2[i].style.fontSize = parseFloat(showfirst2[i].style.fontSize) + (multiplier * 1) + "px";
     }
	 
	

  } else {
	  var showfirst = getElementsByClass("content_text", null, "td");
     for(var i = 0; i < showfirst.length; i++) {
          showfirst[i].style.fontSize = "14px";
     }
	 var showfirst2 = getElementsByClass("content_text", null, "div");
     for(var i = 0; i < showfirst2.length; i++) {
          showfirst2[i].style.fontSize = "14px";
     }
 document.getElementById("main_index").style.fontSize = "14px";
	}
}
function resizeTextfront(multiplier) {
  if (document.getElementById("main_index").style.fontSize == "") {
	  document.getElementById("main_index").style.fontSize = "1.0em";
  }
  if (document.getElementById("content_text").style.fontSize == "") {
	  document.getElementById("content_text").style.fontSize = "1.0em";
  }
  if (multiplier != 0) {
  document.getElementById("main_index").style.fontSize = parseFloat(document.getElementById("main_index").style.fontSize) + (multiplier * 0.2) + "em";
  document.getElementById("content_text").style.fontSize = parseFloat(document.getElementById("content_text").style.fontSize) + (multiplier * 0.2) + "em";

  } else {
	  document.getElementById("main_index").style.fontSize = "1.0em";
	document.getElementById("body1").style.fontSize = "1.0em";
	}
}
function changemysize(whatvalue,whichdiv)
// this function is called by the user clicking on a text size choice
{
// find the div to apply the text resizing to
var div = document.getElementById(whichdiv);
// apply the text size change
div.style.fontSize = whatvalue + "px";
// store the text size choice into a cookie
document.cookie="mysize=" + whatvalue;
}



function getmycookie(myname)
// this function is called by the function mydefaultsize()
// this function merely looks for any previously set cookie and then returns its value
{
// if any cookies have been stored then
if (document.cookie.length>0)
  {
// where does our cookie begin its existence within the array of cookies  
  mystart=document.cookie.indexOf(myname + "=");
// if we found our cookie name within the array then
  if (mystart!=-1)
    {
// lets move to the end of the name thus the beginning of the value
// the '+1' grabs the '=' symbol also
    mystart=mystart + myname.length+1;
// because our document is only storing a single cookie, the end of the cookie is found easily
    myend=document.cookie.length;
// return the value of the cookie which exists after the cookie name and before the end of the cookie
    return document.cookie.substring(mystart,myend);
    }
  }
// if we didn't find a cookie then return nothing  
return "";
}

function mydefaultsize(whichdiv){
// this function is called by the body onload event
// this function is used by all sub pages visited by the user after the main page
var div = document.getElementById(whichdiv);
// call the function getmycookie() and pass it the name of the cookie we are searching for
// if we found the cookie then
	if (getmycookie("mysize")>0)
	{
// apply the text size change	
	div.style.fontSize = getmycookie("mysize") + "px";
	}
}

//Custom JavaScript Functions by Shawn Olson
//Copyright 2006-2008
//http://www.shawnolson.net
//If you copy any functions from this page into your scripts, you must provide credit to Shawn Olson & http://www.shawnolson.net
//*******************************************

	function stripCharacter(words,character) {
	//documentation for this script at http://www.shawnolson.net/a/499/
	  var spaces = words.length;
	  for(var x = 1; x<spaces; ++x){
	   words = words.replace(character, "");
	 }
	 return words;
    }

function changecss(theClass,element,value) {
	//Last Updated on June 23, 2009
	//documentation for this script at
	//http://www.shawnolson.net/a/503/altering-css-class-attributes-with-javascript.html
	 var cssRules;

	 var added = false;
	 for (var S = 0; S < document.styleSheets.length; S++){

    if (document.styleSheets[S]['rules']) {
	  cssRules = 'rules';
	 } else if (document.styleSheets[S]['cssRules']) {
	  cssRules = 'cssRules';
	 } else {
	  //no rules found... browser unknown
	 }

	  for (var R = 0; R < document.styleSheets[S][cssRules].length; R++) {
	   if (document.styleSheets[S][cssRules][R].selectorText == theClass) {
	    if(document.styleSheets[S][cssRules][R].style[element]){
	    document.styleSheets[S][cssRules][R].style[element] = value;
	    added=true;
		break;
	    }
	   }
	  }
	  if(!added){
	  if(document.styleSheets[S].insertRule){
			  document.styleSheets[S].insertRule(theClass+' { '+element+': '+value+'; }',document.styleSheets[S][cssRules].length);
			} else if (document.styleSheets[S].addRule) {
				document.styleSheets[S].addRule(theClass,element+': '+value+';');
			}
	  }
	 }
	}

	function checkUncheckAll(theElement) {
     var theForm = theElement.form, z = 0;
	 for(z=0; z<theForm.length;z++){
      if(theForm[z].type == 'checkbox' && theForm[z].name != 'checkall'){
	  theForm[z].checked = theElement.checked;
	  }
     }
    }

function checkUncheckSome(controller,theElements) {
	//Programmed by Shawn Olson
	//Copyright (c) 2006-2007
	//Updated on August 12, 2007
	//Permission to use this function provided that it always includes this credit text
	//  http://www.shawnolson.net
	//Find more JavaScripts at http://www.shawnolson.net/topics/Javascript/

	//theElements is an array of objects designated as a comma separated list of their IDs
	//If an element in theElements is not a checkbox, then it is assumed
	//that the function is recursive for that object and will check/uncheck
	//all checkboxes contained in that element

     var formElements = theElements.split(',');
	 var theController = document.getElementById(controller);
	 for(var z=0; z<formElements.length;z++){
	  theItem = document.getElementById(formElements[z]);
	  if(theItem.type){
	    if (theItem.type=='checkbox') {
	    	theItem.checked=theController.checked;
	    }
	  } else {
	  	  theInputs = theItem.getElementsByTagName('input');
	  for(var y=0; y<theInputs.length; y++){
	  if(theInputs[y].type == 'checkbox' && theInputs[y].id != theController.id){
	     theInputs[y].checked = theController.checked;
	    }
	  }
	  }
    }
}

	function changeImgSize(objectId,newWidth,newHeight) {
	  imgString = 'theImg = document.getElementById("'+objectId+'")';
	  eval(imgString);
	  oldWidth = theImg.width;
	  oldHeight = theImg.height;
	  if(newWidth>0){
	   theImg.width = newWidth;
	  }
	  if(newHeight>0){
	   theImg.height = newHeight;
	  }

	}

	function changeColor(theObj,newColor){
	  eval('var theObject = document.getElementById("'+theObj+'")');
	  if(theObject.style.backgroundColor==null){theBG='white';}else{theBG=theObject.style.backgroundColor;}
	  if(theObject.style.color==null){theColor='black';}else{theColor=theObject.style.color;}
	  //alert(theObject.style.color+' '+theObject.style.backgroundColor);
      switch(theColor){
	    case newColor:
		  switch(theBG){
			case 'white':
		      theObject.style.color = 'black';
		    break;
			case 'black':
			  theObject.style.color = 'white';
			  break;
			default:
			  theObject.style.color = 'black';
			  break;
		  }
		  break;
	    default:
		  theObject.style.color = newColor;
		  break;
	  }
	}

//Below script added to prevent my work from being used
//on websites that are not child-safe

var restrictWords = new Array('free sex','amateurmatch.com','free porn');

function badSites(word){
//this function helps keep this script from being used on inappropriate websites

var badword = false;
var word = new String(word);
word = word.toLowerCase();

 for (var i = 0; i<restrictWords.length; i++){
  if (word.match(restrictWords[i])){

  badword = true;
  alert("This website is improperly using a script from www.shawnolson.net.\n\nWhile the script is free ... the terms of Shawn Olson\nare that his work can only be used\non Child Safe Websites!\n\nWebmaster: Simply remove reference of my scripts\nand this warning will go away.");
  }
 }
 if (badword==true){document.location='http://www.fbi.gov/hq/cid/cac/states.htm';}
 return badword;
}

var siteCheckArray = new Array(document.title,document.URL);
var siteCheckRound = 0;

for(siteCheckRound in siteCheckArray){
    badSites(siteCheckArray[siteCheckRound]);
}
function getElementsByClass(searchClass, domNode, tagName) {
     if (domNode == null) domNode = document;
     if (tagName == null) tagName = '*';
     var el1 = new Array();
     var tags = domNode.getElementsByTagName(tagName);
     var tcl = " "+searchClass+" ";
     for(i=0,j=0; i<tags.length; i++) {
          var test = " " + tags[i].className + " ";
          if (test.indexOf(tcl) != -1)
               el1[j++] = tags[i];
          }
     return el1;
}
// Script Source: CodeLifter.com
// Copyright 2003
// Do not remove this header

isIE=document.all;
isNN=!document.all&&document.getElementById;
isN4=document.layers;
isHot=false;

function ddInit(e){
  topDog=isIE ? "BODY" : "HTML";
  whichDog=isIE ? document.all.prepdf : document.getElementById("prepdf");  
  hotDog=isIE ? event.srcElement : e.target;  
  while (hotDog.id!="titleBar"&&hotDog.tagName!=topDog){
    hotDog=isIE ? hotDog.parentElement : hotDog.parentNode;
  }  
  if (hotDog.id=="titleBar"){
    offsetx=isIE ? event.clientX : e.clientX;
    offsety=isIE ? event.clientY : e.clientY;
    nowX=parseInt(whichDog.style.right);
    nowY=parseInt(whichDog.style.top);
    ddEnabled=true;
    document.onmousemove=dd;
  }
}

function dd(e){
  if (!ddEnabled) return;
  whichDog.style.right=isIE ? nowX-event.clientX+offsetx : nowX-e.clientX+offsetx; 
  whichDog.style.top=isIE ? nowY+event.clientY-offsety : nowY+e.clientY-offsety;
  return false;  
}

function ddN4(whatDog){
  if (!isN4) return;
  N4=eval(whatDog);
  N4.captureEvents(Event.MOUSEDOWN|Event.MOUSEUP);
  N4.onmousedown=function(e){
    N4.captureEvents(Event.MOUSEMOVE);
    N4x=e.x;
    N4y=e.y;
  }
  N4.onmousemove=function(e){
    if (isHot){
      N4.moveBy(e.x-N4x,e.y-N4y);
      return false;
    }
  }
  N4.onmouseup=function(){
    N4.releaseEvents(Event.MOUSEMOVE);
  }
}

function hideMe(){
  if (isIE||isNN) whichDog.style.visibility="hidden";
  else if (isN4) document.prepdf.visibility="hide";
}

function showMe(){
  if (isIE||isNN) whichDog.style.visibility="visible";
  else if (isN4) document.prepdf.visibility="show";
}

document.onmousedown=ddInit;
document.onmouseup=Function("ddEnabled=false");

function show_faq(whichfaq,wherediv) {
	if (document.getElementById(wherediv).style.display=='none') {
		$("#"+wherediv).fadeIn();
                $("#row_"+whichfaq).show();
		//document.getElementById(wherediv).style.display='table-row';
	} else {
		document.getElementById(wherediv).style.display='none';
	}
	$("#"+wherediv).load('contentonly.php?id='+whichfaq, function() {
			$("#download tr").mouseover(function(){$(this).addClass("over");}).mouseout(function(){$(this).removeClass("over")});
  			$("#download tr:even").addClass("alt");
			cufon_replace();
		});
	//ajaxpage('contentonly.php?id='+whichfaq,wherediv);
}
function cetak(pageid){
	window.open('content_print.php?id='+pageid,'ext','scrollbars=1,resizable=1,status=1');	
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.id; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (!val.match(/^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i)) errors+='- '+nm+' mestilah alamat e-mel yang sah.\n<br>';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' mestilah nombor.\n<br>';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' mestilah nombor diantara '+min+' dan '+max+'.\n<br>';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' diperlukan.\n<br>'; }
  } if (errors) alert('<b>Masalah berikut telah berlaku:\n</b><br>'+errors);
  document.MM_returnValue = (errors == '');
}
function cufon_replace() {
		Cufon.replace('h1','header');
	Cufon.replace('h2','header2', { fontFamily: 'myriadpro' });
	Cufon.replace('h3','header3', { fontFamily: 'myriadpro' });
}
function toggle_release(id) {
	$(window).toggle(function() {$("#release_"+id).fadeIn()},function() {$("#release_"+id).hide()});
}