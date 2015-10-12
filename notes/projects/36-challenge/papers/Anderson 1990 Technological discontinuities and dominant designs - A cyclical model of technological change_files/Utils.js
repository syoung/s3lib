function hasIndexOf(theString, theIndex) {
	if(theString.indexOf(theIndex) == -1) {
		return false;
	}
	return true;
} 
function addClass(item, classToAdd) {
	if(!hasClass(item, classToAdd)) {
		item.className += (" " + classToAdd);
	}
}

function removeClass(item, classToRemove) {
	if(hasIndexOf(item.className, classToRemove)) {
		var theClass = item.className;
		var classes = theClass.split(" ");
		for(var i = 0; i < classes.length; i++) {
			if(classes[i] == classToRemove || classes[i] == " ") {
				classes.splice(i, 1);
			}
		}
		item.className = classes.join(" ");
	}
}
function hasClass(item, classToSearch) {
	if(hasIndexOf(item.className, classToSearch)) {
		var theClass = item.className;
		var classes = theClass.split(" ");
		for(var i = 0; i < classes.length; i++) {
			if(classes[i] == classToSearch) {
				return true;
			}
		}
	}
	return false;
}
function getFileName(theString) {
	if(hasIndexOf(theString, "/")) {
		var firstpos = theString.lastIndexOf("/") + 1;
		var lastpos = theString.length;
		return theString.substring(firstpos, lastpos);	
	}
}
function getQSValue(getThisVar) {
	var toReturn = "";
	//kick out if theres no Query String
	if(!hasIndexOf(document.URL, "?")) {return false;}
	var QS = document.URL.substring(document.URL.indexOf("?") + 1);
	var variables = QS.split("&");
	for(var i = 0; i < variables.length; i++) {
		if(hasIndexOf(variables[i], getThisVar)) {
			//if we find it the return its value
			toReturn = variables[i].split("=")[1];
			return toReturn;
		}
	}
	//if all else fails return false
	return false;
}