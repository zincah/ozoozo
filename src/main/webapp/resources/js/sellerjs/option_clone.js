var option_count = 0;

function option_plus(){

    var cloneElements = $("#option_whole_wrap").clone();
    cloneElements.appendTo(".plus_layer");

    $(".option_container").each(function(option_count, option_container){
        $(this).attr("id", "option_input"+(option_count));
        $(this).siblings().text("옵션 (가구)" + (option_count+1));
    });

    option_count++;

};


/*
파일에 저장할 때
var option_count = 0;
$(".option-plus-btn").click(function(){
    var cloneElements = $("#option_whole_wrap").clone();
    cloneElements.appendTo(".plus_layer");

    $(".option_container").each(function(option_count, option_container){
        $(this).attr("id", "option_input"+(option_count));
        $(this).siblings().text("옵션 (가구)" + (option_count+1));
    });

    option_count++;
    
})*/