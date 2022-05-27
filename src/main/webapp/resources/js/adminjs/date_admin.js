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
//var today = new Date();

let curr;
let utc
let KR_TIME_DIFF
let today;

$(document).ready(function(){

	// 1. 오늘 시간
	curr = new Date();
	
	// 2. UTC 시간 계산
	utc = curr.getTime() + (curr.getTimezoneOffset() * 60 * 1000);
	
	// 3. UTC to KST (UTC + 9시간)
	KR_TIME_DIFF = 9 * 60 * 60 * 1000;
	today = new Date(utc + (KR_TIME_DIFF));
	
	dateBtn8Event();

})

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
//window.open = 

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