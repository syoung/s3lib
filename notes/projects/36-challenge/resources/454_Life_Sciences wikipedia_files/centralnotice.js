
function toggleNotice() {
	var notice = document.getElementById('centralNotice');
	if (!wgNoticeToggleState) {
		notice.className = notice.className.replace('collapsed', 'expanded');
		toggleNoticeCookie('0');
	} else {
		notice.className = notice.className.replace('expanded', 'collapsed');
		toggleNoticeCookie('1');
	}
	wgNoticeToggleState = !wgNoticeToggleState;
}
function toggleNoticeStyle(elems, display) {
	if(elems)
		for(var i=0;i<elems.length;i++)
			elems[i].style.display = display;
}
function toggleNoticeCookie(state) {
	var e = new Date();
	e.setTime( e.getTime() + (7*24*60*60*1000) ); // one week
	var work='hidesnmessage='+state+'; expires=' + e.toGMTString() + '; path=/';
	document.cookie = work;
}
function pickTemplate(templates, weights) {
	var weightedTemplates = new Array();
	var currentTemplate = 0;
	var totalWeight = 0;

	if (templates.length == 0)
		return '';

	while (currentTemplate < templates.length) {
		totalWeight += weights[currentTemplate];
		for (i=0; i<weights[currentTemplate]; i++) {
			weightedTemplates[weightedTemplates.length] = templates[currentTemplate];
		}
		currentTemplate++;
	}
	
	if (totalWeight == 0)
		return '';

	var randomnumber=Math.floor(Math.random()*totalWeight);
	return weightedTemplates[randomnumber];
}


var wgNoticeToggleState = (document.cookie.indexOf('hidesnmessage=1')==-1);
document.writeln("\x3cstyle type=\"text/css\"\x3e\n#centralNotice .siteNoticeSmall{display:none;}\n#centralNotice .siteNoticeSmallAnon{display:none;}\n#centralNotice .siteNoticeSmallUser{display:none;}\n#centralNotice.collapsed .siteNoticeBig{display:none;}\n#centralNotice.collapsed .siteNoticeSmall{display:block;}\n#centralNotice.collapsed .siteNoticeSmallUser{display:block;}\n#centralNotice.collapsed .siteNoticeSmallAnon{display:block;}\n#centralNotice.anonnotice .siteNoticeSmallUser{display:none !important;}\n#centralNotice.usernotice .siteNoticeSmallAnon{display:none !important;}\n\x3c/style\x3e");

wgNotice=pickTemplate(["\x3cstyle type=\"text/css\"\x3e\n/*\nStyles for Notices\n*/\n\n.notice-wrapper, .notice-collapsed-wrapper {\n	margin: 0;\n	padding: 0;\n	font-family: Arial,Helvetica,Tahoma,sans-serif;\n	color: #333;\n	background-color: #ddd;\n	font-size: 1.2em;\n	font-weight: 200;\n}\n.siteNoticeSmallUser {\n  font-size: 1.2em;\n  text-align: left;\n}\n\n.notice-wrapper a,\n.notice-collapsed-wrapper a\n{\n	color: #006699;\n}\n\n.notice-wrapper a:hover { text-decoration: underline; }\n.notice-collapsed-wrapper a:hover { text-decoration: underline; }\n\n.notice-wrapper\n{\n	border: 1px solid #bbb;\n	background-color: #fcfcfc;\n	background-repeat: no-repeat;\n	height: 115px;\n	font-size: 1.4em;\n	padding: 5px 5px;\n}\n\n.notice-collapsed-wrapper\n{\n	border: 1px solid #bbb;\n	text-align: left;\n	background-color: #fcfcfc;\n	font-size: 1.7em;\n	padding: 5px 5px;\n}\n\n.toggle-box\n{\n	float: right;\n	font-size: 0.6em;\n}\n\n.notice-text\n{\n	padding: 0 120px;\n	margin-left: auto;\n	margin-right: auto;\n	margin-bottom: 5px;\n        white-space: nowrap;\n}\n\n.notice-text :hover\n{\n        text-decoration: underline;\n}\n\n.red-button\n{\n	background-image: url(http://upload.wikimedia.org/centralnotice/images/button-red.png);\n	width: 158px;\n	height: 27px;\n	color: #fff;\n	font-size: 0.7em;\n	font-weight: bold;\n	text-align: center;\n	display: table-cell;\n	vertical-align: middle;\n	font-family: Verdana, Arial, Helvetica,Tahoma,sans-serif;\n        cursor: pointer;\n}\n\n.red-button a\n{\n        color: white;\n}\n\n\x3c/style\x3e\n\n\x3cdiv class=\"siteNoticeBig notice-wrapper\" style=\"background-image: url(http://upload.wikimedia.org/centralnotice/images/puzzle-piece.png);\" align=\"center\"\x3e\n  \x3cdiv class=\"toggle-box\"\x3e\n    [\x3ca href=\"#\" onclick=\"toggleNotice();return false\"\x3eCollapse\x3c/a\x3e]\n  \x3c/div\x3e\n \x3cdiv class=\"notice-text\" style=\"padding-top:25px; line-height: 35px; font-family: palatino, serif;  width: 500px;\"\x3e\n       \x3ca href=\"http://wikimediafoundation.org/wiki/Donate/ThankYou/en?utm_source=2008_jimmy_thank_you_b\x26utm_medium=sitenotice\x26utm_campaign=fundraiser2008#appeal\"\x3e\n       \x3cdiv align=\"center\" style=\"font-size: 33px;\"\x3e\n          A Thank You from\x3cBR\x3eWikipedia Founder Jimmy Wales\n       \x3c/div\x3e\n       \x3c/a\x3e\n  \x3c/div\x3e\n\x3c/div\x3e\n\n\x3cdiv class=\"siteNoticeSmallAnon notice-collapsed-wrapper\" style=\"padding-left: 15px;\"\x3e\n  \x3cdiv class=\"toggle-box\"\x3e\n    [\x3ca href=\"#\" onclick=\"toggleNotice();return false\"\x3eExpand\x3c/a\x3e]\n  \x3c/div\x3e\n  Support Wikipedia: a non-profit project. —\n  \x3ca href=\"http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=2008_jimmy_thank_you_b_collapsed\x26utm_medium=sitenotice\x26utm_campaign=fundraiser2008\"\x3e\n    Donate Now\n  \x3c/a\x3e\n\x3c/div\x3e\n\n\x3cdiv class=\"siteNoticeSmallUser\" style=\"padding-left: 15px;\"\x3e\n  \x3cdiv class=\"toggle-box\"\x3e\n    [\x3ca href=\"#\" onclick=\"toggleNotice();return false\"\x3eExpand\x3c/a\x3e]\n  \x3c/div\x3e\n  Support Wikipedia: a non-profit project. —\n  \x3ca href=\"http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=2008_jimmy_thank_you_b_collapsed_user\x26utm_medium=sitenotice\x26utm_campaign=fundraiser2008\"\x3e\n    Donate Now\n  \x3c/a\x3e\n\x3c/div\x3e"],[100]);
if (wgNotice != '')
wgNotice='<div id="centralNotice" class="' + (wgNoticeToggleState ? 'expanded' : 'collapsed') + ' ' + (wgUserName ? 'usernotice' : 'anonnotice' ) + '">' + wgNotice+'</div>';
