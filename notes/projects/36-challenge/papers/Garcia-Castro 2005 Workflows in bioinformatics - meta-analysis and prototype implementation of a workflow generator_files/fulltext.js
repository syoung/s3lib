var initialLeft = 0;
var initialTop = 0;
var outline = new Object();
var leftcolumn = new Object();
window.onload = initOutline;
window.onresize = windowonresize;
window.onscroll = document.documentElement.onscroll = setMenuOffset;

function initOutline() {
	outline = document.getElementById('outline');
	leftcolumn = document.getElementById('leftcolumn');
	if (outline) {
		initialLeft = parseInt(findPos(leftcolumn)[0]);
		initialTop = parseInt(findPos(outline)[1]);
		outline.style.position = 'static';
		setMenuOffset();
	}
}

// initializeOutline to be removed when onload=initOutline in place
function initializeOutline() {
}

function windowonresize() {
	if (outline) {
		initialLeft = parseInt(findPos(leftcolumn)[0]);
		outline.style.left = initialLeft + 'px';
	}
}

function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
		curtop = obj.offsetTop
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
	}
	return [curleft,curtop];
}

function findPosX(obj)
	{
	var curleft = 0;
	if(obj.offsetParent)
	while(1) 
	{
	  curleft += obj.offsetLeft;
	  if(!obj.offsetParent)
	    break;
	  obj = obj.offsetParent;
	}
	else if(obj.x)
	curleft += obj.x;
	return curleft;
	}

function findPosY(obj)
	{
	var curtop = 0;
	if(obj.offsetParent)
	while(1)
	{
	  curtop += obj.offsetTop;
	  if(!obj.offsetParent)
	    break;
	  obj = obj.offsetParent;
	}
	else if(obj.y)
	curtop += obj.y;
	return curtop;
	}

function setMenuOffset() {
	if (outline && outlineok()) {
		var scrllTop = document.documentElement.scrollTop || document.body.scrollTop; // body for Safari
		var scrllLeft = document.documentElement.scrollLeft || document.body.scrollLeft; // body for Safari
		if (scrllTop <= initialTop) {
			if (outline.style.position != 'fixed') {
			}
			else {
				outline.style.position = 'static'
			}
		}
		else {
			if (outline.style.position == 'fixed') {
			}
			else {
				outline.style.position = 'fixed';
				outline.style.top = '0px';
				outline.style.left = initialLeft + 'px';
			}
		}
		if (scrllLeft > 0) {
			if (outline.style.position != 'fixed') {
			}
			else {
				outline.style.left = initialLeft - scrllLeft + 'px';
			}
		}
	}
}

var textholder = "";
var titleholder = "";
function outlineok() {
var ok = true;
if (navigator.vendor) ok = (navigator.vendor.indexOf("Apple") == -1);
return ok;
}
function outlineover(current) {
if ((current.className && current.innerHTML) && outlineok()) {
	textholder = current.innerHTML;
	titleholder = current.innerHTML = current.title;
	current.title = "";
	current.className = "full";
	}
}
function outlineout(current) {
if ((current.className && current.innerHTML) && outlineok()) {
//if ((current.className && current.innerHTML) && (current.title != titleholder)){
	current.innerHTML = textholder;
	current.title = titleholder;
	current.className = "clipped";
	}
}

function totext() {
	document.write("<a href='javascript:turn();'>Return to text</a>")
}