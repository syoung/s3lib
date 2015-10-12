function FlashObject(swfFile, id, dim, transparent, clsid, flashversion, element)
{
	var content = '';
	var swfArray = swfFile.split("?");
	content = content +'<OBJECT classid="'+clsid+'" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version='+flashversion+',0,0,0" ID="'+id+'" '+dim+' ALIGN="">';
	content = content +'<param name=allowScriptAccess value=always><PARAM NAME=movie VALUE="'+swfArray[0]+'"><PARAM NAME=quality VALUE=high><PARAM NAME="wmode" VALUE="'+transparent+'"><param name=FlashVars value="'+swfArray[1]+'?'+swfArray[2]+'">'; 
	content = content + '<EMBED src="'+swfArray[0]+'" quality=high wmode='+transparent+' swLiveConnect=FALSE '+dim+' NAME="'+id+'" FlashVars="'+swfArray[1]+'?'+swfArray[2]+'" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer" allowScriptAccess=always>';
	content =content +'</EMBED></OBJECT>';
	document.getElementById(element).innerHTML=content;
}

