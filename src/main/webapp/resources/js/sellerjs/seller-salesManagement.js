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