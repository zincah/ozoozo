/* 상세검색 옵션이 '전체'일때 입력칸 비활성화 */
var searchSelect = document.getElementById("search-select");

searchSelect.addEventListener("click", function () {
  if (parseInt(searchSelect.options[searchSelect.selectedIndex].value) == 0) {
    document.getElementById("search-input").disabled = true;
  } else {
    document.getElementById("search-input").disabled = false;
  }
});

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
  //기간 초기화
  document.getElementById("btnradio1").checked = true;
  startDate.valueAsDate = today;
  endDate.valueAsDate = today;
  document.getElementById("flexRadioDefault1").checked = true;

  //상세검색 초기화
  document.getElementById("search-select").value = "0";
  document.getElementById("search-input").disabled = true;
  document.getElementById("search-input").value = "";
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

/* 검색 이벤트 */
document.getElementsByClassName("submitBtn")[0].addEventListener("click", function () {
  //일별 or 월별 선택관련
  if (document.getElementById("flexRadioDefault1").checked == true) {
    $("#search-date1").text("일별");
    $("#search-date2").text(startDate.value);
    $("#search-date3").text(endDate.value);
  } else {
    $("#search-date1").text("월별");
    $("#search-date2").text(startDate.value);
    $("#search-date3").text(endDate.value);
  }
});
