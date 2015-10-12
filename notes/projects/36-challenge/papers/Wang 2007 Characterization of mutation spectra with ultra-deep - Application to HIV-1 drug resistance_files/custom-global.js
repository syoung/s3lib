/*
 * CSHL-maintained JavaScript support file for Genome Research
 */

/* */

$(document).ready(function() {

	/** update the widget placeholder based on the pageid **/
	var pageid = $("div.hw-gen-page").attr("id");
	var col2widget = $("div#col-2-widget-placeholder");
	var col3widget = $("div#col-3-widget-placeholder");
var a1 ="http://www.nytimes.com/2008/05/23/science/23gene.html?_r=1"
	if (pageid != undefined) {
		switch (pageid) {
			case "pageid-homex":
col3widget.append('<hr size=1 color=black width=80%><p> \
<b>GR in the News</b></p><p> \
<a target=_blank \
href="http://www.nytimes.com/2008/05/23/science/23gene.html?_r=1"> \
Elbow; No Harm Done \
&mdash; <i>The New York Times</i></a></p> \
<p><a target=_blank \
href="http://www.sciencemag.org/cgi/content/full/320/5879/1001"> \
Bacteria \
Are Picky About Their Homes on Human Skin &mdash; <i>Science</i></p> \
<hr size=1 color=black width=80%>');
				break;
			case "pageid-searchx":
				
				break;
			default:
				break;
		}
	}

});

