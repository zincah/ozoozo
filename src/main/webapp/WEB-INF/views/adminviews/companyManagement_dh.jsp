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
    <link href="resources/css/admincss/modalbtn.css?var=22" rel="stylesheet" />
    <link href="resources/css/admincss/seller-productManagement_dh.css?var=22" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>
    
    	$(document).ready(function(){
    		
    		/* 체크박스 메소드 이 부분이랑 checkfunction() */ 
    		// 전체 체크박스 체크 여부에 따른 하위 체크박스들 상태 변경
    		$("#allCheck").on('change', function(){
    			if ($("#allCheck").is(":checked")) {
        		    $(".check").prop("checked", true);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check:checked").length);
        		  } else {
        		    $(".check").prop("checked", false);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check:checked").length);
        		  }
    		});
    		
    		$(".getSellerInfo").click(function(){
    			
    			var sellerid = {"seller_id" : $(this).val()}
    			
        		$.ajax({
    		  		url:'getSellerInfo.admin',
    		  		method:'post',
    		  		data: JSON.stringify(sellerid),
    		  		contentType : 'application/json; charset=UTF-8',
    		  		dataType : 'json',
    		  		success : function(resp){

    		  			console.log(resp);
    		  			$('#seller_info_modal').modal('show');
    		  			
    		  			$(".company_name").text(resp.company_name);
    		  			$(".seller_name").text(resp.representative);
    		  			$(".company_addr").text(resp.address);
    		  			$(".seller_tell").text(resp.shop_tell);
    		  			$(".seller_email").text(resp.email);
    		  			$(".seller_in").text(resp.entry_date);
    		  			$(".regist_num").text(resp.registration_num);
    		  			
    		  		}
    		  		
    		  		});

    		});
    		
    		// 검색기능
    		var datepick1;
    		var datepick2;
    		
    		$("input[name=datepick1]").click(function(){
    			$("input[name=datepick2]").attr("disabled", true);
    		})
    		
    		$("input[name=datepick1]").change(function(){
    			datepick1 = $("input[name=datepick1]").val();
    			$("input[name=datepick2]").attr("disabled", false);
    		})

    		$("input[name=datepick2]").change(function(){
				searching();
    		})
    		
			$("input[name=btnradio]").click(function(){
				searching();
    		})
    		
    		// searchbox
    		$("#search_input").keyup(function(){
    			searching();
    		})
    		
    		// 업체 상태
    		$("input[name=status]").click(function(){
    			searching();
    		})
    		
    	});
    	
    	function searching(){
    		var search = $("#searchBox").val();
			
    		// checkbox 초기화
    		$("#allCheck").prop("checked", false);
    		
    		var status = $("input[name=status]:checked").val();
    		var ranking = $("input[name=ranking]:checked").val();
    		var startdate = $("input[name=datepick1]").val();
    		var enddate = $("input[name=datepick2]").val();

			var keyword = $("#search_input").val();

			searchMap = {
    				"status" : status,
    				"ranking" : ranking,
    				"startdate" : startdate,
    				"enddate" : enddate,
    				"keyword" : keyword
    		}
			
			$.ajax({
		  		url:'sellerSearchBox.admin',
		  		method:'post',
		  		data: JSON.stringify(searchMap),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			$("#allCheck").prop("checked", false);
					printTable(resp);

		  		}
    		});
    	}
    	
    	// 체크 박스 js
    	function checkfunction(){
    		// 하위 체크박스 체크 여부에 따른 전체 체크박스 상태 변경
    		// 하위 체크박스 체크 개수와 전체 개수를 비교
			
			if ($(".check:checked").length == $(".check").length && $(".check").length != 0) {
    		    $("#allCheck").prop("checked", true);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check:checked").length);
    		    console.log($(".check:checked").length);
    		} else {
    		    $("#allCheck").prop("checked", false);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check:checked").length);
    		    console.log($(".check:checked").length);
    		  }
    	}
    	
    	// 초기화 버튼
    	function clickReset(){
    		
    		$("input[name=datepick2]").attr("disabled", true);
    		dateBtn8Event(); // 날짜 전체로 돌리기
    		$("#btnradio8").prop("checked", true);

			$("#search_input").val("");
			$('input[name="status"]')[0].checked = true;
			
			searching();

    	}
    	

    	function updateSellerStatus(){
    		
    		selleridList = []
    		
    		selleridList.push($("#sellerStatus").val());
    		
    		$("input:checkbox[name=sellerCheckBox]:checked").each(function(){
      			var checkit = $(this).prev().val();
      			selleridList.push(checkit);
      		});

    		
    		$.ajax({
		  		url:'updateSellerStatus.admin',
		  		method:'post',
		  		data: JSON.stringify(selleridList),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){

		  			// 모달과 선택 사항 초기화
		  			$(".modal").modal('hide');
		  			$(".modal-status-select-option option:eq(0)").prop("selected", true);
		  			$("#select-num").text("0");
		  			$("#allCheck").prop("checked", false);

		  			printTable(resp);
		  			

		  		},
	  			error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		  		
		  	});
    	}
    
    	function printTable(resp){
    		$("#sellerTableBody").html(resp);
    	}
    
    
    </script>
    
    
    
    
  </head>
  
  		<jsp:include page="header/header.jsp"></jsp:include>
  		
        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <h1 class="mt-4 insert_title">업체 관리</h1>
            <ol class="breadcrumb2 mb-3 bottomline">
              <li class="breadcrumb-item active">Company Management</li>
              <li>
              	<button type="button" class="btn btn-secondary" onclick="clickReset()">초기화</button>
              </li>
            </ol>
            <div class="">
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">검색어</div>
                  <div class="col search-input">
                    <div class="search-input-box">
                      <input type="text" class="form-control form-control-sm input-font" id="search_input" placeholder="업체명 or 대표명 or 업체코드" />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">업체 상태</div>
                   <div class="col search-check-group">
                   <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" name="status" type="radio" value="" id="status1" checked/>
                      <label class="form-check-label" for="status1"> 전체 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" name="status" type="radio" value="입점신청" id="status2" />
                      <label class="form-check-label" for="status2"> 입점신청업체 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" name="status" type="radio" value="입점중" id="status3" />
                      <label class="form-check-label" for="status3"> 입점업체 </label>
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
                      <input class="form-check-input form-check-input-margin" name="ranking" type="radio" value="" id="ranking1" checked/>
                      <label class="form-check-label" for="ranking1"> 전체 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" name="ranking" type="radio" value="" id="ranking2" />
                      <label class="form-check-label" for="ranking2"> 평점순 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" name="ranking" type="radio" value="" id="ranking3" />
                      <label class="form-check-label" for="ranking3"> 매출순 </label>
                    </div>
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" name="ranking" type="radio" value="" id="ranking4" />
                      <label class="form-check-label" for="ranking4"> 인기순 </label>
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="container container-option container-option-topPadding">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">기간</div>
                  <div class="col search-input">
                    <div class="radio-productCode">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check dateBtn-1" name="btnradio" id="btnradio1" autocomplete="off"/>
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

                        <input type="radio" class="btn-check dateBtn-8" name="btnradio" id="btnradio8" autocomplete="off" checked />
                        <label class="btn btn-outline-secondary dateBtn" for="btnradio8">전체</label>
                      </div>
                    </div>
                    <div class="paddingLeft1">
                      <input class="startDate" type="date" id="date" name="datepick1" value="" />
                      <input class="endDate" type="date" id="date" name="datepick2" value="" disabled/>
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
                  	<input type="hidden" id="findPage" value=1>
                    <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck"/>
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
            <tbody id="sellerTableBody">
              <!-- for -->
              <c:forEach items="${sellerList }" var="seller">
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                  <input type="hidden" value="${seller.seller_id }"/>
	              <input class="check form-check-input form-check-input-margin" type="checkbox" value="" name="sellerCheckBox" onchange="checkfunction()"/>
                </td>
                <td class="content-table-content-text option-line">${seller.seller_id }</td>
                <td class="content-table-content-text option-line"><button class="btn getSellerInfo" style="width: 100%;" value="${seller.seller_id }">${seller.company_name }</button></td>
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
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="sellerStatus">
								<option value="입점중">입점승인</option>
								<option value="보류중">보류중</option>
								<option value="업체정지">업체정지</option>
							</select>
						</div>
					</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn modal-status-select-submit-button" onclick="updateSellerStatus()">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 판매자 -->    
		<div class="modal fade" id="seller_info_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" style="max-width: 650px;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <p class="modal-title" id="">업체 정보</p>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body modal-status-select-product" style="font-size: 11px;">
						<div class="modal-delete-select-product marginTop1">
							<div class="product-list-group">
								<div class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">상호명</div>
										<div class="col company_name">테스트쇼핑몰</div>
										<div class="col-3 view-title-last">대표이사</div>
										<div class="col seller_name">테스트</div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">주소</div>
										<div class="col company_addr">
											[우편번호 들어가는곳]
											서울특별시 종로구 돈화문로 26 단성사 4층</div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">대표 전화번호</div>
										<div class="col seller_tell">010-1234-5678</div>
										<div class="col-3 view-title-last">대표 이메일</div>
										<div class="col seller_email">test1@naver.com</div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div class="container container-option container-option-topPadding notbottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">입점일</div>
										<div class="col seller_in">2022-05-15</div>
										<div class="col-3 view-title-last">사업자등록번호</div>
										<div class="col regist_num">1231212345</div>
									</div>
								</div>
							</div>
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
    <!-- <script src="resources/js/adminjs/admin-productManagement_ih.js"></script> -->
    <script src="resources/js/adminjs/date_admin.js?var=1"></script>
    <script src="resources/js/adminjs/checkbox.js"></script>
  </body>
</html>
