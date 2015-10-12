/* $Id$ */

var feature_timeout = false;

function convert_links() {

	var a = document.getElementsByTagName('a');
	for(var i = 0; i < a.length; i++) {
		if(a[i].href.substr(0, 27) != 'http://www.electrictoolbox.' && a[i].href != 'http://feedproxy.google.com/ElectricToolboxBlog' && a[i].href.substr(0, 24) != 'http://www.mybloglog.com' && a[i].href.substr(0, 11) != 'javascript:') {
			a[i].href = '*' + encodeURI(a[i].href);
		}
	}
	
}

//window.onload = convert_links;
