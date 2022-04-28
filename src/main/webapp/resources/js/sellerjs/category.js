// category 뽑기
function changeFirstOption() {
	var category = { "cate_code": $("#category").val() }


	$.ajax({
		url: 'getMiddleCategory.seller',
		method: 'post',
		data: JSON.stringify(category),
		contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		success: function(resp) {
			$("#middle-select").html("<option selected>중분류</option>");

			$("#middle-select").removeAttr("disabled");
			var midcate = ""
			//console.log(resp);

			$.each(resp, function(index, item) {
				//console.log(item["subcate_code"]);
				midcate += '<option value="' + item["subcate_code"] + '">' + item["subcate_name"] + '</option>';
			})

			$("#middle-select").append(midcate);

		}

		// 성공시 실패시 예외처리 해줘야함
	})

	var cate = $("#category option:selected").text();
	$("#option-layer-name").text("옵션 (" + cate + ")");

}


// 소분류 카테고리 뽑기
function changeSecondOption() {
	var midcategory = { "subcate_code": $("#middle-select").val() }


	$.ajax({
		url: 'getBottomCategory.seller',
		method: 'post',
		data: JSON.stringify(midcategory),
		contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		success: function(resp) {
			$("#small-select").html("<option selected>소분류</option>");
			$("#small-select").removeAttr("disabled");

			console.log(resp);
			var botcate = ""

			$.each(resp, function(index, item) {
				//console.log(item["subcate_code"]);
				botcate += '<option value="' + item["subcate_code"] + '">' + item["subcate_name"] + '</option>';
			})

			$("#small-select").append(botcate);



		}
	});
}