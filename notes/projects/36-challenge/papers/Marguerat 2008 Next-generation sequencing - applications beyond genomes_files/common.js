// Called from many places to handle links.
// Params:
//     link:         URL. 'this' to reuse same window, else ""
//     windowname:   Reference name for window
//     additional:   Attributes for window.open, from:
//        width, height, resizable, scrollbars, toolbar, location, directories,
//        status, menubar, copyhistory.
// Notes: Book version always provides menubar, toolbar, etc.
//
function startTargetBook(link,windowname,width,height,additional)
{
    startTarget(link,windowname,width,height,additional)
}


//===============================================================================
function startTarget(link,windowname,width,height, additional)
{
    if(! window.focus)
        return;

    var sizestring = ",width=" + width + ",height=" + height;
	var opt = "menubar=no,toolbar=no,status=no,scrollbars=yes,resizable=yes,dependent=yes,location=no";
    var allOptions = opt + sizestring;
    if (additional) { allOptions = allOptions + ',' + additional; }

    windowname = String(windowname).replace(/-/g, "_")
    var moveToXDefault = 75
    var moveToYDefault = 50

    var moveToX = moveToXDefault
    var moveToY = moveToYDefault

    try {
        if (window.screen.width && width > 0)
            moveToX = Math.ceil((window.screen.width - width)) - 15
        moveToX = (moveToX > 0 ? moveToX : moveToXDefault)

        if (window.screen.height && height > 0)
            moveToY = Math.ceil((window.screen.height - height)) - 50
        moveToY = (moveToY > 0 ? moveToY : moveToYDefault)
    }
    catch (e) {}

    var wLeftTopCornerOptions = ',left=' + moveToX + ',top=' + moveToY + ',screenX=' + moveToX + ',screenY=' + moveToY

    allOptions = allOptions + wLeftTopCornerOptions

    w = window.open ("", windowname, allOptions)
    w.focus()

    link.target=windowname
}


//===============================================================================
function focuswin(windowname)
{
    windowname = String(windowname).replace(/-/g, "_")
    w = window.open("",windowname,"menubar=yes,scrollbars=yes,toolbar=yes,location=yes,status=yes,directories=yes,resizable=yes");
    w.focus();

    return true;
}


//===============================================================================
function reverseString (inStr)
{
    var outStr = ''

    for (i =0; i <= inStr.length; i++)
    {
	outStr = inStr.charAt(i) + outStr
    }

    return outStr
}


//===============================================================================
function reverseAndReplaceString (inStr, findStr, newStr)
{
    return reverseString(inStr).replace(findStr, newStr)
}

//===============================================================================
function initUnObscureEmail (className, innerHTML)
{

    try{
        if (window.addEventListener)
            window.addEventListener('load', function() {unObscureEmail (className, innerHTML)}, false)
        else if (window.attachEvent)
            window.attachEvent('onload', function() {unObscureEmail (className, innerHTML)})
    }catch(e){
    }
}

//===============================================================================
function unObscureEmail (className, innerHTML)
{
    try {
        if (typeof(unObscuredEmails) == 'undefined')
            unObscuredEmails = new Array()

        if (! unObscuredEmails[className])
        {

            var elmnts = document.getElementsByTagName("span")
            for (var i = 0, len = elmnts.length; i < len; i++)
            {
                if (elmnts.item(i).className.indexOf(className, " ") != -1)
                {
                    elmnts.item(i).innerHTML     = innerHTML;
                    unObscuredEmails[className]  = true

                }
            }
        }
    }
    catch(e){
    }
}

//===============================================================================
function pubMedDbLinkSubmit(control) {
    try{
        if (control.pubmedOption)
            control = control.pubmedOption
        if (control.options)
            location.href = control.options[control.options.selectedIndex].value;
    }
    catch(e){}
    return false;
}
