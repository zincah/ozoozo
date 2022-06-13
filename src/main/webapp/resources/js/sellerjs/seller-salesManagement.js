/* 페이지 로딩 */
$(document).ready(function () {	
	var firstDate = new Date(nowYear, nowMonth, 1);
	var lastDate = new Date(nowYear, nowMonth+1, 0);
	firstDate.setDate(firstDate.getDate() + 1);
	lastDate.setDate(lastDate.getDate() + 1);
	startDate.valueAsDate = firstDate;
	endDate.valueAsDate = lastDate;
	
	// 기간 값 받아오기
	$(".searchDateBtn").change(function() {
		getOrderData();
	});
	$(".startDate").change(function() {
		var stDate = new Date(startDate.value);
		var enDate = new Date(endDate.value);
		var dateDif = enDate.getDate() - stDate.getDate();
		if(startDate.value > endDate.value || dateDif == 1) {
			
			stDate.setDate(stDate.getDate()+2);
			endDate.valueAsDate = stDate;
		}
		getOrderData();
	});
	$(".endDate").change(function() {
		var stDate = new Date(startDate.value);
		var enDate = new Date(endDate.value);
		var dateDif = enDate.getDate() - stDate.getDate();
		if(startDate.value > endDate.value || dateDif == 1) {
			enDate.setDate(enDate.getDate()-2);
			startDate.valueAsDate = enDate;
		}
		getOrderData();
	});
});



/* 기간 검색 단축 버튼 */
// Get input date
var startDate = document.getElementsByClassName("startDate")[0];
var endDate = document.getElementsByClassName("endDate")[0];
// Get today
var today = new Date();
var nowYear = today.getFullYear();
var nowMonth = today.getMonth();

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
  dateInit();
})



/* 기간 초기화 */
function dateInit() {
  document.getElementById("btnradio4").checked = true;
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 1);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}



/* 검색 처리 */
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



/* 리스트 모달 관련 */
// 선택한 날짜의 주문건 출력
function salesDetailView(salesIndex) {
	
	// 날짜값 받아오기
	var temp = 'td[name=selectDate' + salesIndex + ']';
	var selectDate = $(temp).text().trim();
	
	// 데이터 처리 요청
	$.ajax({
  		url:'getSalesDatailView.seller',
  		type:'post',
  		data: JSON.stringify(selectDate),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
  			$("#modal-view-sales-change").html(resp);
  		}
  	});
}