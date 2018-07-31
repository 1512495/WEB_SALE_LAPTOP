jQuery(document).ready(function($){
    
    // jQuery sticky Menu

    $("span.plus").click(function(){
       var x=document.getElementById('const').value;
       var quantity = parseInt(x);
       quantity++;
       document.getElementById('const').value=quantity;
    });

    $("span.subtract").click(function(){
       var x=document.getElementById('const').value;
       var quantity = parseInt(x);
       if(quantity > 1)
       {
            quantity--;
       }
       document.getElementById('const').value=quantity;
    });

    $('button.close').click(function(){
        $('.thongtinsanpham').hide();
    });

    $('input#muagiathuong').click(function(){
        $('div.mua-giathuong').css({
            color: 'red',
        });
        $('div.mua-online').css({
            color: 'black',
        });
    });

    $('input#muaonline').click(function(){
        $('div.mua-giathuong').css({
            color: 'black',
        });
        $('div.mua-online').css({
            color: 'red',
        });
    });
    
    // $('button#muangay').click(function(){
    //     $('div.thongtinsanpham').sho();
    //     // alert('mua rồi');
    // });

	$(".mainmenu-area").sticky({topSpacing:0});
    
    $('.product-carousel').owlCarousel({
        loop:true,
        nav:true,
        margin:20,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
            },
            600:{
                items:3,
            },
            1000:{
                items:5,
            }
        }
    });  
    
    $('.related-products-carousel').owlCarousel({
        loop:true,
        nav:true,
        margin:20,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
            },
            600:{
                items:2,
            },
            1000:{
                items:2,
            },
            1200:{
                items:3,
            }
        }
    });  
    
    

    $('.brand-list').owlCarousel({
        loop:true,
        nav:true,
        margin:20,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
            },
            600:{
                items:3,
            },
            1000:{
                items:4,
            }
        }
    });    
    
    
    // Bootstrap Mobile Menu fix
    $(".navbar-nav li a").click(function(){
        $(".navbar-collapse").removeClass('in');
    });    
    
    // jQuery Scroll effect
    $('.navbar-nav li a, .scroll-to-up').bind('click', function(event) {
        var $anchor = $(this);
        var headerH = $('.header-area').outerHeight();
        $('html, body').stop().animate({
            scrollTop : $($anchor.attr('href')).offset().top - headerH + "px"
        }, 1200, 'easeInOutExpo');

        event.preventDefault();
    });    
    
    // Bootstrap ScrollPSY
    $('body').scrollspy({ 
        target: '.navbar-collapse',
        offset: 95
    })      
});

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-10146041-21', 'auto');
  ga('send', 'pageview');
