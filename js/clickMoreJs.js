$(document).ready(function(){

	//底部后台登录位置初始化
	$(".footer-copyright").css({"top":0});
	$(".footer-backstage").css({"top":"36px"});
	//底部后台登录显示
	$(".footer-footer").mouseover(function(){
		$(".footer-copyright").stop(true,false).animate({"top":"-36px"},200);
		$(".footer-backstage").stop(true,false).animate({"top":"0px"},200);
	});
	$(".footer-footer").mouseout(function(){
		$(".footer-copyright").stop(true,false).animate({"top":"0px"},200);
		$(".footer-backstage").stop(true,false).animate({"top":"36px"},200);
	})
})
/*var TabbedContent = {
        
    		init: function() {
    			$(".tab_item").mouseover(function() {
    				TabbedContent.slideContent($(this));
   				 });
    		},
    		slideContent: function(obj) {
    			var b = $(".tab_item");
    			for( i = 0;i<5;i++){
    				if(b.css("background-color","rgba(256,256,256,0.6)"))
    					b.css("background-color","rgba(256,256,256,1)");
    			}
    			$(obj).css("background-color","rgba(256,256,256,0.6)");
   				var margin = $(obj).parent().parent().find(".slide_content").width();
    			margin = margin * ($(obj).prevAll().size() - 1);
    			margin = margin * (-1) ;
    			$(obj).parent().parent().find(".tabslider").stop().animate({
    				marginLeft: margin + "px"
    			}, {
    				duration: 0
    			});
    		}
    	}
    	$(document).ready(function() {
    		TabbedContent.init();
    		$(".slide_content").mouseleave(function(){
    				$(this).css("visibility","hidden");
    				var b = $(".tab_item");
    				for( i = 0;i<5;i++){
    					b.css("background-color","rgba(256,256,256,1)");
    				}
    			});
        $(".tit").mouseenter(function(){
            $(".slide_content").css("visibility","hidden");
            var b = $(".tab_item");
            for( i = 0;i<5;i++){
              b.css("background-color","rgba(256,256,256,1)");
            }
        })
    		$(".tab_item").mouseover(function() {
    				$(".slide_content").css("visibility","visible");
    			});

    		
    	});

    	//对head的两边white调整
    	function adjust(obj){  
   			var div = document.getElementById("white");  
   			var lll = document.getElementById("white1");   
   			var w  = document.body.clientWidth;  
   			var contwidth = $(".content").width()+0.5;
   			div.style.width = (w-contwidth)/2 +"px"; 
   			lll.style.width = (w-contwidth)/2 +"px";     
		}  
		//对浏览器窗口长宽的监控
		window.onload=function(){  
  			window.onresize = adjust;  
  			adjust();  
		}
        */

    /*=========换页=======*/
    var $page = $(".change-page").children("ul").children("li").eq(3).children("span");
    var urlRequest = document.location.href;
    var urlType = decodeURI(urlRequest).indexOf("type=");
    var urlItem = decodeURI(urlRequest).indexOf("item=");
    var urlPage = decodeURI(urlRequest).indexOf("page=");

    //输入框初始化
    $(".change-page").children("input").val($(".change-page").children("ul").children("li").eq(3).children("span").html());
    $(".change-page").children("input").css({"display":"none"});
    //列表换页输入第几页
    $(".change-page").children("ul").children("li").eq(3).children("span").click(function(){
        $(".change-page").children("input").css({"display":""});
    });
    //切换页数
    $(".change-page").children("input").on("keypress",function(event){ 
        var num = $(".change-page").children("input").val();
        var code = event.keyCode;
        var allPage = $(".change-page").children("ul").children("li").eq(2).children("span").html();
        //按回车切换页数
        if(event.keyCode == 13){  
            if((num-0) <= (allPage-0)){
                $(".change-page").children("ul").children("li").eq(3).children("span").html(num);
            }
            else if((num-0) > (allPage-0)){
                num = allPage;
                $(".change-page").children("ul").children("li").eq(3).children("span").html(num);
            }
            $(".change-page").children("input").css({"display":"none"});
            //切换页数
            if(urlPage != -1) {
                window.location.href = decodeURI(window.location.href).substring(0,urlPage-1) + "&page=" + (num-0-1).toString();
            }
            else if(urlPage == -1) {
                window.location.href = decodeURI(window.location.href) + "&page=" + (num-0-1).toString();
            }
        };
    });