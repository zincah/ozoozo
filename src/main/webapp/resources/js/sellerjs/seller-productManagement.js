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
	
	getProductData();
});



/* 상품 삭제 모달 이벤트 */
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
$("#productStatusChange").click(function () {
	$(".productNum").text($(".check:checked").length);
});

// 판매상태 변경 처리
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
		url : "productStatusUpdate.seller",
		type : "POST",
		data : allData,
		success : function(res) {
			alert("판매상태 변경 완료");
			document.location.reload(); // 페이지 새로고침
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("판매상태 변경 실패");
		}
	});
});



/* 상품삭제 기능 */
// 모달 내 선택된 상품 수 표시 & 선택된 상품 리스트 띄우기
$("#productDelete").click(function () {
	$(".productNum").text($(".check:checked").length);
	
	// 선택<된 상품의 product_id 값 배열로 받아오기 (DB 처리용)
	var pdList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		pdList[index] = $(this).parent().next().text();
		++index;
	});
	
	// ajax 통신
	$.ajax({
		url : "selectProductList.seller",
		type : "POST",
		dataType : "html",
		data : JSON.stringify(pdList),
		contentType : "application/json",
		success : function(res) {
			$("#productDeleteView").html(res);
		},
		error : function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
});

// 삭제버튼 클릭 후 상품 삭제 처리
$("#pdSubmitBtn").click(function () {

	// 선택된 상품의 product_id 값 배열로 받아오기 (DB 처리용)
	var pdList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		pdList[index] = $(this).parent().next().text();
		++index;
	});
	
	// ajax 통신
	$.ajax({
		url : "selectProductDelete.seller",
		type : "POST",
		data : JSON.stringify(pdList),
		contentType : "application/json",
		success : function(res) {
			alert("상품 삭제 완료");
			document.location.reload(); // 페이지 새로고침
		},
		error : function(request, status, error) {
			alert("상품 삭제 실패");
		}
	});
});


/* 상품 검색 기능 */
$(document).ready(function () {	
	// 검색어 값 받아오기
	$("#searchName").keyup(function() {
		getProductData();
	});
	
	// 검색어 조건 값 받아오기
	$(".searchNameStatusGroup").change(function() {
		getProductData();
	});
	
	// 판매 상태 값 받아오기
	$(".searchStatusGroup").change(function() {
		getProductData();
	});
	
	// 카테고리(대분류) 값 받아오기
	$("#category").change(function() {
		getProductData();
	});
	
	// 카테고리(중분류) 값 받아오기
	$("#middle-select").change(function() {
		getProductData();
	});
	
	// 카테고리(소분류) 값 받아오기
	$("#small-select").change(function() {
		getProductData();
	});
	
	// 기간 조건 값 받아오기
	$("#selectDate").change(function() {
		getProductData();
	});
	
	// 기간 값 받아오기
	$(".searchDateBtn").change(function() {
		getProductData();
	});
	$(".startDate").change(function() {
		getProductData();
	});
	$(".endDate").change(function() {
		getProductData();
	});
	
	// 페이징 - setpage
	var pageNum = $("#pageMakerGetPageNum").val();
	setPage(pageNum);
});

// 검색 처리
function getProductData() {
	
	// 상품 선택 checkBox 초기화
	$("#allCheck").prop("checked", false);
	
	// 페이징 - page 정보
	var thispage = $("#findPage").val();
	console.log(thispage);
	
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
	var selectDate = $("#selectDate").val();
	var startDate = $(".startDate").val();
	var endDate = $(".endDate").val();
	
	// 값 묶어서 저장
	var searchMap = {
		"searchName" : searchName,
		"searchNameStatus" : searchNameStatus,
		"category" : category,
		"middleSelect" : middleSelect,
		"smallSelect" : smallSelect,
		"selectDate" : selectDate,
		"startDate" : startDate,
		"endDate" : endDate,
	};
	
	var datas = {"searchMap" : searchMap, "searchStatus" : searchStatus};

	// 데이터 처리 요청
	$.ajax({
  		url:'getSearchProductList.seller',
  		type:'post',
  		data: JSON.stringify(datas),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
			$("#productList").empty();
  			$("#productList").html(resp);
			setPage(1);
  		}
  	});
}

function setPage(pageNum){
    		
	var total = $("#totalcount").val();
	var amount = $("#pageMakerGetAmount").val();

	var endPage = Math.ceil(pageNum/10.0)*10;
	var startPage = endPage - 9;

	if(total == 0){
		var realEnd = 1;
	}else{
		var realEnd = Math.ceil((total*1.0)/amount);
	}

    if(realEnd < endPage){
    	endPage = realEnd;
    }
    
    var prev = startPage > 1;
    var next = endPage < realEnd; // 쓸지안쓸지
    
    $(".page-layer").html("");
    
	for(var i=startPage; i<=endPage; i++){
		
		if(pageNum == i){
			var li = '<li class="page-item active"><a class="page-link" href="'+i+'">'+i+'</a></li>';
		}else{
			var li = '<li class="page-item"><a class="page-link" href="'+i+'">'+i+'</a></li>';
		}
		
		$(".page-layer").append(li);

	}
	
	if(endPage == 1){
		$(".page-layer").hide();
		$(".page-outer").hide();
	}else{
		$(".page-layer").show();
		$(".page-outer").show();
	}
	
	// paging a link click
	$(".page-item a").on("click", function(e){

		e.preventDefault();
		var pageNum = $(this).attr("href");
		$("#findPage").val(pageNum);
		movepage(pageNum);
	});
}

// page 이동
function movepage(pageNum){
	
	// 상품 선택 checkBox 초기화
	$("#allCheck").prop("checked", false);
	
	// 페이징 - page 정보
	var thispage = $("#findPage").val();
	
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
	var selectDate = $("#selectDate").val();
	var startDate = $(".startDate").val();
	var endDate = $(".endDate").val();
	
	// 값 묶어서 저장
	var searchMap = {
		"searchName" : searchName,
		"searchNameStatus" : searchNameStatus,
		"category" : category,
		"middleSelect" : middleSelect,
		"smallSelect" : smallSelect,
		"selectDate" : selectDate,
		"startDate" : startDate,
		"endDate" : endDate,
		"pageNum" : pageNum
	};
	
	var datas = {"searchMap" : searchMap, "searchStatus" : searchStatus};

	// 데이터 처리 요청
	$.ajax({
  		url:'movePaging.seller',
  		type:'post',
  		data: JSON.stringify(datas),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
			$("#productList").empty();
  			$("#productList").html(resp);
			setPage(pageNum);
  		}
  	});
}