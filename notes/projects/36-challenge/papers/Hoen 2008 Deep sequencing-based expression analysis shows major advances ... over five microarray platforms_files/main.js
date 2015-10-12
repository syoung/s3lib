function redirect(targ,selObj,restore) {
    eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
    if (restore) selObj.selectedIndex=0;
}

function prepareErrorLinks() {
    if( ! document.getElementsByTagName ) return false;
    if( ! document.getElementById ) return false;
    if( ! document.getElementById( "validationerror" ) ) return false;
    var errorLinks = document.getElementById( "validationerror" ).getElementsByTagName( "a" );
    for( var i=0; i < errorLinks.length; i++ ) {
        errorLinks[i].onclick = function() {
            var objectId = this.href.substr( this.href.indexOf( "#" ) + 1 );
            if( document.getElementById(objectId) ) {
                document.getElementById(objectId).focus();
            }
        }
    }
}

window.onload = prepareErrorLinks;

var supported = ( document.layers || document.getElementById || document.all );

function encrypt(part1,part2,part3) {
    var all= 'mai'+'lto:'+part1+"@"+part2;
    if( part3 ) all += '?Sub'+'ject='+part3; document.location.href=eval('"'+all+'"');
}

function toggle_display( id ) {
    if( supported ) {
        if( document.layers && document.layers[id] ) {
            document.layers[id].display = ( document.layers[id].display == 'block' ? 'none' : 'block' );
        } else if( document.getElementById && document.getElementById(id) ) {
            document.getElementById(id).style.display = ( document.getElementById(id).style.display == 'block' ? 'none' : 'block' );
        } else if( document.all && document.all[id] ) {
            document.all[id].style.display = ( document.all[id].style.display == 'block' ? 'none' : 'block' );
        }
    }
}

function hide( id ) {
    if( supported ) {
        if( document.layers && document.layers[id] ) {
            document.layers[id].display = 'none';
        } else if( document.getElementById && document.getElementById(id) ) {
            document.getElementById(id).style.display = 'none';
        } else if( document.all && document.all[id] ) {
            document.all[id].style.display = 'none';
        }
    }
}

function unhide( id, display ) {
    // Default to display at block level
    if( ! display ) display = 'block';

    if( supported ) {
        // As IE does not support table-row, translate it to block
        if( navigator.appName == 'Microsoft Internet Explorer' && display == 'table-row' ) display = 'block';

        if( document.layers && document.layers[id] ) {
            document.layers[id].display = display;
        } else if( document.getElementById && document.getElementById(id) ) {
            document.getElementById(id).style.display = display;
        } else if( document.all && document.all[id] ) {
            document.all[id].style.display = display;
        }
    }
}

function visible( id ) {
     if( supported ) {
         if( document.layers && document.layers[id] ) {
             if( document.layers[id].display == 'none' ) return 0;
         } else if( document.getElementById && document.getElementById(id) ) {
             if( document.getElementById(id).style.display == 'none' ) return 0;
         } else if( document.all && document.all[id] ) {
             if( document.all[id].style.display == 'none' ) return 0;
         }
         return 1;
    }
    return 0;
}

function removeSpaces(string) {
     var tstring = "";
     string = '' + string;
     splitstring = string.split(" ");
     for(i = 0; i < splitstring.length; i++) tstring += splitstring[i];
     return tstring;
}

var selectItems = new Object();

function setOptions( listname, selectedItem, optionList ) {
     optionList.options.length = 0;
     optionList[0] = new Option( "Please select", "", true, false );

     if( selectItems[listname][selectedItem] ) {
        var newList = selectItems[listname][selectedItem];
        if( selectedItem != "" ) {
            for( var i = 0; i < newList.length; i++ ) {
                optionList.options[i+1] = new Option( newList[i].text, newList[i].value ? newList[i].value : newList[i].text );
            }
        }
    }
}

// Return the absolute Y position of an element on a page (from the top of the page, NOT visible screen)
function findPos(obj) {
        var curtop = 0;
        var bodyBorder=-document.body.offsetTop||document.body.clientTop;
        if (navigator.userAgent.indexOf("MSIE")!=-1) { curtop-=8 } 
        if (obj.offsetParent) {
                do {
                        curtop += obj.offsetTop;
                } while (obj = obj.offsetParent);
        }
        return curtop+bodyBorder;
}

// Update the floating help window. Leave htext blank to hide again.
function help_window(htext,field){
 var hw = document.getElementById("help_window");
 if(hw != undefined ){
   if(htext == ''){
     hw.className="hidden";
   } else {
        hw.innerHTML=htext;
        hw.className="help_window";
        hw.style.top=findPos(field)+"px";
   }
 }
}

//Archive list interactivity functions
var tick_archive=new Array("Humanities", "Law", "Medicine", "Science", "Social Sciences");
var tick_archive_x=new Array(true, true, true, true, true);
var tick_year=new Array();
var tick_year_x=new Array();
var tick_status=new Array("I", "E", "L");
var tick_status_x=new Array(true, true, true);
var line_id=new Array();
var line_archives=new Array();
var line_year_joined=new Array();
var line_status=new Array();
var year_count=-1;
var line_count=-1;

function add_year(year_to_add) {
  year_count+=1;
  tick_year[year_count]=year_to_add;
  tick_year_x[year_count]=true;
}

function filter() {
  for(var i=0; i<=line_count; i++) {
    var ok="";
	for(var j=0; j<tick_archive.length; j++) {
	  var s=line_archives[i].split(", ");
	  for(var a=0; a<s.length; a++) {
		if((s[a] == tick_archive[j]) && (tick_archive_x[j] == true)) { ok="a"; }
	  }
	}
	for(var j=0; j<tick_year.length; j++) {
	  if((line_year_joined[i] == tick_year[j]) && (tick_year_x[j] == true)) { ok+="y"; }
	} 
	for(var j=0; j<tick_status.length; j++) {
	  if((line_status[i] == tick_status[j]) && (tick_status_x[j] == true)) { ok+="s"; }
	}
	var r=document.getElementById("row"+line_id[i]);
	if(ok == "ays") {
		if(navigator.appName == 'Microsoft Internet Explorer') { 
			r.style.display = 'block';
		} else {
			r.style.display = 'table-row';
		}
	} else {
	  r.style.display="none"; 
	}
  }
}


function tickbox_change(tickbox) {
  var name=tickbox.name;
  var value=tickbox.value;
  var checked=tickbox.checked;
  switch(name) {
  	case "Archive": tick_archive_x[value]=checked; break;
	case "Year"   : tick_year_x[value]=checked; break;
	case "Status" : tick_status_x[value]=checked;
  }
  filter();
}

function archive_line(id, archives, year_joined, status) {
  line_count++;
  line_id[line_count]=id;
  line_archives[line_count]=archives;
  line_year_joined[line_count]=year_joined;
  line_status[line_count]=status;
}