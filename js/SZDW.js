

//点击左边导航栏展开与隐藏
$(function(){
// mtree.js
// Requires jquery.js and velocity.js (optional but recommended).
// Copy the below function, add to your JS, and simply add a list <ul class=mtree> ... </ul>
;(function ($, window, document, undefined) {
  
  // Only apply if mtree list exists
  if($('ul.mtree').length) { 
  
    
  // Settings
  var collapsed = true; // Start with collapsed menu (only level 1 items visible)
  var close_same_level = false; // Close elements on same level when opening new node.
  var duration = 400; // Animation duration should be tweaked according to easing.
  var listAnim = true; // Animate separate list items on open/close element (velocity.js only).
  var easing = 'easeOutQuart'; // Velocity.js only, defaults to 'swing' with jquery animation.
    
  
  // Set initial styles 
  $('.mtree ul').css({'overflow':'hidden', 'height': (collapsed) ? 0 : 'auto', 'display': (collapsed) ? 'none' : 'block' });
  
  // Get node elements, and add classes for styling
  var node = $('.mtree li:has(ul)');  
  node.each(function(index, val) {
    $(this).children(':first-child').css('cursor', 'pointer')
    $(this).addClass('mtree-node mtree-' + ((collapsed) ? 'closed' : 'open'));
    $(this).children('ul').addClass('mtree-level-' + ($(this).parentsUntil($('ul.mtree'), 'ul').length + 1));
  });
  
  // Set mtree-active class on list items for last opened element
  $('.mtree li > *:first-child').on('click.mtree-active', function(e){
    if($(this).parent().hasClass('mtree-closed')) {
      $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
      $(this).parent().addClass('mtree-active');
    } else if($(this).parent().hasClass('mtree-open')){
      $(this).parent().removeClass('mtree-active'); 
    } else {
      $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
      $(this).parent().toggleClass('mtree-active'); 
    }
  });

  // Set node click elements, preferably <a> but node links can be <span> also
  node.children(':first-child').on('click.mtree', function(e){
    
    // element vars
    var el = $(this).parent().children('ul').first();
    var isOpen = $(this).parent().hasClass('mtree-open');
    
    // close other elements on same level if opening 
    if((!close_same_level || $('.csl').hasClass('active')) && !isOpen) {
      var close_items = $(this).closest('ul').children('.mtree-open').not($(this).parent()).children('ul');
      
      // Velocity.js
      if($.Velocity) {
        close_items.velocity({
          height: 0
        }, {
          duration: duration,
          easing: easing,
          display: 'none',
          delay: 100,
          complete: function(){
            setNodeClass($(this).parent(), true)
          }
        });
        
      // jQuery fallback
      } else {
        close_items.delay(100).slideToggle(duration, function(){
          setNodeClass($(this).parent(), true);
        });
      }
    }
    
    // force auto height of element so actual height can be extracted
    el.css({'height': 'auto'}); 
    
    // listAnim: animate child elements when opening
    if(!isOpen && $.Velocity && listAnim) el.find(' > li, li.mtree-open > ul > li').css({'opacity':0}).velocity('stop').velocity('list');
    
    // Velocity.js animate element
    if($.Velocity) {
      el.velocity('stop').velocity({
        //translateZ: 0, // optional hardware-acceleration is automatic on mobile
        height: isOpen ? [0, el.outerHeight()] : [el.outerHeight(), 0]
      },{
        queue: false,
        duration: duration,
        easing: easing,
        display: isOpen ? 'none' : 'block',
        begin: setNodeClass($(this).parent(), isOpen),
        complete: function(){
          if(!isOpen) $(this).css('height', 'auto');
        }
      });
    
    // jQuery fallback animate element
    } else {
      setNodeClass($(this).parent(), isOpen);
      el.slideToggle(duration);
    }
    
    // We can't have nodes as links unfortunately
    e.preventDefault();
  });
  
  // Function for updating node class
  function setNodeClass(el, isOpen) {
    if(isOpen) {
      el.removeClass('mtree-open').addClass('mtree-closed');
    } else {
      el.removeClass('mtree-closed').addClass('mtree-open');
    }
  }
  
  // List animation sequence
  if($.Velocity && listAnim) {
    $.Velocity.Sequences.list = function (element, options, index, size) {
      $.Velocity.animate(element, { 
        opacity: [1,0],
        translateY: [0, -(index+1)]
      }, {
        delay: index*(duration/size/2),
        duration: duration,
        easing: easing
      });
    };
  }
    
    // Fade in mtree after classes are added.
    // Useful if you have set collapsed = true or applied styles that change the structure so the menu doesn't jump between states after the function executes.
    if($('.mtree').css('opacity') == 0) {
      if($.Velocity) {
        $('.mtree').css('opacity', 1).children().css('opacity', 0).velocity('list');
      } else {
        $('.mtree').show(200);
      }
    }
  }
}(jQuery, this, this.document));
})



$(document).ready(function(){


	//左边三级导航栏hover变色
	$(".left-nav").children("ul").children("li").children("ul").children("li").children("a").mouseover(function(){
		$(this).css({"color":"#5eabec"});
	});
	$(".left-nav").children("ul").children("li").children("ul").children("li").children("a").mouseout(function(){
		$(this).css({"color":"#0e3f6d"});
	})


    //左边导航栏固定置顶
	var allH = window.screen.availHeight;
	var navH = $(".left-nav").offset().top;
	var footerH = $(".footer").offset().top;
	$(window).scroll(function () {
	    var leftH = parseInt($(".left-nav").css("height"));
	    var scroH = $(window).scrollTop();
	    if (scroH > navH) {
	        if (leftH <= footerH - scroH) {
	            $(".left-nav").css({ "position": "fixed", "top": 0, "z-index": +1 });
	        }
	        else if (leftH > footerH - scroH) {
	            $(".left-nav").css({ "position": "fixed", "top": (footerH - scroH - leftH), "z-index": +1 });
	        }
	    }
	    else if (scroH <= navH) {
	        $(".left-nav").css({ "position": "static" });
	    };
	});
	$(".left-nav").on("click", function () {
	    setTimeout(function () {
	        var navH = $(".left-nav").offset().top;
	        var footerH = $(".footer").offset().top;
	        var leftH = parseInt($(".left-nav").css("height"));
	        console.log(leftH);
	        var scroH = $(window).scrollTop();
	        if (scroH > navH) {
	            if (leftH < footerH - scroH) {
	                $(".left-nav").css({ "position": "fixed", "top": 0, "z-index": +1 });
	            }
	            else if (leftH >= footerH - scroH) {
	                $(".left-nav").animate({ "top": (footerH - scroH - leftH) }, 200);
	            }
	        }
	        else if (scroH <= navH) {
	            $(".left-nav").css({ "position": "static" });
	        };
	    }, 500)
	})


//横线长度问题
var titleLength = $(".all-title").children("h1").text().length;
  if(titleLength > 5) {
    $(".all-title").children("h1").css({"background":"url(images/middleline02.png) center center no-repeat"});
  }
  else if(titleLength <= 5) {
    $(".all-title").children("h1").css({"background":"url(images/longline.png) center center no-repeat"});
  }

    ////关于页面刷新时的问题：侧边导航的默认展开&显示第几页列表
  var $aside = $(".left-nav");
  var $page = $(".change-page").children("ul").children("li").eq(3).children("span");
  var urlRequest = document.location.href;
  var urlSearch = document.location.search;
  var urlType = decodeURI(urlRequest).indexOf("type=");
  var urlItem = decodeURI(urlRequest).indexOf("item=");
  var urlPage = decodeURI(urlRequest).indexOf("page=");
  if (urlSearch) {
      $aside.find("a").each(function (i, e) {
          var aType = $(this).attr("href").indexOf("type=");
          var aItem = $(this).attr("href").indexOf("item=");
          var aPage = $(this).attr("href").indexOf("page=");
          if (urlPage != -1) {
              if ($(this).attr("href").substring(aType) == decodeURI(urlRequest).substring(urlType, urlPage - 1)) {
                  //侧边导航默认展开的效果及响应式
                  $(this).parent("li").parent("ul").css({ "display": "block", "height": "auto" });
                  $(this).css({ "color": "#5eabec" });
                  $(this).mouseover(function () {
                      $(this).css({ "color": "#5eabec" });
                  });
                  $(this).mouseout(function () {
                      $(this).css({ "color": "#5eabec" });
                  });
                  $(this).parent("li").parent("ul").parent("li").removeClass('mtree-closed').addClass('mtree-open').addClass('mtree-active');
              }
              //列表页数
              $page.html(decodeURI(urlRequest).substring(urlPage + 5) - 0 + 1);
          }
          else if (urlPage == -1) {
              if ($(this).attr("href").substring(aType) == decodeURI(urlRequest).substring(urlType)) {
                  //侧边导航默认展开的效果及响应式
                  $(this).parent("li").parent("ul").css({ "display": "block", "height": "auto" });
                  $(this).parent("li").parent("ul").parent("li").removeClass('mtree-closed').addClass('mtree-open').addClass('mtree-active');
              }
          }
      });
  }
  else {
      $aside.children("ul").children("li").eq(0).children("ul").css({ "display": "block", "height": "auto" });
      $aside.children("ul").children("li").eq(0).removeClass('mtree-closed').addClass('mtree-open').addClass('mtree-active');
  }


    ///输入框初始化
  $(".change-page").children("input").val($(".change-page").children("ul").children("li").eq(3).children("span").html());
  $(".change-page").children("input").css({ "display": "none" });
    //列表换页输入第几页
  $(".change-page").children("ul").children("li").eq(3).children("span").click(function () {
      $(".change-page").children("input").css({ "display": "" });
  });
    //切换页数
  $(".change-page").children("input").on("keypress", function (event) {
      var num = $(".change-page").children("input").val();
      var code = event.keyCode;
      //按回车切换页数
      if (event.keyCode == 13) {
          if (num <= allPage) {
              $(".change-page").children("ul").children("li").eq(3).children("span").html(num);
              //切换页数
              if (urlPage != -1) {
                  window.location.href = decodeURI(window.location.href).substring(0, urlPage - 1) + "&page=" + (num - 0 - 1).toString();
                  return false;
              }
              else if (urlPage == -1) {
                  window.location.href = decodeURI(window.location.href) + "&page=" + (num - 0 - 1).toString();
                  return false;
              }
          }
          else if (num > allPage) {
              $(".change-page").children("ul").children("li").eq(3).children("span").html(allPage);
              //切换页数
              if (urlPage != -1) {
                  window.location.href = decodeURI(window.location.href).substring(0, urlPage - 1) + "&page=" + (allPage - 0 - 1).toString();
                  return false;
              }
              else if (urlPage == -1) {
                  window.location.href = decodeURI(window.location.href) + "&page=" + (allPage - 0 - 1).toString();
                  return false;
              }
          }
          $(".change-page").children("input").css({ "display": "none" });

      };
  });


  //列表hover效果
  $(".common-lists").children("ul").children("li").mouseover(function(){
    $(this).children("a").children("div").children("p").css({"color":"#5eabec"});
    $(this).children("a").children("div").children("h1").css({"color":"#5eabec"});
  });
  $(".common-lists").children("ul").children("li").mouseout(function(){
    $(this).children("a").children(".news-time").children("p").css({"color":"#132840"});
    $(this).children("a").children("div").children("h1").css({"color":"#132840"});
    $(this).children("a").children(".news-title").children("p").css({"color":"#485B71"});
  })



})



