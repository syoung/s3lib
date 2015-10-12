/* SiteCatalyst code version: H.14. Copyright Omniture, Inc. More info available at http://www.omniture.com */
/* Author: Neil Evans */
/************************** CONFIG SECTION ****************************************/
/* Specify the Report Suite(s) */
var s_account="devsundocs";
var sun_dynamicAccountSelection=true;
var sun_dynamicAccountList="sunglobal,sundocs=docs.sun.com;devsundocs=.";
/* Specify the Report Suite ID */
var s_siteid="docs:";
/* Settings for pageName */
/* Remote Omniture JS call  */
var sun_ssl=(window.location.protocol.toLowerCase().indexOf("https")!=-1);
	if(sun_ssl == true) { var fullURL = "https://www.sun.com/share/metrics/metrics_group1.js"; }
		else { var fullURL= "http://www-cdn.sun.com/share/metrics/metrics_group1.js"; }
document.write("<sc" + "ript type=\"text/javascript\" src=\""+fullURL+"\"></sc" + "ript>");
/* Set up private functions */
function getMetaContents(metaName) {
	var metaList = document.getElementsByTagName('meta');
	for (var i in metaList) {
		if(metaList[i].name == metaName) {
			return metaList[i].content;
		}
	}
        return null;
}
/* End private functions */
/************************** END CONFIG SECTION **************************************/
/* CUSTOM VARS PULLED FROM QUERYSTRING */
/* prePlugins functions */
function s_prePlugins(s) {
	/* grab q param */
	s.prop25=s.getQueryParam('q');
	s_prop25=s.prop25;
	/* grab p param */
	s.prop24=s.getQueryParam('p');
	s_prop24=s.prop24;
	/* grab l param */
	s.prop23=s.getQueryParam('l');
	s_prop23=s.prop23;	
        /* Get URL type */
        var URLtype = "home";
        var myURL = window.location.href; 
        var myURLarray = myURL.split("/");
        if (myURLarray.length > 4) {
            if (myURLarray[5] == "doc") {
               URLtype = "book";
            }
            if (myURLarray[5] == "coll") {
               URLtype = "collection";
            }
            if (myURLarray[5] == "prod") {
               URLtype = "products";
            }
            if (myURLarray[5] == "titl") {
               URLtype = "titles";
            }
        }
        /* Get action, if any */
        var myAction=s.getQueryParam('a');
        if (URLtype == "book") {
           if (myAction == "view")  {
             URLtype = "content";
           }
           if (myAction == "browse")  {
             URLtype = "outline";
           }
        }
        /* Set prop19 */
        s.prop19=URLtype;
        /* prop 21 defaults to URLtype */
        sect_id=URLtype;
        if (URLtype == "content" || URLtype == "outline" || URLtype == "book" ||
 URLtype == "collection") {
            q_start=myURLarray[6].indexOf("?");
            if (q_start < 1) {
             sect_id=myURLarray[6]; 
            } else {
             sect_id=myURLarray[6].substr(0,q_start); 
            }
        }
        s.prop21=sect_id;

        /* Set prop17  - defaults to save value as s.prop21 unless XML page */
        chap_id=s.prop21;
        if (URLtype == "content") {
          /* Find chapter ID from breadcrumbs */
	  var chap_id_value=getMetaContents('chapter-id');
          if (chap_id_value != null) {
         	chap_id=s.prop21+"/"+chap_id_value;
                
          } else chap_id=s.prop21;
        }
        s.prop17=chap_id;
}

