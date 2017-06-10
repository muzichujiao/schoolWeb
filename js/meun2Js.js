
var TabbedContent = {
        /*导航栏*/
    		init: function() {
    			$(".tab_item").mouseover(function() {
    				TabbedContent.slideContent($(this));
   				 });
    		},
    		slideContent: function(obj) {
    			var b = $(".tab_item");
    			for( i = 0;i<5;i++){
    				if(b.css("border-right","1px solid #000"))
            {
    					b.css("border-right","1px solid #fff");
              b.css("border-left","1px solid #fff");
              b.css("border-bottom","1px solid #000");
            }
    			}
          $(obj).css("border-right","1px solid #000");
          $(obj).css("border-left","1px solid #000");
          $(obj).css("border-bottom","1px solid #fff");
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
    					b.css("border-right","1px solid #fff");
              b.css("border-left","1px solid #fff");
              b.css("border-bottom","1px solid #000");
    				}
    			});
        $(".tit").mouseenter(function(){
            $(".slide_content").css("visibility","hidden");
            var b = $(".tab_item");
            for( i = 0;i<5;i++){
              b.css("border-right","1px solid #fff");
              b.css("border-left","1px solid #fff");
              b.css("border-bottom","1px solid #000");
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
   			
   			if (w >= 981) {
   			    var contwidth = $(".content").width() + 0.5;
   			    div.style.width = (w - contwidth) / 2 + "px";
   			    lll.style.width = (w - contwidth) / 2 + "px";
   			} else {
   			    div.style.width = "0px";
   			    lll.style.width = "0px";
   			}
		}  
		//对浏览器窗口长宽的监控
		window.onload=function(){  
  			window.onresize = adjust;  
  			adjust();  
		}

