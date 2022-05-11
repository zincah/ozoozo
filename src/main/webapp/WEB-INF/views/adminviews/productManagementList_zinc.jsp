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
    <title>판매게시글 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <link href="resources/css/admincss/productManagement.css?var=13" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>
    
    	$(document).ready(function(){
    		
    		/* 상품 선택 체크박스 */
    		// 전체 체크박스 체크 여부에 따른 하위 체크박스들 상태 변경
    		$("#allCheck").on('change', function(){
    			if ($("#allCheck").is(":checked")) {
        		    $(".check").prop("checked", true);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $("#select-num").text($(".check:checked").length);
        		  } else {
        		    $(".check").prop("checked", false);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $("#select-num").text($(".check:checked").length);
        		  }
    		});
    		
    		
    	});
    	
    	function checkfunction(){
    		// 하위 체크박스 체크 여부에 따른 전체 체크박스 상태 변경
    		// 하위 체크박스 체크 개수와 전체 개수를 비교
			
			if ($(".check:checked").length == $(".check").length) {
    		    $("#allCheck").prop("checked", true);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $("#select-num").text($(".check:checked").length);
    		} else {
    		    $("#allCheck").prop("checked", false);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $("#select-num").text($(".check:checked").length);
    		  }
    	}
    	
		
    </script>
  </head>
  
  		<jsp:include page="header/header.jsp"></jsp:include>

        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <div class="header_layer">
              <h1 class="mt-4 insert_title">판매 게시글 등록 관리</h1>
              
            </div>
            <ol class="breadcrumb mb-3 bottomline">
              <li class="breadcrumb-item active">Manage sales posts</li>
            </ol>
            <div class="container container-option bottomline">
              <div class="row optionGroup1">
                <div class="col-1 option-name">등록일</div>
                <div class="col-10">
	               	 <div class="paddingLeft1 search-input">
	                  <div class="radio-productCode">
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check dateBtn-1" name="btnradio" id="btnradio1" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio1">오늘</label>
								<input type="radio" class="btn-check dateBtn-2" name="btnradio" id="btnradio2" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio2">3일</label>
								<input type="radio" class="btn-check dateBtn-3" name="btnradio" id="btnradio3" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio3">1주일</label>
								<input type="radio" class="btn-check dateBtn-4" name="btnradio" id="btnradio4" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio4">1개월</label>
								<input type="radio" class="btn-check dateBtn-5" name="btnradio" id="btnradio5" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio5">3개월</label>
								<input type="radio" class="btn-check dateBtn-6" name="btnradio" id="btnradio6" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio6">6개월</label>
								<input type="radio" class="btn-check dateBtn-7" name="btnradio" id="btnradio7" autocomplete="off"> <label class="btn btn-outline-secondary dateBtn" for="btnradio7">1년</label>
								<input type="radio" class="btn-check dateBtn-8" name="btnradio" id="btnradio8" autocomplete="off" checked=""> <label class="btn btn-outline-secondary dateBtn" for="btnradio8">전체</label>
							</div>
						</div>
	                    <div class="paddingLeft1">
	                      <input class="startDate" type="date" name="datepick1" value="" />
	                      <input class="endDate" type="date" name="datepick2" value="" disabled/>
	                    </div>
	                    </div>
	               </div>
              </div>
            </div>

            <div class="container container-option container-option-topPadding bottomline">
              <div class="row optionGroup1">
                <div class="col-1 option-name">분류</div>
                <div class="col-10">
                    <div class="radio-productCode paddingLeft1 align-custom">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example" style="width: 200px;">
                          <option selected value="0">카테고리 전체</option>
                          <option value="1">가구</option>
                          <option value="2">패브릭</option>
                          <option value="3">조명</option>
                          <option value="4">가전</option>
                          <option value="5">주방용품</option>
                          <option value="6">데코/식물</option>
                          <option value="7">수납/정리</option>
                        </select>
                      </div>
                      <div class="radio_layer paddingLeft1">
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked="">
                          <label class="form-check-label" for="flexRadioDefault1"> 전체 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                          <label class="form-check-label" for="flexRadioDefault2"> 보류중 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
                          <label class="form-check-label" for="flexRadioDefault3"> 승인대기 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
                          <label class="form-check-label" for="flexRadioDefault3"> 승인완료 </label>
                        </div>

                      </div>

                    </div>

                </div>
                

            </div>
            </div>

            <div class="container container-option container-option-topPadding">
              <div class="row optionGroup1">
                <div class="col-1 option-name">검색</div>
                <div class="col-10 search-layer">
                
	                <div class="radio-productCode paddingLeft1 align-custom">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="large-select" aria-label="Default select example" style="width: 150px;">
                          <option selected value="0">검색 필터</option>
                          <option value="1">브랜드명</option>
                          <option value="2">판매 게시글 명</option>
                          <option value="3">종류</option>
                        </select>
                      </div>
	                </div>
                    
                    <input class="form-control size-input" type="text">
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
			<ul class="dropdown-menu settingBtnDropdown" aria-labelledby="dropdownMenuButton1" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(1px, 28px, 0px);" data-popper-placement="bottom-end">
				<li><h6 class="dropdown-header">판매 상품 관리</h6></li>
				<li>
					<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modal-status-select" id="productStatusChange">게시물상태변경</a>
					<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#coupon_register" id="productStatusChange1">쿠폰등록</a>
				</li>
			</ul>
          </div>
          <div class="table_layer">
            <table class="table table-hover table-box-style">
              <thead>
                <tr class="content-table-title">
                  <td class="content-table-title-text option-line" style="width: 1rem;">
                    <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck"/>
                  </td>
                  <td class="content-table-title-text option-line" style="width: 4rem;">브랜드명</td>
                  <td class="content-table-title-text option-line" style="width: 10rem;">판매 게시글 명</td>
                  <td class="content-table-title-text option-line" style="width: 4rem;">카테고리</td>
                  <td class="content-table-title-text option-line" style="width: 1rem;">건</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">종류</td>
                  <td class="content-table-title-text option-line" style="width: 5rem;">쿠폰정보</td>
                  <td class="content-table-title-text option-line" style="width: 7rem;">신청일</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">오늘의딜</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">베스트</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">상태</td>
                </tr>
              </thead>
              <tbody>
                <!-- for -->
                <tr class="content-table-content content-hover">
                  <td class="content-table-content-text option-line">
                      <input class="form-check-input form-check-input-margin" type="checkbox" value="" value="" name="productcheckbox" onchange="checkfunction()"/>
                  </td>
                  <td class="content-table-content-text option-line">퀵슬립</td>
                  <td class="content-table-content-text option-line">
                    <a href="insertProductList.html">Q4 유로탑 롤팩 매트리스 2size</a>
                    </td>
                  <td class="content-table-content-text option-line">가구</td>
                  <td class="content-table-content-text option-line">2</td>
                  <td class="content-table-content-text option-line">매트리스</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">2022-04-15 20:27</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">-</td>
                  <td class="content-table-content-text option-line">승인완료</td>
                </tr>

              </tbody>
            </table>
          </div>

          <div class="pagi mt-3">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>


          <div class="my-5"></div>

        <!--쿠폰등록modal-->        
		<div class="modal fade" id="coupon_register" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <p class="modal-title" id="">쿠폰 등록</p>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body modal-status-select-product">
					<div class="modal-status-select-product-num">
						<span>선택된 게시물 수 : </span> 
						<span class="modal-status-select-product-num-value productNum" id="select-num">0</span>
						<span>개</span>
					</div>
					<div class="modal-status-select">
						<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="statusOption">
								<option value="1">오픈 기념 이벤트 축하쿠폰/2000원 할인 (10,000원 이상 구매 시)</option>
								<option value="2">가구 10% 할인쿠폰/30000원 이상 구매시 10% 할인</option>
								<option value="3">신규가입 감사쿠폰/1000원 할인 (5000원 이상 구매시)</option>
							</select>
						</div>
					</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn modal-status-select-submit-button" onclick="updateUserStatus()">변경</button>
		      </div>
		    </div>
		  </div>
		</div>
        
        <!-- 상태변경 modal -->
		<div class="modal fade" id="modal-status-select" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <p class="modal-title" id="">상품게시물 상태변경</p>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body modal-status-select-product">
					<div class="modal-status-select-product-num">
						<span>선택된 게시물 수 : </span> 
						<span class="modal-status-select-product-num-value productNum" id="select-num">0</span>
						<span>개</span>
					</div>
					<div class="modal-status-select">
						<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="statusOption">
								<option value="판매중">판매중</option>
								<option value="판매대기">판매대기</option>
								<option value="보류중">보류중</option>
							</select>
						</div>
					</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn modal-status-select-submit-button" onclick="updateUserStatus()">변경</button>
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
    <script src="resources/js/adminjs/date_admin.js"></script>
    <script src="resources/js/adminjs/checkbox.js"></script>
    
  </body>
</html>
