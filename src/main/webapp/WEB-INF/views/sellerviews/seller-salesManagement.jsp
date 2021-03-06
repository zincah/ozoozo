<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>매출 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css" rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
<link href="resources/css/sellercss/seller-salesManagement.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="resources/js/sellerjs/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" />
</head>

<jsp:include page="header/header.jsp"></jsp:include>

<div id="layoutSidenav_content">
	<main style="background-color: #f5f5f5">
		<div class="container-fluid px-4">
			<h1 class="mt-4 insert_title">매출관리</h1>
			<ol class="breadcrumb bottomline marginBottom-0">
				<li class="breadcrumb-item active">Sales Management</li>
			</ol>
			<div id="slideToggle">
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">기간</div>
						<div class="col search-input">
							<div class="radio-productCode">
								<div class="btn-group paddingLeft2" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check dateBtn-2 searchDateBtn" name="btnradio"
										id="btnradio2" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio2">3일</label>

									<input type="radio" class="btn-check dateBtn-3 searchDateBtn" name="btnradio"
										id="btnradio3" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio3">1주일</label>

									<input type="radio" class="btn-check dateBtn-4 searchDateBtn" name="btnradio"
										id="btnradio4" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio4">1개월</label>

									<input type="radio" class="btn-check dateBtn-5 searchDateBtn" name="btnradio"
										id="btnradio5" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio5">3개월</label>

									<input type="radio" class="btn-check dateBtn-6 searchDateBtn" name="btnradio"
										id="btnradio6" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio6">6개월</label>

									<input type="radio" class="btn-check dateBtn-7 searchDateBtn" name="btnradio"
										id="btnradio7" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio7">1년</label>

									<input type="radio" class="btn-check dateBtn-8 searchDateBtn" name="btnradio"
										id="btnradio8" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio8">전체</label>
								</div>
							</div>
							<div class="paddingLeft1">
								<input class="startDate" type="date" id="startDate" value="" /> <input
									class="endDate" type="date" id="endDate" value="" />
							</div>
						</div>
					</div>
				</div>
				<div class="container container-option container-option-topPadding">
					<div class="row optionGroup1">
						<div class="col search-submitBtn">
							<div class="d-grid gap-2">
								<button class="btn btn-secondary initBtn" type="button">초기화</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- content -->
	<div id="salesList">
		<div class="content-table">
			<script type="text/javascript">
			$(document).ready(function(){
				Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
				Chart.defaults.global.defaultFontColor = "#292b2c";
			
				// get Date
				var dateList = ${dateList}; // areaChart
				var countList = ${countList}; // areaChart
						
				var dates = [];
				
				// Area Chart Example
				var ctx = document.getElementById("myAreaChart");
				var myLineChart = new Chart(ctx, {
				  type: "line",
				  data: {
				    labels: dateList,
				    datasets: [
				      {
				        label: "판매이익",
				        lineTension: 0.3,
				        backgroundColor: "rgba(255, 119, 142, 0.224)",
				        borderColor: "rgba(255, 119, 142)",
				        pointRadius: 5,
				        pointBackgroundColor: "rgba(255, 119, 142)",
				        pointBorderColor: "rgba(255,255,255,0.8)",
				        pointHoverRadius: 5,
				        pointHoverBackgroundColor: "rgba(255, 119, 142)",
				        pointHitRadius: 50,
				        pointBorderWidth: 2,
				        data: countList,
				      },
				    ],
				  },
				  options: {
				    scales: { 
				      xAxes: [
				        {
				          time: {
				            unit: "date",
				          },
				          gridLines: {
				            display: true,
				          },
				          ticks: {
				            maxTicksLimit: 7,
				          },
				        },
				      ],
				      yAxes: [
				        {
				          ticks: {
				            min: 0,
				            max: ${maxCount},
				            maxTicksLimit: 5,
				          },
				          gridLines: {
				            color: "rgba(0, 0, 0, .125)",
				          },
				        },
				      ],
				    },
				    legend: {
				      display: false,
				    },
				  },
				});
			})
			</script>
			<script type="text/javascript">
			$(document).ready(function(){
				Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
				Chart.defaults.global.defaultFontColor = "#292b2c";
				
				var barDateList = ${barDateList}; // barChart
				var barCountList = ${barCountList}; // barChart
				
				// Bar Chart Example
				var ctx = document.getElementById("myBarChart");
				var myLineChart = new Chart(ctx, {
				  type: "bar",
				  data: {
				    labels: barDateList,
				    datasets: [
				      {
				        label: "판매량",
				        backgroundColor: "rgba(255, 119, 142)",
				        borderColor: "rgba(255, 119, 142)",
				        data: barCountList,
				      },
				    ],
				  },
				  options: {
				    scales: {
				      xAxes: [
				        {
				          time: {
				            unit: "month",
				          },
				          gridLines: {
				            display: false,
				          },
				          ticks: {
				        	display : false,
				            maxTicksLimit: 5,
				          },
				        },
				      ],
				      yAxes: [
				        {
				          ticks: {
				            min: 0,
				            max: ${barMaxCount},
				            maxTicksLimit: 5,
				          },
				          gridLines: {
				            display: true,
				          },
				        },
				      ],
				    },
				    legend: {
				      display: false,
				    },
				  },
				});
			})
			</script>
			<div class="content-view-title">
				<div>
					<span class="content-view-title-text" id="search-date1">일별</span>
					<span class="content-view-title-text2"> 매출 리스트 (</span>
					<span class="content-view-title-text2" id="search-date2">
						${calMinText}
					</span>
					<span class="content-view-title-text2"> ~ </span>
					<span class="content-view-title-text2" id="search-date3">
						${calMaxText}
					</span>
					<span class="content-view-title-text2">)</span>
				</div>
				<div class="content-view-title-right">
					<div class="d-grid gap-2">
						<button class="btn btn-secondary excelDownBtn" type="button">엑셀다운</button>
					</div>
				</div>
			</div>
			<table class="table table-box-style">
				<thead>
					<tr class="content-table-title">
						<td class="content-table-title-text option-line">날짜</td>
						<td class="content-table-title-text option-line">결제금액</td>
						<td class="content-table-title-text option-line">결제건수</td>
						<td class="content-table-title-text option-line">취소금액</td>
						<td class="content-table-title-text option-line">취소건수</td>
						<td class="content-table-title-text option-line">정상금액(판매-취소)</td>
						<td class="content-table-title-text option-line">정상건수</td>
						<td class="content-table-title-text option-line">할인</td>
						<td class="content-table-title-text option-line">배송비</td>
						<td class="content-table-title-text option-line">판매이익(정상금액-(할인+배송비))</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salesListView" items="${salesListView}" varStatus="status">
						<tr class="content-table-content content-hover table-hover-self">
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales" name="selectDate${status.index}">
								<fmt:formatDate	value="${salesListView.getSales_date()}"
								pattern="yyyy-MM-dd" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_paymentTotal()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_paymentTotalNum()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_canclePaymentTotal()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_canclePaymentTotalNum()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_submitPaymentTotal()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_submitPaymentTotalNum()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_discount()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_shippingFee()}" pattern="#,###" />
							</td>
							<td class="content-table-content-text option-line state0" onclick="salesDetailView(${status.index})"
								data-bs-toggle="modal" data-bs-target="#modal-view-sales">
								<fmt:formatNumber value="${salesListView.getSales_final()}" pattern="#,###" />
							</td>
						</tr>
					</c:forEach>
				</tbody>		
			</table>
			<div class="row mt-4">
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="d-flex title-text bottom-line">
								<p class="margin-zero">
									<i class="fas fa-chart-area me-1 icon-margin-right"></i>매출 통계
								</p>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<div class="card-body padding-zero">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<div class="d-flex title-text bottom-line">
								<p class="margin-zero">
									<i class="fas fa-chart-bar me-1 icon-margin-right"></i>BEST 상품
								</p>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<div class="card-body padding-zero">
									<canvas id="myBarChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 주문상세 Modal -->
	<div class="modal fade" id="modal-view-sales" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-sales">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">매출 상세조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body modal-status-select-product">
					<div>
						<span class="content-view-title-text">건별 매출 리스트</span>
					</div>
					<div id="modal-view-sales-change">
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; Your Website 2022</div>
				<div>
					<a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp;
						Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/datatables-simple-demo.js"></script>
<script src="resources/js/sellerjs/seller-salesManagement.js?t=<%=System.currentTimeMillis()%>"></script>
</body>
</html>