
/* Function for pop up window*/
function newWindow(url,winprop)
{
    var new_window;
    if(winprop == null)
    winprop = "width=550,height=500";
    if(new_window==null) {
       new_window = window.open(url,null,winprop);
    }
    return false;
}
/* used on citation manager pages to submit to different action on clicking different links on page*/
function sumbitToAction(aForm, action){
    var noDoi = aForm.noDoi.value;
    if (noDoi == "noDoi") {
        aForm.action = aForm.redirectUri.value;
        aForm.method = "post";
        aForm.submit();
    } else {
        var elmts = aForm.elements;
        for (var i = 0; i < elmts.length; i++) {
            if ((elmts[i].id == "citeAttach") &&
                (elmts[i].type == "checkbox") &&
                (elmts[i].checked)) {
                var punc = "?";
                if(action.indexOf("?") > -1 ){
                    punc = "&";
                }
                action = action + punc + "citeAttach=true";
            }
        }
        aForm.action = action;
        aForm.method = "post";
        aForm.submit();
    }
}
function submitArticles(aForm, action, redirect) {
      var noDoi = aForm.noDoi.value;
    if(noDoi == "noDoi"){
        aForm.action = aForm.redirectUri.value;
        aForm.method = "post";
        aForm.submit();
    }else{
        submitMultiArticles(aForm, action, redirect, false);
    }
}
function submitMultiArticles(aForm, action, redirect, aMarkall) {
    var hasMarked = false;
    var elmts = aForm.elements;
    for (var i = 0; i < elmts.length; i++) {
        if ((elmts[i].name == "doi") &&
			(elmts[i].type == "checkbox") &&
			(elmts[i].checked)) {
             hasMarked = true;
            break;
        }
    }
    if (!hasMarked) {
		if (aMarkall) {
			markAllCheckboxes(aForm, "doi", true);
		} else {
            alert("Please check at least one item.");
    	    return;
		}
	}
    var newAction = action;
    if(redirect != ''){
        newAction += encodeURIComponent(redirect);
    }


    // msie needs to use this way to update form's action
	if (aForm.getAttributeNode) {
        aForm.getAttributeNode("action").value = newAction;
	} else {
        aForm.action = newAction;
	}
    aForm.method = "post";
    aForm.submit();
}


/*used to set variable for redirecting to same action after deleteing selected articles*/
var forwardAction;
var newcheckedDois="";
var aCitationForm;
var inputFrom;
var xxAllDois = "";

function deleteCitations(url,document, action,from)
{
      aCitationForm = document.getElementById("citationManager");
      newcheckedDois="";
        var hasMarked = false;
        var elmts = aCitationForm.elements;
        for (var i=0; i<elmts.length; i++) {
            if ((elmts[i].type == "checkbox") && (elmts[i].name == "doi")) {
                if((elmts[i].checked)){
                   hasMarked = true;
                }
                if(!(elmts[i].checked)){
                    newcheckedDois+= elmts[i].name + "=" + elmts[i].value+"&";
                }
              }
         }
        if (!hasMarked) {
            alert("Please check at least one item.");
            return;
        }
    inputFrom = from;
    var input_box=confirm("Are you sure you want to delete the selected item(s)?");
         forwardAction = action;
         if (input_box==true){
           submitArticles(aCitationForm,forwardAction,false);
         }

}

/*delete citations after user press yes on pop up*/
function deleteConfirmedCitations()
{
    if(inputFrom =='savedArticles')
         submitArticles(aCitationForm,forwardAction,false);
}

/*used to see submit action  in new window */
function submitActionInNewWindow(aForm, action) {
    var noDoi = aForm.noDoi.value;
    var target = aForm.target;
    aForm.method = "post";
    if (noDoi == "noDoi") {
        aForm.action = aForm.redirectUri.value;
    } else {
        aForm.action = action;
        aForm.target = "_blank";
    }
    aForm.submit();
    aForm.target = target;
}

/* preview citation */
function previewCitation (document, singleCit){
    var aform = document.getElementById("emailCite");
    var selectedValue = document.getElementById("citeFormat").value;
    var senderEmail = document.getElementById("emailBox").value;
    var opNotes = document.getElementById("opNotes").value;
    var act = "emailCitations";
    if(singleCit != null) {
        act = "emailSingleCitation";
    }
    var bibtexUri = act + "?previewType=bibtex&include=abs&userEmail="+senderEmail+"&opNotes="+opNotes;
    var printerUri = act + "?previewType=printerFriendly&userEmail="+senderEmail+"&opNotes="+opNotes;
    var citationManagerUri = act + "?previewType=citationManager&userEmail="+senderEmail+"&opNotes="+opNotes;;
    var tabDelimitedUri = act + "?previewType=tabDelimited&userEmail="+senderEmail+"&opNotes="+opNotes;
    if(selectedValue == "bibtex"){
        submitActionInNewWindow(aform,bibtexUri);
    }
    if(selectedValue == "printerFriendly"){
        submitActionInNewWindow(aform,printerUri);
    }
    if(selectedValue == "citationManager"){
        submitActionInNewWindow(aform,citationManagerUri);
    }
    if(selectedValue == "tabDelimited"){
        submitActionInNewWindow(aform,tabDelimitedUri);
    }

}

function modify_boxes(aForm){
     var elmts = aForm.elements;
    for (var i = 0; i < elmts.length; i++) {
		if ((elmts[i].name == "doi")) {
            if (aForm.selectUnselect.checked){
                elmts[i].checked = true;
             }else{
                 elmts[i].checked = false;
             }
        }
    }
}

function modify_checkboxes(document,aformId,elemId){
    var aForm = document.getElementById(aformId);
    var elmts = aForm.elements;
    for (var i = 0; i < elmts.length; i++) {
		if (elmts[i].type == "checkbox") {
            if (document.getElementById(elemId).checked){
                elmts[i].checked = true;
             }else{
                 elmts[i].checked = false;
             }
        }
    }
}

function submitFormWithNewAction(authForm,inAction){
    authForm.action = inAction;
    authForm.method = "post";
    authForm.submit();
  }


function submitShowAuthLogin(document){
    var authForm = document.getElementById("accessLogin");
    var org = document.getElementById("federationSelect");
      var orgValue = org.value;
    if(orgValue !=""){
        window.location.href = orgValue;

    }else{
        authForm.action = authForm.action+"?error=true&currUrl="+document.getElementById("currUrl").value;
        authForm.submit();
    }
}

function expandCollapse(elemId, imgId) {
	var el = document.getElementById(elemId);
	var imgEl = document.getElementById(imgId);
	if ( el.style.display != "none" ) {
		el.style.display = 'none';
		imgEl.src = '/templates/jsp/_jstor/images/expand_white.gif';
	}
	else {
		el.style.display = '';
		imgEl.src = '/templates/jsp/_jstor/images/collapse_white.gif';
	}
}

 /* scripts for discipline tree on advanced search page*/
function setAnchor(formid, tag) {
	var form = document.getElementById(formid);
	if (form != null) {
		if ( !isMacIEBrowser() ) {
			var formAction = form.action;
			if (formAction.indexOf('#') >= 0) {
				formAction = formAction.substring(0,formAction.indexOf('#'));
			}

            formAction += "#" + tag;
			form.action = formAction;
		}
    }
}

function isMacIEBrowser() {
	var browserName=navigator.appName;
	var isMac=(navigator.appVersion.indexOf("Mac")!=-1) ;
	var result=false;
	if ( (browserName=="Microsoft Internet Explorer") && (isMac ) ) {
		result=true;
	}
	return result;
}

function modify_dc_journal_checkboxes(dcId){
    var elem = document.getElementById("sp." + dcId);
    var elmts = elem.getElementsByTagName("input");
    for (var i = 0; i < elmts.length; i++) {
        if (document.getElementById("dc." + dcId).checked){
            elmts[i].checked = true;
        }else{
            elmts[i].checked = false;
        }
    }
}

function modify_discipline_checkbox(dcId){
    var elem = document.getElementById("sp." + dcId);
    var elmts = elem.getElementsByTagName("input");
    var result = true;
    for (var i = 0; i < elmts.length; i++) {
        if(!elmts[i].checked){
            result = false;
            break;
        }
    }
    document.getElementById("dc." + dcId).checked = result;
}


function refHover(thisblock) {
   anchors=thisblock.parentNode.getElementsByTagName('a')
   for (i=0; i<anchors.length; i++) {if (anchors[i]==thisblock) anchors[i-1].className+=" refhover"}
}

function refUnhover(thisblock) {
  anchors=thisblock.parentNode.getElementsByTagName('a')
  for (i=0; i<anchors.length; i++) {if (anchors[i]==thisblock) anchors[i-1].className="refArrow"}
}

var newwindow="";

function openPopup(url) {
 newwindow = window.open(url,'pop','width=800,height=600,resizable=yes,scrollbars=yes');
 if (window.focus) {
   newwindow.focus();
 }
 return false;
}

function loadFromPopup(url) {
 if (top.opener){
     top.opener.window.location.href = url;
     window.close();
     return false;
 }
 return true;
}
/* Function used to clear other input box if different radio button is selected in support form*/
function clearOther(document){
    var inputId = document.getElementById('otherInfo');
    inputId.value ="";
}

/* Function used to clear other input box if different radio button is selected in support form*/
function ckeckOther(document){
    var inputId = document.getElementById('otherRadio');
    inputId.checked="yes";
}

/* Function to check that the date is valid (required format YYYY-MM-DD) */
function checkDate(field){
    var checkstr = "0123456789";
    var DateField = field;
    var Datevalue = "";
    var DateTemp = "";
    var seperator = "-";
    var day;
    var month;
    var year;
    var leap = 0;
    var err = 0;
    var i;
    DateValue = DateField.value;
    /* Delete all chars except 0..9 */
    for (i = 0; i < DateValue.length; i++) {
              if (checkstr.indexOf(DateValue.substr(i,1)) >= 0) {
                 DateTemp = DateTemp + DateValue.substr(i,1);
              }
    }
    DateValue = DateTemp;
    /* Always change date to 8 digits - string*/
    /* if year is entered as 2-digit / always assume 20xx */
    if (DateValue.length == 6) {
      DateValue = '20'+DateValue.substr(0,2) + DateValue.substr(2,4);
    }
    if (DateValue.length != 8) { err = 19; }
    /* year is wrong if year = 0000 */
    year = DateValue.substr(0,4);
    if (year == 0) { err = 20;}
    /* Validation of month*/
    month = DateValue.substr(4,2);
    if ((month < 1) || (month > 12)) { err = 21;}
    /* Validation of day*/
    day = DateValue.substr(6,2);
    if (day < 1) { err = 22;}

    /* Validation leap-year / february / day */
    if ((year % 4 == 0) || (year % 100 == 0) || (year % 400 == 0)) { leap = 1; }

    if ((month == 2) && (leap == 1) && (day > 29)) { err = 23;}
    if ((month == 2) && (leap != 1) && (day > 28)) { err = 24;}

    /* Validation of other months */
    if ((day > 31) && ((month == "01") || (month == "03") || (month == "05") || (month == "07") || (month == "08") || (month == "10") || (month == "12"))) {
      err = 25;
    }

    if ((day > 30) && ((month == "04") || (month == "06") || (month == "09") || (month == "11"))) { err = 26;}

    /* if 00 ist entered, no error, deleting the entry */
    if ((day == 0) && (month == 0) && (year == 00)) { err = 0; day = ""; month = ""; year = ""; seperator = ""; }

    /* if no error, write the completed date to Input-Field (e.g. 2001-12-13.) */
    if (err == 0) {
        DateField.value = year + seperator + month + seperator + day;
    }
    /* Error-message if err != 0 */
    else {
      alert("Date is Incorrect. Please enter a valid year.");
      DateField.select();
      DateField.focus();
    }
}

function checkYear(field){
    var validformat=/^\d{4}$/;
    if (!validformat.test(field.value)) {
        alert("Year is Incorrect. Please enter a valid year.");
        field.select();
        field.focus();
    }
}
