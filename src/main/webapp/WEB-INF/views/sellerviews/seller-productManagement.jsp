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
<title>상품관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css" rel="stylesheet" />
<link href="resources/css/sellercss/seller-productManagement.css"
	rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
<script type="text/javascript"
	src="resources/js/sellerjs/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>

<jsp:include page="header/header.jsp"></jsp:include>

<div id="layoutSidenav_content">
	<main style="background-color: #f5f5f5">
		<div class="container-fluid px-4">
			<h1 class="mt-4 insert_title">상품관리</h1>
			<ol class="breadcrumb mb-3 bottomline">
				<li class="breadcrumb-item active">Product Management</li>
			</ol>
			<div class="container container-option bottomline">
				<div class="row optionGroup1">
					<div class="col status-name">
						<span>전체</span> <span class="status-value"><fmt:formatNumber
								value="${fn:length(productList)}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>판매대기</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus0}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>판매중</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus1}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>품절</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus2}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>승인대기</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus3}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>판매중지</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus4}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>판매종료</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus5}" pattern="#,###" /></span>
					</div>
					<div class="col status-name-last">
						<span>판매금지</span> <span class="status-value"><fmt:formatNumber
								value="${productStatus6}" pattern="#,###" /></span>
					</div>
					<div class="col-4 search-button-area">
						<button class="search-button" id="searchBtn">
							상세 검색
							<svg class="search-button-icon"
								xmlns="http://www.w3.org/2000/svg" width="13" height="13"
								fill="currentColor" class="bi bi-chevron-down"
								viewBox="0 0 16 16">
                      <path fill-rule="evenodd"
									d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                    </svg>
						</button>
					</div>
				</div>
			</div>
			<div id="slideToggle">
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">검색어</div>
						<div class="col search-input">
							<div class="search-input-box">
								<input type="text"
									class="form-control form-control-sm input-font"
									id="exampleFormControlInput1" placeholder="" />
							</div>
							<div class="radio-productCode paddingLeft1">
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="flexRadioDefault" id="flexRadioDefault1" checked /> <label
										class="form-check-label" for="flexRadioDefault1">
										고유상품번호 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="flexRadioDefault" id="flexRadioDefault2" /> <label
										class="form-check-label" for="flexRadioDefault2">
										판매자상품번호 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="flexRadioDefault" id="flexRadioDefault3" /> <label
										class="form-check-label" for="flexRadioDefault3"> 상품명
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">판매 상태</div>
						<div class="col search-check-group">
							<div class="form-check form-check-display">
								<input class="form-check-input form-check-input-margin"
									type="checkbox" value="" id="statusCheckAll" /> <label
									class="form-check-label" for="statusCheck1"> 전체 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck1" /> <label
									class="form-check-label" for="statusCheck1"> 판매대기 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck2" /> <label
									class="form-check-label" for="statusCheck2"> 판매중 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck3" /> <label
									class="form-check-label" for="statusCheck3"> 품절 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck4" /> <label
									class="form-check-label" for="statusCheck4"> 승인대기 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck5" /> <label
									class="form-check-label" for="statusCheck5"> 판매중지 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck6" /> <label
									class="form-check-label" for="statusCheck6"> 판매종료 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck"
									type="checkbox" value="" id="statusCheck7" /> <label
									class="form-check-label" for="statusCheck7"> 판매금지 </label>
							</div>
						</div>
					</div>
				</div>
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">카테고리</div>
						<div class="col search-input">
							<div class="radio-productCode">
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="category"
										name="category_name" aria-label="Default select example"
										onchange="changeFirstOption()">
										<option selected>대분류</option>
										<c:forEach items="${cateList }" var="cate">
											<option value="${cate.cate_code}">${cate.cate_name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="middle-select"
										name="subcategory1" disabled=""
										aria-label="Default select example"
										onchange="changeSecondOption()">
										<option selected>중분류</option>
									</select>
								</div>
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="small-select"
										name="subcategory2" disabled=""
										aria-label="Default select example">
										<option selected>소분류</option>
										<div id="bot-layer"></div>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">기간</div>
						<div class="col search-input">
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<select class="form-select selectDate"
									aria-label="Default select example" id="selectDate">
									<!-- <option selected>대분류</option> -->
									<option value="1">상품 등록일1</option>
									<option value="2">상품 등록일2</option>
									<option value="3">상품 등록일3</option>
								</select>
							</div>
							<div class="radio-productCode">
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

									<input type="radio" class="btn-check dateBtn-6" name="btnradio"
										id="btnradio6" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio6">6개월</label>

									<input type="radio" class="btn-check dateBtn-7" name="btnradio"
										id="btnradio7" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio7">1년</label>

									<input type="radio" class="btn-check dateBtn-8" name="btnradio"
										id="btnradio8" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio8">전체</label>
								</div>
							</div>
							<div class="paddingLeft1">
								<input class="startDate" type="date" id="date" value="" /> <input
									class="endDate" type="date" id="date" value="" />
							</div>
						</div>
					</div>
				</div>
				<div class="container container-option container-option-topPadding">
					<div class="row optionGroup1">
						<div class="col search-submitBtn">
							<div class="d-grid gap-2">
								<button class="btn btn-secondary submitBtn" type="button"
									id="submitBtn">검색</button>
							</div>
							<div class="d-grid gap-2">
								<button class="btn btn-outline-secondary initBtn" type="button">초기화</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- content -->
	<div class="content-table">
		<div class="content-view-title">
			<div>
				<span class="content-view-title-text">상품목록 (선택 </span> <span
					class="content-view-title-value" id="select-num">0</span> <span
					class="content-view-title-text2">건)</span>
			</div>
			<div class="content-view-title-right">
				<div class="btn-group" role="group"
					aria-label="Basic radio toggle button group">
					<select class="form-select selectAlign"
						aria-label="Default select example">
						<!-- <option selected>대분류</option> -->
						<option value="1">상품등록일순</option>
						<option value="2">상품명순</option>
						<option value="3">상품번호순</option>
					</select>
				</div>
				<div class="d-grid gap-2">
					<button class="btn btn-secondary excelDownBtn" type="button">엑셀다운</button>
				</div>
				<div class="dropdown setting-button">
					<button class="settingBtn" type="button" id="dropdownMenuButton1"
						data-bs-toggle="dropdown" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path
								d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z" />
                  </svg>
					</button>
					<ul class="dropdown-menu settingBtnDropdown"
						aria-labelledby="dropdownMenuButton1">
						<li><h6 class="dropdown-header">상품 설정 일괄 변경</h6></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#modal-status-select" id="productStatusChange">판매상태 변경</a></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#modal-delete">상품 삭제</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 판매상태 변경 Modal -->
		<div class="modal fade" id="modal-status-select" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-small modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">판매상태 변경</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-status-select-product">
						<div class="modal-status-select-product-num">
							<span>선택된 상품 수 : </span> <span
								class="modal-status-select-product-num-value productNum">0</span> <span>개</span>
						</div>
						<div class="modal-status-select">
							<div class="btn-group modal-status-select-btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<select class="form-select modal-status-select-option"
									aria-label="Default select example">
									<option value="1">판매중</option>
									<option value="2">판매대기</option>
									<option value="3">품절</option>
									<option value="4">판매중지</option>
									<option value="5">판매종료</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button"
							class="btn btn-primary modal-status-select-submit-button" id="pscSubmitBtn">변경</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 상품 삭제 Modal -->
		<div class="modal fade" id="modal-delete" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">상품 삭제</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-status-select-product">
						<div class="modal-delete-product-num">
							<span>선택된 상품 수 : </span> <span
								class="modal-delete-product-num-value">0</span> <span>개</span>
						</div>
						<div class="modal-delete-select-product">
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed modal-product-list"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#flush-collapseOne" aria-expanded="false"
											aria-controls="flush-collapseOne">
											선택된 상품 리스트
											<svg class="accordion-button-arrow"
												xmlns="http://www.w3.org/2000/svg" width="13" height="13"
												fill="currentColor" class="bi bi-chevron-down"
												viewBox="0 0 16 16">
                              <path fill-rule="evenodd"
													d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                            </svg>
										</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										aria-labelledby="flush-headingOne"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<!-- for -->
											<div class="product-list-group">
												<table class="table table-box-style">
													<thead>
														<tr class="content-table-title">
															<td class="content-table-title-text option-line">No.</td>
															<td class="content-table-title-text option-line">상품고유번호</td>
															<td class="content-table-title-text option-line">판매자상품코드</td>
															<td class="content-table-title-text option-line">상품명</td>
															<td class="content-table-title-text option-line">판매가</td>
															<td class="content-table-title-text option-line">카테고리</td>
															<td class="content-table-title-text option-line">판매상태</td>
														</tr>
													</thead>
													<tbody>
														<!-- for -->
														<tr class="content-table-content">
															<td class="content-table-content-text option-line">1</td>
															<td class="content-table-content-text option-line state0">0654367</td>
															<td class="content-table-content-text option-line">001</td>
															<td class="content-table-content-text option-line">동준이의
																핫핑크 미니스커트</td>
															<td class="content-table-content-text option-line">12,000</td>
															<td class="content-table-content-text option-line">가구</td>
															<td class="content-table-content-text option-line">판매중</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button"
							class="btn btn-primary modal-status-select-submit-button">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-hover table-box-style">
			<thead>
				<tr class="content-table-title">
					<td class="content-table-title-text option-line"><input
						class="form-check-input" type="checkbox" value="" id="allCheck" /></td>
					<td class="content-table-title-text option-line">상품고유번호</td>
					<td class="content-table-title-text option-line">판매자상품코드</td>
					<td class="content-table-title-text option-line">상품명</td>
					<td class="content-table-title-text option-line">판매가</td>
					<td class="content-table-title-text option-line">카테고리</td>
					<td class="content-table-title-text option-line">판매상태</td>
					<td class="content-table-title-text option-line">재고</td>
					<td class="content-table-title-text option-line">등록일</td>
					<td class="content-table-title-text option-line">수정일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="productListView" items="${productListView}">
					<tr class="content-table-content content-hover">
						<td class="content-table-content-text option-line"><input
							class="form-check-input check" type="checkbox" value="" /></td>
						<td class="content-table-content-text option-line state0">${productListView.getProduct_id()}</td>
						<td class="content-table-content-text option-line">${productListView.getProduct_seller_code()}</td>
						<td class="content-table-content-text option-line">${productListView.getProduct_title()}</td>
						<td class="content-table-content-text option-line"><fmt:formatNumber
								value="${productListView.getProduct_price()}" type="currency" /></td>
						<td class="content-table-content-text option-line">${productListView.getCategory_name()}</td>
						<td class="content-table-content-text option-line">${productListView.getStatus()}</td>
						<td class="content-table-content-text option-line">${productListView.getProduct_quantity()}</td>
						<td class="content-table-content-text option-line"><fmt:formatDate
								value="${productListView.getProduct_created()}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td class="content-table-content-text option-line"><fmt:formatDate
								value="${productListView.getProduct_updated()}"
								pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script
	src="resources/js/sellerjs/seller-productManagement.js?t=<%=System.currentTimeMillis() %>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/category.js"></script>
</body>
</html>