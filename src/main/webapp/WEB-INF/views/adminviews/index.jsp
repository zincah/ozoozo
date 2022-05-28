<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin Dashboard</title>
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link href="resources/css/admincss/index_ih.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script>
    
	
	$(document).ready(function(){
		
		// line chart 
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = "#292b2c";

		// get Date
		var dateList = ${dateList};
		var countList = ${countList};
		
		var dates = [];
		
		dateList = dateList.reverse();
		countList = countList.reverse();
		
		// Area Chart Example
		var ctx = document.getElementById("myAreaChart"); // myBarChart
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
		            max: 30,
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
		
		var labelList = ${labelList};
		var totalList = ${totalList};
		var rankList = ${rankList};

		
		var max = totalList.reduce(function (previous, current){
			return previous > current ? previous:current;
		})
		console.log(max);
		
		
		// bar chart
		var ctx = document.getElementById("myBarChart");
		var myLineChart = new Chart(ctx, {
		  type: "bar",
		  data: {
		    labels: labelList,
		    datasets: [
		      {
			        label: "rank",
			        backgroundColor: "rgba(255, 119, 142)",
			        borderColor: "rgba(255, 119, 142)",
			        data: totalList,
			  	}
		    	
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
		            maxTicksLimit: labelList.length,
		          },
		        },
		      ],
		      yAxes: [
		        {
		          ticks: {
		            min: 0,
		            max: max+10000,
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
</head>

		<jsp:include page="header/header.jsp"></jsp:include>

        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4 insert_title">센터 홈</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Center Home</li>
            </ol>
            <div class="row">
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100 box-shadow">
	                <a href="information.admin">
	                  <div class="card-body">
	                    <div class="d-flex title-text">
	                      <p class="margin-zero"><i class="bi bi-megaphone-fill icon-margin-right"></i>공지사항</p>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">게시 중</p>
	                      <div>
	                        <span class="num-text-color">${notice }</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">게시 중단</p>
	                      <div>
	                        <span class="num-text-color">0</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                  </div>
                  	</a>
                </div>
              </div>
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100 box-shadow">
                <a href="companyManagement.admin">
	                  <div class="card-body">
	                    <div class="d-flex title-text">
	                      <p class="margin-zero"><i class="bi bi-person-workspace icon-margin-right"></i>신규입점신청</p>
	                      <span class="badge rounded-pill bg-pointcolor title-badge-margin-left">0</span>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">활동 업체</p>
	                      <div>
	                        <span class="num-text-color">${seller }</span>
	                        <span>개</span>
	                      </div>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">유령 업체</p>
	                      <div>
	                        <span class="num-text-color">0</span>
	                        <span>개</span>
	                      </div>
	                    </div>
	                  </div>
                  </a>
                </div>
              </div>
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100 box-shadow">
	                <a href="productManagementList.admin">
	                  <div class="card-body">
	                    <div class="d-flex title-text">
	                      <p class="margin-zero"><i class="bi bi-tags-fill icon-margin-right"></i>상품등록요청</p>
	                      <span class="badge rounded-pill bg-pointcolor title-badge-margin-left">${regiList[0] }</span>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">등록 대기</p>
	                      <div>
	                        <span class="num-text-color">${regiList[0] }</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">등록 보류</p>
	                      <div>
	                        <span class="num-text-color">${regiList[1] }</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                  </div>
                  </a>
                </div>
              </div>
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card h-100 box-shadow">
                	<a href="reviewManagement.admin">
	                  <div class="card-body">
	                    <div class="d-flex title-text">
	                      <p class="margin-zero"><i class="bi bi-exclamation-circle-fill icon-margin-right"></i>신규신고</p>
	                      <span class="badge rounded-pill bg-pointcolor title-badge-margin-left">0</span>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">리뷰 신고</p>
	                      <div>
	                        <span class="num-text-color">0</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">회원 신고</p>
	                      <div>
	                        <span class="num-text-color">0</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                    <div class="d-flex justify-content-between sub-text">
	                      <p class="small">기타 신고</p>
	                      <div>
	                        <span class="num-text-color">0</span>
	                        <span>건</span>
	                      </div>
	                    </div>
	                  </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xl-6 col-md-6 mb-4">
                <div class="card h-100 box-shadow">
                  <div class="card-body">
                    <div class="d-flex title-text bottom-line">
                      <p class="margin-zero"><i class="fas fa-chart-area me-1 icon-margin-right"></i>회원 유입인구</p>
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
                <div class="card h-100 box-shadow">
                  <div class="card-body">
                    <div class="d-flex title-text bottom-line">
                      <p class="margin-zero"><i class="fas fa-chart-bar me-1 icon-margin-right"></i>BEST 상품 판매량</p>
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
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
              <div class="text-muted">Copyright &copy; Your Website 2022</div>
              <div>
                <a href="#">Privacy Policy</a>
                &middot;
                <a href="#">Terms &amp; Conditions</a>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <!--  <script src="resources/assets/demo/chart-area-demo.js"></script>-->
    <!-- <script src="resources/assets/demo/chart-bar-demo.js"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/datatables-simple-demo.js"></script>
  </body>
</html>