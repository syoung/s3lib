function twiigsURLEncode28410_73355900(plaintext)
{
  // The Javascript escape and unescape functions do not correspond
  // with what browsers actually do...
  var SAFECHARS =
    "0123456789" +                  // Numeric
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +  // Alphabetic
    "abcdefghijklmnopqrstuvwxyz" +
    "-_.!~*'()";                    // RFC2396 Mark characters
  var HEX = "0123456789ABCDEF"; 
  var encoded = "";
  for(var i = 0; i < plaintext.length; i++ )
  {
    var ch = plaintext.charAt(i);
    if(ch == " ")
    {
      encoded += "+";				// x-www-urlencoded, rather than %20
    }
    else if(SAFECHARS.indexOf(ch) != -1)
    {
      encoded += ch;
    }
    else 
    {
      var charCode = ch.charCodeAt(0);
      if(charCode > 255)
      {
        alert( "Unicode Character '" + ch + "' cannot be encoded using standard URL encoding.\n" + "(URL encoding only supports 8-bit characters.)\n" + "A space (+) will be substituted." );
        encoded += "+";
      }
      else
      {
        encoded += "%";
        encoded += HEX.charAt((charCode >> 4) & 0xF);
        encoded += HEX.charAt(charCode & 0xF);
      }
    }
  } // for
  return encoded;
}

function twiigsInclude28410_73355900(script_filename)
{
  var html_doc = document.getElementsByTagName('head').item(0);
  var js = document.createElement('script');
  js.setAttribute('type', 'text/javascript');
  js.setAttribute('src', script_filename);
  html_doc.appendChild(js);
}

function twiigsPollLoading28410_73355900()
{
  var poll = document.getElementById('TWIIGSPOLL28410_73355900');
  poll.innerHTML = '<div class="TWIIGSPOLLloading"'+twiigsAddStyleBlock28410_73355900({"text-align":"center"})+'><img src="http://www.twiigs.com/img/loading.gif"'+twiigsAddStyleImage28410_73355900({})+'> Loading...</div>';
}

function twiigsPollVote28410_73355900(form, vote)
{
  var script_filename = 'http://www.twiigs.com/pollvote.js?pid=28410&ajax=1&w=1&color=';
  script_filename += '&pidsuffix=73355900';
  if(vote)
  {
    script_filename += '&vsubmit=1';
    if(form.ptype.value == 2)
    {
      script_filename += '&panswer=' + twiigsURLEncode28410_73355900(form.panswer.value);
    }
    else
    {
      if(form.pmultiple.value == 1)
        var answer = form.elements['paid[]'];
      else
        var answer = form.paid;
      var paid = '';
      for(i = 0; i < answer.length; i++)
      {
        if(answer[i].checked)
        {
          if(paid != '')
            paid += ','
          paid += answer[i].value;
        }
      }
      script_filename += '&paid=' + twiigsURLEncode28410_73355900(paid);
    }
  }
  twiigsPollLoading28410_73355900();  
  twiigsInclude28410_73355900(script_filename);  
  return false;
}

function twiigsPollView28410_73355900()
{
  twiigsPollLoading28410_73355900();
  var script_filename = 'http://www.twiigs.com/pollview.js?pid=28410&ajax=1&w=1';
  script_filename += '&pidsuffix=73355900'; 
  twiigsInclude28410_73355900(script_filename);
  return false;
}

function twiigsAddStyle28410_73355900(stype, mods)
{
  var params = {
    "background-color" : "transparent",
    "background-image" : "none",
    "border-style" : "none",
    "clear" : "none",
    "display" : "block",
    "float" : "none",
    "position" : "static",
    "visibility" : "visible",
    "height" : "auto",
    "line-height" : "normal", 
    "width" : "auto",
    "margin-top" : "0",
    "margin-right" : "0",
    "margin-bottom" : "0",
    "margin-left" : "0",
    "outline-style" : "none",
    "padding-top" : "0",
    "padding-right" : "0",
    "padding-bottom" : "0",
    "padding-left" : "0",
    "clip" : "auto",
    "overflow" : "hidden",
    "vertical-align" : "baseline",
    "z-index" : "auto",
    "letter-spacing" : "normal", 
    "text-align" : "left",
    "text-decoration" : "none",
    "text-indent" : "0",
    "text-shadow" : "none",
    "text-transform" : "none",
    "white-space" : "normal",
    "word-spacing" : "normal"
  }; 
  
  for(var i in stype)
    params[i] = stype[i];
  for(var i in mods)
    params[i] = mods[i];
  
  var style = ' style="';  
  for(var i in params)
  {
    if(params[i] != null)
      style += i + ": " + params[i] + "; ";
  }
  style += '"';

  return style;
}

function twiigsAddStyleBlock28410_73355900(mods)
{
  var stype = {
  };
  return twiigsAddStyle28410_73355900(stype, mods);
}

function twiigsAddStyleInline28410_73355900(mods)
{
  var stype = {
    "display" : "inline"
  };
  return twiigsAddStyle28410_73355900(stype, mods);
}

function twiigsAddStyleInput28410_73355900(mods)
{
  var stype = { 
    "background-color" : null,
    "background-image" : null,
    "border-style" : null,
    "display" : "inline",
    "text-shadow" : null
  };
  return twiigsAddStyle28410_73355900(stype, mods);
}

function twiigsAddStyleImage28410_73355900(mods)
{
  var stype = { 
    "background-color" : null,
    "background-image" : null,
    "display" : "inline",
    "height" : null, 
    "width" : null 
  };
  return twiigsAddStyle28410_73355900(stype, mods);
}

function twiigsAddStyleLink28410_73355900(mods)
{
  var stype = { 
    "display" : "inline",
    "text-decoration" : null
  };
  return twiigsAddStyle28410_73355900(stype, mods);
}

function twiigsAddStyleList28410_73355900(mods)
{
  var stype = { 
    "display" : "list-item",
    "list-style-type" : "none",
    "list-style-position" : "outside",
    "list-style-image" : "none"
  };
  return twiigsAddStyle28410_73355900(stype, mods);
}

function twiigsPollBarWidthSet28410_73355900()
{
  for(var i = 0; i < 3; i++)
    twiigsPollBarWidthSetBar28410_73355900(i, 20);
}

function twiigsPollBarWidthSetBar28410_73355900(i, n)
{
  var imgObj = document.getElementById("TWIIGSPOLL28410_73355900answerimg" + i);
  if(imgObj)
  {
    var itemObj = document.getElementById("TWIIGSPOLL28410_73355900answeritem" + i);
    if(itemObj)
    {
      if(itemObj.offsetWidth > 0)
      {
        var pctObj = document.getElementById("TWIIGSPOLL28410_73355900answerpct" + i);
        var pct = parseFloat(pctObj.innerHTML);
        imgObj.width = parseInt(pct * (parseInt(itemObj.offsetWidth) - 56));
        pctObj.innerHTML = parseInt(pct * 100) + "%";
      }
      else
      {
        if(n > 0)
        {
          n--;
          setTimeout('twiigsPollBarWidthSetBar28410_73355900(' + i + ', ' + n + ')', 100);
        }
      }
    }
  }
}

document.write('<div class="TWIIGSPOLLpollcontainer" '+twiigsAddStyleBlock28410_73355900({})+'>'
+' <div class="TWIIGSPOLLpoll" '+twiigsAddStyleBlock28410_73355900({"margin-top":"5px","margin-right":"5px","margin-left":"5px"})+'>'
+' <div class="TWIIGSPOLLquestion" '+twiigsAddStyleBlock28410_73355900({"margin-bottom":"8px","font-weight":"bold"})+'>'
+' <a class="TWIIGSPOLLquestionlink" href="http://www.twiigs.com/poll/Science/28410" '+twiigsAddStyleInline28410_73355900({})+'>'
+'Peer-review journals under review: how well do they handle complaints about what they publish?</a>'
+' </div>'
+' <div id="TWIIGSPOLL28410_73355900" class="TWIIGSPOLLresponse" '+twiigsAddStyleBlock28410_73355900({})+'>'
+' <form method="POST" name="twiigsformpollvote28410_73355900" action="http://www.twiigs.com/vote" '+twiigsAddStyleBlock28410_73355900({})+'>'
+' <input type="hidden" name="pview" value="">'
+' <input type="hidden" name="pid" value="28410">'
+' <input type="hidden" name="ptype" value="1">'
+' <input type="hidden" name="pmultiple" value="0">'
+' <input type="hidden" name="results" value="1">'
+' <div class="TWIIGSPOLLanswers" '+twiigsAddStyleBlock28410_73355900({"margin-bottom":"8px"})+'>'
+' <ul class="TWIIGSPOLLanswerselection" '+twiigsAddStyleBlock28410_73355900({})+'>'
+' <li class="TWIIGSPOLLanswerselectionitem" '+twiigsAddStyleList28410_73355900({"margin-bottom":"7px","margin-left":"4px","*margin-bottom":"2px"})+'>'
+' <input class="TWIIGSPOLLanswerradio" type="radio" name="paid" value="1" '+twiigsAddStyleInput28410_73355900({})+'>'
+' Very well. Journals are great at responding to concerns about what they publish. </li>'
+' <li class="TWIIGSPOLLanswerselectionitem" '+twiigsAddStyleList28410_73355900({"margin-bottom":"7px","margin-left":"4px","*margin-bottom":"2px"})+'>'
+' <input class="TWIIGSPOLLanswerradio" type="radio" name="paid" value="2" '+twiigsAddStyleInput28410_73355900({})+'>'
+' A few journals might be bad at this, but most journals are good at fielding complaints. </li>'
+' <li class="TWIIGSPOLLanswerselectionitem" '+twiigsAddStyleList28410_73355900({"margin-bottom":"7px","margin-left":"4px","*margin-bottom":"2px"})+'>'
+' <input class="TWIIGSPOLLanswerradio" type="radio" name="paid" value="3" '+twiigsAddStyleInput28410_73355900({})+'>'
+' Poorly. Journals are very defensive and don'+"'"+'t take criticism well. </li>'
+' </ul>'
+' </div>'
+' <div class="TWIIGSPOLLpostinfo" '+twiigsAddStyleBlock28410_73355900({"margin-bottom":"8px","text-align":"right","display":"none"})+'>'
+' Created on Mar 24, 2009 </div>'
+' <div class="TWIIGSPOLLvote" '+twiigsAddStyleBlock28410_73355900({})+'>'
+' <p class="TWIIGSPOLLbutton" '+twiigsAddStyleBlock28410_73355900({"margin-top":"2px","margin-bottom":"2px","text-align":"center"})+'>'
+' <input class="TWIIGSPOLLsubmit" type="submit" name="vsubmit" value="Vote" onClick="return twiigsPollVote28410_73355900(document.twiigsformpollvote28410_73355900,true);" onDblClick="return twiigsPollVote28410_73355900(document.twiigsformpollvote28410_73355900,true);" '+twiigsAddStyleInput28410_73355900({"padding-right":"4px","padding-left":"4px","text-align":"center"})+'>'
+' </p>'
+' <p class="TWIIGSPOLLdisplayresults" '+twiigsAddStyleBlock28410_73355900({"margin-top":"2px","margin-bottom":"2px","text-align":"center"})+'>'
+' <a class="TWIIGSPOLLlink" href="http://www.twiigs.com/poll/Science/28410?results=1" onClick="return twiigsPollVote28410_73355900(document.twiigsformpollvote28410_73355900,false);" onDblClick="return twiigsPollVote28410_73355900(document.twiigsformpollvote28410_73355900,false);" '+twiigsAddStyleLink28410_73355900({})+'>'
+'View Results</a>'
+' </p>'
+' </div>'
+' </form>'
+' </div>'
+' </div>'
+' </div>'
+'');
twiigsPollBarWidthSet28410_73355900();
