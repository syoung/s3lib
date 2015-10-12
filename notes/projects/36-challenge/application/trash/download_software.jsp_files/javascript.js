
//******************** Form Validation ****************************

var errColor = "#ffdddd";
var focusColor = "#edf3fd";
var blurColor = "#FFFFFF";
function verifyRequired() {

  if (document.icpsignup["fields_email"].value == "") {

    alert("The Email field is required.");

    return false;

  }

 

 

return true;

}
function validateSubscribeRT(myform) {
	bgChange(myform.email,blurColor);
    if (validEmail(myform.email.value)) {
		return true;
    } else {
		bgChange(myform.email,errColor);
		alert("Please enter a valid email");
		return false;
    }
}

function validateSubscribe(myform) {

	//reset bgcolor
	bgChange(myform.fields_fname,blurColor);
	bgChange(myform.fields_fname,blurColor);

    var msg = "";
 	var count = 0;
    
    if(!validName(myform.fields_fname.value)){bgChange(myform.fields_fname,errColor);msg += "* Name\n";} 
	if(!validEmail(myform.fields_email.value)){bgChange(myform.fields_email,errColor);msg += "* Email\n";} 
	//for(var i=0;i < myform.list.length;i++){if(myform.list[i].checked)count++;}
	//if(count==0)msg += "* Please choose a list\n";
	
    if (msg == "") {
		return true;
    } else {
		alert("The following field(s) must be completed:\n\n" + msg);
		return false;
    }
}

function validateUnSubscribe(myform) {

	//reset bgcolor
	bgChange(myform.fields_email,blurColor);

    var msg = "";
	if(!validEmail(myform.fields_email.value)){bgChange(myform.fields_email,errColor);msg += "* Email\n";} 
	
    if (msg == "") {
		if (confirm('Are you sure you want to unsunscribe?')){return true}else{return false};
    } else {
		alert("The following field(s) must be completed:\n\n" + msg);
		return false;
    }
}

function validName(nameString) {RegExp = /^[A-Z]./i;return(RegExp.exec(nameString));}
function validEmail(emailString) {RegExp = /[\w\.\-]{2,}\@[\w\-]{2,}\.[a-z,1-100]{2,3}/i;return(RegExp.exec(emailString));}
//function validEmail(emailString) {RegExp = /[\w\.\-]{2,}\@[\w\-]{2,}\.[a-z]{2,3}/i;return(RegExp.exec(emailString));}
function bgChange(myField,myColor) {if (!document.layers){myField.style.background = myColor;}}

//******************** MISC ****************************

function populateSubscribeForm(myform) {
	if(!validName(myform.name.value)){bgChange(myform.name,errColor);msg += "* Name\n";} 
}


//******************** Querystring parser ****************************

function createRequestObject() {
  FORM_DATA = new Object();
  separator = ',';
  query = '' + this.location;
  query = query.substring((query.indexOf('?')) + 1);
  if (query.length < 1) { return false; }
  keypairs = new Object();
  numKP = 1;
  while (query.indexOf('&') > -1) {
    keypairs[numKP] = query.substring(0,query.indexOf('&'));
    query = query.substring((query.indexOf('&')) + 1);
    numKP++;
  }
  keypairs[numKP] = query;
  for (i in keypairs) {
    keyName = keypairs[i].substring(0,keypairs[i].indexOf('='));
    keyValue = keypairs[i].substring((keypairs[i].indexOf('=')) + 1);
    while (keyValue.indexOf('+') > -1) {
      keyValue = keyValue.substring(0,keyValue.indexOf('+')) + ' ' + keyValue.substring(keyValue.indexOf('+') + 1);
    }
    keyValue = unescape(keyValue);
    if (FORM_DATA[keyName]) {
      FORM_DATA[keyName] = FORM_DATA[keyName] + separator + keyValue;
    } else {
      FORM_DATA[keyName] = keyValue;
    }
  }
  return FORM_DATA;
}

FORM_DATA = createRequestObject();

// Random Image *************************************************************

pic = new Array;
picalt = new Array;
for(var i=0;i < 10;i++)
	{
		pic[i] = "images/circles" + i + ".jpg";
		picalt[i] = "collage of images";
	}

//var totalpics = pic.length - 1;
var totalpics = pic.length;
var randomnumber;

function randomPic(mypage){
randomnumber=Math.floor(Math.random()*totalpics); // 0 to totalpics value
if (readCookie(mypage)){while (randomnumber == readCookie(mypage)) {randomnumber=Math.floor(Math.random()*totalpics);}}
}

// Cookie functions *******************************************************

// set days = 0 for expiration on session end

function createCookie(name,value,days)
{
	if (days)
	{
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name)
{
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++)
	{
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}
function roll_back(img_name, img_src)
{
	//alert(img_name);
	//document[img_name].src = img_src;
	document.getElementById(img_name).src=img_src;
}
function AppLogin(element_name)
{
	//alert(img_name);
	//document[img_name].src = img_src;

	document.getElementById(element_name).value = '';
	//alert(element_name);
}
function eraseCookie(name)
{
	createCookie(name,"",-1);
}


//****** Alerts array members -> startDate,expireDate,message
var myAlerts = new Array();
//myAlerts[0] = [new Date('07/24/2006'),new Date('08/05/2006'),"Grants.gov will be conducting maintenance on 8/5/06 from 12:00 AM - 10:00 AM EST and 8/6/06 from 12:00 AM - 10:00 AM EST. You will not be able to access the website during this time."]
//myAlerts[1] = [new Date('07/24/2006'),new Date('08/02/2006'),"alert2"]
//myAlerts[0] = [new Date('08/28/2006'),new Date('08/31/2006'),"Grants.gov will conduct maintenance on 08/30/2006 from 5:00 PM - 6:30 PM EST. The following functionalities may be affected: Search, Agency Login, E-Biz POC Login, Technical Library and System-to-System XML posting through email."]
//myAlerts[0] = [new Date('09/28/2006'),new Date('09/30/2006'),"Currently, we are performing maintenance on our site which may result in a delayed response when searching for grant opportunities. We apologize for this inconvenience."]
//myAlerts[0] = [new Date('10/04/2006'),new Date('10/09/2006'),"Please note that the site will be down this Sunday, 10/08/2006, from 10:00 AM - 6:00 PM EST. We apologize for any inconvenience."]
//myAlerts[0] = [new Date('Mon Oct 9 00:00:00 EDT 2006'),new Date('Mon Oct 16 06:00:00 EDT 2006'),"Please note that the site will be down from 8:00 AM EST on 10/14/2006 to 6:00 AM EST on 10/16/2006. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('Wed Nov 1 00:00:00 EST 2006'),new Date('Thu Nov 2 18:30:00 EST 2006'),"Grants.gov will be conducting maintenance on 11/2/06 from 5:00 PM - 6:00 PM EST. You may experience some technical difficulties on the site during this time. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('Wed Nov 1 00:00:00 EST 2006'),new Date('12/01/2006'),"ORC, the <strong style=\"text-decoration:underline;\">applicant</strong> credential provider for Grants.gov, has been experiencing intermittent downtime since late Friday, November 3, 2006. Grants.gov is actively working with ORC on this issue. If an applicant experiences any difficulties with obtaining a credential through ORC, please contact our help desk at 1-800-518-4726 or submit an email through <a href=\"mailto:support@grants.gov\">support@grants.gov</a>. We apologize for any inconvenience this may cause and we have alerted all Federal grant making agencies of this temporary system issue."];
//myAlerts[0] = [new Date('11/20/2006'),new Date('11/21/2006 12:00 AM EST'),"&ndash; The Grants.gov Contact Center will be closed on Thursday, 11/23/2006, in observance of the Federal Holiday. Normal standard hours of operation will resume on Friday, 11/24/2006, at 7:00 AM EST."];
//myAlerts[1] = [new Date('11/20/2006'),new Date('11/21/2006 12:00 AM EST'),"&ndash; Please note there is a Department of Energy (DOE) Small Business Innovation Research (SBIR) scheduled closing Tuesday, 11/21/2006."];
//myAlerts[2] = [new Date('11/20/2006'),new Date('11/21/2006 12:00 AM EST'),"&ndash; Helpful Hint! Remember when submitting a grant application, it takes 24-48 hours for the system to process the application."];
//myAlerts[0] = [new Date('11/20/2006'),new Date('11/21/2006 11:59 PM EST'),"<br><br>&ndash; The Grants.gov Contact Center will be closed on Thursday, 11/23/2006, in observance of the Federal Holiday. Normal standard hours of operation will resume on Friday, 11/24/2006, at 7:00 AM EST.<br><br>&ndash; Please note there is a Department of Energy (DOE) Small Business Innovation Research (SBIR) scheduled closing Tuesday, 11/21/2006.<br><br>&ndash; Helpful Hint! Remember when submitting a grant application, it takes 24-48 hours for the system to process your application."];
//myAlerts[1] = [new Date('11/22/2006 EST'),new Date('11/23/2006 11:59 PM EST'),"<br><br>&ndash; The Grants.gov Contact Center will be closed on Thursday, 11/23/2006, in observance of the Federal Holiday. Normal standard hours of operation will resume on Friday, 11/24/2006, at 7:00 AM EST.<br><br>&ndash; Helpful Hint! Remember when submitting a grant application, it takes 24-48 hours for the system to process your application."];
//myAlerts[0] = [new Date('4/12/2007 11:59 PM EST'),new Date('4/29/2007 11:59 PM EST'),"Grants.gov will be unavailable from April 28, 2007 through April 29, 2007 for scheduled maintenance. The site will be live Monday, April 30, 2007."];
//myAlerts[0] = [new Date('4/12/2007 11:59 PM EST'),new Date('5/27/2007 11:59 PM EST'),"Grants.gov will be unavailable from May 26, 2007 through May 27, 2007 to complete upgrades to the infrastructure. The site will be live Monday, May 28, 2007. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('5/30/2007 11:59 PM EST'),new Date('6/06/2007 11:59 PM EST'),"Due to high volume of submissions expected through Grants.gov due to multiple agency closings through June 5, 2007, the response time for processing applications may be longer than usual. Please visit our <font<a href=\"http://www.grants.gov/aboutgrants/technical_alerts.jsp\">Technical Alerts page</a>  for more information. Grants.gov appreciates your support during this time."];
//myAlerts[0] = [new Date('5/30/2007 11:59 PM EST'),new Date('6/05/2007 11:59 PM EST'),"Due to high volume of submissions expected through Grants.gov due to multiple agency closings through June 5, 2007, the response time for processing applications may be longer than usual. Please visit our <a href=\"http://www.grants.gov/aboutgrants/technical_alerts.jsp\">Technical Alerts page</a>  for more information. Grants.gov appreciates your support during this time."];
//myAlerts[1] = [new Date('5/30/2007 11:59 PM EST'),new Date('6/10/2007 11:59 PM EST'),"Grants.gov will be unavailable from June 9, 2007 through June 10, 2007 for scheduled maintenance. The site will be live Monday, June 11, 2007. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('6/28/2007 11:59 PM EST'),new Date('7/1/2007 6:00 PM EST'),"Please note that the site will be down this Sunday, 07/01/2007, from 12:00 AM - 3:00 AM Eastern Time and 4:00 PM - 6:00 PM Eastern Time. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('6/28/2007 11:59 PM EST'),new Date('7/8/2007 11:59 PM EST'),"Please note that the site will be down this Saturday, 07/07/2007, through Sunday, 07/08/2007. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('6/28/2007 11:59 PM EST'),new Date('7/19/2007 3:00 AM EST'),"Grants.gov will be conducting maintenance on 7/19/07 from 12:00 AM - 3:00 AM ET. You will not be able to access the website during this time. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('7/26/2007 11:59 PM EST'),new Date('7/29/2007 1:00 PM EST'),"Grants.gov will be conducting maintenance on 7/29/07 from 10:00 AM to 1:00 PM ET. You will not be able to access the website during this time. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('10/18/2007 11:59 PM EST'),new Date('10/28/2007 11:59 PM EST'),"Grants.gov will be conducting scheduled maintenance on 10/28/07 from 12:00 AM - 12:00 PM ET. Grants.gov will be unavailable during this time."];
//myAlerts[0] = [new Date('12/13/2007 11:59 AM EST'),new Date('12/15/2007 11:59 PM EST')," Grants.gov will undergo scheduled maintenance Saturday, December 15, 2007 from 12:00 a.m. – 12:00 p.m. Eastern Time. You may experience some intermittent delays while using the site. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('02/13/2008 11:59 PM EST'),new Date('03/19/2008 7:01 AM EST'),"Please note the Applicant Login and the Applicant System-to-System authentication is currently unavailable without assistance from the contact center. Please call 1-800-518-4726 or email <a href=\"mailto:support@grants.gov\">support@grants.gov</a> for further instructions. Once these technical issues are resolved this message will expire. We apologize for any inconvenience. "];
// myAlerts[0] = [new Date('02/13/2008 11:59 PM EST'),new Date('8/01/2008 7:01 AM EST'),"The Grants.gov system is currently experiencing intermittent technical issues. These technical issues are inhibiting the submission of applications. Upon resolution of this matter, this message will no longer appear. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('06/11/2008 11:59 PM EST'),new Date('7/01/2008 7:01 AM EST'),"Grants.gov is currently experiencing system lag time. Applications are being accepted; however there may be a delay while the system processes the submission. We appreciate your patience while we work to resolve this issue and apologize for any inconvenience. This message will be removed once the issue is resolved."];
//myAlerts[0] = [new Date('06/11/2008 11:59 PM EST'),new Date('6/29/2008 6:01 PM EST'),"Grants.gov will conduct scheduled maintenance beginning 12:00 AM Saturday, June 28, 2008 &ndash; 6:00 PM Sunday, June 29, 2008 Sunday, June 29, 2008 Eastern Time. The website will be unavailable during this time. We apologize for any inconvenience."];
//myAlerts[0] = [new Date('09/17/2008 5:59 PM EST'),new Date('09/20/2008 8:01 PM EST'),"Grants.gov will be unavailable Saturday, September 20, 2008 from 6:00 &ndash; 8:00 P.M. ET due to system maintenance. We apologize for any inconvenience."];

//myAlerts[0] = [new Date('09/17/2008 5:59 PM EST'),new Date('09/24/2008 7:31 AM EST'),"Central Contractor Registration (CCR) will be unavailable on Wednesday, September 24, 2008 from 5:30 a.m. to 7:30 a.m. EDT for installation of their next release."];

//myAlerts[0] = [new Date('11/21/2008 11:00 AM EST'),new Date('11/21/2008 10:00 PM EST'),"Grants.gov anticipates slower processing times due to increased activity on the system today. We apologize for this inconvenience."];

//myAlerts[0] = [new Date('01/23/2009 11:00 AM EST'),new Date('02/06/2009 12:01 AM EST'),"A substantial increase in submissions is causing system slowness. Submission processing times may take longer than usual, thank you for your patience."];

myAlerts[0] = [new Date('01/04/2009 12:00 AM EST'),new Date('02/08/2009 11:59 PM EST'),"Grants.gov will be unavailable Saturday and Sunday, February 7-8, 2009 for system maintenance. We apologize for any inconvenience."];


// myAlerts[0] = [new Date('startdate starttime timezone'),new Date('enddate endtime timezone'),"your text here"];


function writeAlert(){
	var now = new Date();
	for (x in myAlerts){
		if((now>myAlerts[x][0])&&(now<myAlerts[x][1]))document.write('<div class="alertBox"><div><strong>Alert: </strong>' + myAlerts[x][2] + '</div></div><br>');	
		//document.write('<div class="alertBox"><div><strong>Alert: </strong>' + myAlerts[x] + '</div></div><br>');
		
	}
}

function writeAlert2(myStartDate,myExpireDate,myMessage){
	var startDate = new Date(myStartDate);
	var expireDate = new Date(myExpireDate);
	var now = new Date();
	if((now>startDate)&&(now<expireDate))document.write('<div id="alertBox"><div>' + myMessage + '</div></div><br>');
}

//****** notification text when clicking on an outlink

function getNotify() {
	alert("The U.S. Department of Health and Human Services Office of Grants does not guarantee that external websites comply with the requirements of Section 508 (Accessibility Requirements) of the Rehabilitation Act.");
}

function writeTimedContent(startDate,expireDate,content){
	var now = new Date(); 
	if((now>new Date(startDate))&&(now<new Date(expireDate)))document.write(content);
}

function updateFeatureList(){
	var arrFeatureList = document.getElementById("featureList").getElementsByTagName("li");
	arrFeatureList[arrFeatureList.length-1].className = "lastItem";
	//document.write(arrFeatureList);
}


function createNav(){

	var strCurrentElementID = document.getElementsByTagName("body")[0].id.replace(/body/i, "nav")
	var arrActiveElementIDs = new Array();
	var count=0;
	
	if(document.getElementById(strCurrentElementID)!=null){
		while (strCurrentElementID != 'nav')
		{
			if (document.getElementById(strCurrentElementID).nodeName == "LI") {
				arrActiveElementIDs[count] = strCurrentElementID;
				document.getElementById(strCurrentElementID).className='activeListItem'
				count++;
			}
			strCurrentElementID = document.getElementById(strCurrentElementID).parentNode.id;
		}
		document.getElementById(arrActiveElementIDs[0]).getElementsByTagName("a")[0].className='activeLink';
	}
	
	
	//breadcrumb
	breadCrumbInnerHTML = document.getElementById("breadCrumb").innerHTML;
	for(i=arrActiveElementIDs.length;i>0;i--){
		objCurrentLink = document.getElementById(arrActiveElementIDs[i-1]).getElementsByTagName("a")[0];
		breadCrumbInnerHTML = breadCrumbInnerHTML + '<li><a href="' +  objCurrentLink.href  + '">' + objCurrentLink.innerHTML + '</a></li>';
	}
	document.getElementById("breadCrumb").innerHTML = breadCrumbInnerHTML;
	
	//add crumb divider via css - last crumb has different style
	arrBreadCrumbs = document.getElementById("breadCrumb").getElementsByTagName("li");
	arrBreadCrumbs[arrBreadCrumbs.length-1].className='lastCrumb';


}
