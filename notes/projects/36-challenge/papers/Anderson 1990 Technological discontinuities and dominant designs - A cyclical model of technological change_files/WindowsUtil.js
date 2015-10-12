// WindowsUtil - controls all new windows and pop-ups

var WindowsUtil = {
	
	init : function() {
		if (!document.getElementsByTagName) return;
		
		// get div's in pop-up windows
		if (window.opener) {
			var popUpDivs = document.getElementsByTagName('div');
		}
		
		if (!window.opener || (window.opener && Core.hasClass(popUpDivs, "popWithLinks")))  {
			var theLinks = document.getElementsByTagName('a');
			var numberOfLinks = theLinks.length;
				
			for (var i=0; i<numberOfLinks; i++) {
				if (!theLinks[i].className) {
					continue;
				}
				if (Core.hasClass(theLinks[i], "popUp")) {
					theLinks[i].onclick = WindowsUtil.openPop;
					theLinks[i].setAttribute('title', 'This link opens in a new window');
				}
				else if (Core.hasClass(theLinks[i], "newWindow")) {
					theLinks[i].onclick = WindowsUtil.openNew;
					
					if (Core.hasClass(theLinks[i], ("refArrow")) || Core.hasClass(theLinks[i], ("refLink"))) {
						var getTitle = theLinks[i].title;
						theLinks[i].setAttribute('title', (getTitle + ' ; link opens in a new window'));
					}
					else {
					theLinks[i].setAttribute('title', 'This link opens in a new window');
					}
				}
				
				
				if (Core.hasClass(theLinks[i], "multiCite")) {
					theLinks[i].setAttribute('title', 'Multiple citations within a single reference: links open in a new window');
				}
			}
				
			var hqImagesContainer = document.getElementById('hqImagesContainer');
			if (!hqImagesContainer) {
				return;
			}
			var imageLinks = hqImagesContainer.getElementsByTagName('a');
			var numberOfImgLinks = imageLinks.length;
				
			for (var i=0; i<numberOfImgLinks; i++) {
				imageLinks[i].onclick = WindowsUtil.openImg;
				imageLinks[i].setAttribute('title', 'This link opens an image in a new window');
			}
		}
	},

	openPop : function() {
		window.open(this.href,"_blank","width=500,height=500,top=50,left=50,resizable=0,toolbar=0,location=0,menubar=0,scrollbars=0"); 
		return false;
	},

	openNew : function() {
		window.open(this.href,"_blank","width=750,height=550,top=100,left=100,resizable=1,toolbar=1,location=1,menubar=1,scrollbars=1"); 
		return false;
	},

	openImg : function() {
		window.open(this.href,"_blank","width=750,height=750,top=25,left=25,resizable=1,toolbar=0,location=0,menubar=0,scrollbars=1");
		return false;
	}
}

windowObject.addLoadFunction(WindowsUtil.init);