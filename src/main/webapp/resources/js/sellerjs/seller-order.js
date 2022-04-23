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

/* search-category JS */
// Get select
var large = document.getElementById("large-select");
var middle = document.getElementById("middle-select");
var small = document.getElementById("small-select");

var selectValue_large;
var selectValue_middle;
var selectValue_small;

// Listen for click
large.addEventListener("click", selectDisabled_large);
middle.addEventListener("click", selectDisabled_middle);

// Function
function selectDisabled_large() {
  selectValue_large = parseInt(large.options[large.selectedIndex].value); //옵션 값을 얻어와서 숫자로 형변환
  //옵션 값이 숫자라면 true, 아니라면 false
  if (selectValue_large > 0) {
    middle.disabled = false;
  } else {
    middle.disabled = true;
    small.disabled = true;
  }
}
function selectDisabled_middle() {
  selectValue_middle = parseInt(middle.options[middle.selectedIndex].value); //옵션 값을 얻어와서 숫자로 형변환
  //옵션 값이 숫자라면 true, 아니라면 false
  if (selectValue_middle > 0) {
    small.disabled = false;
  } else {
    small.disabled = true;
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
  document.getElementById("statusCheck1").checked = false;
  document.getElementById("statusCheck2").checked = false;
  document.getElementById("statusCheck3").checked = false;
  document.getElementById("statusCheck4").checked = false;
  document.getElementById("statusCheck5").checked = false;
  document.getElementById("statusCheck6").checked = false;
  document.getElementById("statusCheck7").checked = false;
  document.getElementById("statusCheck8").checked = false;

  //카테고리 초기화
  document.getElementById("large-select").value = "0";
  document.getElementById("middle-select").value = "0";
  document.getElementById("small-select").value = "0";
  middle.disabled = true;
  small.disabled = true;

  //기간 초기화
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

/* 체크박스 관련 */
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

/* 상단 처리상태별 숫자 관련 */
$(document).ready(function () {});
