<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>고객문의</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css" rel="stylesheet" />
<link href="resources/css/sellercss/seller-customerInquiry.css" rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
<script type="text/javascript" src="resources/js/sellerjs/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<jsp:include page="header/header.jsp"></jsp:include>

<div id="layoutSidenav_content">
	<main style="background-color: #f5f5f5">
		<div class="container-fluid px-4">
			<h1 class="mt-4 insert_title">고객문의</h1>
			<ol class="breadcrumb mb-3 bottomline">
				<li class="breadcrumb-item active">Customer Inquiry</li>
			</ol>
			<div class="container container-option bottomline">
				<div class="row optionGroup1">
					<div class="col-2 option-name">문의 접수일</div>
					<div class="col option-line">
						<div class="btn-group paddingLeft1" role="group"
							aria-label="Basic radio toggle button group">
							<input type="radio" class="btn-check dateBtn-1" name="btnradio"
								id="btnradio1" autocomplete="off" checked /> <label
								class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>

							<input type="radio" class="btn-check dateBtn-2" name="btnradio"
								id="btnradio2" autocomplete="off" /> <label
								class="btn btn-outline-secondary dateBtn" for="btnradio2">3일</label>

							<input type="radio" class="btn-check dateBtn-3" name="btnradio"
								id="btnradio3" autocomplete="off" /> <label
								class="btn btn-outline-secondary dateBtn" for="btnradio3">1주일</label>

							<input type="radio" class="btn-check dateBtn-4" name="btnradio"
								id="btnradio4" autocomplete="off" /> <label
								class="btn btn-outline-secondary dateBtn" for="btnradio4">1개월</label>

							<input type="radio" class="btn-check dateBtn-5" name="btnradio"
								id="btnradio5" autocomplete="off" /> <label
								class="btn btn-outline-secondary dateBtn" for="btnradio5">3개월</label>
						</div>
					</div>
					<div class="col">
						<div class="paddingLeft1">
							<input class="startDate" type="date" id="date" value="" /> <input
								class="endDate" type="date" id="date" value="" />
						</div>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
			<div class="container container-option container-option-topPadding">
				<div class="row optionGroup1">
					<div class="col-2 option-name">처리상태</div>
					<div class="col-3 option-line">
						<div class="btn-group paddingLeft1" role="group"
							aria-label="Basic radio toggle button group">
							<select class="form-select selectState"
								aria-label="Default select example">
								<!--<option selected>미답변</option>-->
								<option value="1">미답변</option>
								<option value="2">답변완료</option>
							</select>
						</div>
					</div>
					<div class="col-2 option-name">문의유형</div>
					<div class="col">
						<div class="btn-group paddingLeft1" role="group"
							aria-label="Basic radio toggle button group">
							<select class="form-select selectState"
								aria-label="Default select example">
								<!--<option selected>미답변</option>-->
								<option value="1">전체</option>
								<option value="2">상품</option>
								<option value="3">배송</option>
								<option value="4">교환</option>
								<option value="5">반품</option>
								<option value="6">환불</option>
								<option value="7">기타</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- content -->
	<div class="content-table">
		<table class="table table-hover table-box-style">
			<thead>
				<tr class="content-table-title">
					<td class="content-table-title-text option-line">접수일</td>
					<td class="content-table-title-text option-line">처리상태</td>
					<td class="content-table-title-text option-line">문의유형</td>
					<td class="content-table-title-text option-line">주문번호</td>
					<td class="content-table-title-text option-line">문의내용</td>
					<td class="content-table-title-text option-line">상품번호</td>
					<td class="content-table-title-text option-line">상품명</td>
					<td class="content-table-title-text option-line">질문자</td>
					<td class="content-table-title-text">처리일시</td>
				</tr>
			</thead>
			<tbody>
				<!-- for -->
				<tr class="content-table-content content-hover">
					<td class="content-table-content-text option-line">2022-04-13
						18:40</td>
					<td class="content-table-content-text option-line state0">미답변</td>
					<td class="content-table-content-text option-line">환불</td>
					<td class="content-table-content-text option-line">12151-424132</td>
					<td class="content-table-content-text option-line">욜라구리네 그냥
						환불해주세요ㅡㅡ</td>
					<td class="content-table-content-text option-line">132</td>
					<td class="content-table-content-text option-line">핫핑크 나일론 코끼리
						삼각팬티</td>
					<td class="content-table-content-text option-line">이영</td>
					<td class="content-table-content-text option-line">-</td>
				</tr>
				<tr class="content-table-content content-hover">
					<td class="content-table-content-text option-line">2022-04-12
						13:11</td>
					<td class="content-table-content-text option-line state1">답변완료</td>
					<td class="content-table-content-text option-line">상품</td>
					<td class="content-table-content-text option-line">12151-424132</td>
					<td class="content-table-content-text option-line">이거 중국산인가요?</td>
					<td class="content-table-content-text option-line">132</td>
					<td class="content-table-content-text option-line">핫핑크 나일론 코끼리
						삼각팬티</td>
					<td class="content-table-content-text option-line">정대현</td>
					<td class="content-table-content-text option-line">2022-04-12
						16:44</td>
				</tr>
				<tr class="content-table-content content-hover">
					<td class="content-table-content-text option-line">2022-04-11
						17:35</td>
					<td class="content-table-content-text option-line state1">답변완료</td>
					<td class="content-table-content-text option-line">배송</td>
					<td class="content-table-content-text option-line">12151-424132</td>
					<td class="content-table-content-text option-line">오늘 시켰는데
						내일까지 받을 수 있나여^^</td>
					<td class="content-table-content-text option-line">132</td>
					<td class="content-table-content-text option-line">핫핑크 나일론 코끼리
						삼각팬티</td>
					<td class="content-table-content-text option-line">이아연</td>
					<td class="content-table-content-text option-line">2022-04-12
						16:37</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row answer-area">
		<div class="col">
			<div class="content-table" style="padding-right: 0">
				<div class="content-view-title">
					<span class="content-view-title-text">고객문의 내용 보기</span>
				</div>
				<table class="table table-box-style content-view-table">
					<tbody>
						<tr class="content-table-content">
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">접수일</td>
							<td class="content-table-content-text option-line">2022-04-13
								18:40</td>
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">처리일</td>
							<td class="content-table-content-text option-line">-</td>
						</tr>
						<tr class="content-table-content">
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">질문자</td>
							<td class="content-table-content-text option-line">이영</td>
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">질문자ID</td>
							<td class="content-table-content-text option-line">TwoZero</td>
						</tr>
						<tr class="content-table-content">
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">주문번호</td>
							<td class="content-table-content-text option-line">12151-424132</td>
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">상품명</td>
							<td class="content-table-content-text option-line">핫핑크 나일론
								코끼리 삼각팬티</td>
						</tr>
						<tr class="content-table-content">
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">상품번호</td>
							<td colspan="3" class="content-table-content-text option-line">132</td>
						</tr>
						<tr class="content-table-content">
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">문의내용</td>
							<td colspan="3" class="content-table-content-text option-line">우웨ㅔ에에에에에에에에에에에엑<br />우웨ㅔ에에에에에에에에에에에엑
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col reply-write">
			<div class="content-table" style="padding-left: 0">
				<div class="content-view-title">
					<span class="content-view-title-text">판매자 답변 처리</span>
				</div>
				<table class="table table-box-style content-view-table">
					<tbody>
						<tr class="content-table-content">
							<td
								class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">답변 내용</td>
							<td class="content-table-content-text option-line">
								<div class="form-floating">
									<textarea class="form-control answer-textarea"
										placeholder="Leave a comment here" id="floatingTextarea2"
										style="height: 10rem"></textarea>
									<label for="floatingTextarea2">답변 내용 입력</label>
								</div>
							</td>
						</tr>
						<tr class="content-table-content">
							<td colspan="2" class="content-table-content-text">
								<div class="d-grid gap-2">
									<button class="btn btn-secondary submitBtn" type="button">답변
										등록</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
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
<script src="resources/assets/demo/chart-area-demo.js"></script>
<script src="resources/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/datatables-simple-demo.js"></script>
<script src="resources/js/sellerjs/seller-customerInquiry.js"></script>
</body>
</html>