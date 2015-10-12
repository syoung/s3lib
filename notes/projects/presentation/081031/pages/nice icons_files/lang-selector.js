function setup_langSelector() {
	var langLinks = document.getElementById("lang-links");
	if (!langLinks || (is && is.ie5)) { return; }
	addClassName(langLinks.parentNode, 'scripted-languages'); // triggers alternate css layout
	var form = document.createElement('form');
	langLinks.parentNode.insertBefore(form, langLinks);
	form.action = '';
	var select = document.createElement('select');
	var as = langLinks.getElementsByTagName('a');
	for (var a=0; a<as.length; a++) {
		var href = (as[a].href) ? as[a].href : window.location.href;
		addOptionToSelect(select, as[a].firstChild.nodeValue, href, ((as[a].href)?false:true));
	}
	form.appendChild(select);
	select.onchange = function() {
		window.location = this.options[this.options.selectedIndex].value;
	};
	langLinks.parentNode.removeChild(langLinks);
}

function addOptionToSelect(selectObj, text, value, selected) {
	var opt = selectObj.options[selectObj.options.length] = new Option(text, value);
	if (selected) {
		opt.selected = true;
		opt.defaultSelected = true;
		addClassName(opt, 'selected');
	}
}

window.attemptsSetupLangSelector = 0;

window.trySetupLangSelector = function() {
	var list = document.getElementById("lang-links");
	if ((!list || !list.parentNode.nextSibling) && window.attemptsSetupLangSelector < 600) { // fail after 600 attempts
		window.attemptsSetupLangSelector++;
		window.setTimeout("window.trySetupLangSelector()", 100); // try again every 1/10 of a second
	} else if (list && list.parentNode.nextSibling) { setup_langSelector(); }
	else {
		//alert("failed to set up language selector");
	}
}

window.trySetupLangSelector();

// ADD CLASSES TO OBJECTS
function addClassName(element, className){
	if (hasClassName(element, className)) { return false; }
	if (!element.className) { element.className = className; }
	else { element.className += ' '+className; }
	return true;
}

// REMOVE CLASSES FROM OBJECTS
function removeClassName(element, className){
	if (!hasClassName(element, className)) { return false; }
	var classNames = element.className.split(' ');
	var newClassNames = [];
	for (var a=0; a<classNames.length; a++){
		if (classNames[a] != className) { newClassNames[newClassNames.length] = classNames[a]; }
	}
	element.className = newClassNames.join(' ');
	return true;
}

// TEST FOR CLASS NAME
function hasClassName(element, className){
	var exp = new RegExp("\\b"+className+"\\b");
	return (element.className && exp.exec(element.className))?true:false;
}

