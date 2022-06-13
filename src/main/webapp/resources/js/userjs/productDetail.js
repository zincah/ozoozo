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

function reset(notchangeColor){
    $("#QuickBtn1").removeClass("production-selling-navigation__item--active");
    $("#QuickBtn2").removeClass("production-selling-navigation__item--active");
    $("#QuickBtn3").removeClass("production-selling-navigation__item--active");
    $("#QuickBtn4").removeClass("production-selling-navigation__item--active");
    $(notchangeColor).addClass("production-selling-navigation__item--active");
}



//상품 select 구문














