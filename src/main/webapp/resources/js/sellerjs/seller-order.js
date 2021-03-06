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



/* ???????????? ????????? ?????? JS */
$(".initBtn").click(function () {
	//????????? ?????????
	$("#searchName").val("");
	$("#searchNameStatus1").prop("checked", true);

	//???????????? ?????????
	$("#statusCheckAll").prop("checked", false);
	$(".statusCheck").prop("checked", false);

	//???????????? ?????????
	$("#category").val("?????????").attr("selected", "selected");
	$("#middle-select").html("<option selected>?????????</option>");
	$("#middle-select").attr("disabled", true);
	$("#small-select").html("<option selected>?????????</option>");
	$("#small-select").attr("disabled", true);

	//?????? ?????????
	$("#selectDate").val("1");
	$("#btnradio8").prop("checked", true);
	dateBtn8Event();
	
	getOrderData();
});



/* ????????? ????????? ????????? */
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



/* ??????-???????????? ???????????? */
// ?????? ???????????? ?????? ????????? ?????? ?????? ??????????????? ?????? ??????
$("#statusCheckAll").change(function () {
  if ($("#statusCheckAll").is(":checked")) {
    $(".statusCheck").prop("checked", true);
  } else {
    $(".statusCheck").prop("checked", false);
  }
});

// ?????? ???????????? ?????? ????????? ?????? ?????? ???????????? ?????? ??????
// ?????? ???????????? ?????? ????????? ?????? ????????? ??????
$(".statusCheck").change(function () {
  if ($(".statusCheck:checked").length == $(".statusCheck").length) {
    $("#statusCheckAll").prop("checked", true);
  } else {
    $("#statusCheckAll").prop("checked", false);
  }
});



/* ?????? ?????? ???????????? */
// ?????? ???????????? ?????? ????????? ?????? ?????? ??????????????? ?????? ??????
$("#allCheck").change(function () {
  if ($("#allCheck").is(":checked")) {
    $(".check").prop("checked", true);
    // ????????? ???????????? ????????? ?????? ????????? ??????
    $("#select-num").text($(".check:checked").length);
  } else {
    $(".check").prop("checked", false);
    // ????????? ???????????? ????????? ?????? ????????? ??????
    $("#select-num").text($(".check:checked").length);
  }
});

// ?????? ???????????? ?????? ????????? ?????? ?????? ???????????? ?????? ??????
// ?????? ???????????? ?????? ????????? ?????? ????????? ??????
$(".check").change(function () {
  if ($(".check:checked").length == $(".check").length) {
    $("#allCheck").prop("checked", true);
    // ????????? ???????????? ????????? ?????? ????????? ??????
    $("#select-num").text($(".check:checked").length);
  } else {
    $("#allCheck").prop("checked", false);
    // ????????? ???????????? ????????? ?????? ????????? ??????
    $("#select-num").text($(".check:checked").length);
  }
});

/* ?????? ?????? ?????? */
$(document).ready(function () {	
	// ????????? ??? ????????????
	$("#searchName").keyup(function() {
		getOrderData();
	});
	
	// ????????? ?????? ??? ????????????
	$(".searchNameStatusGroup").change(function() {
		getOrderData();
	});
	
	// ?????? ?????? ??? ????????????
	$(".searchStatusGroup").change(function() {
		getOrderData();
	});
	
	// ????????????(?????????) ??? ????????????
	$("#category").change(function() {
		getOrderData();
	});
	
	// ????????????(?????????) ??? ????????????
	$("#middle-select").change(function() {
		getOrderData();
	});
	
	// ????????????(?????????) ??? ????????????
	$("#small-select").change(function() {
		getOrderData();
	});
	
	// ?????? ??? ????????????
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

// ?????? ??????
function getOrderData() {
	
	// ?????? ?????? checkBox ?????????
	$("#allCheck").prop("checked", false);
	
	// ??? ????????????
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
	
	// ??? ????????? ??????
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

	// ????????? ?????? ??????
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



// ?????? ???????????? ??????
function orderDetailView(orderIndex) {
	
	// ????????? ?????? ?????????????????? ??? ????????????
	var orderNum = 'span[name=orderNum' + orderIndex + ']';
	var orderNumData = $(orderNum).text();
	// ????????? ?????? ??????????????? ??? ????????????
	var orderId = 'span[name=orderId' + orderIndex + ']';
	var orderIdData = $(orderId).text();
	
	var allData = {
		"orderNumData" : orderNumData,
		"orderIdData" : orderIdData}

	// ????????? ?????? ??????
	$.ajax({
  		url:'getOrderDatailView.seller',
  		type:'post',
  		data: JSON.stringify(allData),
  		contentType : 'application/json; charset=UTF-8',
  		dataType : 'html',
  		success : function(resp){
			$("#modal-view-order-change").empty();
  			$("#modal-view-order-change").html(resp);
  		}
  	});
}



// ?????? ?????? ????????? ?????? ??? ????????? ????????? ????????? ?????????
$(".menu").click(function () {

	$(".orderNum").text($(".check:checked").length);
	
	// ????????? ????????? order_id ??? ????????? ????????????
	var selectList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		selectList[index] = $(this).parent().next().next().children().first().text();
		++index;
	});
	
	// ajax ??????
	$.ajax({
		url : "selectOrderList.seller",
		type : "POST",
		dataType : "html",
		data : JSON.stringify(selectList),
		contentType : "application/json",
		success : function(res) {
			$(".selectOrderView").html(res);
		},
		error : function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
})

// ???????????? ??????
$("#orderCheckSubmitBtn").click(function() {
	
	// ????????? ????????? order_id ??? ????????? ????????????
	var selectList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		selectList[index] = $(this).parent().next().next().children().first().text();
		++index;
	});
	
	// ajax ??????
	$.ajax({
		url : "orderCheckUpdate.seller",
		type : "POST",
		data : JSON.stringify(selectList),
		contentType : "application/json",
		dateType : "json",
		success : function(res) {
			if(res=="fail") {
				alert("?????? ????????? ???????????? ????????? ???????????? ???????????????.");
			} else {
				alert("?????? ?????? ??????");
				document.location.reload(); // ????????? ????????????
			}
		},
		error : function(request, status, error) {
			alert("?????? ?????? ??????");
		}
	});
	
})

// ????????????
$("#sendSubmitBtn").click(function() {
	
	// ????????? ????????? order_id ??? ????????? ????????????
	var selectList = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		selectList[index] = $(this).parent().next().next().children().first().text();
		++index;
	});

	// ????????? ????????? order_Num ??? ????????? ????????????
	var selectListON = new Array();
	var index = 0;
	$(".check:checked").each(function () {
		selectListON[index] = $(this).parent().next().next().children().last().text();
		++index;
	});
	
	var delivery;
	if($("#selectDelivery2").val() == 0) {
		delivery = "CJ????????????";
	} else if($("#selectDelivery2").val() == 1) {
		delivery = "????????????";
	} else if($("#selectDelivery2").val() == 2) {
		delivery = "????????????";
	} else if($("#selectDelivery2").val() == 3) {
		delivery = "????????????";
	} else if($("#selectDelivery2").val() == 4) {
		delivery = "???????????????";
	}
	var invoice = $("#inputInvoiceNumber").val();
	
	var allData = {
		"selectList" : selectList,
		"selectListON" : selectListON,
		"delivery" : delivery,
		"invoice" : invoice,
	}
	
	// ajax ??????
	$.ajax({
		url : "orderSendUpdate.seller",
		type : "POST",
		data : JSON.stringify(allData),
		contentType : "application/json",
		dateType : "json",
		success : function(res) {
			if(res=="fail1") {
				alert("?????? ????????? ??????????????? ????????? ???????????? ???????????????.");
			} else if(res=="fail2") {
				alert("?????? ????????? ????????????????????? ?????? ???????????? ???????????????.");
			} else if(res=="fail3") {
				alert("??????????????? ??????????????????.");
			} else if(res=="fail4") {
				alert("??????????????? ?????? ?????? 8?????? ????????? ??????????????????.");
			} else {
				alert("?????? ?????? ??????");
				document.location.reload(); // ????????? ????????????
			}
		},
		error : function(request, status, error) {
			alert("?????? ?????? ??????");
		}
	});	
})
