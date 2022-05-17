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
<title>판매글관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css" rel="stylesheet" />
<link href="resources/css/sellercss/seller-productPostingManagement.css?t=<%=System.currentTimeMillis()%>"
	rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
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
			<h1 class="mt-4 insert_title">판매글관리</h1>
			<ol class="breadcrumb mb-3 bottomline">
				<li class="breadcrumb-item active">Product Posting Management</li>
			</ol>
			<div class="container container-option bottomline">
				<div class="row optionGroup1">
					<div class="col status-name">
						<span>전체</span> <span class="status-value"><fmt:formatNumber
								value="${fn:length(postingListView)}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>판매중</span> <span class="status-value"><fmt:formatNumber
								value="${postingStatus0}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>판매종료</span> <span class="status-value"><fmt:formatNumber
								value="${postingStatus1}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>승인대기</span> <span class="status-value"><fmt:formatNumber
								value="${postingStatus2}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>보류</span> <span class="status-value"><fmt:formatNumber
								value="${postingStatus3}" pattern="#,###" /></span>
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
									id="searchName" placeholder="" />
							</div>
							<div class="radio-productCode paddingLeft1">
								<div class="form-check">
									<input class="form-check-input searchNameStatusGroup" type="radio"
										name="searchNameStatus" id="searchNameStatus1" value="1" checked /> <label
										class="form-check-label" for="searchNameStatus1">
										게시글번호 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input searchNameStatusGroup" type="radio"
										name="searchNameStatus" id="searchNameStatus2" value="2" /> <label
										class="form-check-label" for="searchNameStatus2">
										판매글제목 </label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">판매글 상태</div>
						<div class="col search-check-group">
							<div class="form-check form-check-display">
								<input class="form-check-input form-check-input-margin searchStatusGroup"
									type="checkbox" id="statusCheckAll" name="searchStatus" value="1" /> <label
									class="form-check-label" for="statusCheckAll"> 전체 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck1" name="searchStatus" value="2" /> <label
									class="form-check-label" for="statusCheck1"> 판매중 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck2" name="searchStatus" value="3" /> <label
									class="form-check-label" for="statusCheck2"> 판매종료 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck3" name="searchStatus" value="4" /> <label
									class="form-check-label" for="statusCheck3"> 승인대기 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck4" name="searchStatus" value="5" /> <label
									class="form-check-label" for="statusCheck4"> 보류 </label>
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
									<option value="1">판매글 등록일</option>
									<option value="2">오늘의딜 등록일</option>
								</select>
							</div>
							<div class="radio-productCode">
								<div class="btn-group paddingLeft1" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check dateBtn-1 searchDateBtn" name="btnradio"
										id="btnradio1" autocomplete="off"  /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>

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
										id="btnradio8" autocomplete="off" checked/> <label
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
							<div class="d-grid gap-2"> <!-- 비강조 클래스 : btn-outline-secondary -->
								<button class="btn btn-secondary initBtn" type="button">초기화</button>
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
				<span class="content-view-title-text">판매글목록 (선택 </span> <span
					class="content-view-title-value" id="select-num">0</span> <span
					class="content-view-title-text2">건)</span>
			</div>
			<div class="content-view-title-right">
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
						<li><h6 class="dropdown-header">판매글 설정 일괄 변경</h6></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#modal-status-select" id="productStatusChange">판매상태
								변경</a></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#modal-delete" id="dealApplication">오늘의딜 신청</a></li>
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
							<span>선택된 판매글 수 : </span> <span
								class="modal-status-select-product-num-value productNum">0</span>
							<span>개</span>
						</div>
						<div class="modal-status-select">
							<div class="btn-group modal-status-select-btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<select class="form-select modal-status-select-option"
									aria-label="Default select example" id="statusOption">
									<option value="1">판매중</option>
									<option value="2">판매종료</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button"
							class="btn btn-primary modal-status-select-submit-button"
							id="pscSubmitBtn">변경</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 오늘의딜 신청 Modal -->
		<div class="modal fade" id="modal-delete" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">오늘의딜 신청</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-status-select-product">
						<div class="modal-delete-product-notice">
							<span class="modal-delete-product-num-value"><i
								class="bi bi-dot"></i>오늘의딜은 '현재 할인율+10%'으로 진행되며 신청 후 승인 전까진 상태변경이 불가합니다.</span>
						</div>
						<div class="modal-delete-product-num">
							<span>선택된 판매글 수 : </span> <span
								class="modal-delete-product-num-value productNum">0</span> <span>개</span>
						</div>
						<div class="modal-delete-select-product">
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed modal-product-list"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#flush-collapseOne" aria-expanded="false"
											aria-controls="flush-collapseOne">
											선택된 판매글 리스트
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
															<td class="content-table-title-text option-line">판매글번호</td>
														<td class="content-table-title-text option-line">평점</td>
														<td class="content-table-title-text option-line">제목</td>
														<td class="content-table-title-text option-line">할인율</td>
														<td class="content-table-title-text option-line">대표금액</td>
														<td class="content-table-title-text option-line">쿠폰코드</td>
														<td class="content-table-title-text option-line">카테고리</td>
														<td class="content-table-title-text option-line">판매상태</td>
														</tr>
													</thead>
													<tbody id="selectPostingView">
														
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
							class="btn btn-primary modal-status-select-submit-button"
							id="dealAppSubmitBtn">신청</button>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-hover table-box-style" id="productListTable">
			<thead>
				<tr class="content-table-title">
					<td class="content-table-title-text option-line"><input
						class="form-check-input" type="checkbox" value="" id="allCheck" /></td>
					<td class="content-table-title-text option-line">판매글번호</td>
					<td class="content-table-title-text option-line">평점</td>
					<td class="content-table-title-text option-line">제목</td>
					<td class="content-table-title-text option-line">할인율</td>
					<td class="content-table-title-text option-line">대표금액</td>
					<td class="content-table-title-text option-line">쿠폰코드</td>
					<td class="content-table-title-text option-line">카테고리</td>
					<td class="content-table-title-text option-line">판매상태</td>
					<td class="content-table-title-text option-line">등록일</td>
					<td class="content-table-title-text option-line">오늘의딜 기간</td>
				</tr>
			</thead>
			<tbody id="postingList">
				<c:forEach var="postingListView" items="${postingListView}">
					<tr class="content-table-content content-hover">
						<td class="content-table-content-text option-line checkTd">
							<c:if test="${postingListView.getPost_status() ne '승인대기' and postingListView.getPost_status() ne '보류' and !postingListView.isToday_deal() and postingListView.getDeal_status() ne '신청'}">
								<input class="form-check-input check" type="checkbox" value="" />
							</c:if>
							<c:if test="${postingListView.getPost_status() eq '승인대기' or postingListView.getPost_status() eq '보류' or postingListView.isToday_deal() or postingListView.getDeal_status() eq '신청'}">
								<input class="form-check-input" type="checkbox" value="" disabled />
							</c:if>
						</td>
						<td class="content-table-content-text option-line state0">${postingListView.getPost_id()}</td>
						<td class="content-table-content-text option-line">${postingListView.getStar_ratio()}</td>
						<td class="content-table-content-text option-line">
						${postingListView.getPost_name()}
						<c:if test="${postingListView.isToday_deal()}">
							<img class="badgeicon" alt="[오늘의딜]" title="오늘의딜" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/badgeIcon-deal.gif">
						</c:if>
						</td>
						<!-- 딜 유무에 따른 할인율 데이터 -->
						<c:if test="${postingListView.isToday_deal()}">
							<td class="content-table-content-text option-line" style="color:#ff778e">
								${postingListView.getDeal_saleratio()}%
							</td>
						</c:if>
						<c:if test="${!postingListView.isToday_deal()}">
							<td class="content-table-content-text option-line">
								${postingListView.getSale_ratio()}%
							</td>
						</c:if>
						<!-- 딜 유무에 따른 판매 금액 데이터 -->
						<c:if test="${postingListView.isToday_deal()}">
							<td class="content-table-content-text option-line" style="color:#ff778e"><fmt:formatNumber
									value="${postingListView.getDeal_saleprice()}" type="currency" /></td>
						</c:if>
						<c:if test="${!postingListView.isToday_deal()}">
							<td class="content-table-content-text option-line"><fmt:formatNumber
									value="${postingListView.getWhole_price()}" type="currency" /></td>
						</c:if>
						<td class="content-table-content-text option-line">${postingListView.getPost_couponid()}</td>
						<td class="content-table-content-text option-line">${postingListView.getCate_name()}</td>
						<td class="content-table-content-text option-line">${postingListView.getPost_status()}</td>
						<td class="content-table-content-text option-line"><fmt:formatDate
								value="${postingListView.getPost_created()}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td class="content-table-content-text option-line">
							<c:if test="${postingListView.getDeal_time() ne null}">
								<fmt:formatDate
										value="${postingListView.getDeal_time()}"
										pattern="yyyy-MM-dd HH:mm" />
										 ~ 
								<fmt:formatDate
										value="${postingListView.getDeal_endtime()}"
										pattern="yyyy-MM-dd HH:mm" />
							</c:if>
							<c:if test="${postingListView.getDeal_status() eq '신청'}">
							오늘의딜 승인대기중
							</c:if>
						</td>
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
	src="resources/js/sellerjs/seller-productPostingManagement.js?t=<%=System.currentTimeMillis()%>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/category.js"></script>
</body>
</html>