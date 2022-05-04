 function openCoupon() {
        document.getElementById("coupon").style.display = "";
    }
    function closeCoupon() {
        document.getElementById("coupon").style.display = "none";
    }

    function openCard(){
        document.getElementById("card").style.display = "";
    }
    function closeCard() {
        document.getElementById("card").style.display = "none";
    }
    function openSmallbuy(){
        document.getElementById("smallbuy").style.display = "";
    }
    
        
        $('.production-selling-select-modal').click(function(e) { 
        if($(e.target).hasClass("react-modal__content-wrap-dhp")) {
            $('#smallbuy').css("display","none");

            } 
        });
        $('.production-selling-select-modal').click(function(e) { 
        if($(e.target).hasClass("production-selling-select-modal")) {
             $('#smallbuy').css("display","none");
            } 
        });
//제일 어려운 스크롤바..

$(function() {
 	var exlocation = $("#sidebar_js").offset().top;
    plus = $('.sticky-container').outerHeight() + 80;
    $banner = $('.production-selling-sidebar');
$(window).scroll(function(){
	size=$('.layout-footer').outerHeight();
    var location = $(window).scrollTop();
    var val = $(document).height() - $(window).height() - size;
    var grayBar = location-exlocation;
   if (location >= val){
        $('#sidebar_move').css('position', 'absolute');
        $('#sidebar_move').css('top', '');
            $('#sidebar_move').css('bottom', '0');
        
        }else if((grayBar+plus) > 0 ){
            $('#sidebar_move').css({'position': 'fixed', 'height': '589px', 'transition': 'top 0.1s ease 0s', 'top': '133px', 'width': '313.75px'});
            $('#sidebar_js1').css('height' , '589px');
        } else{
        $('#sidebar_move').css('position', 'relative');
        $('#sidebar_move').css('top', '0');
        $('#sidebar_move').css('bottom', '');
    }
    
    var pointer1 = $("#production-selling-review").offset().top;
    var pointer2 = $("#production-selling-question").offset().top;
    var pointer3 = $("#production-selling-delivery").offset().top;
    //console.log(location-pointer3);
    if((location - pointer3) > -1){
        var notchangeColor = $("#QuickBtn4");
        reset(notchangeColor);
    }else if((location - pointer2) > -1){
        var notchangeColor = $("#QuickBtn3");
        reset(notchangeColor);
    }else if((location - pointer1) > -1){
        var notchangeColor = $("#QuickBtn2");
        reset(notchangeColor);
    }else{
        var notchangeColor = $("#QuickBtn1");
        reset(notchangeColor);
    }
});
});
function reset(notchangeColor){
    $("#QuickBtn1").removeClass("production-selling-navigation__item--active");
    $("#QuickBtn2").removeClass("production-selling-navigation__item--active");
    $("#QuickBtn3").removeClass("production-selling-navigation__item--active");
    $("#QuickBtn4").removeClass("production-selling-navigation__item--active");
    $(notchangeColor).addClass("production-selling-navigation__item--active");
}

var img = $(".production-selling-cover-image__list__btn");
$(img).hover(function(){
    //console.log($(this).attr('aria-label'));
    var choice = $(this).attr('aria-label');
    var value = (choice*100-100)*-1;
    var target = $(".carousel_list");
    //target.css("transform" , 'translateX(-100%)');
    if(1 == choice){
        target.css("transform" , 'translateX(0%)');
    }else if(2 == choice){
        target.css("transform" , 'translateX(-100%)');
    }else if(3 == choice){
        target.css("transform" , 'translateX(-200%)');
    }else if(4 == choice){
        target.css("transform" , 'translateX(-300%)');
    }else if(5 == choice){
        target.css("transform" , 'translateX(-400%)');
    }
});

//상품 select 구문














