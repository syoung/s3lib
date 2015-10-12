/* jQuery javascript functions for content page */
var gIsFrameset = false;
$(document).ready(function() {
	
	handleAuthAffil();
	
	var defaultDockedNavRules = [
		'', '<div class="content-box" id="docked-cb"><div class="cb-contents"><h3>This Article</h3><div class="cb-section cb-slug"><ol id="docked-slug"><li></li></ol></div><div class="cb-section"><ol id="docked-nav-views"></ol></div></div></div>',
		'$(#col-2 #docked-nav-views)', '$(#article-cb-main .cb-section ol:has(li a[rel^="view-"]) > li)',
		'$(#col-2 #docked-nav #docked-slug li)', '$(#slugline)',
		'', '$(#article-dyn-nav)',

		'$(#docked-cb)', '$(#cb-art-svcs)'
	];

	if (!(getSiteOption("suppressDockedNav") == true)) {
		setupDockBlock(2, 'docked-nav', 'dockblock', defaultDockedNavRules);
	}
	
	var unloadedImgLookupRule = "div.article div.fig img";
	var numImagesToLoad = checkUnloadedImgs(unloadedImgLookupRule);

	/* ref rollover */
	setTimeout("addRefPops()", 25);
	
	/* fig-expansion in page */
	setTimeout("figExpandInline()", 10);
	
	/* 'new window' fig expansions */
	setTimeout("newWindowTargets()", 25);
	
	/* AJAX related article callbacks */
	setTimeout("getISIRelated()", 50);
	
	/* AJAX citing article callbacks */
	setTimeout("getHWCiting()", 50);
	setTimeout("getISICiting()", 50);
	
	/* AJAX Entrez Links callbacks */
	setTimeout("getEntrezLinks()", 50);
	
	/* Related content */
	setTimeout("getHWRelatedURLs()", 50);
	
	/* Fix col heights for images */
	setTimeout("fixHeightForImages(1" + "," + numImagesToLoad + ", '" + unloadedImgLookupRule + "')",1000);
	
});

function handleAuthAffil() {
	var authAffil = $("div.article div.contributors ol.affiliation-list");
	if (authAffil.length) {
		var expandStr = getSiteOption('authExpandString', null);
		if (expandStr == null) {
			expandStr = getSiteOption('expandString', '+');
		}
		var contractStr = getSiteOption('autContractString', null);
		if (contractStr == null) {
			contractStr = getSiteOption('contractString', '-');
		}
		var newP = '<p class="affiliation-list-reveal"><a href="#" class="view-more">' + expandStr + '</a>Author Affiliations</p>';
		/* add auth affil show/hide p */
		var contribLists = $("div.article div.contributors ol.contributor-list");
		if (contribLists.length) {
			contribLists.after(newP);
		}
		/* hide author affiliations until requested */
		if (authAffil.length) {
			authAffil.each(
				function (i) {
					modClass(authAffil.eq(i),'hideaffil','showaffil');
				}
			);
		}
		$("div.article div.contributors p.affiliation-list-reveal a.view-more").click(
			function(e) {
				var allViewMores = $("div.article div.contributors p.affiliation-list-reveal a.view-more");
				var authAffils = $("div.article div.contributors ol.affiliation-list");
				if ($(this).text() == contractStr) {
					/* hide the affil list */
					allViewMores.empty().append(expandStr);
					authAffils.each(
						function(i) {
							modClass(authAffils.eq(i),'hideaffil','showaffil');
						}
					);
				}
				else {
					allViewMores.empty().append(contractStr);
					authAffils.each(
						function(i) {
							modClass(authAffils.eq(i),'showaffil','hideaffil');
						}
					);
				}
				fixColHeights(1);
				e.preventDefault();
			}
		);
		/* show author affiliations when affil link is selected */
		$("div.article div.contributors ol.contributor-list a[href^='#aff']").click(
			function(e) {
				$("div.article div.contributors p.affiliation-list-reveal a.view-more").each(
					function() {
						if ($(this).text() == expandStr) {
							$(this).empty().append(contractStr);
							var authAffils = $("div.article div.contributors ol.affiliation-list");
							if (authAffils.length) {
								authAffils.each(
									function(i) {
										modClass(authAffils.eq(i),'showaffil','hideaffil');
									}
								);
							}
							fixColHeights(1);
						}
					}
				);
			}
		);
		fixColHeights(1);
	}
}

function figExpandInline() {
	var figlinks = $("div.fig-inline a[href*='expansion']");
	if (figlinks.length) {
		figlinks.each(
			function() {
				var $this = $(this);
				var classAttr = $this.attr("class");
				if (!(classAttr && (classAttr == 'in-nw'))) {
					if ($this.text().indexOf('n this window') >= 0) {
						$this.text("In this page");
					}
					var parentDiv = $this.parents("div.fig-inline");
					var href = $this.attr("href");
					$(this).click(
						function(e) {
							swapFig(e, href, parentDiv);
						}
					);
				}
			}
		);
	}
}

function swapFig(e, href, figWrapperEl) {
	var host = document.location.protocol + "//" + document.location.host;
	var path = document.location.pathname;
	var pathseg = path.substring(0, path.lastIndexOf('/'));
	var baseAjaxUrl = host + pathseg + '/' + href;
	var ajaxUrl = baseAjaxUrl + ((href.indexOf('?') >= 0) ? '&' : '?') + 'baseURI=' + baseAjaxUrl;
	$.ajax({
		url: ajaxUrl,
		dataType: "html",
		type: "GET",
		error: ajaxErr,
		beforeSend: addFigHeaders,
		success: function(xhtml) {
			addFig(xhtml, figWrapperEl);
		},
		complete: ajaxComplete
	});
	e.preventDefault();
}
function addFigHeaders(req) {
	addCommonHeaders(req);
	addPartHeaders(req);
}

function addFig(xhtmlData, figWrapperEl) {
	if (xhtmlData && !(xhtmlData.indexOf('<html') >= 0)) {
		figWrapperEl.replaceWith(xhtmlData);
		newWindowTargets();
		var lookupRule = "div.article div.fig img";
		var numImagesToLoad = checkUnloadedImgs(lookupRule);
		setTimeout("fixHeightForImages(1" + "," + numImagesToLoad + "," + lookupRule + ")", 1000);
		fixColHeights(1);
	}
}
function addRefPops() {
	var numMissed = 0;
	var i = 1;
	var idroot = "#xref-ref-";
	var el = $(idroot + i + '-1');
	/* not all refs appear in text; compensate */
	while (numMissed < 10) {
		if (el.length) {
			numMissed = 0;
		el.hover(dispRef, hideRef);
		var j = 2;
		var el2 = $(idroot + i + "-" + j);
		while (el2.length) {
			el2.hover(dispRef, hideRef);
			j++;
			el2 = $(idroot + i + "-" + j);
		}
		}
		else {
			numMissed++;
		}
		i++;
		el = $(idroot + i + "-1");
	}
}

function dispRef(e) {
	var link = $(this).attr("href");
	if($("div#hovering-ref").length) {
		$("div#hovering-ref").remove();
		alert("hovering-ref div removed on new hover!");
	}	
	var newDiv = '<div id="hovering-ref">' + ($(link).next("div").children("div.cit-metadata").clone().html()) + '</div>';
	$("body").append(newDiv);
	var elH = getObjHeight($("div#hovering-ref"));
	$("div#hovering-ref").css("left", e.pageX+10).css("top", e.pageY-elH).css("position", "absolute");
}

function hideRef(e) {
	if($("div#hovering-ref").length) {
		$("div#hovering-ref").remove();
	}
}

function getHWCiting() {
	var citingA = $("#cb-hw-citing-articles");
	if (citingA.length) {
		var newA = '<a id="cb-loading-hw-cited" href="#">Loading citing article data...</a>';
		citingA.replaceWith(newA);
		var href = citingA.attr("href");
		var id = '';
		if (href && (href.indexOf('?') > 0)) {
			var args = href.substring(href.indexOf('?') + 1).split('&');
			for (var i = 0; i < args.length; i++) {
				if (args[i].toLowerCase().indexOf('legid=') == 0) {
					id = args[i].substring(args[i].indexOf('=') + 1);
					if (id.indexOf('#') > 0) {
						id = id.substring(0, id.indexOf('#'));
					}
				}
			}
			if (!(id == '')) {
				var host = document.location.protocol + "//" + document.location.host;
				var ajaxUrl = host + '/cited-by/' + id.replace(/;/,'/');
				$.ajax({
					url: ajaxUrl,
					dataType: "html",
					type: "GET",
					error: ajaxErr,
					success: addHWCiting,
					complete: ajaxComplete
				});

			}
		}
	}
}
function getHWRelatedURLs() {
	var relatedURLsA = $("#cb-related-urls");
	if (relatedURLsA.length) {
		var newA = '<a id="cb-loading-related-urls" href="#">Loading related web page data...</a>';
		relatedURLsA.replaceWith(newA);
		var href = relatedURLsA.attr("href");
		var id = '';
		if (href && (href.indexOf('?') > 0)) {
			var args = href.substring(href.indexOf('?') + 1).split('&');
			for (var i = 0; i < args.length; i++) {
				if (args[i].toLowerCase().indexOf('legid=') == 0) {
					id = args[i].substring(args[i].indexOf('=') + 1);
					if (id.indexOf('#') > 0) {
						id = id.substring(0, id.indexOf('#'));
					}
				}
			}
			if (!(id == '')) {
				var host = document.location.protocol + "//" + document.location.host;
				var ajaxUrl = host + '/related-web-pages/' + id.replace(/;/,'/');
				$.ajax({
					url: ajaxUrl,
					dataType: "html",
					type: "GET",
					error: ajaxErr,
					success: addRelatedURLs,
					complete: ajaxComplete
				});

			}
		}
	}
}
function getISIRelated() {
	var relatedA = $("#cb-isi-similar-articles");
	if (relatedA.length) {
		var newA = '<a id="cb-isi-similar-articles" href="#">Loading ISI article data...</a>';
		relatedA.replaceWith(newA);
		var href = relatedA.attr("href");
		var id = '';
		if (href) {
			var hrefDec = decodeURI(href);
			if ((hrefDec.indexOf('?') > 0)) {
				var args = hrefDec.substring(hrefDec.indexOf('?') + 1).split('&');
				for (var i = 0; i < args.length; i++) {
					var argDec = decodeURIComponent(args[i]);
					if (argDec.toLowerCase().indexOf('access_num=') == 0) {
						id = argDec.substring(argDec.indexOf('=') + 1);
						if (id.indexOf('#') > 0) {
							id = id.substring(0, id.indexOf('#'));
						}
					}
				}
				if (!(id == '')) {
					var host = document.location.protocol + "//" + document.location.host;
					var ajaxUrl = host + '/isi-links/has-related/' + id.replace(/;/,'/');
					$.ajax({
						url: ajaxUrl,
						dataType: "html",
						type: "GET",
						error: ajaxErr,
						success: addISIRelated,
						complete: ajaxComplete
					});
				}
			}
		}
	}
}
function getISICiting() {
	var citingA = $("#cb-isi-citing-articles");
	if (citingA.length) {
		var newA = '<a id="cb-loading-isi-cited" href="#">Loading ISI citing article data...</a>';
		citingA.replaceWith(newA);
		var href = citingA.attr("href");
		var id = '';
		if (href) {
			var hrefDec = decodeURI(href);
			if ((hrefDec.indexOf('?') > 0)) {
				var args = hrefDec.substring(hrefDec.indexOf('?') + 1).split('&');
				for (var i = 0; i < args.length; i++) {
					var argDec = decodeURIComponent(args[i]);
					if (argDec.toLowerCase().indexOf('access_num=') == 0) {
						id = argDec.substring(argDec.indexOf('=') + 1);
						if (id.indexOf('#') > 0) {
							id = id.substring(0, id.indexOf('#'));
						}
					}
				}
				if (!(id == '')) {
					var host = document.location.protocol + "//" + document.location.host;
					var ajaxUrl = host + '/isi-links/' + id.replace(/;/,'/');
					$.ajax({
						url: ajaxUrl,
						dataType: "html",
						type: "GET",
						error: ajaxErr,
						success: addISICiting,
						complete: ajaxComplete
					});
				}
			}
		}
	}
}
function getEntrezLinks() {
	var entrezDiv = $("#cb-entrez-links-placeholder");
	if (entrezDiv.length) {
		var entrezA = entrezDiv.children("a");
		if (entrezA) {
			var host = document.location.protocol + "//" + document.location.host;
			var ajaxUrl = host + entrezA.attr("href");
			$.ajax({
				url: ajaxUrl,
				dataType: "html",
				type: "GET",
				error: ajaxErr,
				success: addEntrezLinks,
				complete: ajaxComplete
			});
		}
	}
}

function ajaxErr(req, msg, e) {
}
function ajaxComplete(req, msg) {
}
function updateCBItem(cbItem, newHTML, hasData) {
	var parentItem = cbItem.parents("li").eq(0);
	cbItem.replaceWith(newHTML);
	if (!hasData) {
		// hide the parent li
		if (parentItem.length) {
			modClass(parentItem,"nodata","");
			// check if there are any siblings still being displayed
			var otherItems = parentItem.siblings();
			var allItemsEmpty;
			if (otherItems.length) {
				if (otherItems.length == otherItems.filter(".nodata").length) {
					allItemsEmpty = true
				}
				else {
					allItemsEmpty = false;
				}
			}
			else {
				allItemsEmpty = true;
			}
			if (allItemsEmpty) {
				var cbsection = parentItem.parents("div.cb-section").eq(0);
				if (cbsection.length) {
					modClass(cbsection,"nodata","");
				}
			}
		}
	}
	// in frameset fix targets on child links, forms
	fixFrameLinks(parentItem.find("a,form"));
	fixColHeights(2);
}
function fixFrameLinks(jqItems) {
	if ((gIsFrameset != null) && gIsFrameset) {
		jqItems.each(
			function(i) {
				$(this).attr("target", "_top");
			}
		);
	}
}
function addRelatedURLs(xhtmlData) {
	var cbA = $("#cb-loading-related-urls");
	if (xhtmlData && !(xhtmlData.indexOf('<span') >= 0)) {
		$("#related-urls").replaceWith(xhtmlData);
		fixColHeights(1);
		if (cbA.length) {
			updateCBItem(cbA, '<a href="#related-urls">Related Web Pages</a>', true);
		}
	}
	else {
		if (cbA.length) {
			updateCBItem(cbA, '<div id="cb-loaded-related-urls-none">No related web pages</div>', false);
		}
	}
}
function addHWCiting(xhtmlData) {
	var cbA = $("#cb-loading-hw-cited");
	if (xhtmlData) {
		$("#content-block").append(xhtmlData);
		fixColHeights(1);
		if (cbA.length) {
			updateCBItem(cbA, '<a href="#cited-by">View citing article information</a>', true);
		}
	}
	else {
		if (cbA.length) {
			updateCBItem(cbA, '<div id="cb-loaded-hw-cited-none">No citing articles</div>', false);
		}
	}
}
function addISIRelated(xhtmlData) {
	var cbA = $("#cb-isi-similar-articles");
	if (xhtmlData && !(xhtmlData.indexOf('<span') >= 0)) {
		if (cbA.length) {
			updateCBItem(cbA, xhtmlData, true);
		}
	}
	else {
		if (cbA.length) {
			updateCBItem(cbA, '<div id="cb-loaded-isi-related-none">No ISI related articles</div>', false);
		}
	}
}
function addISICiting(xhtmlData) {
	var cbA = $("#cb-loading-isi-cited");
	if (xhtmlData && !(xhtmlData.indexOf('<span') >= 0)) {
		if (cbA.length) {
			updateCBItem(cbA, xhtmlData, true);
		}
	}
	else {
		if (cbA.length) {
			updateCBItem(cbA, '<div id="cb-loaded-isi-cited-none">No ISI citing articles</div>', false);
		}
	}
}
function addEntrezLinks(xhtmlData) {
	var entrezDiv = $("#cb-entrez-links-placeholder");
	if (xhtmlData) {
		entrezDiv.empty().append(xhtmlData);
		fixFrameLinks(entrezDiv.find("a,form"));
		fixColHeights(2);
	}
}
function addDockedNav() {
	var slugEl = $("#slugline");
	// get direct children li elements only
	var artViews = $("#article-cb-main .cb-section ol:has(li a[rel^='view-']) > li").clone();
	var newDiv = '<div id="docked-nav"></div>';
	$("#col-2").append(newDiv);
	$("#col-2 #docked-nav").hide();
	var newDivJQuery = $("#docked-nav");
	newDivJQuery.append('<div class="content-box"><div class="cb-contents"><h3>This Article</h3><div class="cb-section cb-slug"><ol id="docked-slug"><li></li></ol></div><div class="cb-section"><ol id="docked-nav-views"></ol></div></div></div>');
	$("#col-2 #docked-nav-views").append(artViews); /*.append(artSupp);*/
	$("#col-2 #docked-nav #docked-slug li").append(slugEl.clone());
	newDivJQuery.append($("#article-dyn-nav").clone());
	$("#col-2 #docked-nav").fadeIn(250);
}


function removeDockedNav() {
	var dockedNav = $("div#docked-nav");
	if(dockedNav.length) {
		dockedNav.fadeOut(250, function() { dockedNav.remove(); });
	}
}
