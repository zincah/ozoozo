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
    <link href="resources/css/admincss/paging.css?var=12" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- SheetJS CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
	<!-- FileSaver saveAs CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <script>
    
    	var excelHandler;
    
    	$(document).ready(function(){
 

    		/* 상품 선택 체크박스 */
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

    		// setpage
			var pageNum = ${pageMaker.getPageNum()};
    		setPage(pageNum);
    		
    		// 검색 기능
    		// 날짜
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
    			// 날짜 선택
    			getData();
    		})
    		
			$("input[name=btnradio]").click(function(){
				// 날짜 버튼들 누르면 반응
    			getData();
    		})
    		
    		$("#large-select").change(function(){
    			// 카테고리 선택
    			getData();
    		})

    		$("input[name=posttype]").click(function(){
    			// 포스팅 타입 선택
    			getData();
    		})
    		
    		$("#search_select").change(function(){
    			$("#search_input").prop("disabled", false);
    			searching();
    		});
    		
    		$(".excelDown").click(function(){
    	    	excelHandler = {
    	    			getExcelFileName : function(){
    	    	            return 'table-test.xlsx';
    	    	        },
    	    	        getSheetName : function(){
    	    	            return 'postTable';
    	    	        },
    	    	        getExcelData : function(){
    	    	            return document.getElementById('postTable'); 
    	    	        },
    	    	        getWorksheet : function(){
    	    	            return XLSX.utils.table_to_sheet(this.getExcelData());
    	    	        }	
    	    	}
    			excelExport();
    		})

    	});
    	
    	
    	function getData(){
    		
    		// checkbox 초기화
    		$("#allCheck").prop("checked", false);
			
			// page 정보
			var thispage = $("#findPage").val();
			console.log(thispage);
			
    		//조건들 받아오기
    		var posttype = $("input[name=posttype]:checked").val();
			var dealtype;
    		
    		if(posttype == '신청'){
    			var dealtype = posttype;
    			var posttype = '';
    		}
    		
    		var category = $("#large-select").val();
    		var startdate = $("input[name=datepick1]").val();
    		var enddate = $("input[name=datepick2]").val();

			var pack = $("#search_select option:selected").val();
			var keyword = $("#search_input").val();

			searchMap = {
    				"posttype" : posttype,
    				"dealtype" : dealtype,
    				"category" : category,
    				"startdate" : startdate,
    				"enddate" : enddate,
    				"pack" : pack,
    				"keyword" : keyword
    		}
			
			$.ajax({
		  		url:'productSearch.admin',
		  		method:'post',
		  		data: JSON.stringify(searchMap),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			printTable(resp);
		  			setPage(1);
		  			

		  		}
    		});
			
    	}
    	
    	function searching(){

    		$("#search_input").keyup(function(){
    			
        		// checkbox 초기화
        		$("#allCheck").prop("checked", false);
    			
    			// page 정보
    			var thispage = $("#findPage").val();
    			console.log(thispage);
    			
        		//조건들 받아오기
        		var posttype = $("input[name=posttype]:checked").val();
        		var dealtype;
        		
        		if(posttype == '신청'){
        			var dealtype = posttype;
        			var posttype = '';
        		}
        		
        		var category = $("#large-select").val();
        		var startdate = $("input[name=datepick1]").val();
        		var enddate = $("input[name=datepick2]").val();

    			var pack = $("#search_select option:selected").val();
    			var keyword = $("#search_input").val();

    			searchMap = {
        				"posttype" : posttype,
        				"dealtype" : dealtype,
        				"category" : category,
        				"startdate" : startdate,
        				"enddate" : enddate,
        				"pack" : pack,
        				"keyword" : keyword
        		}
    			
    			$.ajax({
    		  		url:'productSearchBox.admin',
    		  		method:'post',
    		  		data: JSON.stringify(searchMap),
    		  		contentType : 'application/json; charset=UTF-8',
    		  		dataType : 'html',
    		  		success : function(resp){
    		  			
    		  			printTable(resp);
    		  			setPage(1);

    		  		}
        		});

    		});
    	}

    	
    	function setPage(pageNum){
    		
    		var total = $("#totalcount").val();
    		console.log(total);
    		var amount = ${pageMaker.getAmount()};

    		var endPage = Math.ceil(pageNum/10.0)*10;
    		var startPage = endPage - 9;

    		if(total == 0){
    			var realEnd = 1;
    		}else{
    			var realEnd = Math.ceil((total*1.0)/amount);
    		}

    	    if(realEnd < endPage){
    	    	endPage = realEnd;
    	    }
    	    
    	    var prev = startPage > 1;
    	    var next = endPage < realEnd; // 쓸지안쓸지
    	    
    	    $(".page-layer").html("");
    	    
			for(var i=startPage; i<=endPage; i++){
				
				if(pageNum == i){
					var li = '<li class="page-item active"><a class="page-link" href="'+i+'">'+i+'</a></li>';
				}else{
					var li = '<li class="page-item"><a class="page-link" href="'+i+'">'+i+'</a></li>';
				}
				
				$(".page-layer").append(li);

			}
			
			if(endPage == 1){
				$(".page-layer").hide();
				$(".page-outer").hide();
			}else{
				$(".page-layer").show();
				$(".page-outer").show();
			}
			
			
    		// paging a link click
        	$(".page-item a").on("click", function(e){

    			e.preventDefault();
    			var pageNum = $(this).attr("href");
    			$("#findPage").val(pageNum);
    			console.log($("#findPage").val(pageNum));
    			movepage(pageNum);
    		});

    		
    	}

    	// page 이동
    	function movepage(pageNum){
    		
    		// checkbox 초기화
    		$("#allCheck").prop("checked", false);
			
    		//조건들 받아오기
    		var posttype = $("input[name=posttype]:checked").val();
    		var dealtype;
    		
    		if(posttype == '신청'){
    			var dealtype = posttype;
    			var posttype = '';
    		}
    		
    		var category = $("#large-select").val();
    		var startdate = $("input[name=datepick1]").val();
    		var enddate = $("input[name=datepick2]").val();

			var pack = $("#search_select option:selected").val();
			var keyword = $("#search_input").val();

			searchMap = {
    				"posttype" : posttype,
    				"dealtype" : dealtype,
    				"category" : category,
    				"startdate" : startdate,
    				"enddate" : enddate,
    				"pack" : pack,
    				"keyword" : keyword,
    				"pageNum" : pageNum
    		}
    		

    		$.ajax({
		  		url:'movePaging.admin',
		  		method:'post',
		  		data: JSON.stringify(searchMap),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			printTable(resp);
		  			setPage(pageNum);
		  			


		  		},
		  		error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
    		});
    		
    	}
    	
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
    	
    	// 오늘의 딜 상태 변경
    	function updateDealStatus(){
    		
    		// 게시면은 insert 중지면은 delete
    		
    		var postNumList = []
    		
    		$("input:checkbox[name=productcheckbox]:checked").each(function(){
      			var checkit = $(this).prev().val();
      			postNumList.push(checkit);
      		});
    		
    		postNumList.push($("#findPage").val());
    		postNumList.push($("#dealStatusOption").val());
    	
    		
    		$.ajax({
		  		url:'updateDealStatus.admin',
		  		method:'post',
		  		data: JSON.stringify(postNumList),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
					
		  			$(".modal").modal('hide');
		  			$(".modal-status-select-option option:eq(0)").prop("selected", true);
		  			$("#select-num").text("0");
		  			
		  			
		  			printTable(resp);
		  			setPage($("#findPage").val());
		  			clickReset2();
		  			
		  			}
		  		
		  		});
    	}
    	
    	// 쿠폰 상태 변경
    	function updateCouponStatus(){
    		
    		var postNumList = []
    		
    		$("input:checkbox[name=productcheckbox]:checked").each(function(){
      			var checkit = $(this).prev().val();
      			postNumList.push(checkit);
      		});
    		
    		postNumList.push($("#findPage").val());
    		postNumList.push($("#couponStatusOption").val());
    		
    		
    		$.ajax({
		  		url:'updateCoupon.admin',
		  		method:'post',
		  		data: JSON.stringify(postNumList),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
					
		  			$(".modal").modal('hide');
		  			$(".modal-status-select-option option:eq(0)").prop("selected", true);
		  			$("#select-num").text("0");
		  			
		  			
		  			printTable(resp);
		  			setPage($("#findPage").val());
		  			clickReset2();
		  			
		  			}
		  		
		  		});
    	}
    	
    	// 게시물 상태 변경
    	function updatePostStatus(){
    		// checkbox 값 한개씩 가져오기
    		var postNumList = []
    		
    		$("input:checkbox[name=productcheckbox]:checked").each(function(){
      			var checkit = $(this).prev().val();
      			postNumList.push(checkit);
      		});
    		
    		postNumList.push($("#findPage").val());
    		postNumList.push($("#productStatusOption").val());
    		
    		console.log($("#productStatusOption").val());
    		

    		$.ajax({
		  		url:'updateProductStatus.admin',
		  		method:'post',
		  		data: JSON.stringify(postNumList),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
					
		  			$(".modal").modal('hide');
		  			$(".modal-status-select-option option:eq(0)").prop("selected", true);
		  			$("#select-num").text("0");
		  			
		  			printTable(resp);
		  			setPage($("#findPage").val());
		  			clickReset2();
		  			
		  			}
		  		
		  		});
				
    		
    	}
    	
    	function printTable(resp){
    		$("#postTableBody").html(resp);
    		
    		// checkbox 초기화
    		$("#allCheck").prop("checked", false);
    		checkfunction();
    	}
    	
    	// 초기화 버튼 눌렀을 때 리스트까지 한꺼번에 뽑아주기 위한 용도
    	function clickReset(){
    		
    		$("input[name=datepick2]").attr("disabled", true);
    		dateBtn8Event(); // 날짜 전체로 돌리기
    		$("#btnradio8").prop("checked", true);
    		
    		$("#search_select option:eq(0)").prop("selected", true);
    		$("#search_input").prop("disabled", true);
			$("#search_input").val("");
			
			$("#large-select option:eq(0)").prop("selected", true);
			$('input[name="posttype"]')[0].checked = true;
			
			getData();

    	}
    	
    	// 상태변경시 적용하는 초기화 용도
		function clickReset2(){
    		
    		$("input[name=datepick2]").attr("disabled", true);
    		dateBtn8Event(); // 날짜 전체로 돌리기
    		$("#btnradio8").prop("checked", true);
    		
    		$("#search_select option:eq(0)").prop("selected", true);
    		$("#search_input").prop("disabled", true);
			$("#search_input").val("");
			
			$("#large-select option:eq(0)").prop("selected", true);
			$('input[name="posttype"]')[0].checked = true;
			


    	}
    	
    	function excelExport(){
    		
    		// step 1. workbook 생성
    	    var wb = XLSX.utils.book_new();

    	    // step 2. 시트 만들기 
    	    var newWorksheet = excelHandler.getWorksheet();
    	    
    	    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
    	    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

    	    // step 4. 엑셀 파일 만들기 
    	    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

    	    // step 5. 엑셀 파일 내보내기 
    	    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
    		
    	}
    	
    	// excel download
    	function s2ab(s) { 
    	    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
    	    var view = new Uint8Array(buf);  //create uint8array as viewer
    	    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
    	    return buf;    
    	}
    	

    	
		
    </script>
  </head>
  
  		<jsp:include page="header/header.jsp"></jsp:include>

        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <div class="header_layer">
              <h1 class="mt-4 insert_title">판매 게시글 등록 관리</h1>
              
            </div>
            <ol class="breadcrumb2 mb-3 bottomline">
              <li class="breadcrumb-item active">Manage sales posts</li>
              <li>
              	<button type="button" class="btn btn-secondary" onclick="clickReset()">초기화</button>
              </li>
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
                          <option selected value="">카테고리 전체</option>
                          <option value="가구">가구</option>
                          <option value="패브릭">패브릭</option>
                          <!-- 
                          <option value="조명">조명</option>
                          <option value="가전">가전</option>
                          <option value="주방용품">주방용품</option>
                          <option value="데코/식물">데코/식물</option>
                          <option value="수납/정리">수납/정리</option> -->
                        </select>
                      </div>
                      <div class="radio_layer paddingLeft1">
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="posttype" id="flexRadioDefault1" checked="" value="">
                          <label class="form-check-label" for="flexRadioDefault1"> 전체 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="posttype" id="flexRadioDefault2" value="보류중">
                          <label class="form-check-label" for="flexRadioDefault2"> 보류중 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="posttype" id="flexRadioDefault3" value="승인대기">
                          <label class="form-check-label" for="flexRadioDefault3"> 승인대기 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="posttype" id="flexRadioDefault4" value="판매중">
                          <label class="form-check-label" for="flexRadioDefault4"> 판매중 </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input radio-custom" type="radio" name="posttype" id="flexRadioDefault5" value="신청">
                          <label class="form-check-label" for="flexRadioDefault5"> 오늘의딜승인대기 </label>
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
                        <select class="form-select selectState" id="search_select" aria-label="Default select example" style="width: 150px;">
                          <option selected value="">검색 필터</option>
                          <option value="company_name">브랜드명</option>
                          <option value="post_name">판매 게시글 명</option>
                          <option value="subcate_name">종류</option>
                        </select>
                      </div>
	                </div>
                    
                    <input class="form-control size-input" id="search_input" type="text" disabled>
                </div>
            </div>
            </div>
            
        </main>
        <!-- content -->
        <div class="content-table">
          <div class="dropdown setting-button text-end" style="margin-bottom: 0.5rem;">
          	<button class="btn excelDown btn-outline-secondary" style="padding: 0.2rem 0.75rem;">엑셀다운</button>
            <button class="settingBtn" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                   <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"></path>
                 </svg>
			</button>
			<ul class="dropdown-menu settingBtnDropdown" aria-labelledby="dropdownMenuButton1" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(1px, 28px, 0px);" data-popper-placement="bottom-end">
				<li><h6 class="dropdown-header">판매 상품 관리</h6></li>
				<li>
					<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modal-status-select" id="productStatusChange">게시물상태변경</a>
					<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#coupon_register" id="couponStatusChange">쿠폰등록</a>
					<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#today_deal_register" id="dealStatusChange">오늘의딜 승인</a>
				</li>
			</ul>
          </div>
          <div class="table_layer">
            <table class="table table-hover table-box-style" id="postTable">
              <thead>
                <tr class="content-table-title">
                  <td class="content-table-title-text option-line" style="width: 1rem;">
                  	<input type="hidden" id="findPage" value=1>
                    <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck"/>
                  </td>
                  <td class="content-table-title-text option-line" style="width: 4rem;">브랜드명</td>
                  <td class="content-table-title-text option-line" style="width: 10rem;">판매 게시글 명</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">카테고리</td>
                  <td class="content-table-title-text option-line" style="width: 1rem;">건</td>
                  <td class="content-table-title-text option-line" style="width: 4rem;">종류</td>
                  <td class="content-table-title-text option-line" style="width: 5rem;">쿠폰정보</td>
                  <td class="content-table-title-text option-line" style="width: 7rem;">신청일</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">오늘의딜</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">베스트</td>
                  <td class="content-table-title-text option-line" style="width: 3rem;">상태</td>
                </tr>
              </thead>
              <tbody id="postTableBody">
                <!-- for -->
                <input type="hidden" value="${totalcount}" id="totalcount">
                <c:forEach items="${postList }" var="post">
	                <tr class="content-table-content content-hover">
	                  <td class="content-table-content-text option-line">
	                      <input type="hidden" value="${post.post_id }"/>
	                      <input class="check form-check-input form-check-input-margin" type="checkbox" value="" name="productcheckbox" onchange="checkfunction()"/>
	                  </td>
	                  <td class="content-table-content-text option-line">${post.company_name }</td>
	                  <td class="content-table-content-text option-line">
	                    <a href="/house/postingInfo.admin?postcode=${post.post_id }" target="_blank">${post.post_name }</a>
	                    </td>
	                  <td class="content-table-content-text option-line">${post.cate_name }</td>
	                  <td class="content-table-content-text option-line">${post.product_count }</td>
	                  <td class="content-table-content-text option-line">${post.subcate_name }</td>
	                  <td class="content-table-content-text option-line">
	                   <c:choose>
							<c:when test="${post.post_couponid != null}">
								${post.coupon_title }
								<input type="hidden" value="${post.post_couponid }">
							</c:when>
							<c:when test="${post.post_couponid != null}">-</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
	                  </td>
	                  <td class="content-table-content-text option-line">
	                  	<fmt:formatDate value="${post.product_created }" pattern="yyyy-MM-dd HH:mm" />
	                  </td>
	                  <td class="content-table-content-text option-line">
		                  <c:choose>
								<c:when test="${post.deal_status != null}">${post.deal_status }</c:when>
								<c:when test="${post.deal_status == null}">-</c:when>
								<c:otherwise>-</c:otherwise>
						</c:choose>
	                  </td>
	                  <td class="content-table-content-text option-line">
	                  	<c:choose>
							<c:when test="${post.best_product == true}">o</c:when>
							<c:when test="${post.best_product == false}">x</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
	                  </td>
	                  <td class="content-table-content-text option-line">${post.post_status }</td>
	                </tr>
				</c:forEach>
              </tbody>
            </table>
            
            <div class="pagi mt-3">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
              <!-- 
                <li class="page-item page-outer">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">
                    	<i class="fa-solid fa-angle-left"></i>
                    </span>
                  </a>
                </li> -->
                <div class="page-layer">
                	
                
                
                </div>
                <!-- 
                <li class="page-item page-outer">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">
                    	<i class="fa-solid fa-angle-right"></i>
                    </span>
                  </a>
                </li> -->
              </ul>
            </nav>
          </div>
            
            
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
						<span class="modal-status-select-product-num-value productNum select-num">0</span>
						<span>개</span>
					</div>
					<div class="modal-status-select">
						<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="couponStatusOption">
								<c:forEach items="${couponList }" var="coupon">
									<option value="${coupon.coupon_id }">${coupon.coupon_title } / ${coupon.coupon_subtitle }</option>
								</c:forEach>
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
						<span class="modal-status-select-product-num-value productNum select-num">0</span>
						<span>개</span>
					</div>
					<div class="modal-status-select">
						<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="productStatusOption">
								<option value="판매중">판매중</option>
								<option value="승인대기">승인대기</option>
								<option value="보류중">보류중</option>
							</select>
						</div>
					</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn modal-status-select-submit-button" onclick="updatePostStatus()">변경</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 상태변경 modal -->
		<div class="modal fade" id="today_deal_register" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <p class="modal-title" id="">오늘의 딜 상태변경</p>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body modal-status-select-product">
					<div class="modal-status-select-product-num">
						<span>선택된 게시물 수 : </span> 
						<span class="modal-status-select-product-num-value productNum select-num">0</span>
						<span>개</span>
					</div>
					<div class="modal-status-select">
						<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
							<select class="form-select modal-status-select-option" aria-label="Default select example" id="dealStatusOption">
								<option value="게시">게시</option>
								<option value="중지">중지</option>
							</select>
						</div>
					</div>
				</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn modal-status-select-submit-button" onclick="updateDealStatus()">변경</button>
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
    <script src="resources/js/adminjs/date_admin.js?var=1"></script>
    <script src="resources/js/adminjs/checkbox.js"></script>
    
  </body>
</html>
