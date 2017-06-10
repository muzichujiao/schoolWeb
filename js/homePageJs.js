/*导航栏*/
var TabbedContent = {
    init: function () {
        $(".tab_item").mouseover(function () {
            TabbedContent.slideContent($(this));
        });
    },
    		slideContent: function(obj) {
    			var b = $(".tab_item");
    			for( i = 0;i<5;i++){
    				if(b.css("background-color","rgba(256,256,256,0.68)"))
    					b.css("background-color","rgba(256,256,256,1)");
    			}
    			$(obj).css("background-color","rgba(256,256,256,0.68)");
   				var margin = $(obj).parent().parent().find(".slide_content").width();
    			margin = margin * ($(obj).prevAll().size() - 1);
    			margin = margin * -1;
    			$(obj).parent().parent().find(".tabslider").stop().animate({
    				marginLeft: margin + "px"
    			}, {
    				duration: 0
    			});
    		}
    	}
    	$(window).ready(function() {
    		TabbedContent.init();
    	    $(".slideC").mouseleave(function(){
    				$(this).css("visibility","hidden");

    				var b = $(".tab_item");
    				for( i = 0;i<5;i++){
    					b.css("background-color","rgba(256,256,256,1)");
    				}
    		});
    		$(".tit").mouseenter(function () {
    		    $(".slideC").css("visibility", "hidden");
    		    var b = $(".tab_item");
    		    for (i = 0; i < 5; i++) {
    		        b.css("background-color", "rgba(256,256,256,1)");
    		    }
    		});
    		$(".tab_item").mouseover(function() {
    				$(".slideC").css("visibility","visible");
    		});

    		$(".inforTittle").mouseover(function () {
    		    $("#lecture").stop(true, false).animate({ "margin-top": "-55px" }, 100);
    		    $("#moreLecture").stop(true, false).animate({ "margin-top": "0px" }, 100);
    		});
    		$(".inforTittle").mouseout(function () {
    		    $("#lecture").stop(true, false).animate({ "margin-top": "0px" }, 100);
    		    $("#moreLecture").stop(true, false).animate({ "margin-top": "55px" }, 100);
    		})

    		
    	});

    	//对head的两边white调整
    	function adjust(obj){  
   			var div = document.getElementById("white");  
   			var lll = document.getElementById("white1");   
   			var w = document.body.clientWidth;
   			if (w >= 984) {
   			    var contwidth = $(".tabs").width() + 0.5;
   			    div.style.width = (w - contwidth) / 2 + "px";
   			    lll.style.width = (w - contwidth) / 2 + "px";
   			} else {
   			    div.style.width = "0px";
   			    lll.style.width ="0px";
   			}
   			
   			var contwidth = $(".tabs").width();
   			
   			var prev = document.getElementById("prev");
   			var next = document.getElementById("next");
   			prev.style.marginLeft = (w - contwidth - 10) / 4 + "px";
   			next.style.marginRight = (w - contwidth - 10) / 4 + "px";
   			if (contwidth < 1000)
   			    document.getElementById("list").style.left = '-1366px';
   			else
   			    document.getElementById("list").style.left = '-1920px';
   			        
		}  
		//对浏览器窗口长宽的监控
		window.onload=function(){  
  			window.onresize = adjust;  
  			adjust();  
		}
		$(document).ready(function () {


		    window.onresize = adjust;
		    adjust();

		    //底部后台登录位置初始化
		    $(".footer-copyright").css({ "top": 0 });
		    $(".footer-backstage").css({ "top": "36px" });
		    //底部后台登录显示
		    $(".footer-footer").mouseover(function () {
		        $(".footer-copyright").stop(true, false).animate({ "top": "-36px" }, 200);
		        $(".footer-backstage").stop(true, false).animate({ "top": "0px" }, 200);
		    });
		    $(".footer-footer").mouseout(function () {
		        $(".footer-copyright").stop(true, false).animate({ "top": "0px" }, 200);
		        $(".footer-backstage").stop(true, false).animate({ "top": "36px" }, 200);
		    })

		});




		/*轮播图*/
	/*	$(document).ready(function(){
     //轮播
    var t = setInterval('lunbo()', 5000);
  
  //轮播暂停，重启
    $('div.expert').mouseover(function(){
      clearInterval(t);}).mouseout(function(){    
        t = setInterval('lunbo()', 5000);});
  })
    var page = 1;
    var i = 3;
    function lunbo(){    
        var expert = $(".expert_list ul li").width();
        var $expert_list = $('div.expert_list');   
        var len_li = $expert_list.find('li').length;    
        var page_count = Math.ceil(len_li/i);    
        if(!$expert_list.is(':animated')) {        
            if (page == i) {   
                $expert_list.animate({right:'0px'},1);            
                page = 1;       
            } else {            
        $expert_list.animate({right: "+" + expert + 'px'}, 'slow'); 
       page++;       
   }    
}
}*/




		window.onload = function () {
		   
		    var contwidth = $(".tabs").width();
		    var list = document.getElementById('list');
		    var prev = document.getElementById('prev');
		    var next = document.getElementById('next');
		    var index = 1;//保存存放第几张图片
		    var goed = false;//表示是否在动画
		    var timer;

		    var lunboImg;
		    if (contwidth < 1000)
		        lunboImg = -1366;
		    else
		        lunboImg = -1920;


		    //函数：点击箭头 图片移动  
		    function animate(offset) {
		        goed = true;
		        var newLeft = parseInt(list.style.left) + offset;
		        var time = 300;//位移总时间
		        var interval = 10;//位移间隔时间
		        var speed = offset / (time / interval);//每次位移量
		        var lunboleft = lunboImg + "px";
		        var lunboL = lunboImg * 5 + "px";
		        function go() {
		            if ((speed < 0 && parseInt(list.style.left) > newLeft) || (speed > 0 && parseInt(list.style.left) < newLeft)) {
		                list.style.left = parseInt(list.style.left) + speed + 'px';
		                setTimeout(go, interval);//在interval时间后调用go函数
		            } else {
		                goed = false;
		                list.style.left = newLeft + 'px';

		                //循环效果 在循环到最后一张时 跳到第一张

		                if (newLeft > lunboImg) {
		                    $("#list").animate({ left: lunboL }, 1);
		                }
		                if (newLeft < lunboImg * 5) {
		                    /*list.style.left = -1366+'px';*/
		                    $("#list").animate({ left: lunboleft }, 1);

		                }
		            }
		        }
		        go();
		    }
		    //定时切换 自动播放
		    function play() {
		        timer = setInterval(function () {
		            next.onclick();
		        }, 3000);//定时器 每隔3秒播放
		    }
		    //删除定时器
		    function stop() {
		        clearInterval(timer);
		    }

		    //第二个箭头
		    next.onclick = function () {
		        var listImg = $("#list").find("img").width();
		        listImg = -listImg;
		        if (index == 5) {
		            index = 1;
		        } else {
		            index += 1;
		        }
		        if (goed == false) {
		            animate(listImg);
		        }

		    }
		    //第一个箭头
		    prev.onclick = function () {
		        var listImg = $("#list").find("img").width();
		        if (index == 1) {
		            index = 5;
		        } else {
		            index -= 1;
		        }
		        if (goed == false) {
		            animate(listImg);
		        }
		    }

		    //鼠标移上去停止 移出去继续播放
		    list.onmouseover = stop;
		    list.onmouseout = play;
		    play();

		}
