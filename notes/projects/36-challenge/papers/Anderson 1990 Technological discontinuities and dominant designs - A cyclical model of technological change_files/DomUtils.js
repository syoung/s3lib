/*
 *  Give it a DOM object and let it strip out
 *  those pesky #text nodes from mozilla for you
 */
function stripEmptyTextNodes(element) {
	for(var i = 0; i < element.childNodes.length; i++) {
		alert(element.childNodes[i].nodeName);
		if(element.childNodes[i].nodeName == "#text") {
			element.removeChild(element.childNodes[i]);
			i--;
		}
	}
	return element;
}
/*
 *  Do a simple getElementById and strip out the #text
 *  nodes while your at it, pass it an Object or a String
 *  of an ID
 */
function grabStrippedElement(ele) {
	if(typeof ele == "string") {
		return stripEmptyTextNodes(document.getElementById(ele));
	}else {
		return stripEmptyTextNodes(ele);
	}
}
function grabElement(ele) {
	if(typeof ele == "string") {
		return document.getElementById(ele);
	}else {
		return ele;
	}
}
function grabElesByTag(eleType) {
	if(arguments.length < 2) {
		return document.getElementsByTagName(eleType);
	}else {
		return arguments[1].getElementsByTagName(eleType);
	}
}
function grabEleByNameAndClass(name, className, element) {
	var collectionWithClass = new Array();
	var searchElement = grabElement(element);
	var collection = grabElesByTag(name, searchElement);
	for(var i=0;i<collection.length;i++) {
		if(hasClass(collection[i], className)) {
			collectionWithClass.push(collection[i]);
		}
	}
	return collectionWithClass;
}
var __isNS__ = false;
if(document.getElementById && !document.all) {
	__isNS__ = true;
}

/*
 * object used to add onload functions for the body onload event
 * this way we can keep JS that needs to run onload unobtrusive
 *
 * usage: windowObject.addLoadFunction([pass function], [pass function]);
 * you can pass 1 or more functions, the number does not matter
 */
	var WindowObject = function(win) {
		this._win = win;
		this.stack = [];
	};
	WindowObject.prototype = {
		"runFuncs": function() {
			for(var index = 0; index < this.stack.length; index++) {
				this.stack[index]();
			}
		},
		"addLoadFunction": function() {
			for(var index = 0; index < arguments.length; index++) {
				this.stack.push(arguments[index]);
			}
		}
	};
	var windowObject = new WindowObject(this);
	function runOnLoad() {
		windowObject.runFuncs();
	}
	window.onload = runOnLoad;



