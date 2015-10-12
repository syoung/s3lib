// ==UserScript==
// @name          Hatena Bookmark :: Auto Hide Footer
// @namespace     http://userstyles.org
// @description	  http://b.hatena.ne.jp/
// @author        NAME IS NULL
// @homepage      http://userstyles.org/styles/15119
// @include       http://b.hatena.ne.jp/*
// @include       https://b.hatena.ne.jp/*
// @include       http://*.b.hatena.ne.jp/*
// @include       https://*.b.hatena.ne.jp/*
// @run-at        document-start
// ==/UserScript==
(function() {
var css = "#footer{\n  position:fixed!important;\n  left:0!important;\n  right:0!important;\n  bottom:0!important;\n  height:auto!important;\n\n  z-index:111!important;\n}\n#footer:not(:active) > .line:not(:hover),\n#footer:active > .line + .copyright,\n#footer > .line:hover + .copyright{\n  display:none!important;\n}\n.line{\n  margin:0!important;\n}\n#prefooter{\n  height:10px!important;\n}";
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		var node = document.createElement("style");
		node.type = "text/css";
		node.appendChild(document.createTextNode(css));
		heads[0].appendChild(node); 
	}
}
})();
