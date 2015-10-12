// JavaScript Document
function checkInputClick(input, restrict) {
		var is_major = parseInt(navigator.appVersion);  
		var is_minor = parseFloat(navigator.appVersion);   
		var agt = navigator.userAgent.toLowerCase();   
		var is_mac = (agt.indexOf('mac') != -1);  
		var is_ie = ((agt.indexOf('msie') != -1) && (agt.indexOf('opera') == -1));  
		var searchVal;  
		var searchLocation = '&btnG=Google+Search&access=p&output=xml_no_dtd&sort=date%3AD%3AL%3Ad1&ie=UTF-8&client=default_frontend&oe=UTF-8&site='+ restrict +'&stylesheet=/niaid/styles/search/Main.4.468.xsl';  
		if (is_mac && is_ie) {     
		  searchVal = input;  
		} else {     
		  searchVal = encodeURIComponent(input);  
		}   
		
		if(input.length>0){ 
		  window.location='http://www3.niaid.nih.gov/niaid/scripts/search/searchresult.aspx?q='+ searchVal + searchLocation;
		  return(false);  
		}else{    
		  return(false);  
		}
	}
