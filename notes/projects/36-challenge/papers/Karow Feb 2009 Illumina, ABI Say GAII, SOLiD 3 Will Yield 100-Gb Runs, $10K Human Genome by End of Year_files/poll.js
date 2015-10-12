function twiigsURLEncode29927_62144500(plaintext)
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

function twiigsInclude29927_62144500(script_filename)
{
  var html_doc = document.getElementsByTagName('head').item(0);
  var js = document.createElement('script');
  js.setAttribute('type', 'text/javascript');
  js.setAttribute('src', script_filename);
  html_doc.appendChild(js);
}

function twiigsPollLoading29927_62144500()
{
  var poll = document.getElementById('TWIIGSPOLL29927_62144500');
  poll.innerHTML = '<div class="TWIIGSPOLLloading"'+twiigsAddStyleBlock29927_62144500({"text-align":"center"})+'><img src="http://www.twiigs.com/img/loading.gif"'+twiigsAddStyleImage29927_62144500({})+'> Loading...</div>';
}

function twiigsPollVote29927_62144500(form, vote)
{
  var script_filename = 'http://www.twiigs.com/pollvote.js?pid=29927&ajax=1&w=1&color=';
  script_filename += '&pidsuffix=62144500';
  if(vote)
  {
    script_filename += '&vsubmit=1';
    if(form.ptype.value == 2)
    {
      script_filename += '&panswer=' + twiigsURLEncode29927_62144500(form.panswer.value);
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
      script_filename += '&paid=' + twiigsURLEncode29927_62144500(paid);
    }
  }
  twiigsPollLoading29927_62144500();  
  twiigsInclude29927_62144500(script_filename);  
  return false;
}

function twiigsPollView29927_62144500()
{
  twiigsPollLoading29927_62144500();
  var script_filename = 'http://www.twiigs.com/pollview.js?pid=29927&ajax=1&w=1';
  script_filename += '&pidsuffix=62144500'; 
  twiigsInclude29927_62144500(script_filename);
  return false;
}

function twiigsAddStyle29927_62144500(stype, mods)
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

function twiigsAddStyleBlock29927_62144500(mods)
{
  var stype = {
  };
  return twiigsAddStyle29927_62144500(stype, mods);
}

function twiigsAddStyleInline29927_62144500(mods)
{
  var stype = {
    "display" : "inline"
  };
  return twiigsAddStyle29927_62144500(stype, mods);
}

function twiigsAddStyleInput29927_62144500(mods)
{
  var stype = { 
    "background-color" : null,
    "background-image" : null,
    "border-style" : null,
    "display" : "inline",
    "text-shadow" : null
  };
  return twiigsAddStyle29927_62144500(stype, mods);
}

function twiigsAddStyleImage29927_62144500(mods)
{
  var stype = { 
    "background-color" : null,
    "background-image" : null,
    "display" : "inline",
    "height" : null, 
    "width" : null 
  };
  return twiigsAddStyle29927_62144500(stype, mods);
}

function twiigsAddStyleLink29927_62144500(mods)
{
  var stype = { 
    "display" : "inline",
    "text-decoration" : null
  };
  return twiigsAddStyle29927_62144500(stype, mods);
}

function twiigsAddStyleList29927_62144500(mods)
{
  var stype = { 
    "display" : "list-item",
    "list-style-type" : "none",
    "list-style-position" : "outside",
    "list-style-image" : "none"
  };
  return twiigsAddStyle29927_62144500(stype, mods);
}

function twiigsPollBarWidthSet29927_62144500()
{
  for(var i = 0; i < 3; i++)
    twiigsPollBarWidthSetBar29927_62144500(i, 20);
}

function twiigsPollBarWidthSetBar29927_62144500(i, n)
{
  var imgObj = document.getElementById("TWIIGSPOLL29927_62144500answerimg" + i);
  if(imgObj)
  {
    var itemObj = document.getElementById("TWIIGSPOLL29927_62144500answeritem" + i);
    if(itemObj)
    {
      if(itemObj.offsetWidth > 0)
      {
        var pctObj = document.getElementById("TWIIGSPOLL29927_62144500answerpct" + i);
        var pct = parseFloat(pctObj.innerHTML);
        imgObj.width = parseInt(pct * (parseInt(itemObj.offsetWidth) - 56));
        pctObj.innerHTML = parseInt(pct * 100) + "%";
      }
      else
      {
        if(n > 0)
        {
          n--;
          setTimeout('twiigsPollBarWidthSetBar29927_62144500(' + i + ', ' + n + ')', 100);
        }
      }
    }
  }
}

document.write('<div class="TWIIGSPOLLpollcontainer" '+twiigsAddStyleBlock29927_62144500({})+'>'
+' <div class="TWIIGSPOLLpoll" '+twiigsAddStyleBlock29927_62144500({"margin-top":"5px","margin-right":"5px","margin-left":"5px"})+'>'
+' <div class="TWIIGSPOLLquestion" '+twiigsAddStyleBlock29927_62144500({"margin-bottom":"8px","font-weight":"bold"})+'>'
+' <a class="TWIIGSPOLLquestionlink" href="http://www.twiigs.com/poll/Science/29927" '+twiigsAddStyleInline29927_62144500({})+'>'
+'Gender equity in life sciences: what'+"'"+'s the deal?</a>'
+' </div>'
+' <div id="TWIIGSPOLL29927_62144500" class="TWIIGSPOLLresponse" '+twiigsAddStyleBlock29927_62144500({})+'>'
+' <form method="POST" name="twiigsformpollvote29927_62144500" action="http://www.twiigs.com/vote" '+twiigsAddStyleBlock29927_62144500({})+'>'
+' <input type="hidden" name="pview" value="">'
+' <input type="hidden" name="pid" value="29927">'
+' <input type="hidden" name="ptype" value="1">'
+' <input type="hidden" name="pmultiple" value="0">'
+' <input type="hidden" name="results" value="1">'
+' <div class="TWIIGSPOLLanswers" '+twiigsAddStyleBlock29927_62144500({"margin-bottom":"8px"})+'>'
+' <ul class="TWIIGSPOLLanswerselection" '+twiigsAddStyleBlock29927_62144500({})+'>'
+' <li class="TWIIGSPOLLanswerselectionitem" '+twiigsAddStyleList29927_62144500({"margin-bottom":"7px","margin-left":"4px","*margin-bottom":"2px"})+'>'
+' <input class="TWIIGSPOLLanswerradio" type="radio" name="paid" value="1" '+twiigsAddStyleInput29927_62144500({})+'>'
+' Just look at the number of female PIs -- obviously some affirmative action is needed. </li>'
+' <li class="TWIIGSPOLLanswerselectionitem" '+twiigsAddStyleList29927_62144500({"margin-bottom":"7px","margin-left":"4px","*margin-bottom":"2px"})+'>'
+' <input class="TWIIGSPOLLanswerradio" type="radio" name="paid" value="2" '+twiigsAddStyleInput29927_62144500({})+'>'
+' There'+"'"+'s obvious disparity, but it'+"'"+'s not clear that anything should be done about it. </li>'
+' <li class="TWIIGSPOLLanswerselectionitem" '+twiigsAddStyleList29927_62144500({"margin-bottom":"7px","margin-left":"4px","*margin-bottom":"2px"})+'>'
+' <input class="TWIIGSPOLLanswerradio" type="radio" name="paid" value="3" '+twiigsAddStyleInput29927_62144500({})+'>'
+' What'+"'"+'s the problem? The proportion of men and women just reflects different interests. </li>'
+' </ul>'
+' </div>'
+' <div class="TWIIGSPOLLpostinfo" '+twiigsAddStyleBlock29927_62144500({"margin-bottom":"8px","text-align":"right","display":"none"})+'>'
+' Created on Apr 15, 2009 </div>'
+' <div class="TWIIGSPOLLvote" '+twiigsAddStyleBlock29927_62144500({})+'>'
+' <p class="TWIIGSPOLLbutton" '+twiigsAddStyleBlock29927_62144500({"margin-top":"2px","margin-bottom":"2px","text-align":"center"})+'>'
+' <input class="TWIIGSPOLLsubmit" type="submit" name="vsubmit" value="Vote" onClick="return twiigsPollVote29927_62144500(document.twiigsformpollvote29927_62144500,true);" onDblClick="return twiigsPollVote29927_62144500(document.twiigsformpollvote29927_62144500,true);" '+twiigsAddStyleInput29927_62144500({"padding-right":"4px","padding-left":"4px","text-align":"center"})+'>'
+' </p>'
+' <p class="TWIIGSPOLLdisplayresults" '+twiigsAddStyleBlock29927_62144500({"margin-top":"2px","margin-bottom":"2px","text-align":"center"})+'>'
+' <a class="TWIIGSPOLLlink" href="http://www.twiigs.com/poll/Science/29927?results=1" onClick="return twiigsPollVote29927_62144500(document.twiigsformpollvote29927_62144500,false);" onDblClick="return twiigsPollVote29927_62144500(document.twiigsformpollvote29927_62144500,false);" '+twiigsAddStyleLink29927_62144500({})+'>'
+'View Results</a>'
+' </p>'
+' </div>'
+' </form>'
+' </div>'
+' </div>'
+' </div>'
+'');
twiigsPollBarWidthSet29927_62144500();
