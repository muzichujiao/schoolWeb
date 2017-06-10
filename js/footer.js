



$(document).ready(function(){


	//底部后台登录位置初始化
	$(".footer-copyright").css({"top":0});
	$(".footer-backstage").css({"top":"36px"});
	//底部后台登录显示
	$(".footer-footer").hover(function(){
		$(".footer-copyright").stop(true,false).animate({"top":"-36px"},200);
		$(".footer-backstage").stop(true,false).animate({"top":"0px"},200);
	}, function () {
	    $(".footer-copyright").stop(true, false).animate({ "top": "0px" }, 200);
	    $(".footer-backstage").stop(true, false).animate({ "top": "36px" }, 200);
	});
})



