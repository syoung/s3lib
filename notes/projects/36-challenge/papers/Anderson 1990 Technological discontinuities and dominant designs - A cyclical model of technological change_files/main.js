function showFeeTable(value) {
	var elements = Core.getElementsByClass('feeTable');
	for(var i=0; i < elements.length; i++) {
		if(elements[i].id == value) {
			Core.removeClass(elements[i], "hiddenFees");
			Core.addClass(elements[i], "activeFees");
		} else {
			Core.removeClass(elements[i], "activeFees");
			Core.addClass(elements[i], "hiddenFees");
		}
	}
}

/* Function to expand and collapse Title History on Complete Title List and Title List by Collection */
function toggle(id){
	var toggleImg = document.getElementById("journal"+id);
	var tableRows = document.getElementsByTagName("tr");
	
	for (var i=0; i < tableRows.length; i++) {
		if (!tableRows[i].className) {
					continue;
		}
				
		var historyClass = "titleHistory"+id;
		
		if (Core.hasClass(tableRows[i], historyClass)) {
			if ((Core.hasClass(tableRows[i], "sub")) && (Core.hasClass(tableRows[i], "collapsed"))) {
				Core.removeClass(tableRows[i], "collapsed");
				Core.addClass(toggleImg, "expanded");
			}
			else {
				Core.addClass(tableRows[i], "collapsed");
				Core.removeClass(toggleImg, "expanded");
			}
		}
	}
}

//function hideNoJS() {
//	var message = Core.getElementsByClass('noJS');
	
//	for (var i=0; i<message.length; i++) {
//		Core.addClass(message[i], " hidden");
//	}
//}

function getHeight(obj) {
	return obj.offsetHeight;
}

function activateDropDowns() {
	var globalNav = document.getElementById("globalNav");
	if(!globalNav) {return} //kick out of this function if the globalNav does not exist
	
	var NavItemCollection = grabEleByNameAndClass("LI", "hasDropDown", globalNav);
	for(var i=0; i < NavItemCollection.length; i++) {
		var NavItem = NavItemCollection[i];
		NavItem.onmouseover = NavItem.onfocus  = function() {
			if(!Core.hasClass(this, "over")) {
				Core.addClass(this, "over")
			}
		};
		NavItem.onmouseout = NavItem.onblur =  function() {
			if(Core.hasClass(this, "over")) {
				Core.removeClass(this, "over")
			}
		};
	}
}

var approveTermsMsg = "Your use of the JSTOR Archive indicates your\n" +
	"acceptance of JSTOR's Terms and Conditions of Use\n" +
	"and Privacy Policy, available at\n" +
	"http://www.jstor.org/about/terms.html\n" +
	"and http://www.jstor.org/about/privacy.html.\n" +
	"JSTOR's Terms and Conditions of Use provides, in part,\n" +
	"that unless you have obtained prior permission,\n" +
	"you may not download an entire issue of a journal or\n" +
	"multiple copies of articles, and you may use content in\n" +
	"the JSTOR archive only for personal, non-commercial use.";

function confirmTerms(url) {
    if (confirm(approveTermsMsg)) {
	window.open(url,"_blank","width=750,height=550,top=100,left=100,resizable=1,toolbar=1,location=1,menubar=1,scrollbars=1");
	return false;
    }
	return false;
}

function checkTerms() {
	var termsCheck = document.getElementById('termsCheck');
	if(!termsCheck) {return}

	var buttons = document.getElementById('journalTools');
	var results = document.getElementById('results');
	var toc = document.getElementById('toc');

	if (!buttons && !results && !toc) {return}
	
	var pdfArray = Core.getElementsByClass("pdf");
	
	if (Core.hasClass(termsCheck, "approved")) {
		for (var i=0; i<pdfArray.length; i++) {
			pdfArray[i].setAttribute("class", "newWindow");
			pdfArray[i].setAttribute("onclick", "");
			var currentURL = pdfArray[i].href;
			var countToEqual = currentURL.indexOf("=");
			var newURL = currentURL.substr((countToEqual + 1));
			pdfArray[i].setAttribute("href", newURL);
		}
	}
}

function jumpToError() {
var error = document.getElementById("errorExists");
	if (!error) {
		  return;
		} else {
		  window.location.hash="errorExists";
		}
	}
	
function displayUrl() {
	var populateUrl = document.getElementById("populateUrl");
	if (!populateUrl) {
		return;
	} else {
		var pageUrl = document.location.href;
		var urlText = document.createTextNode(pageUrl);
		populateUrl.appendChild(urlText); 
	}
}

function toggleCitationHidden() {
  var citeToggle = document.getElementById("citeToggle");
  var citeContent = document.getElementById("citeContent");
  if (Core.hasClass(citeContent,"hidden")) {
    Core.removeClass(citeContent,"hidden");
    citeToggle.innerHTML = "- Hide full citation";
  } else {
    Core.addClass(citeContent,"hidden");
    citeToggle.innerHTML = "+ Show full citation";
  }
  return false;
}
function checkForPageImage() {
  if (document.getElementById) {
    var hasImage = document.getElementById("citeToggleContainer");
    if (hasImage != null) {
      toggleCitationHidden();
      var citeToggle = document.getElementById("citeToggle");
      if (Core.hasClass(citeToggle, "hidden")) {
        Core.removeClass(citeToggle, "hidden");
      }
    }
    return;
  } else {
    return;
  }
}	

function setToFirstControl()
{
  var checkForForms = document.getElementsByTagName("form");
  if (!checkForForms) {return;}
   
  var bFound = false; 

  //for each form
  for (f=0; f < document.forms.length; f++) 
  {
    //for each element in each form
    for(i=0; i < document.forms[f].length; i++)
    {
      //if it's not a hidden element
      if (document.forms[f][i].type && document.forms[f][i].type != "hidden") 
      { 
        //and it's not disabled
        if (document.forms[f][i].disabled != true) 
        {
          try {
             //set the focus to it
             document.forms[f][i].focus();
             var bFound = true;
          }
          catch(er) {
          }
        }
      }
      //if found in this element, stop looking
      if (bFound == true)
        break;
    }
    //if found in this form, stop looking
    if (bFound == true)
      break;
  }
}

windowObject.addLoadFunction(activateDropDowns);
windowObject.addLoadFunction(checkTerms);
windowObject.addLoadFunction(setToFirstControl);