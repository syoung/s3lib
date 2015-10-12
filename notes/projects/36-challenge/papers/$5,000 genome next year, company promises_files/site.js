(function($) {
	$(document).ready(function () {
		$("body:not('.js-enabled')").addClass("js-enabled");

		/* ========================== */
		/* = homepage "search news" = */
		/* ========================== */
		$(".search-news #searchnews").focus(function() {
			$(".search-news label").fadeOut("slow");	
		});
		
		$(".search-news #searchnews").blur(function() {
			if (!$(".search-news #searchnews").val()) {
				$(".search-news label").fadeIn("slow");	
			}
		});
		
		/* =============== */
		/* = news ticker = */
		/* =============== */
		var runTicker = true; // if set to true kind of violates W3C WCAG 1.0 (guideline 7.2)
		var tickerControlText;	
		
		if (runTicker) {
			tickerControlText = "stop ticker";
		} else {
			tickerControlText = "start ticker";
		}
	
		// build controls
		$(".ticker > li:last-child").createAppend("ul", { "class": "controls" }, "");	
		$(".ticker .controls").createAppend(
			"li", {"class":"stop-ticker"}, [
				"a", { "href": ""}, tickerControlText
			]
		);
		$(".ticker .controls").createAppend(
			"li", {"class":"previous-link"}, [
				"a", {"href": ""}, "previous"
			]
		);
		$(".ticker .controls").createAppend(
			"li", {"class":"next-link"}, [
				"a", {"href":""}, "next"
			]
		);
		$(".ticker .controls li:not('.stop-ticker') a").createAppend("span", {"class":"hidden"}, " link");
	
		// hide all then show first as default
		changeTickerLink(0);
		
		// cycle through ticker links (if ticker exists)
		if ($(".ticker").html()) {
			window.setInterval(function ()  {		
				if(runTicker) {
					var selectedLi = parseInt($(".ticker .links li.selected").attr("class").replace(/l([0-9]{1}).*/g, "$1")) + 1;
					if (selectedLi > $(".ticker .links li").length -1) {selectedLi = 0};
					changeTickerLink(selectedLi);
				}
			}, 3500);		
		}
		
		// stop ticker when links hovered over
		$(".ticker .links a").mouseover(function() {runTicker = false;});
		$(".ticker .links a").mouseout(function() {
			runTicker = true;
			$(".ticker .stop-ticker a").html("stop ticker");
		});
		
		// stop/start ticker link
		$(".ticker .stop-ticker").bind("click", function() {
			if (runTicker) {
				runTicker = false;
				$(".ticker .stop-ticker a").html("start ticker");
			} else {
				nextLink();
				runTicker = true;
				$(".ticker .stop-ticker a").html("stop ticker");
			}
			return false;
		});
		
		// next ticker link
		$(".ticker .next-link").bind("click", function() {
			nextLink();
			return false;
		});
		
		// previous ticker link
		$(".ticker .previous-link").bind("click", function() {
			previousLink();
			return false;	
		});
		
		nextLink = function() {
			runTicker = false;
			$(".ticker .stop-ticker a").html("start ticker");
			var selectedLi = parseInt($(".ticker .links li.selected").attr("class").replace(/l([0-9]+).*/g, "$1")) + 1;
			if (selectedLi > $(".ticker .links li").length -1) {selectedLi = 0};
			changeTickerLink(selectedLi);
		}
		
		previousLink = function() {
			runTicker = false;
			$(".ticker .stop-ticker a").html("start ticker");
			var selectedLi = parseInt($(".ticker .links li.selected").attr("class").replace(/l([0-9]+).*/g, "$1")) - 1;
			if (selectedLi < 0) {selectedLi = $(".ticker .links li").length -1};
			changeTickerLink(selectedLi);
		}
	
		/* ====================================== */
		/* = rightnav "recent activity" include = */
		/* ====================================== */ 
		$("#recent-activity .categories > li:first-child").addClass("on");
		$("#recent-activity .story-type a").bind("click", function () {
			$("#recent-activity .category[@class*=on]").removeClass("on");
			$("#recent-activity .focused").removeClass("focused");
			$(this).parent().parent().addClass("on");
			return false;
		});
		
		/* ============================== */
		/* = archive calendar drop down = */
		/* ============================== */		
		$("#archive .heading").click(function() {
			$(this).next()
				.slideToggle("fast")
			.end()
			.toggleClass("on");
			return false;
		});
		
		$("#archive .heading").hover(function(){
			$(this).addClass("hover").css("cursor", "pointer");
		},function(){
			$(this).removeClass("hover").css("cursor", "default");
		});
		
		// ===========================
		// = article comment preview =
		// ===========================
		// show "preview post" button
		$("form.comment .buttons .shown-by-js").removeClass("shown-by-js");
		
		$("form.comment .buttons .submit.preview").bind("click", function() {
			$(".preview-by-js p").text($("#comment").val());
			$("form.comment #comment").slideToggle("slow");
			$("form.comment label").slideToggle("slow");
			$(".preview-by-js").slideToggle("slow");
			// Case matters!
			if ($(this).attr("value") == "Preview comment") {
				// console.log($(this).attr("value"));
				$(this).attr("value", "Edit comment");
			} else {
				// console.log($(this).attr("value"));
				$(this).attr("value", "Preview comment");
			}
			return false;
		});
		
		// ===================================
		// = moderation request notification =
		// ===================================
		if($(".inform-user").text()) {
			window.setInterval(function ()  {		
				$(".inform-user.comment").slideUp("slow");
			}, 7000);
			window.setInterval(function ()  {		
				$(".inform-user.moderation").slideUp("slow");
			}, 4000);
		}
		
		/* ============== */
		/* = slide show = */
		/* ============== */
		// build paginator
		$(".js-added").createAppend("ul", { "class": "slide-paginator" }, "");	
		
		$("div[@id^=img]").each(function(i) {
			var x = i+1;
			$(".js-added .slide-paginator").createAppend(
				"li", { "class": "img"+x}, [
					"a", { "href": ""}, [
						"span", { "class": "number" }, x.toString()
					]
				]
			);
		});
		
		$(".slide-paginator a").createPrepend("span", { "class": "hidden" }, "figure ");
		
		$(".js-added .slide-paginator").createPrepend(
			"li", { "class": "sp-prev" }, [
				"a", { "href": "#prev" }, "previous"
			]
		);
		
		$(".js-added .slide-paginator").createAppend(
			"li", { "class": "sp-next" }, [
				"a", { "href": "#next" }, "next"
			]
		);
		
		// set first numbered li to be highlit as default
		$(".img1 a").addClass("selected");
		
		// hide "previous" link as default
		$(".sp-prev").css( {visibility: "hidden"} );
		
		// numbered links
	/*	$(".ar").addClass("js");*/
		$(".slide-paginator li[@class^=img] a").bind("click", function () {
			$(".slide-paginator a").removeClass("selected");
			$(this).addClass("selected");
			$("div[@id^=img]").hide();
			$("#img" + $(this).children(".number").html()).show();
			nextPreviousLinks($(this).children(".number").html());
			return false;	
		});
		
		// next
		$(".sp-next a").bind("click", function() {
			if (parseInt($(".slide-paginator .selected .number").html()) != $(".slide-paginator li[@class^=img]").length) {
				var x = parseInt($(".slide-paginator .selected .number").html()) + 1;
				setSelected(x);
				nextPreviousLinks(x);
			}
			return false;	
		});
		
		// previous
		$(".sp-prev a").bind("click", function() {
			if (parseInt($(".slide-paginator .selected .number").html()) != 1) {
				var x = parseInt($(".slide-paginator .selected .number").html()) - 1;
				setSelected(x);
				nextPreviousLinks(x);
			}
			return false;	
		});	
		
	});
	
	function setSelected(imgSelected) {
		$(".slide-paginator a").removeClass("selected");
		$(".img" + imgSelected + " a").addClass("selected");
		$("div[@id^=img]").hide();
		$("#img" + imgSelected).show();
	}
	
	function nextPreviousLinks(imgSelected) {
		if (imgSelected == 1) {
			$(".sp-prev").css( {visibility: "hidden"} );
			$(".sp-next").css( {visibility: "visible"} );
		}
		
		if (imgSelected == $(".slide-paginator li[@class^=img]").length) {
			$(".sp-next").css( {visibility: "hidden"} );
			$(".sp-prev").css( {visibility: "visible"} );
		}
		
		if (imgSelected != $(".slide-paginator li[@class^=img]").length && imgSelected != 1) {
			$(".sp-prev").css( {visibility: "visible"} );
			$(".sp-next").css( {visibility: "visible"} );
		}
	}
	
	function changeTickerLink(selectedLi) {
		$(".ticker .links li").hide().removeClass("selected");
		$(".ticker .links .l" + selectedLi).fadeIn("slow").addClass("selected");
	}
}) (jQuery);