/* 기간 검색 단축 버튼 */
$(".dateBtn-1").click(function() {
	startDate.valueAsDate = today;
  	endDate.valueAsDate = today;
})
$(".dateBtn-2").click(function() {
  var calculationDate = new Date();
  calculationDate.setDate(today.getDate() - 3);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})
$(".dateBtn-3").click(function() {
  var calculationDate = new Date();
  calculationDate.setDate(today.getDate() - 7);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})
$(".dateBtn-4").click(function() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 1);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})
$(".dateBtn-5").click(function() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 3);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})
$(".dateBtn-6").click(function() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 6);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})
$(".dateBtn-7").click(function() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 12);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})
$(".dateBtn-8").click(function() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 60);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
})

/* 상세검색 초기화 클릭 */
$(".initBtn").click(function() {
  //기간 초기화
  document.getElementById("btnradio1").checked = true;
  startDate.valueAsDate = today;
  endDate.valueAsDate = today;
  document.getElementById("flexRadioDefault1").checked = true;
})

/* 상품 검색 기능 */
$(document).ready(function () {	
	// 기간 값 받아오기
	$(".searchDateBtn").change(function() {
		getOrderData();
	});
	$(".startDate").change(function() {
		getOrderData();
	});
	$(".endDate").change(function() {
		getOrderData();
	});
});

// 검색 처리
function getOrderData() {
	
	// 값 받아오기
	var startDate = $(".startDate").val();
	var endDate = $(".endDate").val();
	
	// 값 묶어서 저장
	var searchMap = {
		"startDate" : startDate,
		"endDate" : endDate,
	};

	// 데이터 처리 요청
	$.ajax({
  		url:'getSearchSalesList.seller',
  		type:'post',
  		data: JSON.stringify(searchMap),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
			$("#salesList").empty();
  			$("#salesList").html(resp);
  		}
  	});
}