<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>업체 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link href="resources/css/admincss/insertProduct_dh.css?var=1" rel="stylesheet" />
    <link href="resources/css/admincss/seller-productManagement_dh.css?after" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
  </head>
  
  		<jsp:include page="header/header.jsp"></jsp:include>
  		
        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <h1 class="mt-4 insert_title">업체 관리</h1>
            <ol class="breadcrumb bottomline">
              <li class="breadcrumb-item active">Product Management</li>
            </ol>
            <div class="">
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">검색어</div>
                  <div class="col search-input">
                    <div class="search-input-box">
                      <input type="text" class="form-control form-control-sm input-font" id="exampleFormControlInput1" placeholder="업체명 or 사업장 번호" />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">업체 상태</div>
                   <div class="col search-check-group">
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                      <label class="form-check-label" for="flexCheckDefault"> 입점신청업체 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                      <label class="form-check-label" for="flexCheckDefault"> 입점업체 </label>
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">분류</div>
                  <div class="col search-check-group">
                  	<!-- 나중에 넣기 -->
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                      <label class="form-check-label" for="flexCheckDefault"> 평점순 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                      <label class="form-check-label" for="flexCheckDefault"> 매출순 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
                      <label class="form-check-label" for="flexCheckDefault"> 인기순 </label>
                    </div>
                    
                  </div>
                </div>
              </div>
              
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">카테고리</div>
                  <div class="col search-input">
                    <div class="radio-productCode">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example">
                          <option selected>대분류</option>
                          <option value="1">주방</option>
                          <option value="2">헬스/반려/캠핑</option>
                          <option value="3">생활용품</option>
                          <option value="4">가구</option>
                          <option value="5">홈테코/조명</option>
                          <option value="6">시공/서비스</option>
                          <option value="7">렌탈</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">기간</div>
                  <div class="col search-input">
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                      <select class="form-select selectDate" aria-label="Default select example">
                        <!-- <option selected>대분류</option> -->
                        <option value="1">상품 등록일</option>
                        <option value="2">상품 등록일</option>
                        <option value="3">상품 등록일</option>
                      </select>
                    </div>
                    <div class="radio-productCode">
                      <div class="btn-group paddingLeft1" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check dateBtn-1" name="btnradio" id="btnradio1" autocomplete="off" checked />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>

                        <input type="radio" class="btn-check dateBtn-2" name="btnradio" id="btnradio2" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio2">3일</label>

                        <input type="radio" class="btn-check dateBtn-3" name="btnradio" id="btnradio3" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio3">1주일</label>

                        <input type="radio" class="btn-check dateBtn-4" name="btnradio" id="btnradio4" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio4">1개월</label>

                        <input type="radio" class="btn-check dateBtn-5" name="btnradio" id="btnradio5" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio5">3개월</label>

                        <input type="radio" class="btn-check dateBtn-6" name="btnradio" id="btnradio6" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio6">6개월</label>

                        <input type="radio" class="btn-check dateBtn-7" name="btnradio" id="btnradio7" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio7">1년</label>

                        <input type="radio" class="btn-check dateBtn-8" name="btnradio" id="btnradio8" autocomplete="off" />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio8">전체</label>
                      </div>
                    </div>
                    <div class="paddingLeft1">
                      <input class="startDate" type="date" id="date" value="" />
                      <input class="endDate" type="date" id="date" value="" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding">
                <div class="row optionGroup1">
                  <div class="col search-submitBtn">
                    <div class="d-grid gap-2">
                      <button class="btn btn-secondary submitBtn" type="button">검색</button>
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
        	<div class="dropdown setting-button text-end">
				<button class="settingBtn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                   <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"></path>
                 </svg>
				</button>
				<ul class="dropdown-menu settingBtnDropdown" aria-labelledby="dropdownMenuButton1" style="">
					<li><h6 class="dropdown-header">업체 관리</h6></li>
					<li>
						<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modal-status-select" id="companyStatusChange">업체상태변경</a>
					</li>
				</ul>
			</div>
          <table class="table table-hover table-box-style">
            <thead>
              <tr class="content-table-title">
                <td class="content-table-title-text option-line" style="width: 1rem;">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
                </td>
                <td class="content-table-title-text option-line" style="width: 3rem;">업체코드</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">업체명</td>
                <td class="content-table-title-text option-line" style="width: 4rem;">대표명</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">대표전화</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">사업자등록번호</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">입점일</td>
                <td class="content-table-title-text option-line" style="width: 3rem;">업체별점</td>
                <td class="content-table-title-text option-line" style="width: 3rem;">상태</td>
                  
              </tr>
            </thead>
            <tbody>
              <!-- for -->
              <c:forEach items="${sellerList }" var="seller">
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
                </td>
                <td class="content-table-content-text option-line">${seller.seller_id }</td>
                <td class="content-table-content-text option-line">${seller.company_name }</td>
                <td class="content-table-content-text option-line">${seller.representative }</td>
                <td class="content-table-content-text option-line">${seller.shop_tell }</td>
                <td class="content-table-content-text option-line">${seller.registration_num }</td>
                <td class="content-table-content-text option-line">
					<fmt:formatDate value="${seller.entry_date}" pattern="yyyy-MM-dd HH:mm" />
				</td>
                <td class="content-table-content-text option-line">${seller.brandstar }</td>
                <td class="content-table-content-text option-line">${seller.seller_status }</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        
        <!--쿠폰등록modal-->        
		<div class="modal fade" id="modal-status-select" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <p class="modal-title" id="">업체 관리</p>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body modal-status-select-product">
					<div class="modal-status-select-product-num">
						<span>선택된 업체 수 : </span> 
						<span class="modal-status-select-product-num-value productNum select-num">0</span>
						<span>개</span>
					</div>
					<div class="modal-status-select">
						<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="couponStatusOption">
								<option value="입점중">입점승인</option>
								<option value="보류중">보류중</option>
								<option value="업체정지">업체정지</option>
							</select>
						</div>
					</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn modal-status-select-submit-button" onclick="updateCouponStatus()">확인</button>
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
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/admin-productManagement_ih.js"></script>
  </body>
</html>
