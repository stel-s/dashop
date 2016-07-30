
jQuery(function ($) {
    // Related Products Detail 
	$('.iframe-link').magnificPopup({
		type:'iframe',
	    fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in',
		callbacks: {
			
		   markupParse: function(template, values, item) {
			   template.find('iframe').addClass('zoom-anim-dialog ');
		   }
		}
    });
	
	$('.closePopup').on( "click", function(e) {
	    e.preventDefault();
	    if (window.parent == window.top) {
			window.open($(this).attr("href"));
		    window.parent.$.magnificPopup.close();
	    }
	});
});

jQuery(function ($) {
    "use strict";
	//Quantity plus minus 
    $.initQuantity = function ($control) {
        $control.each(function () {
            var $this = $(this),
                data = $this.data("inited-control"),
                $plus = $(".input-group-addon:last", $this),
                $minus = $(".input-group-addon:first", $this),
                $value = $(".form-control", $this);
            if (!data) {
                $control.attr("unselectable", "on").css({
                    "-moz-user-select": "none",
                    "-o-user-select": "none",
                    "-khtml-user-select": "none",
                    "-webkit-user-select": "none",
                    "-ms-user-select": "none",
                    "user-select": "none"
                }).bind("selectstart", function () {
                    return false
                });
                $plus.click(function () {
                    var val =
                        parseInt($value.val()) + 1;
                    $value.val(val);
                    return false
                });
                $minus.click(function () {
                    var val = parseInt($value.val()) - 1;
                    $value.val(val > 0 ? val : 1);
                    return false
                });
                $value.blur(function () {
                    var val = parseInt($value.val());
                    $value.val(val > 0 ? val : 1)
                })
            }
        })
    };
    $.initQuantity($(".quantity-control"));
    $.initSelect = function ($select) {
        $select.each(function () {
            var $this = $(this),
                data = $this.data("inited-select"),
                $value = $(".value", $this),
                $hidden = $(".input-hidden", $this),
                $items = $(".dropdown-menu li > a", $this);
            if (!data) {
                $items.click(function (e) {
                    if ($(this).closest(".sort-isotope").length >
                        0) e.preventDefault();
                    var data = $(this).attr("data-value"),
                        dataHTML = $(this).html();
                    $this.trigger("change", {
                        value: data,
                        html: dataHTML
                    });
                    $value.html(dataHTML);
                    if ($hidden.length) $hidden.val(data)
                });
                $this.data("inited-select", true)
            }
        })
    };
    $.initSelect($(".btn-select"))
});


/******** Social Widgets Accounts ********/
jQuery(function ($) {
    "use strict";
    var socialItems = $('.social-widgets .items .item');
    var counter = 0;
    socialItems.each(function () {
        counter++;
        var itemclass = "item-0" + counter;
        $(this).addClass(itemclass)
    });
});

jQuery(function ($) {
    "use strict";
    $(".social-widgets .item").each(function () {
        var $this = $(this),
            timer;
        $this.on("mouseenter", function () {
            var $this = $(this);
            if (timer) clearTimeout(timer);
            timer = setTimeout(function () {
                $this.addClass("active")
            }, 200)
        }).on("mouseleave", function () {
            var $this = $(this);
            if (timer) clearTimeout(timer);
            timer = setTimeout(function () {
                $this.removeClass("active")
            }, 100)
        }).on("click", function (e) {
            e.preventDefault()
        })
    })
});

jQuery(function ($) {
    "use strict";
    var loadmap = $(".social-widgets .item a");
    loadmap.click(function (e) {
        e.preventDefault()
    });
    loadmap.hover(function (e) {
        if (!$(this).parent().hasClass("load")) {
            var loadcontainer = $(this).parent().find(".loading");
            $.ajax({
                url: $(this).attr("href"),
                cache: false,
                success: function (data) {
                    setTimeout(function () {
                        loadcontainer.html(data)
                    }, 1000)
                }
            });
            $(this).parent().addClass("load")
        }
    })
});
/******** End Social Widgets Accounts ********/

$(document).ready(function(){
	
	
	/*Scroll to top */
	$(".back-to-top").addClass("hidden-top");
		$(window).scroll(function () {
		if ($(this).scrollTop() === 0) {
			$(".back-to-top").addClass("hidden-top")
		} else {
			$(".back-to-top").removeClass("hidden-top")
		}
	});

	$('.back-to-top').click(function () {
		$('body,html').animate({scrollTop:0}, 1200);
		return false;
	});		
	
	
	/******** Menu Show Hide Sub Menu ********/
	$('#menu .nav > li').mouseover(function() {
		$screensize = $(window).width();
		if ($screensize > 991) {
		$(this).find('> div').stop(true, true).slideDown('fast');
		}			
		$(this).bind('mouseleave', function() {
			$screensize = $(window).width();
		if ($screensize > 991) {
			$(this).find('> div').stop(true, true).css('display', 'none');
		}
	});});

	$('#menu .nav > li.categories > div > .column, #menu .nav > li div > ul > li').mouseover(function() {
		$screensize = $(window).width();
		if ($screensize > 991) {
		$(this).find('> div').css('display', 'block');
		}			
		$(this).bind('mouseleave', function() {
			$screensize = $(window).width();
		if ($screensize > 991) {
			$(this).find('> div').css('display', 'none');
		}
	});});

	$('#menu .nav > li > div').closest("li").addClass('sub');

	/******** Navigation Menu ********/
	$('#menu .navbar-header > span').click(function () {
		  $(this).toggleClass("active");  
		  $("#menu .navbar-collapse").slideToggle('medium');
	});
	
	if($('#menu .navbar-header span').hasClass("active")){
			console.log('opencart');
			//$("#menu .navbar-collapse").slideUp('medium');  
	}  
	$('.so-vertical-menu .cat-title').click(function () {
		
		  
	});
	
	$('#menu .nav > li > div > .column > div, .submenu, #menu .nav > li > div').before('<span class="submore"></span>');
			$('span.submore').click(function () {
				$(this).next().slideToggle('fast');
				$(this).toggleClass('plus');
	});
	
	/******** Language and Currency Dropdowns ********/
	$('#currency, #bt-language, #my_account').hover(function() {
		$(this).find('ul').stop(true, true).slideDown('fast');
	  },function() {
		$(this).find('ul').stop(true, true).css('display', 'none');
	  });
	
	// Product detial reviews button
	$(".reviews_button,.write_review_button").click(function (){
        var tabTop = $(".producttab").offset().top;
        $("html, body").animate({ scrollTop:tabTop }, 1000);
    });
   
    // Resonsive Header Top
    $(".collapsed-block .expander").click(function (e) {
        var collapse_content_selector = $(this).attr("href");
        var expander = $(this);
        if (!$(collapse_content_selector).hasClass("open")) expander.addClass("open").html("<i class='fa fa-angle-up'></i>");
        else expander.removeClass("open").html("<i class='fa fa-angle-down'></i>"); if (!$(collapse_content_selector).hasClass("open")) $(collapse_content_selector).addClass("open").slideDown("normal");
        else $(collapse_content_selector).removeClass("open").slideUp("normal");
        e.preventDefault()
    })

    
    // style for header top link
	/*$(".header-top-right .top-link > li").mouseenter(function(){
		$(".header-top-right .top-link > li.account").addClass('inactive');
	});
	$(".header-top-right .top-link > li").mouseleave(function(){
		$(".header-top-right .top-link > li.account").removeClass('inactive');
	});
	$(".header-top-right .top-link > li.account").mouseenter(function(){
		$(".header-top-right .top-link > li.account").removeClass('inactive');
	});*/
	
	// style for Client Say
	$('.slider-clients-say').owlCarousel2({
		pagination: false,
		center: false,
		nav: true,
		loop: false,
		margin: 25,
		navText: [ 'prev', 'next' ],
		slideBy: 1,
		autoplay: false,
		autoplayTimeout: 2500,
		autoplayHoverPause: true,
		autoplaySpeed: 800,
		startPosition: 0, 
		responsive:{
			0:{
				items:1
			},
			480:{
				items:1
			},
			768:{
				items:1
			},
			1200:{
				items:1
			}
		}
	});	 
});

