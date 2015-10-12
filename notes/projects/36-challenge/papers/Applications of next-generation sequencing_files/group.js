// resize image containers based on size of images
runOnLoad(function() {
	$("div.image-full").each(function(i){
		var imageWidth = $(this).find("img").width();
		$(this).css("width", (imageWidth));
		$(this).css({ "margin-left" : "auto", "margin-right" : "auto" });
	});

	$("div.image-legend").each(function(i){
		var imageWidth = $(this).find("img").width();
		$(this).css("width", (imageWidth + 10));
		$(this).find("img").css("margin-top", "5px");
	});
});