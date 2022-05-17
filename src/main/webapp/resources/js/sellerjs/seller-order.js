/* search JS */
// Get searchBtn
var searchBtn = document.getElementsByClassName("search-button")[0];
var searchBtnStatus = 0;

// Get searchBtn-icon
var searchBtnIcon = document.getElementsByClassName("search-button-icon")[0];

// Get slide Toggle div
var slideToggle = document.getElementById("slideToggle");

// Listen for click
searchBtn.addEventListener("click", searchBtnEvent);

// Window Open
window.open = slideinit();

// Function
function slideinit() {
	$(slideToggle).slideUp(0);
}
function searchBtnEvent() {
	$(slideToggle).slideToggle();
	if (searchBtnStatus == 1) {
		searchBtnIcon.style.transform = "rotateX(0deg)";
		searchBtnStatus = 0;
	} else {
		searchBtnIcon.style.transform = "rotateX(180deg)";
		searchBtnStatus = 1;
	}
}



/* input Date JS */
// Get dateBtn
var dateBtn1 = document.getElementsByClassName("dateBtn-1")[0];
var dateBtn2 = document.getElementsByClassName("dateBtn-2")[0];
var dateBtn3 = document.getElementsByClassName("dateBtn-3")[0];
var dateBtn4 = document.getElementsByClassName("dateBtn-4")[0];
var dateBtn5 = document.getElementsByClassName("dateBtn-5")[0];
var dateBtn6 = document.getElementsByClassName("dateBtn-6")[0];
var dateBtn7 = document.getElementsByClassName("dateBtn-7")[0];
var dateBtn8 = document.getElementsByClassName("dateBtn-8")[0];

// Get input date
var startDate = document.getElementsByClassName("startDate")[0];
var endDate = document.getElementsByClassName("endDate")[0];

// Get today
var today = new Date();

// Listen for click
dateBtn1.addEventListener("click", dateBtn1Event);
dateBtn2.addEventListener("click", dateBtn2Event);
dateBtn3.addEventListener("click", dateBtn3Event);
dateBtn4.addEventListener("click", dateBtn4Event);
dateBtn5.addEventListener("click", dateBtn5Event);
dateBtn6.addEventListener("click", dateBtn6Event);
dateBtn7.addEventListener("click", dateBtn7Event);
dateBtn8.addEventListener("click", dateBtn8Event);

// Window open function
window.open = dateBtn8Event();

// Function
function dateBtn1Event() {
  startDate.valueAsDate = today;
  endDate.valueAsDate = today;
}
function dateBtn2Event() {
  var calculationDate = new Date();
  calculationDate.setDate(today.getDate() - 3);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}
function dateBtn3Event() {
  var calculationDate = new Date();
  calculationDate.setDate(today.getDate() - 7);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}
function dateBtn4Event() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 1);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}
function dateBtn5Event() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 3);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}
function dateBtn6Event() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 6);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}
function dateBtn7Event() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 12);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}
function dateBtn8Event() {
  var calculationDate = new Date();
  calculationDate.setMonth(today.getMonth() - 60);
  startDate.valueAsDate = calculationDate;
  endDate.valueAsDate = today;
}



/* 상세검색 초기화 클릭 JS */
$(".initBtn").click(function () {
	//검색어 초기화
	$("#searchName").val("");
	$("#searchNameStatus1").prop("checked", true);

	//판매상태 초기화
	$("#statusCheckAll").prop("checked", false);
	$(".statusCheck").prop("checked", false);

	//카테고리 초기화
	$("#category").val("대분류").attr("selected", "selected");
	$("#middle-select").html("<option selected>중분류</option>");
	$("#middle-select").attr("disabled", true);
	$("#small-select").html("<option selected>소분류</option>");
	$("#small-select").attr("disabled", true);

	//기간 초기화
	$("#selectDate").val("1");
	$("#btnradio8").prop("checked", true);
	dateBtn8Event();
	
	getOrderData();
});



/* 모달내 화살표 이벤트 */
var modalDelListBtn = document.getElementsByClassName("modal-product-list")[0];
var modalDelListBtnIcon = document.getElementsByClassName("accordion-button-arrow")[0];
var modalDelListBtnStatus = 0;

modalDelListBtn.addEventListener("click", modalDelListBtnEvent);

function modalDelListBtnEvent() {
	if (modalDelListBtnStatus == 1) {
		modalDelListBtnIcon.style.transform = "rotateX(0deg)";
		modalDelListBtnStatus = 0;
	} else {
		modalDelListBtnIcon.style.transform = "rotateX(180deg)";
		modalDelListBtnStatus = 1;
	}
}



/* 검색-판매상태 체크박스 */
// 전체 체크박스 체크 여부에 따른 하위 체크박스들 상태 변경
$("#statusCheckAll").change(function () {
  if ($("#statusCheckAll").is(":checked")) {
    $(".statusCheck").prop("checked", true);
  } else {
    $(".statusCheck").prop("checked", false);
  }
});

// 하위 체크박스 체크 여부에 따른 전체 체크박스 상태 변경
// 하위 체크박스 체크 개수와 전체 개수를 비교
$(".statusCheck").change(function () {
  if ($(".statusCheck:checked").length == $(".statusCheck").length) {
    $("#statusCheckAll").prop("checked", true);
  } else {
    $("#statusCheckAll").prop("checked", false);
  }
});



/* 상품 선택 체크박스 */
// 전체 체크박스 체크 여부에 따른 하위 체크박스들 상태 변경
$("#allCheck").change(function () {
  if ($("#allCheck").is(":checked")) {
    $(".check").prop("checked", true);
    // 선택된 체크박스 개수에 따른 숫자값 변경
    $("#select-num").text($(".check:checked").length);
  } else {
    $(".check").prop("checked", false);
    // 선택된 체크박스 개수에 따른 숫자값 변경
    $("#select-num").text($(".check:checked").length);
  }
});

// 하위 체크박스 체크 여부에 따른 전체 체크박스 상태 변경
// 하위 체크박스 체크 개수와 전체 개수를 비교
$(".check").change(function () {
  if ($(".check:checked").length == $(".check").length) {
    $("#allCheck").prop("checked", true);
    // 선택된 체크박스 개수에 따른 숫자값 변경
    $("#select-num").text($(".check:checked").length);
  } else {
    $("#allCheck").prop("checked", false);
    // 선택된 체크박스 개수에 따른 숫자값 변경
    $("#select-num").text($(".check:checked").length);
  }
});



/* 판매상태 변경 기능 */
// 모달 내 선택된 상품 수 표시
$("#menu1").click(function () {
	$(".orderNum").text($(".check:checked").length);
});

// 판매글 상태 변경 처리
$("#pscSubmitBtn").click(function () {

	// 선택된 상품의 product_id 값 배열로 받아오기
	var pscList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		pscList[index] = $(this).parent().next().text();
		++index;
	});
	
	// 상태 옵션값 받아오기
	var statusOption = $("#statusOption option:selected").text();
	
	// 데이터 모으기
	var allData = {"pscList":pscList, "statusOption":statusOption};
	
	// ajax 통신
	$.ajax({
		url : "postingStatusUpdate.seller",
		type : "POST",
		data : allData,
		success : function(res) {
			alert("판매글 상태 변경 완료");
			document.location.reload(); // 페이지 새로고침
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("판매글 상태 변경 실패");
		}
	});
});



/* 오늘의딜 신청 기능 */
// 모달 내 선택된 상품 수 표시 & 선택된 상품 리스트 띄우기
$("#dealApplication").click(function () {
	$(".productNum").text($(".check:checked").length);
	
	// 선택<된 상품의 product_id 값 배열로 받아오기 (DB 처리용)
	var postingList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		postingList[index] = $(this).parent().next().text();
		++index;
	});
	console.log(postingList);
	
	// ajax 통신
	$.ajax({
		url : "selectPostingList.seller",
		type : "POST",
		dataType : "html",
		data : JSON.stringify(postingList),
		contentType : "application/json",
		success : function(res) {
			$("#selectPostingView").html(res);
		},
		error : function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
});

// 신청버튼 클릭 후 deal_info에 등록
$("#dealAppSubmitBtn").click(function () {

	// 선택된 상품의 product_id 값 배열로 받아오기 (DB 처리용)
	var postingList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		postingList[index] = $(this).parent().next().text();
		++index;
	});
	console.log(postingList);
	
	// ajax 통신
	$.ajax({
		url : "PostingDealAppUpdate.seller",
		type : "POST",
		data : JSON.stringify(postingList),
		contentType : "application/json",
		success : function(res) {
			alert("오늘의딜 신청 완료");
			document.location.reload(); // 페이지 새로고침
		},
		error : function(request, status, error) {
			alert("오늘의딜 신청 실패");
		}
	});
});


/* 상품 검색 기능 */
$(document).ready(function () {	
	// 검색어 값 받아오기
	$("#searchName").keyup(function() {
		getOrderData();
	});
	
	// 검색어 조건 값 받아오기
	$(".searchNameStatusGroup").change(function() {
		getOrderData();
	});
	
	// 판매 상태 값 받아오기
	$(".searchStatusGroup").change(function() {
		getOrderData();
	});
	
	// 카테고리(대분류) 값 받아오기
	$("#category").change(function() {
		getOrderData();
	});
	
	// 카테고리(중분류) 값 받아오기
	$("#middle-select").change(function() {
		getOrderData();
	});
	
	// 카테고리(소분류) 값 받아오기
	$("#small-select").change(function() {
		getOrderData();
	});
	
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
	
	// 상품 선택 checkBox 초기화
	$("#allCheck").prop("checked", false);
	
	// 값 받아오기
	var searchName = $("#searchName").val();
	var searchNameStatus = $("input[name='searchNameStatus']:checked").val();
	var searchStatus = [];
	$("input:checkbox[name='searchStatus']:checked").each(function(i) {
		searchStatus.push($(this).val());
	});
	var category = $("#category").val();
	var middleSelect = $("#middle-select").val();
	var smallSelect = $("#small-select").val();
	var startDate = $(".startDate").val();
	var endDate = $(".endDate").val();
	
	// 값 묶어서 저장
	var searchMap = {
		"searchName" : searchName,
		"searchNameStatus" : searchNameStatus,
		"category" : category,
		"middleSelect" : middleSelect,
		"smallSelect" : smallSelect,
		"startDate" : startDate,
		"endDate" : endDate,
	};
	
	var datas = {"searchMap" : searchMap, "searchStatus" : searchStatus};

	// 데이터 처리 요청
	$.ajax({
  		url:'getSearchOrderList.seller',
  		type:'post',
  		data: JSON.stringify(datas),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
			$("#orderList").empty();
  			$("#orderList").html(resp);
  		}
  	});
}



// 주문 상세조회 모달
function orderDetailView(orderNum) {
	
	// 선택한 행의 그룹주문번호 값 저장하기
	console.log(orderNum);
	
	/*
	// 데이터 처리 요청
	$.ajax({
  		url:'getOrderDatailView.seller',
  		type:'post',
  		data: JSON.stringify(orderNum),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
  			$("#modal-view-order").html(resp);
  		}
  	});*/
}