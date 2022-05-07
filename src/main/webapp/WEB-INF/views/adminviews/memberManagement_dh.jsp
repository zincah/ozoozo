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
    <title>회원관리</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/admincss/fonts.css" rel="stylesheet" />
    <link href="resources/css/admincss/styles.css" rel="stylesheet" />
    <link href="resources/css/admincss/membermanagement_dh.css?var=12" rel="stylesheet" />
    <link href="resources/css/admincss/insertProduct_dh.css?var=1" rel="stylesheet" />
    <link href="resources/css/admincss/seller-productManagement_dh.css?var=1" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script>
    
    	$(document).ready(function(){
    		// 사용자 type에 따라 list 받아오는 부분
       		$("input[name=member]").change(function(){
       			var check = $("input[name=member]:checked").val();
       			getUserDataType(check);
       		});
    		
    		// 사용자 status에 따라 list 받아오는 부분
    		$("#status_select").change(function(){
    			var selectit = $("#status_select").val();
    			getUserDataStatus(selectit);
    		});
    		
    		$("#resetBtn").click(function(){
    			getUserDataType("");
    			$("input[name=datepick2]").attr("disabled", true);
    			// 날짜 오늘날짜로 돌리는 것도~
    			// 초기화 처리 작성해줘야함.
    		});
    		
    		// 날짜
    		$("input[name=datepick1]").change(function(){
    			var datepick1 = $("input[name=datepick1]").val();
    			alert("End Date를 선택해주세요.");
    			$("input[name=datepick2]").attr("disabled", false);
    			
    			getUserDataDate() // 날짜 넘기기
    		})
    		
    		$("input[name=datepick2]").change(function(){
    			var datepick2 = $("input[name=datepick2]").val();
    			alert(datepick2);
    		})

    	});
    	
    	// user data filtering by status
    	// 사용자 상태에 따라 list 받아오는 부분
    	function getUserDataStatus(selectit){
    		
    		$.ajax({
		  		url:'getUserListByStatus.admin',
		  		method:'post',
		  		data: JSON.stringify(selectit),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(resp){
		  			
		  			$("#listTableBody").html("");
	  				var result = ""
	  				
					$.each(resp,function(index,item){
			  				
						var gen = "-";
		  				
		  				if(item["gender"]==true){
		  					gen = "남성";
		  				}else if(item["gender"]==false){
		  					gen = "여성";
		  				}else{
		  					gen = "-";
		  				}
		  				
		  				var join_date = new Date(item["join_date"]).toISOString().split("T")[0];

		  				result += 
		  					'<tr class="content-table-content content-hover">\
							  <td class="content-table-content-text option-line"><input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" /></td>\
							  <td class="content-table-content-text option-line state0">'+item["user_num"]+'</td>\
							<td class="content-table-content-text option-line">'+item["nickname"]+'</td>\
							<td class="content-table-content-text option-line">'+item["user_email"]+'</td>\
							<td class="content-table-content-text option-line">'+item["user_type"]+'</td>\
							<td class="content-table-content-text option-line">0</td>\
							<td class="content-table-content-text option-line">'+gen+'</td>\
							<td class="content-table-content-text option-line">'+join_date+'</td>\
							<td class="content-table-content-text option-line">2022-04-12 16:44</td>\
							<td class="content-table-content-text option-line">0</td>\
							<td class="content-table-content-text option-line">'+item["user_status"]+'</td>';
			  		})
			  			
			  		$("#listTableBody").append(result);
		  		}

    		});
						
    		
    	}
    	
    	// user data filtering by type
    	// 사용자 type에 따라 list 받아오는 부분
    	function getUserDataType(check){

		  	$.ajax({
		  		url:'getUserList.admin',
		  		method:'post',
		  		data: JSON.stringify(check),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(resp){
						
		  				$("#listTableBody").html("");
		  				var result = ""
							
			  			$.each(resp,function(index,item){
			  				
							var gen = "-";
			  				
			  				if(item["gender"]==true){
			  					gen = "남성";
			  				}else if(item["gender"]==false){
			  					gen = "여성";
			  				}else{
			  					gen = "-";
			  				}
			  				
			  				var join_date = new Date(item["join_date"]).toISOString().split("T")[0];

			  				result += 
			  					'<tr class="content-table-content content-hover">\
								  <td class="content-table-content-text option-line"><input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" /></td>\
								  <td class="content-table-content-text option-line state0">'+item["user_num"]+'</td>\
								<td class="content-table-content-text option-line">'+item["nickname"]+'</td>\
								<td class="content-table-content-text option-line">'+item["user_email"]+'</td>\
								<td class="content-table-content-text option-line">'+item["user_type"]+'</td>\
								<td class="content-table-content-text option-line">0</td>\
								<td class="content-table-content-text option-line">'+gen+'</td>\
								<td class="content-table-content-text option-line">'+join_date+'</td>\
								<td class="content-table-content-text option-line">2022-04-12 16:44</td>\
								<td class="content-table-content-text option-line">0</td>\
								<td class="content-table-content-text option-line">'+item["user_status"]+'</td>';
			  			})
			  			
			  			$("#listTableBody").append(result);
			  			
		  			}
		  		});
				
    		
    	}
    		

    
    	
    
    
    </script>
  </head>
 
 		<jsp:include page="header/header.jsp"></jsp:include>
        <main style="background-color: #f5f5f5">
          <div class="container-fluid px-4">
            <h1 class="mt-4 insert_title">회원 관리</h1>
            <ol class="breadcrumb2 bottomline">
              <li class="breadcrumb-item active">Member Management</li>
              <li>
              	<button type="button" class="btn btn-secondary" id="resetBtn">초기화</button>
              </li>
            </ol>

            
            <div class="">
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">검색어</div>
                  <div class="col search-input">
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                      <select class="form-select selectState" id="search_select" aria-label="Default select example">
                        <option selected disabled value="0">분류</option>
                        <option value="1">UID</option>
                        <option value="2">닉네임</option>
                        <option value="3">E-Mail</option>
                      </select>
                    </div>
                    <div class="search-input-box">
                        
                      <input type="text" class="form-control form-control-sm input-font" id="exampleFormControlInput1" placeholder="" />
                    </div>
                    
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">회원 구분</div>
                  <div class="col search-check-group">
                    <div class="form-check form-custom-ay">
					  <input class="form-check-input" type="radio" name="member" id="wholemember" value="" checked>
					  <label class="form-check-label" for="wholemember">
					   	전체
					  </label>
					</div>
					<div class="form-check form-custom-ay">
					  <input class="form-check-input" type="radio" name="member" id="origin" value="일반회원">
					  <label class="form-check-label" for="origin">
					   	일반회원
					  </label>
					</div>
					<div class="form-check form-custom-ay">
					  <input class="form-check-input" type="radio" name="member" id="seller" value="판매회원">
					  <label class="form-check-label" for="seller">
					   	판매회원
					  </label>
					</div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding bottomline">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">회원상태</div>
                  <div class="col search-input">
                    <div class="radio-productCode">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                        <select class="form-select selectState" id="status_select" aria-label="Default select example">
                          <option selected disabled>상태</option>
                          <option value="활동중">활동중</option>
                          <option value="활동정지">정지</option>
                          <option value="휴면상태">휴면</option>
                        </select>
                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="container container-option container-option-topPadding">
                <div class="row optionGroup1">
                  <div class="col-1 status-name">가입 기간</div>
                  <div class="col search-input">
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
                      <input class="startDate" type="date" name="datepick1" id="date" value="" />
                      <input class="endDate" type="date" name="datepick2" id="date" value="" disabled/>
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
					<li><h6 class="dropdown-header">고객 설정 일괄 변경</h6></li>
					<li>
						<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modal-status-select" id="productStatusChange">회원상태변경</a>
					</li>
				</ul>
			</div>

          <table class="table table-hover table-box-style">
            <thead>
              <tr class="content-table-title">
                <td class="content-table-title-text option-line">
                  <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="allCheck" />
                </td>
                <td class="content-table-title-text option-line">UID</td>
                <td class="content-table-title-text option-line">닉네임</td>
                <td class="content-table-title-text option-line">이메일</td>
                <td class="content-table-title-text option-line">회원유형</td>
                <td class="content-table-title-text option-line">구매건수</td>
                <td class="content-table-title-text option-line">성별</td>
                <td class="content-table-title-text option-line">회원가입일</td>
                <td class="content-table-title-text option-line">최종로그인</td>
                <td class="content-table-title-text option-line">Point</td>
                <td class="content-table-title-text ">현재 상태</td>
              </tr>
            </thead>
            <tbody id="listTableBody">
              <!-- for -->
              <c:forEach items="${userList }" var="user">
              <tr class="content-table-content content-hover">
                <td class="content-table-content-text option-line">
                	<input class="form-check-input form-check-input-margin check" type="checkbox" value=""/>
                </td>
                <td class="content-table-content-text option-line state0">${user.user_num }</td>
                <td class="content-table-content-text option-line">${user.nickname }</td>
                <td class="content-table-content-text option-line">${user.user_email }</td>
                <td class="content-table-content-text option-line">${user.user_type }</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">
	                <c:choose>
						<c:when test="${user.gender == true}">남성</c:when>
						<c:when test="${user.gender == false}">여성</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>

                </td>
                <td class="content-table-content-text option-line">
                	<!--<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.join_date}"/>-->
                	<fmt:formatDate pattern="yyyy-MM-dd" value="${user.join_date}"/>
                </td>
                <td class="content-table-content-text option-line">2022-04-12 16:44</td>
                <td class="content-table-content-text option-line">0</td>
                <td class="content-table-content-text option-line">${user.user_status }</td>
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
                <a href="#">Privacy Policy</a>
                &middot;
                <a href="#">Terms &amp; Conditions</a>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    
	<!-- modal 추가 -->
	<div class="modal fade" id="modal-status-select" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-small">
	    <div class="modal-content">
	      <div class="modal-header">
	        <p class="modal-title" id="">회원상태 변경</p>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body modal-status-select-product">
				<div class="modal-status-select-product-num">
					<span>선택된 회원 수 : </span> 
					<span class="modal-status-select-product-num-value productNum" id="select-num">0</span>
					<span>명</span>
				</div>
				<div class="modal-status-select">
					<div class="btn-group modal-status-select-btn-group" role="group" aria-label="Basic radio toggle button group">
						<select class="form-select modal-status-select-option" aria-label="Default select example" id="statusOption">
							<option value="1">활동중</option>
							<option value="2">휴면상태</option>
							<option value="3">활동정지</option>
						</select>
					</div>
				</div>
			</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn modal-status-select-submit-button">변경</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="resources/js/adminjs/admin-productManagement_ih.js"></script>
    <script src="resources/js/adminjs/checkbox_admin.js"></script>
    <script src="resources/js/adminjs/date_admin.js"></script>
  </body>
</html>
