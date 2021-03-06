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
<title>주문관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css" rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
<link href="resources/css/sellercss/seller-order.css" rel="stylesheet" />
<link href="resources/css/sellercss/seller-order2.css" rel="stylesheet" />
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
			<h1 class="mt-4 insert_title">주문관리</h1>
			<ol class="breadcrumb mb-3 bottomline">
				<li class="breadcrumb-item active">Order Management</li>
			</ol>
			<div class="container container-option bottomline">
				<div class="row optionGroup1">
					<div class="col status-name">
						<span>전체</span> <span class="status-value"><fmt:formatNumber
								value="${fn:length(orderListView)}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>결제완료</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus0}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>배송준비중</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus1}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>배송중</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus2}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>배송완료</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus3}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>구매확정</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus4}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>교환</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus5}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>반품</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus6}" pattern="#,###" /></span>
					</div>
					<div class="col status-name">
						<span>환불</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus7}" pattern="#,###" /></span>
					</div>
					<div class="col status-name-last">
						<span>주문취소</span> <span class="status-value"><fmt:formatNumber
								value="${orderStatus8}" pattern="#,###" /></span>
					</div>
					<div class="col-3 search-button-area">
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
									class="form-control form-control-sm input-font" id="searchName"
									placeholder="" />
							</div>
							<div class="radio-productCode paddingLeft1">
								<div class="form-check">
									<input class="form-check-input searchNameStatusGroup"
										type="radio" name="searchNameStatus" id="searchNameStatus1"
										value="1" checked /> <label class="form-check-label"
										for="searchNameStatus1"> 주문번호 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input searchNameStatusGroup"
										type="radio" name="searchNameStatus" id="searchNameStatus2"
										value="2" /> <label class="form-check-label"
										for="searchNameStatus2"> 그룹주문번호 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input searchNameStatusGroup"
										type="radio" name="searchNameStatus" id="searchNameStatus3"
										value="3" /> <label class="form-check-label"
										for="searchNameStatus3"> 수취인명 </label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-1 status-name-400">처리 상태</div>
						<div class="col search-check-group">
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin searchStatusGroup"
									type="checkbox" id="statusCheckAll" name="searchStatus"
									value="1" /> <label class="form-check-label"
									for="statusCheckAll"> 전체 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck1" name="searchStatus" value="2" />
								<label class="form-check-label" for="statusCheck1"> 결제완료
								</label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck2" name="searchStatus" value="3" />
								<label class="form-check-label" for="statusCheck2">
									배송준비중 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck3" name="searchStatus" value="4" />
								<label class="form-check-label" for="statusCheck3"> 배송중
								</label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck4" name="searchStatus" value="5" />
								<label class="form-check-label" for="statusCheck4"> 배송완료
								</label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck5" name="searchStatus" value="6" />
								<label class="form-check-label" for="statusCheck5"> 구매확정
								</label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck6" name="searchStatus" value="7" />
								<label class="form-check-label" for="statusCheck6"> 교환 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck7" name="searchStatus" value="8" />
								<label class="form-check-label" for="statusCheck7"> 반품 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck8" name="searchStatus" value="9" />
								<label class="form-check-label" for="statusCheck8"> 환불 </label>
							</div>
							<div class="form-check form-check-display">
								<input
									class="form-check-input form-check-input-margin statusCheck searchStatusGroup"
									type="checkbox" id="statusCheck9" name="searchStatus" value="10" />
								<label class="form-check-label" for="statusCheck9"> 주문취소
								</label>
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
							<div class="radio-productCode">
								<div class="btn-group paddingLeft2" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check dateBtn-1 searchDateBtn"
										name="btnradio" id="btnradio1" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>

									<input type="radio" class="btn-check dateBtn-2 searchDateBtn"
										name="btnradio" id="btnradio2" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio2">3일</label>

									<input type="radio" class="btn-check dateBtn-3 searchDateBtn"
										name="btnradio" id="btnradio3" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio3">1주일</label>

									<input type="radio" class="btn-check dateBtn-4 searchDateBtn"
										name="btnradio" id="btnradio4" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio4">1개월</label>

									<input type="radio" class="btn-check dateBtn-5 searchDateBtn"
										name="btnradio" id="btnradio5" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio5">3개월</label>

									<input type="radio" class="btn-check dateBtn-6 searchDateBtn"
										name="btnradio" id="btnradio6" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio6">6개월</label>

									<input type="radio" class="btn-check dateBtn-7 searchDateBtn"
										name="btnradio" id="btnradio7" autocomplete="off" /> <label
										class="btn btn-outline-secondary dateBtn" for="btnradio7">1년</label>

									<input type="radio" class="btn-check dateBtn-8 searchDateBtn"
										name="btnradio" id="btnradio8" autocomplete="off" checked />
									<label class="btn btn-outline-secondary dateBtn"
										for="btnradio8">전체</label>
								</div>
							</div>
							<div class="paddingLeft1">
								<input class="startDate" type="date" id="startDate" value="" />
								<input class="endDate" type="date" id="endDate" value="" />
							</div>
						</div>
					</div>
				</div>
				<div class="container container-option container-option-topPadding">
					<div class="row optionGroup1">
						<div class="col search-submitBtn">
							<div class="d-grid gap-2">
								<!-- 비강조 클래스 : btn-outline-secondary -->
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
				<span class="content-view-title-text">주문목록 (선택 </span> <span
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
						<li><h6 class="dropdown-header">주문건 일괄 설정</h6></li>
						<li><a class="dropdown-item menu" href="#" data-bs-toggle="modal"
							data-bs-target="#modal-check" id="menu1">발주확인</a></li>
						<li><a class="dropdown-item menu" href="#" data-bs-toggle="modal"
							data-bs-target="#modal-send" id="menu2">발송처리</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 발주확인 Modal -->
		<div class="modal fade" id="modal-check" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">발주확인처리</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-status-select-product">
						<div class="modal-delete-product-notice">
							<span class="modal-delete-product-num-value"><i
								class="bi bi-dot"></i>단일 혹은 일괄로 발주확인처리를 하여 처리상태를 배송준비중으로 변경합니다.</span>
						</div>
						<div class="modal-delete-product-num">
							<span>선택된 상품 수 : </span> <span
								class="modal-delete-product-num-value orderNum">0</span> <span>개</span>
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
															<td class="content-table-title-text option-line">주문날짜</td>
															<td class="content-table-title-text option-line">주문번호</td>
															<td class="content-table-title-text option-line">판매자 상품코드</td>
															<td class="content-table-title-text option-line">상품명</td>
															<td class="content-table-title-text option-line">옵션정보</td>
															<td class="content-table-title-text option-line">판매가</td>
															<td class="content-table-title-text option-line">주문 수량</td>
														</tr>
													</thead>
													<tbody class="selectOrderView">

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
							id="orderCheckSubmitBtn">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 발송처리 Modal -->
		<div class="modal fade" id="modal-send" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">발송처리</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-status-select-product">
						<div class="modal-delete-product-notice">
							<span class="modal-delete-product-num-value"><i
								class="bi bi-dot"></i>송장번호를 입력하여 선택된 주문건을 일괄 발송처리 합니다.</span>
						</div>
						<div class="col search-input invoice-box">
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<select class="form-select selectState parcelservice-select"
									aria-label="Default select example" id="selectDelivery2">
									<option value="0">CJ대한통운</option>
									<option value="1">롯데택배</option>
									<option value="2">한진택배</option>
									<option value="3">로젠택배</option>
									<option value="4">우체국택배</option>
								</select>
							</div>
							<div class="invoice-number">
								<input type="text"
									class="form-control form-control-sm input-font"
									id="inputInvoiceNumber" placeholder="송장번호 입력" />
							</div>
						</div>
						<div class="modal-delete-product-num">
							<span>선택된 상품 수 : </span> <span
								class="modal-delete-product-num-value orderNum">0</span> <span>개</span>
						</div>
						<div class="modal-delete-select-product">
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed modal-product-list"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#flush-collapseOne" aria-expanded="false"
											aria-controls="flush-collapseOne">
											선택된 주문 리스트
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
															<td class="content-table-title-text option-line">주문날짜</td>
															<td class="content-table-title-text option-line">주문번호</td>
															<td class="content-table-title-text option-line">판매자 상품코드</td>
															<td class="content-table-title-text option-line">상품명</td>
															<td class="content-table-title-text option-line">옵션정보</td>
															<td class="content-table-title-text option-line">판매가</td>
															<td class="content-table-title-text option-line">주문 수량</td>
														</tr>
													</thead>
													<tbody class="selectOrderView">

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
							id="sendSubmitBtn">확인</button>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-hover table-box-style">
			<thead>
				<tr class="content-table-title">
					<td class="content-table-title-text option-line"><input
						class="form-check-input" type="checkbox" value="" id="allCheck" />
					</td>
					<td class="content-table-title-text option-line">주문날짜</td>
					<td class="content-table-title-text option-line">주문번호(그룹)</td>
					<td class="content-table-title-text option-line">처리상태</td>
					<td class="content-table-title-text option-line">판매자 상품코드</td>
					<td class="content-table-title-text option-line">상품명</td>
					<td class="content-table-title-text option-line">옵션정보</td>
					<td class="content-table-title-text option-line">수량</td>
					<td class="content-table-title-text option-line">수취인명</td>
					<td class="content-table-title-text option-line">수취인연락처</td>
					<td class="content-table-title-text option-line">배송지</td>
				</tr>
			</thead>
			<tbody id="orderList">
				<c:forEach var="orderListView" items="${orderListView}"
					varStatus="status">
					<tr class="content-table-content content-hover">
						<td class="content-table-content-text option-line checkTd">
							<c:choose>
								<c:when test="${orderListView.getOrder_status() ne '배송완료' and orderListView.getOrder_status() ne '구매확정'}">
										<input class="form-check-input check" type="checkbox" value="" />
								</c:when>
								<c:otherwise>
										<input class="form-check-input" type="checkbox" value="" disabled />
								</c:otherwise>
							</c:choose>
						</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order"><fmt:formatDate
								value="${orderListView.getOrder_date()}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td class="content-table-content-text option-line state0" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">
							<span name="orderId${status.index}">${orderListView.getOrder_id()}</span>
							(<span name="orderNum${status.index}">${orderListView.getOrder_num()}</span>)
						</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getOrder_status()}</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getProduct_seller_code()}</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getProduct_title()}</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">
							${orderListView.getOption1()} <c:if
								test="${orderListView.getOption2() ne ''}">
								 / ${orderListView.getOption2()}
							</c:if>
						</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getQuantity()}</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getReceiver()}</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getPhone_num()}</td>
						<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderListView.getAddress1()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 주문상세 Modal -->
	<div class="modal fade" tabindex="-1" id="modal-view-order"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-order">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">주문 상세조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body modal-status-select-product">
					<div>
						<span class="content-view-title-text">주문 정보</span>
					</div>
					<div id="modal-view-order-change">
						<div class="modal-delete-select-product">
							<div class="product-list-group">
								<table class="table table-box-style">
									<thead>
										<tr class="content-table-title">
											<td class="content-table-title-text option-line">주문날짜</td>
											<td class="content-table-title-text option-line">주문번호</td>
											<td class="content-table-title-text option-line">판매자 상품코드</td>
											<td class="content-table-title-text option-line">상품명</td>
											<td class="content-table-title-text option-line">옵션정보</td>
											<td class="content-table-title-text option-line">판매가</td>
											<td class="content-table-title-text option-line">주문 수량</td>
										</tr>
									</thead>
									<tbody>
											<tr class="content-table-content content-hover">
												<td class="content-table-content-text option-line"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
												<td class="content-table-content-text option-line state0"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
												<td class="content-table-content-text option-line"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
												<td class="content-table-content-text option-line"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
												<td class="content-table-content-text option-line"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
												<td class="content-table-content-text option-line"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
												<td class="content-table-content-text option-line"
													data-bs-toggle="modal" data-bs-target="#modal-view-order"></td>
											</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="marginTop">
							<span class="content-view-title-text">결제/배송 정보</span>
						</div>
						<div class="modal-delete-select-product marginTop1"
							id="selectOrderDetailView2">
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline topline">
									<div class="row optionGroup1">
										<div class="col-2 view-title">주문자 이메일</div>
										<div class="col"></div>
										<div class="col-2 view-title-last">최종 결제금액<br>(결제금액-할인금액)</div>
										<div class="col"></div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-2 view-title">결제수단</div>
										<div class="col"></div>
										<div class="col-2 view-title-last">결제정보</div>
										<div class="col"></div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-2 view-title">택배회사</div>
										<div class="col"></div>
										<div class="col-2 view-title-last">송장번호</div>
										<div class="col"></div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-2 view-title">배송금액</div>
										<div class="col"></div>
										<div class="col-2 view-title-last">배송메세지</div>
										<div class="col"></div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-2 view-title">배송지</div>
										<div class="col"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/scripts.js"></script>
<script src="resources/js/sellerjs/seller-customerInquiry.js"></script>
<script
	src="resources/js/sellerjs/seller-order.js?t=<%=System.currentTimeMillis()%>"></script>
<script src="resources/js/sellerjs/category.js"></script>
</body>
</html>