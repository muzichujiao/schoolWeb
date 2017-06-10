
// header
$(document).ready(function () {

    var TabbedContent = {
        /*导航栏*/
        init: function () {
            $(".tab_item").mouseover(function () {
                TabbedContent.slideContent($(this));
            });
        },
        slideContent: function (obj) {
            var b = $(".tab_item");
            for (i = 0; i < 5; i++) {
                if (b.css("border-right", "1px solid #000")) {
                    b.css("border-right", "1px solid #fff");
                    b.css("border-left", "1px solid #fff");
                    b.css("border-bottom", "1px solid #000");
                }
            }
            $(obj).css("border-right", "1px solid #000");
            $(obj).css("border-left", "1px solid #000");
            $(obj).css("border-bottom", "1px solid #fff");
            var margin = $(obj).parent().parent().find(".slide_content").width();
            margin = margin * ($(obj).prevAll().size() - 1);
            margin = margin * (-1);
            $(obj).parent().parent().find(".tabslider").stop().animate({
                marginLeft: margin + "px"
            }, {
                duration: 0
            });
        }
    }
    $(document).ready(function () {
        TabbedContent.init();
        $(".slide_content").mouseleave(function () {
            $(this).css("visibility", "hidden");
            var b = $(".tab_item");
            for (i = 0; i < 5; i++) {
                b.css("border-right", "1px solid #fff");
                b.css("border-left", "1px solid #fff");
                b.css("border-bottom", "1px solid #000");
            }
        });
        $(".tit").mouseenter(function () {
            $(".slide_content").css("visibility", "hidden");
            var b = $(".tab_item");
            for (i = 0; i < 5; i++) {
                b.css("border-right", "1px solid #fff");
                b.css("border-left", "1px solid #fff");
                b.css("border-bottom", "1px solid #000");
            }
        })
        $(".tab_item").mouseover(function () {
            $(".slide_content").css("visibility", "visible");
        });


    });

    //对head的两边white调整
    function adjust(obj) {
        var div = document.getElementById("white");
        var lll = document.getElementById("white1");
        var w = document.body.clientWidth;

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
    window.onload = function () {
        window.onresize = adjust;
        adjust();
    }

})





//点击左边导航栏展开与隐藏
$(function () {
    // mtree.js
    // Requires jquery.js and velocity.js (optional but recommended).
    // Copy the below function, add to your JS, and simply add a list <ul class=mtree> ... </ul>
    ; (function ($, window, document, undefined) {

        // Only apply if mtree list exists
        if ($('ul.mtree').length) {


            // Settings
            var collapsed = true; // Start with collapsed menu (only level 1 items visible)
            var close_same_level = false; // Close elements on same level when opening new node.
            var duration = 400; // Animation duration should be tweaked according to easing.
            var listAnim = true; // Animate separate list items on open/close element (velocity.js only).
            var easing = 'easeOutQuart'; // Velocity.js only, defaults to 'swing' with jquery animation.


            // Set initial styles 
            $('.mtree ul').css({ 'overflow': 'hidden', 'height': (collapsed) ? 0 : 'auto', 'display': (collapsed) ? 'none' : 'block' });

            // Get node elements, and add classes for styling
            var node = $('.mtree li:has(ul)');
            node.each(function (index, val) {
                $(this).children(':first-child').css('cursor', 'pointer')
                $(this).addClass('mtree-node mtree-' + ((collapsed) ? 'closed' : 'open'));
                $(this).children('ul').addClass('mtree-level-' + ($(this).parentsUntil($('ul.mtree'), 'ul').length + 1));
            });

            // Set mtree-active class on list items for last opened element
            $('.mtree li > *:first-child').on('click.mtree-active', function (e) {
                if ($(this).parent().hasClass('mtree-closed')) {
                    $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
                    $(this).parent().addClass('mtree-active');
                } else if ($(this).parent().hasClass('mtree-open')) {
                    $(this).parent().removeClass('mtree-active');
                } else {
                    $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
                    $(this).parent().toggleClass('mtree-active');
                }
            });

            // Set node click elements, preferably <a> but node links can be <span> also
            node.children(':first-child').on('click.mtree', function (e) {

                // element vars
                var el = $(this).parent().children('ul').first();
                var isOpen = $(this).parent().hasClass('mtree-open');

                // close other elements on same level if opening 
                if ((!close_same_level || $('.csl').hasClass('active')) && !isOpen) {
                    var close_items = $(this).closest('ul').children('.mtree-open').not($(this).parent()).children('ul');

                    // Velocity.js
                    if ($.Velocity) {
                        close_items.velocity({
                            height: 0
                        }, {
                            duration: duration,
                            easing: easing,
                            display: 'none',
                            delay: 100,
                            complete: function () {
                                setNodeClass($(this).parent(), true)
                            }
                        });

                        // jQuery fallback
                    } else {
                        close_items.delay(100).slideToggle(duration, function () {
                            setNodeClass($(this).parent(), true);
                        });
                    }
                }

                // force auto height of element so actual height can be extracted
                el.css({ 'height': 'auto' });

                // listAnim: animate child elements when opening
                if (!isOpen && $.Velocity && listAnim) el.find(' > li, li.mtree-open > ul > li').css({ 'opacity': 0 }).velocity('stop').velocity('list');

                // Velocity.js animate element
                if ($.Velocity) {
                    el.velocity('stop').velocity({
                        //translateZ: 0, // optional hardware-acceleration is automatic on mobile
                        height: isOpen ? [0, el.outerHeight()] : [el.outerHeight(), 0]
                    }, {
                        queue: false,
                        duration: duration,
                        easing: easing,
                        display: isOpen ? 'none' : 'block',
                        begin: setNodeClass($(this).parent(), isOpen),
                        complete: function () {
                            if (!isOpen) $(this).css('height', 'auto');
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
                if (isOpen) {
                    el.removeClass('mtree-open').addClass('mtree-closed');
                } else {
                    el.removeClass('mtree-closed').addClass('mtree-open');
                }
            }

            // List animation sequence
            if ($.Velocity && listAnim) {
                $.Velocity.Sequences.list = function (element, options, index, size) {
                    $.Velocity.animate(element, {
                        opacity: [1, 0],
                        translateY: [0, -(index + 1)]
                    }, {
                        delay: index * (duration / size / 2),
                        duration: duration,
                        easing: easing
                    });
                };
            }

            // Fade in mtree after classes are added.
            // Useful if you have set collapsed = true or applied styles that change the structure so the menu doesn't jump between states after the function executes.
            if ($('.mtree').css('opacity') == 0) {
                if ($.Velocity) {
                    $('.mtree').css('opacity', 1).children().css('opacity', 0).velocity('list');
                } else {
                    $('.mtree').show(200);
                }
            }
        }
    }(jQuery, this, this.document));

})



$(document).ready(function ($) {

    //左边三级导航栏hover变色
    $(".left-nav").children("ul").children("li").children("ul").children("li").children("a").mouseover(function () {
        $(this).css({ "color": "#5eabec" });
    });
    $(".left-nav").children("ul").children("li").children("ul").children("li").children("a").mouseout(function () {
        $(this).css({ "color": "#0e3f6d" });
    })


    //左边导航栏固定置顶
    var navH = $(".left-nav").offset().top;
    var footerH = $(".footer").offset().top;
    $(window).scroll(function () {
        var leftH = parseInt($(".left-nav").css("height"));
        var scroH = $(window).scrollTop();
        if (scroH > navH) {
            if (leftH < footerH - scroH) {
                $(".left-nav").css({ "position": "fixed", "top": 0, "z-index": +1 });
            }
            else if (leftH > footerH - scroH) {
                if (footerH - leftH > navH) {
                    $(".left-nav").css({ "position": "fixed", "top": (footerH - scroH - leftH), "z-index": +1 });
                }
                else if (footerH - leftH <= navH) {
                    $(".left-nav").css({ "position": "static" });
                }
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
            if (scroH >= navH) {
                if (leftH < footerH - scroH) {
                    $(".left-nav").css({ "position": "fixed", "top": 0, "z-index": +1 });
                }
                else if (leftH > footerH - scroH) {
                    $(".left-nav").animate({ "top": (footerH - scroH - leftH) }, 200);
                }
            }
            else if (scroH < navH) {
                $(".left-nav").css({ "position": "static" });
            };
        }, 500)
    })



    //关于页面刷新时的问题：侧边导航栏的默认展开
    var $aside = $(".left-nav");
    var urlRequest = document.location.search;
    if (urlRequest) {
        var urlType = decodeURI(urlRequest).split("&")[0].split("=")[1];
        $aside.find("a").each(function () {
            var aType = $(this).attr("href").split("&")[0].split("=")[1];
            if (aType == urlType) {
                //三级
                if ($(this).parent("li").parent("ul").hasClass("mtree-level-1")) {
                    var rightItem = $(".right-lists").find("h1").eq(0).text();
                    var checkItem = $(this).attr("href").indexOf("item=");
                    var aThird = $(this).text();
                    if (aThird == rightItem) {
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
                    else if (checkItem != -1) {
                        var urlItemCheck = decodeURI(urlRequest).indexOf("item=");
                        var aItem = $(this).attr("href").split("&")[1].split("=")[1];
                        if (aItem == rightItem) {
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
                        else if (urlItemCheck != -1) {
                            var urlItem = decodeURI(urlRequest).split("&")[1].split("=")[1];
                            if (aItem == urlItem) {
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
                        }
                    }
                }
                    //二级
                else if ($(this).parent("li").parent("ul").hasClass("mtree")) {
                    //侧边导航默认展开的效果及响应式
                    $(this).css({ "color": "#fff" });
                    $(this).mouseover(function () {
                        $(this).css({ "color": "#fff" });
                    });
                    $(this).mouseout(function () {
                        $(this).css({ "color": "#fff" });
                    });
                    $(this).parent("li").css({ "background": "url(images/left-nav-second-click.png) no-repeat" });
                }
            }
        })
    }
    else {
        $aside.children("ul").children("li").eq(0).children("ul").css({ "display": "block", "height": "auto" });
        $aside.children("ul").children("li").eq(0).children("ul").children("li").eq(0).children("a").css({ "color": "#5eabec" }).mouseover(function () { $(this).css({ "color": "#5eabec" }); }).mouseout(function () { $(this).css({ "color": "#5eabec" }); });
        $aside.children("ul").children("li").eq(0).removeClass('mtree-closed').addClass('mtree-open').addClass('mtree-active');
    }




    //var urlPage = decodeURI(window.location.href).indexOf("page=");
    var $page = $(".change-page").children("ul").children("li").eq(3).children("span");
    //输入框初始化
    //$(".change-page").children("input").val($page.html());
    $(".change-page").children("input").css({ "display": "none" });
    //列表换页输入第几页
    $page.click(function () {
        $(".change-page").children("input").css({ "display": "" });
    });
    //切换页数
    $(".change-page").children("input").on("keypress", function (event) {
        //var num = $(".change-page").children("input").val();
        var code = event.keyCode;
        //按回车切换页数
        if (event.keyCode == 13) {
            //$page.html(num);
            $(".change-page").children("input").css({ "display": "none" });
            //切换页数
            // if(urlPage != -1) {
            //   window.location.href = decodeURI(window.location.href).substring(0,urlPage-1) + "&page=" + (num-0-1).toString();
            // }
            // else if(urlPage == -1) {
            //   window.location.href = decodeURI(window.location.href) + "&page=" + (num-0-1).toString();
            // }
        };
    });



    //控制表格宽度
    $(".lists").children("ul").each(function () {
        var tdNum = $(this).find("li").length;
        if (tdNum == 5) {
            $(this).children("li").eq(0).css({ "width": "8%" });
            $(this).children("li").eq(1).css({ "width": "19%" });
            $(this).children("li").eq(2).css({ "width": "30%" });
            $(this).children("li").eq(3).css({ "width": "13%" });
            $(this).children("li").eq(4).css({ "width": "30%" });
        }
        else if (tdNum == 4) {
            $(this).children("li").eq(0).css({ "width": "12%" });
            $(this).children("li").eq(1).css({ "width": "45%" });
            $(this).children("li").eq(2).css({ "width": "13%" });
            $(this).children("li").eq(3).css({ "width": "30%" });
        }
        else if (tdNum == 1) {
            $(this).children("li").eq(0).css({ "width": "100%" });
        }
    })






    //横线长度问题
    $(".all-title").find("h1").each(function () {
        var titleLength = $(this).text().length;
        if (titleLength > 5) {
            $(this).css({ "background": "url(images/middleline02.png) center center no-repeat" });
        }
        else if (titleLength <= 5) {
            $(this).css({ "background": "url(images/longline.png) center center no-repeat" });
        }
    })
    $(".lists-title").find("h1").each(function () {
        var wordLength = $(this).text().length;
        if (wordLength > 5) {
            $(this).css({ "background": "url(images/middleline02.png) center center no-repeat" });
        }
        else if (wordLength <= 5) {
            $(this).css({ "background": "url(images/line.png) center center no-repeat" });
        }
    })




    //控制三级导航ul宽度的问题
    var thirdNav = $(".all-title").find("li").length;
    var allUlWidth = 0;
    for (i = 0; i < thirdNav; i++) {
        if ($(".all-title").find("li").eq(i).text() == "") {
            $(".all-title").find("li").eq(i).css({ "display": "none" });
        }
        else {
            allUlWidth += parseInt($(".all-title").find("li").eq(i).css("width")) + 40;
        }
    }
    $(".all-title").children("ul").css({ "width": allUlWidth });





    //控制四级导航ul宽度的问题
    var forthNav = $(".lists-title").children("ul").children("li").length;
    var ulWidth = 0;
    for (i = 0; i < forthNav; i++) {
        if ($(".lists-title").children("ul").children("li").eq(i).text() == "") {
            $(".lists-title").children("ul").children("li").eq(i).css({ "display": "none" });
        }
        else {
            ulWidth += parseInt($(".lists-title").children("ul").children("li").eq(i).css("width")) + 40;
        }
    }
    $(".lists-title").children("ul").css({ "width": ulWidth });



    //列表hover效果
    $(".common-lists").find("li").mouseover(function () {
        $(this).children("a").children("div").children("p").css({ "color": "#5eabec" });
        $(this).children("a").children("div").children("h1").css({ "color": "#5eabec" });
    });
    $(".common-lists").find("li").mouseout(function () {
        $(this).children("a").children(".news-time").children("p").css({ "color": "#132840" });
        $(this).children("a").children("div").children("h1").css({ "color": "#132840" });
        $(this).children("a").children(".news-title").children("p").css({ "color": "#485B71" });
    });


    //学生组织页爱特工作室logo太大了……
    $(".organization-lists").find("img").each(function () {
        if ($(this).attr("src") == "images/itStudio.png") {
            $(this).css({ "height": "auto", "width": "320px", "margin-top": "60px" });
        }
    })


})


/*轮播图*/
$(document).ready(function () {
    $(document).ready(function () {
        //轮播
        var t = setInterval('lunbo()', 5000);

        //轮播暂停，重启
        $('div.expert').mouseover(function () {
            clearInterval(t);
        }).mouseout(function () {
            t = setInterval('lunbo()', 5000);
        });
    })

    var page = 1;
    var i = 3;
    function lunbo() {
        var expert = $(".expert_list ul li").width();
        var $expert_list = $('div.expert_list');
        var len_li = $expert_list.find('li').length;
        var page_count = Math.ceil(len_li / i);
        if (!$expert_list.is(':animated')) {
            if (page == i) {
                $expert_list.animate({ right: '0px' }, 1);
                page = 1;
            }
            else {
                $expert_list.animate({ right: "+" + expert + 'px' }, 'slow');
                page++;
            }
        }
    }
})





// footer
$(document).ready(function () {


    //底部后台登录位置初始化
    $(".footer-copyright").css({ "top": 0 });
    $(".footer-backstage").css({ "top": "36px" });
    //底部后台登录显示
    $(".footer-footer").hover(function () {
        $(".footer-copyright").stop(true, false).animate({ "top": "-36px" }, 200);
        $(".footer-backstage").stop(true, false).animate({ "top": "0px" }, 200);
    }, function () {
        $(".footer-copyright").stop(true, false).animate({ "top": "0px" }, 200);
        $(".footer-backstage").stop(true, false).animate({ "top": "36px" }, 200);
    });
})