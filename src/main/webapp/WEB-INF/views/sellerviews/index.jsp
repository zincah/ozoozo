<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>센터홈</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/styles2.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css" rel="stylesheet" />
<link href="resources/css/sellercss/indexSeller.css" rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" />
</head>

<jsp:include page="header/header.jsp"></jsp:include>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4 insert_title">센터 홈</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Center Home</li>
			</ol>
			<a href="seller-notice.html">
				<div class="card text-black mb-4 box-shadow">
					<div class="card-body2">
						<i class="bi bi-megaphone-fill"></i> <span class="notice-view">CJ
							대한통운 택배 파업 공지</span> <span class="notice-date">2022-04-18</span>

						<li class="badgetop bg-primarytop rounded-pill-top notice-num"
							style="float: right">99+</li>
					</div>
				</div>
			</a>
			<div class="row">
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text">
								<p class="margin-zero">
									<i class="fa-solid fa-basket-shopping icon-margin-right"></i>신규주문
								</p>
								<span
									class="badge rounded-pill bg-pointcolor title-badge-margin-left">0</span>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">결제 대기</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">결제 완료</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text">
								<p class="margin-zero">
									<i class="fa-solid fa-truck-fast icon-margin-right"></i>배송상태
								</p>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">배송 준비중</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">배송 중</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">배송 완료</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text">
								<p class="margin-zero">
									<i class="fa-solid fa-arrow-rotate-left icon-margin-right"></i>신규환불
								</p>
								<span
									class="badge rounded-pill bg-pointcolor title-badge-margin-left">0</span>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">취소 요청</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">반품 요청</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">교환 요청</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text">
								<p class="margin-zero">
									<i class="fa-solid fa-circle-dollar-to-slot icon-margin-right"></i>정산내역
								</p>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">당일 정산</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">정산 예정</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text bottom-line">
								<p class="margin-zero">
									<i class="bi bi-chat-square-dots-fill icon-margin-right"></i>미답변
									문의
								</p>
								<span
									class="badge rounded-pill bg-pointcolor title-badge-margin-left">0</span>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">상품 문의</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">배송 문의</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">교환 및 환불 문의</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text bottom-line">
								<p class="margin-zero">
									<i class="bi bi-pencil-fill icon-margin-right"></i>리뷰
								</p>
								<span
									class="badge rounded-pill bg-pointcolor title-badge-margin-left">0</span>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">신규 리뷰</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
							<div class="d-flex justify-content-between sub-text">
								<p class="small">저평점 리뷰</p>
								<div>
									<span class="num-text-color">0</span> <span>건</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card h-100 box-shadow">
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
					<div class="card h-100 box-shadow">
						<div class="card-body">
							<div class="d-flex title-text bottom-line">
								<p class="margin-zero">
									<i class="fas fa-chart-bar me-1 icon-margin-right"></i>상품별 판매
									건수
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
	</main>
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
<script src="resources/assets/demo/chart-area-demo.js"></script>
<script src="resources/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/datatables-simple-demo.js"></script>
</body>
</html>