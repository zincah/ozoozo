<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-table">
	<script type="text/javascript">
	$(document).ready(function(){
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = "#292b2c";
	
		// get Date
		var dateList = ${dateList};
		var countList = ${countList};
				
		var dates = [];
		
		// Area Chart Example
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
		  type: "line",
		  data: {
		    labels: dateList,
		    datasets: [
		      {
		        label: "Sessions",
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
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatDate	value="${salesListView.getSales_date()}"
						pattern="yyyy-MM-dd" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_paymentTotal()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_paymentTotalNum()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_canclePaymentTotal()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_canclePaymentTotalNum()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_submitPaymentTotal()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_submitPaymentTotalNum()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_discount()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line"
						data-bs-toggle="modal" data-bs-target="#modal-view-sales">
						<fmt:formatNumber value="${salesListView.getSales_shippingFee()}" pattern="#,###" />
					</td>
					<td class="content-table-content-text option-line state0"
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
							<i class="fas fa-chart-bar me-1 icon-margin-right"></i>상품별 판매 건수
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