<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 배너 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/admincss/fonts.css?after" rel="stylesheet" />
<link href="resources/css/admincss/styles.css" rel="stylesheet" />
<link href="resources/css/admincss/information.css?var=1"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript"
	src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/adminjs/plus_photo.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

	
<script>
	
	$(document).ready(function() {
		
		// 애초에 새 공지사항 등록 눌려져있게
		makeNewInfo();
		
		
		$(".modi_btn").hide();
		$(".del_btn").hide();
		$(".stop_btn").hide();
		$("#info_date").text("");
		var classname = $("#banner_bigname").parent();
	    classname.find("span").text("");
	    var classname = $("#banner_smname").parent();
	    classname.find("span").text("");
		
		$(".content-table-content-text").find("span").text("");
		
		/* 새 공지사항 jquery */
		
		/* 취소 버튼 */
		$(".reset_btn").click(function() {
			$(".cancle2").hide();
			$(".upload2").hide();
			$(".cancle1").hide();
			$(".upload1").hide();
			
			$("#info_newTitle").hide();
			$("#info_title").show();
			$("#info_title").text("");
			
			$(".insert_btn").hide();
			$(".reset_btn").hide();
			$(".modi_btn").hide();
			$(".del_btn").hide();
			$(".stop_btn").hide();
			
			var classname = $("#banner_bigname").parent();
		    classname.find("span").text("");
		    var classname = $("#banner_smname").parent();
		    classname.find("span").text("");
			
			$(".content-table-content-text").find("span").text("");
			
			
		});

		/* 등록 버튼  */   
		$(".insert_btn").click(function() {
	
			if( $("#info_newTitle").val() == "" || $('.banner_bigname').length == 0 ||$('.banner_smname').length == 0){
				alert("제목 또는 이미지를 추가하셔야 합니다 ");
			}else{
		    //파일을 포함한 데이터 db로 넘기기
		    
		    //form data생성
		    var formData = new FormData();
		    
		    //데이터담기
		    var data = {   
    					"banner_title": $("#info_newTitle").val()
                        }
		    
		    // input class 값 
		    var fileInput = $('.banner_bigname');
		    // fileInput 개수를 구한다.
		    for (var i = 0; i < fileInput.length; i++) {
		    	if (fileInput[i].files.length > 0) {
		    		for (var j = 0; j < fileInput[i].files.length; j++) {
		    			console.log(" fileInput[i].files[j] :::"+ fileInput[i].files[j]);
		    			
		    			/* // formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.   */
		    			formData.append('big', $('.banner_bigname')[i].files[j]);
		    		}
		    	}
		    }
		    var fileInput1 = $('.banner_smname');
		    // fileInput 개수를 구한다.
		    for (var i = 0; i < fileInput1.length; i++) {
		    	if (fileInput1[i].files.length > 0) {
		    		for (var j = 0; j < fileInput1[i].files.length; j++) {
		    			console.log(" fileInput1[i].files[j] :::"+ fileInput1[i].files[j]);
		    			
		    			/* // formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.   */
		    			formData.append('small', $('.banner_smname')[i].files[j]);
		    		}
		    	}
		    }
		/*  // 'key'라는 이름으로 위에서 담은 data를 formData에 append한다. type은 json   */
		 formData.append('key', new Blob([ JSON.stringify(data) ], {type : "application/json"}));
		 
		  // ajax 처리 부분 * 
		 //- contentType : false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
		 //- processData : false로 선언 시 formData를 string으로 변환하지 않음 */
		  
		 
		  $.ajax({  
		       url:'eventupload.admin',
		       method:'POST',
		       data: formData,
		       contentType: false,              // * 중요 *
		       processData: false, 				// * 중요 *					
		       enctype : 'multipart/form-data', // * 중요 *
		       success: function(data) { 
		    	   
		    	   location.reload();
		       }
		  

		 })
			}	
	});
		
	/* 개시 중지 버튼 */
	$(".b_btn").click(function(){
		
		  var item = $(this).attr('id') 
		  
		  var bool=$(this).text()
		
		if ($(this).text()=='재개시'){
			bool = "재개시";
		 }else if($(this).text()!=='재개시'){
			 bool = "중지";
		 } 
		
		var bang={ "item" : $(this).attr('id'),
					"bool" : bool}
		
		 
		$.ajax({
			url:'statuschange.admin',
			method:'post',
			contentType: 'application/json; charset=UTF-8',
			data:  JSON.stringify(bang),
			dataType: 'json',
			async: false,
			success:function(data){
				
				
				if(data.bool=='중지'){
					$('.s_'+data.item).text("")
					$('.s_'+data.item).text("중지")
					$('.b_'+data.item).text("")
					$('.b_'+data.item).text("재개시")
				}else if(data.bool=='재개시'){
				
				
				$('.s_'+data.item).text("")
				$('.s_'+data.item).text("개시중")
				$('.b_'+data.item).text("")
				$('.b_'+data.item).text("중지")
				}
			},
			error:function(res){
				console.log('dddddddddddd')
			}
		}) 
		
	})
	/* 내용뿌리기 */
	$(".b_title").click(function(){
	
		// 하단 버튼 바꾸기
		$(".insert_btn").hide();
		$(".reset_btn").hide();
		$(".del_btn").show();
		$("#info_newTitle").hide();
		$("#info_title").show();
		
		$(".upload1").hide();
		$(".upload2").hide();
		$(".cancle1").hide();
		$(".cancle2").hide();
		
		var item = $(this).attr('id');
		
		var fox ={"id" : item}
		
		$.ajax({
			url:'view.admin',
			method:'post',
			contentType: 'application/json; charset=UTF-8',
			data:  JSON.stringify(fox),
			dataType: 'json',
			async: false,
			success:function(data){
				
				$.each(data,function(index,fox){

						
					var UNIX_timestamp = fox["banner_uploaddate"]
					
					  var a = new Date(UNIX_timestamp);
					  var year = a.getFullYear();
					  var month = a.getMonth();
					  var date = a.getDate();
					  var hour = a.getHours();
					  var min = a.getMinutes();
					  var sec = a.getSeconds();
					  var time = year + '-' + '0' +month + '-' + date + ' ' + hour + ':' + min + ':' + sec ;

					 
					$("#info_date").text("");
					$("#info_date").text(time); 
					 $("#info_title").text("")
					$("#info_title").text(""+fox["banner_title"])
					
					// banner id 를 input type hidden으로 세팅
					$(".banner_id_input").val(""+fox["banner_id"]);
					 
					var classname = $("#banner_bigname").parent();
				    classname.find("span").text(""+fox["banner_bigname"]);
				    var classname = $("#banner_smname").parent();
				    classname.find("span").text(""+fox["banner_smname"]);  
					
				})
				
			}
			
			
			})
		
		
	
	});
	});
	
	// 새 공지사항 등록 버튼 클릭
	function makeNewInfo(){
		var classname = $("#banner_bigname").parent();
	    classname.find("span").text("");
	    var classname = $("#banner_smname").parent();
	    classname.find("span").text("");

		$(".insert_btn").show();
		$(".reset_btn").show();
		$(".modi_btn").hide();
		$(".del_btn").hide();
		$(".stop_btn").hide();
		
		$(".cancle2").show();
		$(".upload2").show();
		$(".cancle1").show();
		$(".upload1").show();

		$("#info_date").text("");
		
		$("#info_newTitle").show();
		$("#info_title").hide();

		$("#info_content").text("");
		$("#info_content").removeAttr("disabled");
		
		//작은놈
		const realUpload = document.querySelector('.banner_smname');
		const upload = document.querySelector('.upload2');

		upload.addEventListener('click', () => realUpload.click());
		
		
		//큰놈
		const realUpload1 = document.querySelector('.banner_bigname');
		const upload1 = document.querySelector('.upload1');

		upload1.addEventListener('click', () => realUpload1.click());
		
		$("#banner_bigname").on("change",(e)=>{photo_name(e.target)});
	    function photo_name(input){
	    	var classname = $(input).parent();
	    	console.log(classname);
	        var name = input.value;
	        var names = name.split("\\\\");
	        var trueName = names[names.length-1];
	        classname.find("span").text(trueName);
	    }
	    $("#banner_smname").on("change",(e)=>{photo_name(e.target)});
	    function photo_name(input){
	    	var classname = $(input).parent();
	    	console.log(classname);
	        var name = input.value;
	        var names = name.split("\\\\");
	        var trueName = names[names.length-1];
	        classname.find("span").text(trueName);
	    }
	}
	
	// banner list에서 없애기
	function deleteBannerList(){
		
		var banner_id = $(".banner_id_input").val();

		console.log(banner_id);
		
		$.ajax({
			url:'deleteBanner.admin',
			method:'post',
			contentType: 'application/json; charset=UTF-8',
			data:  JSON.stringify(banner_id),
			dataType: 'json',
			success:function(resp){
				
				console.log(resp);
				location.reload();
				makeNewInfo();
			}
		});
		
		
	}
	
	
	
</script>
</head>

<jsp:include page="header/header.jsp"></jsp:include>
<main style="background-color: #f5f5f5">
	<div class="container-fluid px-4">
		<div class="header_layer">
			<h1 class="mt-4 insert_title">이벤트 배너</h1>

		</div>
		<ol class="breadcrumb mb-3 bottomline">
			<li class="breadcrumb-item active">Manage Announcement</li>
		</ol>
		<div class="container container-option">
			<div class="row optionGroup1">
				<div class="col-1 option-name">등록일</div>
				<div class="col-5 option-line">
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
				<div class="col-6">
					<div class="paddingLeft1">
						<input class="startDate" type="date" id="date" value="" /> <input
							class="endDate" type="date" id="date" value="" />
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
				<td class="content-table-title-text option-line">#</td>
				<td class="content-table-title-text option-line">등록일</td>
				<td class="content-table-title-text option-line">제목</td>
				<td class="content-table-title-text option-line">담당자</td>
				<td class="content-table-title-text option-line">상태</td>
				<td class="content-table-title-text"></td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="BB">
			<!-- for -->
			<tr class="content-table-content content-hover">
			<td class="content-table-content-text option-line">${BB.banner_id}</td>
				<td class="content-table-content-text option-line">${BB.banner_uploaddate}</td>
				
				<td id="${BB.banner_id}" class="content-table-content-text option-line b_title"><a >${BB.banner_title}
				</a></td>
				<td class="content-table-content-text option-line">쎄션</td>
				
				<c:set var="BB.banner_status" value="false" />
				 <c:if test="${BB.banner_status eq 'false'}"><td class="content-table-content-text option-line state0 s_${BB.banner_id}" id="false">중지</td></c:if>
				 <c:if test="${BB.banner_status eq 'true'}"><td class="content-table-content-text option-line state0 s_${BB.banner_id}" id="true">개시중</td></c:if>
				
				<td class="content-table-content-text option-line">
				<c:set var="BB.banner_status" value="false" />


					<c:if test="${BB.banner_status eq 'false'}">
					<button id="${BB.banner_id}"class="btn btn-outline-secondary b_btn b_${BB.banner_id}" style="width: 60px;">재개시</button></c:if>
					<c:if test="${BB.banner_status eq 'true'}">
					<button id="${BB.banner_id}" class="btn btn-outline-secondary b_btn b_${BB.banner_id}" style="width: 60px;">중지</button></c:if>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	
</div>
<div class="">
	<div class="">
		<div class="content-table">
			<div class="content-view-title content-header">
				<span class="content-view-title-text">이벤트 내용 보기</span>
				<button class="btn btn-outline-secondary" id="new_info" onclick="makeNewInfo()">
					새로운 이벤트 등록</button>
			</div>
			<form method="post" action="#" >
				<table class="table table-box-style content-view-table">
					<tbody>
						<tr class="content-table-content">
							<td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5; width: 20%;">등록일</td>
							<td class="content-table-content-text option-line" id="info_date" style="width: 50%;"></td>
							<td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5; width: 10%;">담당자</td>
							<td class="content-table-content-text option-line" id="info_charge" style="width: 20%;">쎄션</td>
						</tr>
						<tr class="content-table-content">
							<td class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">제목</td>
							<td colspan="3" class="content-table-content-text option-line">

								<p id="info_title"></p> 
								<input class="banner_id_input" type="hidden" value="">
								<input class="form-control info_text" id="info_newTitle">
							</td>
						</tr>
						<tr class="content-table-content">
							<td class="content-table-content-text option-line content-table-title" style="background-color: #f5f5f5">이미지(big size)</td>
							<td colspan="2" class="content-table-content-text option-line">
								
							<input type="file" name="banner_bigname" id="banner_bigname" class="banner_bigname" style="display: none" onchange="changeValue(this)" accept="image/*" />
												<span> </span>	
							</td>
							<td colspan="1" class="content-table-content-text">
								<button type="button" class="btn btn-secondary btn-size upload1" >업로드</button>
								<button type="button" class="btn btn-outline-secondary btn-size cancle1" >취소</button>
							</td>
						</tr>
						

						<tr class="content-table-content">
							<td class="content-table-content-text option-line content-table-title"
								style="background-color: #f5f5f5">이미지(small size)</td>
							<td colspan="2" class="content-table-content-text option-line">
								
							<input type="file" name="banner_smname" id="banner_smname" class="banner_smname" style="display: none" onchange="changeValue(this)" accept="image/*" />
								<span> </span>
							</td>
							<td colspan="1" class="content-table-content-text">
								<button type="button" class="btn btn-secondary btn-size upload2" >업로드</button>
								
								<button type="button" class="btn btn-outline-secondary btn-size cancle2">취소</button>
							</td>
						</tr>
						
						<tr class="content-table-content text-end table-btn-layer">
							<td colspan="4">
								<button type="button" class="btn btn-secondary modi_btn">수정</button>
								<button type="button" class="btn btn-secondary stop_btn">중지</button>
								<button type="button" class="btn btn-danger del_btn" onclick="deleteBannerList()">삭제</button>
								<button class="btn btn-success insert_btn">등록</button>
								<button type="reset" class="btn btn-secondary reset_btn">취소</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>


		</div>
	</div>

	<div class="my-5"></div>




	<!-- footer -->
	<footer class="py-4 bg-light mt-auto">

		<a href="#">Privacy Policy</a> &middot;
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; Your Website 2022</div>
				<div>
					<a href="#">Terms &amp; Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="resources/js/adminjs/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="resources/js/adminjs/admin-customerInquiry_ih.js"></script>
</body>

</html>