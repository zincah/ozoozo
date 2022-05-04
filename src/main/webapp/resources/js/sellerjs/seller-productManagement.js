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
window.open = dateBtn1Event();

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
// Get initBtn
var initBtn = document.getElementsByClassName("initBtn")[0];

// Listen for click
initBtn.addEventListener("click", initBtnEvent);

// Function
function initBtnEvent() {
	//검색어 초기화
	document.getElementById("exampleFormControlInput1").value = "";
	document.getElementById("flexRadioDefault1").checked = true;

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
	document.getElementById("selectDate").value = "1";
	document.getElementById("btnradio1").checked = true;
	startDate.valueAsDate = today;
	endDate.valueAsDate = today;
}



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
	
	// 선택된 상품의 product_id 값 배열로 받아오기 (DB 처리용)
	var pdList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		pdList[index] = $(this).parent().next().text();
		++index;
	});
	console.log(pdList);
	
	// ajax 통신
	$.ajax({
		url : "selectProductList.seller",
		type : "POST",
		data : pdList,
		success : function(res) {
	
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("오류 발생");
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
	console.log(pdList);
	
	
});