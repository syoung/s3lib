(function($) {
	$(document).ready(function () {

		// enables dropdown ads to display whilst maintaining .user-services visibility aat small resolutions
		// yes, it involves browser detection, and yes, that is truly horrible.
		if (jQuery.browser.mozilla) {
		
			var dropdownAd = false;
		
			// for each descendant of .leaderboard that isn't a <script>, determine if it's taller than standard leaderboard height
			$("#hdr .leaderboard *:not(script):not(.padder)").each(function() {
				if($(this).height() > 90) {
					dropdownAd = true;
				}
			});
		
			if (dropdownAd) {
				$("#hdr .leaderboard").css("overflow","visible");
				$("#hdr .leaderboard .padder").css("overflow","visible");
				$("#hdr .leaderboard").hover(function() {
					$("#hdr .leaderboard").css("overflow","visible");
					$("#hdr .leaderboard .padder").css("overflow","visible");
				},function() {
					$("#hdr .leaderboard").css("overflow","hidden");
					$("#hdr .leaderboard .padder").css("overflow","hidden");
				});			
			}
		}
		
	});
}) (jQuery);