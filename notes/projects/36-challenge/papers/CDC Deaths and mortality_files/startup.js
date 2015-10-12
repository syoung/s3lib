setDefault("CDC_VIDEO_RESIZE_ARRAY",new Array());function loaderFunction(){resizeSearch();
}$(document).ready(function(){loaderFunction();});function resizeSearch(){$(".searchResize").each(function(){if(getWindowWidth()<835){$(this).css("width","220px");
}else{$(this).css("width","300px");}if($(this).attr("id")=="searchFormLocal"){$("#searchForm").css("display","none");
}$(this).find(".searchBox").each(function(){if(getWindowWidth()<835){$(this).css("width","150px");
}else{$(this).css("width","230px");}});});}function resizeElements(){resizeSearch();
for(var i=0;i<CDC_VIDEO_RESIZE_ARRAY.length;i++){var mov=CDC_VIDEO_RESIZE_ARRAY[i];
mov.resize();}}$(window).resize(function(){resizeElements();});