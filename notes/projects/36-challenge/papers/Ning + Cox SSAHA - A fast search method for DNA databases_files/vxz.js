var thisref = document.referrer;
var herenow = location.href;
	 var metaArray = document.getElementsByName('citation_doi');
	if(metaArray.length >0){
		var thisdoi = metaArray[0].content;
		var metaArray1 = document.getElementsByName('citation_title');
		
		var thisurl = " ";
		var metaArray2 = document.getElementsByName('citation_abstract_html_url');
		if(metaArray2.length >0){
			thisurl = metaArray2[0].content;			
		}
		
 		 document.write(unescape("%3Cscript src='http://www.cshsymposium.org/doi_testz.php?artx=" + herenow + "&dx=" + thisdoi + "&rfx=" + thisurl  +  "' type='text/javascript'%3E%3C/script%3E"));
	}
 




