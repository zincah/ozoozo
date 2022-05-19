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
    <title>매출 현황</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <link href="resources/css/admincss/insertProduct_dh.css?var=1" rel="stylesheet" />
    <link href="resources/css/admincss/saleStatus.css?var=122" rel="stylesheet" />
    <link href="resources/css/admincss/seller-productManagement_dh.css?after" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
  	<script>
  	
  		var searchMap = {}
  		
  		$(document).ready(function(){
  			
  			/* 상품 선택 체크박스 */
    		// 전체 체크박스 체크 여부에 따른 하위 체크박스들 상태 변경
    		
    		// 판매매출
    		$("#allCheck1").on('change', function(){
    			if ($("#allCheck1").is(":checked")) {
        		    $(".check1").prop("checked", true);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check1:checked").length);
        		  } else {
        		    $(".check1").prop("checked", false);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check1:checked").length);
        		  }
    		});
  			
    		// best30
    		$("#allCheck2").on('change', function(){

    			if ($("#allCheck2").is(":checked")) {
        		    $(".check2").prop("checked", true);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check2:checked").length);
        		  } else {
        		    $(".check2").prop("checked", false);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check2:checked").length);
        		  }
    		});
  			
  			// 오늘의딜
    		$("#allCheck3").on('change', function(){

    			if ($("#allCheck3").is(":checked")) {
        		    $(".check3").prop("checked", true);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check3:checked").length);
        		  } else {
        		    $(".check3").prop("checked", false);
        		    // 선택된 체크박스 개수에 따른 숫자값 변경
        		    $(".select-num").text($(".check3:checked").length);
        		  }
    		});
  			
  			// 라디오버튼 선택시 테이블 교체
  			$("input[name=checktype]").click(function(){
  				
  				var checking = $("input[name=checktype]:checked").val();
  				console.log(checking);
  				if(checking == 'deal'){
  					getTodayDeal();
  				}else if(checking == 'best'){
  					getBest30();
  				}else{
  					getStoreSale();
  				}

  			})
  			
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
  			
  			
  		})
  		
  		function getStoreSale(searchMap){
  			
			$("#table_subject").text("업체별 매출");
			$("#best30").hide();
			$("#storeSales").show();
			$("#todayDeal").hide();
			
			console.log(searchMap);
  			
  			$.ajax({
		  		url:'getStoreSaleList.admin',
		  		method:'post',
		  		contentType : 'application/json; charset=UTF-8',
		  		data : JSON.stringify(searchMap),
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			$(".storeSaleTable").html(resp);
		  			$("input[name=btnradio]").attr("disabled", false);
		  			$("input[name=datepick1]").attr("disabled", false);

		  		}
    		});
  		}
  		
  		function getBest30(searchMap){
  			
			$("#table_subject").text("베스트 30");
			$("#best30").show();
			$("#storeSales").hide();
			$("#todayDeal").hide();
			
			console.log(searchMap);
  			
  			$.ajax({
		  		url:'getBest30List.admin',
		  		method:'post',
		  		contentType : 'application/json; charset=UTF-8',
		  		data : JSON.stringify(searchMap),
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			$(".bestTable").html(resp);
		  			$("input[name=btnradio]").attr("disabled", true);
		  			$("input[name=datepick1]").attr("disabled", true);
		  			
		  

		  		}
    		});
  		}
  		
  		function getTodayDeal(searchMap){
  			
			$("#table_subject").text("오늘의 딜");
			$("#todayDeal").show();
			$("#storeSales").hide();
			$("#best30").hide();
			
			console.log(searchMap);
  			
  			$.ajax({
		  		url:'getTodayDealList.admin',
		  		method:'post',
		  		contentType : 'application/json; charset=UTF-8',
		  		data : JSON.stringify(searchMap),
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			$(".dealTable").html(resp);
		  			$("input[name=btnradio]").attr("disabled", false);
		  			$("input[name=datepick1]").attr("disabled", false);
		  

		  		}
    		});

  		}
  		
    	// 체크 박스 js
    	function checkfunction(){
    		// 하위 체크박스 체크 여부에 따른 전체 체크박스 상태 변경
    		// 하위 체크박스 체크 개수와 전체 개수를 비교
			
    		// 1
			if ($(".check1:checked").length == $(".check1").length && $(".check1").length != 0) {
    		    $("#allCheck1").prop("checked", true);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check1:checked").length);
    		    console.log($(".check1:checked").length);
    		} else {
    		    $("#allCheck1").prop("checked", false);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check1:checked").length);
    		    console.log($(".check1:checked").length);
    		}
    		
			// best 30
    		if ($(".check2:checked").length == $(".check3").length && $(".check2").length != 0) {
    		    $("#allCheck2").prop("checked", true);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check2:checked").length);
    		    console.log($(".check2:checked").length);
    		} else {
    		    $("#allCheck2").prop("checked", false);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check2:checked").length);
    		    console.log($(".check2:checked").length);
    		}
    		
    		// 오늘의 딜
    		if ($(".check3:checked").length == $(".check3").length && $(".check3").length != 0) {
    		    $("#allCheck3").prop("checked", true);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check3:checked").length);
    		    console.log($(".check3:checked").length);
    		} else {
    		    $("#allCheck3").prop("checked", false);
    		    // 선택된 체크박스 개수에 따른 숫자값 변경
    		    $(".select-num").text($(".check3:checked").length);
    		    console.log($(".check3:checked").length);
    		}
    	}
  		
	
    	// 초기화 버튼
    	function clickReset(){
    		
    		$("input[name=datepick2]").attr("disabled", true);
    		dateBtn8Event(); // 날짜 전체로 돌리기
    		$("#btnradio8").prop("checked", true);
			$("#storesaleradio").prop("checked", true);
			$("#search_input").val("");
			
			searching();

    	}
    	
    	
    	function searching(){
    		//var search = $("#searchBox").val();
    		
    		// checkbox 초기화
    		$("#allCheck").prop("checked", false);
    		
    		var startdate = $("input[name=datepick1]").val();
    		var enddate = $("input[name=datepick2]").val();
			var keyword = $("#search_input").val();
			
			searchMap = {
    				"startdate" : startdate,
    				"enddate" : enddate,
    				"keyword" : keyword
    		}

    		var checking = $("input[name=checktype]:checked").val();
			if(checking == 'deal'){
				getTodayDeal(searchMap);
			}else if(checking == 'best'){
				getBest30(searchMap);
			}else{
				getStoreSale(searchMap);
			}
				
				
    	}
  		
  	
  	
  	</script>
  
  </head>
  
  		<jsp:include page="header/header.jsp"></jsp:include>
  
        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <h1 class="mt-4 insert_title">매출 현황</h1>
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
                      <input type="text" class="form-control form-control-sm input-font" id="search_input" placeholder="업체명 or 판매 게시글 명" />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">분류</div>
                  <div class="col search-check-group">
                    <div class="form-check form-check-display">
                      <input class="form-check-input form-check-input-margin" type="radio" value="sales" name="checktype" id="storesaleradio" checked/>
                      <label class="form-check-label" for="storesaleradio"> 매장별 매출 </label>
                    </div>
                    <div class="form-check form-check-display">
                        <input class="form-check-input form-check-input-margin" type="radio" value="best" name="checktype" id="bestsaleradio" />
                        <label class="form-check-label" for="bestsaleradio"> 베스트30 </label>
                      </div>
                      <div class="form-check form-check-display">
                        <input class="form-check-input form-check-input-margin" type="radio" value="deal" name="checktype" id="todaydealradio" />
                        <label class="form-check-label" for="todaydealradio"> 오늘의 딜 </label>
                      </div>
                    
                  </div>
                </div>
              </div>
             
              <div class="container container-option container-option-topPadding bottomline">
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

                        <input type="radio" class="btn-check dateBtn-8" name="btnradio" id="btnradio8" autocomplete="off" checked/>
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
        	<div id="table_subject">업체별 매출</div>
        	
        	<!-- store sale -->
          <table class="table table-hover table-box-style" id="storeSales">
            <thead>
              <tr class="content-table-title">
                <td class="content-table-title-text option-line" style="width: 1rem;">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck1" />
                </td>
                <td class="content-table-title-text option-line" style="width: 5rem;">SID</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">업체명</td>
                <td class="content-table-title-text option-line" style="width: 5rem;">대표명</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">사업자 등록 번호</td>
                <td class="content-table-title-text option-line" style="width: 5rem;">판매건수</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">기간별 매출액</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">브랜드수익</td>
                <td class="content-table-title-text option-line" style="width: 3rem;">수수료</td>
                <td class="content-table-title-text" style="width: 5rem;">상태</td>
              </tr>
            </thead>
            <tbody class="storeSaleTable">
              <!-- for -->
              <c:forEach items="${sellerSaleList }" var="sellerSale">
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                  <input class="form-check-input form-check-input-margin check1" type="checkbox" value="" onclick="checkfunction()">
                </td>
                <td class="content-table-content-text option-line">${sellerSale.seller_id }</td>
                <td class="content-table-content-text option-line">${sellerSale.company_name }</td>
                <td class="content-table-content-text option-line">${sellerSale.representative }</td>
                <td class="content-table-content-text option-line">${sellerSale.registration_num }</td>
                <td class="content-table-content-text option-line">${sellerSale.quantity }</td>
                <td class="content-table-content-text option-line">
           			<fmt:formatNumber type="number" maxFractionDigits="3" value="${sellerSale.payment}" var="payment"/>
           				${payment }
           		</td>
                <td class="content-table-content-text option-line">
                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sellerSale.payment}" var="realpayment"/>
                	${realpayment }
				</td>
                <td class="content-table-content-text option-line">${sellerSale.fee }%</td>
                <td class="content-table-content-text option-line">
                  ${sellerSale.seller_status }
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <!-- best 30 -->
            <table class="table table-hover table-box-style" id="best30">
            <thead>
              <tr class="content-table-title">
                <td class="content-table-title-text option-line" style="width: 1rem;">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck2" />
                </td>
                <td class="content-table-title-text option-line" style="width: 3rem;">POSTNUM</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">브랜드명</td>
                <td class="content-table-title-text option-line" style="width: 15rem;">판매 게시글 명</td>
                <td class="content-table-title-text option-line" style="width: 5rem;">카테고리</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">판매가</td>
                <td class="content-table-title-text option-line" style="width: 4rem;">개수</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">매출액</td>
                <td class="content-table-title-text option-line" style="width: 4rem;">건수</td>
                <td class="content-table-title-text option-line" style="width: 7rem;">게시일</td>
                <td class="content-table-title-text" style="width: 5rem;">오늘의딜유무</td>
              </tr>
            </thead>
            <tbody class="bestTable">
              <!-- for -->
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                  <input class="check2 form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
                </td>
                <td class="content-table-content-text option-line">1001</td>
                <td class="content-table-content-text option-line">뽀대현</td>
                <td class="content-table-content-text option-line">정대현</td>
                <td class="content-table-content-text option-line">가구</td>
                <td class="content-table-content-text option-line">전체</td>
                <td class="content-table-content-text option-line">3</td>
                <td class="content-table-content-text option-line">4.3</td>
                <td class="content-table-content-text option-line">게시</td>
                <td class="content-table-content-text option-line">게시</td>
                <td class="content-table-content-text">게시</td>
              </tr>
            </tbody>
          </table>
          
          <!-- today deal -->
          <table class="table table-hover table-box-style" id="todayDeal">
            <thead>
              <tr class="content-table-title">
                <td class="content-table-title-text option-line" style="width: 1rem;">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck3" />
                </td>
                <td class="content-table-title-text option-line" style="width: 3rem;">POSTNUM</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">브랜드명</td>
                <td class="content-table-title-text option-line" style="width: 15rem;">판매 게시글 명</td>
                <td class="content-table-title-text option-line" style="width: 5rem;">카테고리</td>
                <td class="content-table-title-text option-line" style="width: 8rem;">매출액</td>
                <td class="content-table-title-text option-line" style="width: 4rem;">건수</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">시작일</td>
                <td class="content-table-title-text option-line" style="width: 10rem;">종료일</td>
                <td class="content-table-title-text" style="width: 5rem;">상태</td>
              </tr>
            </thead>
            <tbody class="dealTable">
              <!-- for -->
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                  <input class="check form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
                </td>
                <td class="content-table-content-text option-line">1001</td>
                <td class="content-table-content-text option-line">뽀대현</td>
                <td class="content-table-content-text option-line">정대현</td>
                <td class="content-table-content-text option-line">가구</td>
                <td class="content-table-content-text option-line">전체</td>
                <td class="content-table-content-text option-line">3</td>
                <td class="content-table-content-text option-line">2022-03-12</td>
                <td class="content-table-content-text option-line">4.3</td>
                <td class="content-table-content-text option-line">게시</td>
              </tr>
            </tbody>
          </table>
          
        
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
