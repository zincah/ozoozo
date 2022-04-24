var right = document.getElementById("category_btn_right");
var left = document.getElementById("category_btn_left");
var cate = document.getElementById("category_list");
var move_check = 0;

right.addEventListener("click", function() {

	cate.style.transform = 'translateX(-60%)';

});

left.addEventListener("click", function() {

	cate.style.transform = 'translateX(0)';

});