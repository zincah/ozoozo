<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품등록</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?var=1" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css?var=212" rel="stylesheet" />
<jsp:include page="header/headerModalView.jsp"></jsp:include>
<script type="text/javascript" src="resources/js/sellerjs/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/sellerjs/plus_photo.js?var=12"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script>

      $(document).ready(function () {
    	  

	   	  // enter event 제거 : 자동 form전송 막기위해서
	   	  $('form').keydown(function() {
			    if (event.keyCode === 13) {
			        event.preventDefault();
			    }
			});
			    	  
        /* 판매가 입력 관련 js */
        $(".sale_price_layer").hide();

        $(".sale_percent_input").keydown(function (key) {
          if (key.keyCode == 13) {
        	var pri = $("#represent_price").val();
        	var per = $(".sale_percent_input").val();
        	var rper = 100 - per;
        	var fpri = (pri/100*rper); // 할인된 금액
        	var mi = pri - fpri; // 차액
        	$(".sale_price").text(fpri + "원");
        	$(".mi_saleprice").text("("+mi+"원 할인)");
            $(".sale_price_layer").show();
            event.preventDefault();
          } else if ($(".sale_percent_input").text() == "") {
        	$(".sale_price").text("");
            $(".sale_price_layer").hide();
          }
        });

        /* 카테고리 토글 */
        var optionMap = new Object();

        $(".option_list").click(function () {
          var option_value = $(this).text();
          var option_btn = $(this).parents("ul").siblings("button").text();

          optionMap.option = option_btn;
          optionMap.option_value = option_value;

          var html = "<span>" + option_btn + " : " + option_value + "</span>&nbsp&nbsp";

          $(".option_text").append(html);
        });

        /* 카테고리 */
        /* 클래스를 추가하고 없애는 방식으로 해서 그걸 읽어야할듯 */

        $(".cate1").click(function () {
          $(".cate1").css("background-color", "#f5f5f5");
          $(this).css("background-color", "#828282");
        });

        $(".cate2").click(function () {
          $(".cate2").css("background-color", "#f5f5f5");
          $(this).css("background-color", "#828282");
        });

        $(".cate3").click(function () {
          $(".cate3").css("background-color", "#f5f5f5");
          $(this).css("background-color", "#828282");
        });

        
        /* 세일 설정 jquery */
        $("#sale_notset").click(function () {
          $("#sale_notset").removeClass("btn-outline-secondary").addClass("btn-secondary");
          $("#sale_set").removeClass("btn-secondary").addClass("btn-outline-secondary");
          $(".sale_percent_input").attr("disabled", "true");
        });

        $("#sale_set").click(function () {
          $("#sale_set").removeClass("btn-outline-secondary").addClass("btn-secondary");
          $("#sale_notset").removeClass("btn-secondary").addClass("btn-outline-secondary");
          $(".sale_percent_input").removeAttr("disabled");
        });
        

        

      });
      
   	// 대표사진 clone
   	var photo_count = 0;

	function mainPhotoplus(){
		
		if(photo_count >= 4){
			alert("5개를 초과할 수 없습니다.");
		}else{
			var cloneElements = $("#thisphoto").clone();
		    cloneElements.appendTo(".photos");
		}

	    $(".photo_layer").each(function(photo_count, photo_layer){
	        $(this).attr("id", "photo_layer"+(photo_count));
	    });
	    
	    $(".photo_upload").each(function(photo_count, photo_upload){
	    	$(this).attr("id", "photo_upload"+(photo_count));
	    });
	    
	    $(".main_photo").each(function(photo_count, main_photo){
	    	$(this).attr("id", "main_photo"+(photo_count));
	    });
	    
	    $(".image_show").each(function(photo_count, image_show){
	    	$(this).attr("id", "image_show"+(photo_count));
	    });
	    
	    photo_count++;
	    
	};

      function mainFileUpload(event) {
		
    	  var checkId = event.id;
    	  var checkSu = checkId.substr(-1);
    	  
    	  $('#main_photo'+checkSu).click();

      }
      
      function delPhoto(delit){
    	  var parentId = delit.parentNode.id;
    	  var checkSu = parentId.substr(-1);
    	  
    	  var container = document.getElementById('image_show'+checkSu);
    	  if(container.hasChildNodes()){
    		  container.removeChild(container.firstChild);
    		  $('#image_show'+checkSu).hide();
    	  }
    	  
    	  
      }

      /* file 이름 나옴 */
      function changeValue(input) {
    	  console.log("change")
    	  var checkId = input.id;
    	  var checkSu = checkId.substr(-1);
    	  
        var file = input.files[0]; //선택된 파일 가져오기
        var filename;
        if(file != null){
        	filename = file.name;
        	console.log(filename);
        }
        
        if (/(\.gif|\.jpg|\.jpeg|\.webp|\.png|\.PNG)$/i.test(filename) == false) {
        	$('#main_photo'+checkSu).val("");
            alert("이미지 형식의 파일을 선택하십시오");
        }else{
        	
            //미리 만들어 놓은 div에 text(파일 이름) 추가
            //var name = document.getElementById('fileName');
            //name.textContent = file.name;

            //새로운 이미지 div 추가
            var newImage = document.createElement("img");
            newImage.setAttribute("class", "upload_img");

            //이미지 source 가져오기
            newImage.src = URL.createObjectURL(file);
            newImage.style.visibility = "visible";
            newImage.style.objectFit = "contain";
            alert(URL.createObjectURL(file));

            //이미지를 image-show div에 추가
            var container = document.getElementById('image_show'+checkSu);
            container.appendChild(newImage);
            $('#image_show'+checkSu).show();
        	
        }
        
      }


      
      	// 데이터모으기
      	// 할인율 설정안함 처리 해줘야해
      	
	    function gatherData(){
      		
      		
      		if($("input[name=post_name]").val()=="" || $("#category").val()==null ||
      				$("#middle-select").val()==null ||
      				$("#option1_name").val()=="" || $("#product_title").val()=="" ||
      				$("#option1").val()=="" || $("#product_price").val()=="" ||
      				$("#product_quantity").val()=="" || $("#table-productTitle").val()=="" ||
      				$("#table-kc").val()=="" || $("#table-color").val()=="" || 
      				$("#table-component").val()=="" || $("#table-material").val()=="" ||
      				$("#table-manufacturer").val()=="" || $("#table-country").val()=="" ||
      				$("#table-size").val()=="" ||  $("#table-delivery").val()=="" ||
      				$("#table-qa").val()=="" || $("#table-cstel").val()=="" ||
      				$("#represent_price").val()=="" || $("#sale_ratio").val()=="" || 
      				$("#post_shipfee").val()=="" || $("#shiptable_info").val()=="" ||
      				$("#shiptable_fee").val()=="" || $("#shiptable_plusfee").val()=="" ||
      				$("#shiptable_plusfee").val()=="" || $("#shiptable_unable").val()=="" ||
      				$("#shiptable_propotionalfee").val()=="" || $("#refundtable_fee").val()=="" ||
      				$("#exchangetable_fee").val()=="" || $("#refundtable_address").val()==""){
      			
      			alert("내용이 제대로 입력되지 않았습니다.");
      		}else{

          		checkProduct();
          		photoUpload();
          		
          		var wholelist = []
          		var jsonmove = []
          		titles = [];
          		
          		var checkmap = {};
          		
          		var topcate = $("#category").val();

    			var cates = {
    					"cate_code" : topcate,
    			}
          		
          		$(".checkTitle").each(function(){
          			var checkTitle = $(this).text();
          			titles.push(checkTitle);
          		})
          		
          		for(var i=0; i<titles.length; i++){
          			var checkli = []

          			$('input:checkbox[name='+titles[i]+']:checked').each(function(){
          				var checkit = $(this).val();
          				checkli.push(checkit);
          			});
          			
          			var key = titles[i];
          			checkmap[key] = checkli;
    				
          		}
          		
    			/*
          		if($("#option_input").find("#rental").val() != ""){
          			checkmap.상품유형 = [$("#option_input").find("#rental").val()];
          		}else{
          			checkmap.상품유형 = []
          		}
          		
          		if($("#option_input").find("#refurbish").val() != ""){
          			checkmap.상품유형 = [$("#option_input").find("#rental").val()];
          		}else{
          			checkmap.상품유형 = []
          		}*/

          		
          		console.log(checkmap);
    			
    			var table = {
    					"table_productTitle" : $("#table-productTitle").val(),
    					"table_kc" : $("#table-kc").val(),
    					"table_color" : $("#table-color").val(),
    					"table_component" : $("#table-component").val(),
    					"table_material" : $("#table-material").val(),
    					"table_manufacturer" : $("#table-manufacturer").val(),
    					"table_country" : $("#table-country").val(),
    					"table_size" : $("#table-size").val(),
    					"table_delivery" : $("#table-delivery").val(),
    					"table_qa" : $("#table-qa").val(),
    					"table_cstel" : $("#table-cstel").val(),
    					"shiptable_info" : $("#shiptable_info").val(),
    					"shiptable_fee" : $("#shiptable_fee").val(),
    					"shiptable_plusfee" : $("#shiptable_plusfee").val(),
    					"shiptable_unable" : $("#shiptable_unable").val(),
    					"shiptable_propotionalfee" : $("#shiptable_propotionalfee").val(),
    					"refundtable_fee" : $("#refundtable_fee").val(),
    					"exchangetable_fee" : $("#exchangetable_fee").val(),
    					"refundtable_address" : $("#refundtable_address").val()
    			}
    			
    			jsonmove.push(checkmap);
    			jsonmove.push(table);
    			jsonmove.push(cates);
    			
    			console.log(JSON.stringify(jsonmove));
    			
    			// ajax로 데이터 넘기기
    		  	$.ajax({
    	  		url:'getJson.seller',
    	  		method:'post',
    	  		data: JSON.stringify(jsonmove),
    	  		contentType : 'application/json; charset=UTF-8',
    	  		dataType : 'json',
    	  		async: false,
    	  		success : function(resp){
    					
    	  				alert("filter data");

    	  			}
    	  		});
      			
      		}

	    }
      	
      	// filtering option 뽑기
      	function getFilterOption(category){
      		
      		
      	
      		
      		$.ajax({
		  		url:'getFilterOption.seller',
		  		method:'post',
		  		data: JSON.stringify(category),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
		  			
		  			$(".filtering-layer").html("");
		  			$(".filtering-layer").append(resp);
		  		}
		  		
		  		})
      		
      	}
      
      	
      	// category 뽑기
      	function changeFirstOption(){
			var category = {"cate_code" : $("#category").val()}

			getFilterOption(category);
			
		  	$.ajax({
		  		url:'getMiddleCategory.seller',
		  		method:'post',
		  		data: JSON.stringify(category),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(resp){
		  			$("#middle-select").html("<option selected>중분류</option>");
		  			
		  			$("#middle-select").removeAttr("disabled");
		  			var midcate = ""
		  			//console.log(resp);
					
		  			$.each(resp,function(index,item){
		  				//console.log(item["subcate_code"]);
		  				midcate += '<option value="'+item["subcate_code"]+'">'+item["subcate_name"]+'</option>';
		  			})
		  			
		  			$("#middle-select").append(midcate);
		  		    
		  			}
		  			
		  			// 성공시 실패시 예외처리 해줘야함
		  		})
		  		
		  		var cate = $("#category option:selected").text();
		   		$("#option-layer-name").text("옵션 (" + cate + ")");
		  		
  		}

      	
      	// 소분류 카테고리 뽑기
      	function changeSecondOption(){
			var midcategory = {"subcate_code" : $("#middle-select").val()}
			
			
		  	$.ajax({
		  		url:'getBottomCategory.seller',
		  		method:'post',
		  		data: JSON.stringify(midcategory),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(resp){
		  			$("#small-select").html("<option selected value=''>소분류</option>");
		  			$("#small-select").removeAttr("disabled");
		  			
		  			console.log(resp);
		  			var botcate = ""
					
		  			$.each(resp,function(index,item){
		  				//console.log(item["subcate_code"]);
		  				botcate += '<option value="'+item["subcate_code"]+'">'+item["subcate_name"]+'</option>';
		  			})
		  			
		  			$("#small-select").append(botcate);
		  		
		  			
		  		
		  			}
      			});
      		}
      	
      	// 상품 clone
      	var pro_count = 0;

		function option_plus(){
		
		    var cloneElements = $("#product_plus").clone();
		    cloneElements.appendTo(".plus-layer");
		
		    
		    $(".product_wrap").each(function(pro_count, product_wrap){
		        $(this).attr("id", "product_wrap"+(pro_count));
		        $(this).siblings().text("상품 " + (pro_count+1));
		    });
		
		    pro_count++;

		};

		
		// product check	
		function checkProduct(){
			
			var product_list = []
		
			if($("#small-select").val()==""){
				var subcate = $("#middle-select").val();
				console.log(subcate);
			}else{
				var subcate = $("#small-select").val();
				console.log(subcate);
			}
			
			for(var i=0; i<pro_count+1; i++){
				
				per_product = {
						"pro_catecode" : $("#category").val(),
						"pro_subcatecode" : subcate,
						"option1_name" : $("#option1_name").val(),
						"option2_name" : $("#option2_name").val(),
						"seller_id" : ${seller.seller_id},
						"product_title" : $("#product_wrap"+i+"").find("#product_title").val(),
						"option1" : $("#product_wrap"+i+"").find("#option1").val(),
						"option2" : $("#product_wrap"+i+"").find("#option2").val(),
						"product_price" : $("#product_wrap"+i+"").find("#product_price").val(),
						"product_quantity" : $("#product_wrap"+i+"").find("#product_quantity").val(),
				}

				
				product_list.push(per_product);
				
			}
			
			console.log(JSON.stringify(product_list));

		  	$.ajax({
		  		url:'insertProduct.seller',
		  		method:'post',
		  		data: JSON.stringify(product_list),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		async: false, // ajax 동기식 처리
		  		success : function(resp){
		  			$("#post_id").attr('value',resp);
		  			var cate = $("#category").val();
		  			
		  			$("#po_category").attr('value', cate);
		  			$("#po_subcate").attr('value', subcate);
		  			
		  			var shipfee = $("#post_shipfee").val();
		  			if(shipfee == ""){
		  				$("#post_shipfee").val(0);
		  			}
		  			
		  			alert("form전송");
		  			$("form").submit();
		  			
		  		},
		  		error : function(request,status,error){
		  			alert("code:"+request.status+"\nmessage:" + request.responseTest+"\nerror:"+error);
		  		}
		  		
		  	});
		}
		
		
		// 사진업로드 기능
		function photoUpload(){
			
			var formData = new FormData();
		
			
			var mainFileInput = $(".main_photo");
			var fileInput = $(".thisisfile");
			
			for (var i = 0; i < mainFileInput.length; i++) {
				if (mainFileInput[i].files.length > 0) {
					for (var j = 0; j < mainFileInput[i].files.length; j++) {
						console.log(" mainFileInput[i].files[j] :::"+ mainFileInput[i].files[j]);
						
						// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
						formData.append('mainfile', $('.main_photo')[i].files[j]);
					}
				}
			}
			
			for (var i = 0; i < fileInput.length; i++) {
				if (fileInput[i].files.length > 0) {
					for (var j = 0; j < fileInput[i].files.length; j++) {
						console.log(" fileInput[i].files[j] :::"+ fileInput[i].files[j]);
						
						// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
						formData.append('file', $('.thisisfile')[i].files[j]);
					}
				}
			}
			

			
			$.ajax({
			      url: 'uploadPhotos.seller',
			      method:'post',
			      data: formData,
			      contentType: false,             
			      processData: false,              
			      async: false, 
			      success: function(resp) {
					alert("성공!");
					console.log(resp);
			      },
			      error: function(jqXHR){
			    	  alert(jqXHR.responseText);
			      }
			});
			
			
		
		}
			
			
			
		
		


      	
	
      	
    
    </script>

</head>

<jsp:include page="header/header.jsp"></jsp:include>

<div id="layoutSidenav_content">
	<main style="background-color: #f5f5f5">
		<div class="container-fluid px-4">
			<h1 class="mt-4 insert_title">상품등록(판매게시글)</h1>
			<ol class="breadcrumb bottomline header-custom">
				<li class="breadcrumb-item active">Product registration</li>
				<li>
					<div class="option-plus-btn">
						<button class="btn btn-secondary" type="button"
							onclick="option_plus()">
							상품추가 <i class="fa-solid fa-plus"></i>
						</button>
					</div>
				</li>
			</ol>

			<form method="post" action="putProduct.seller">
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600" id="option-name">브랜드명(상호명)</div>
						<div class="col-4 search-input status-name-400">${seller.company_name}</div>
						<div class="col-2 status-name-600">대표명</div>
						<div class="col-4 search-input status-name-400">${seller.representative}</div>
					</div>
				</div>
				<input type="hidden" value="${seller.seller_id}" name="post_sellerid">
				<input type="hidden" value="0" name="post_id" id="post_id">
				<input type="hidden" value="0" name="po_category" id="po_category">
				<input type="hidden" value="0" name="po_subcate" id="po_subcate">
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600">게시글명</div>
						<div class="col-10 search-input">
							<input type="text" class="form-control input-custom" name="post_name">
						</div>
					</div>
				</div>

				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600">카테고리</div>
						<div class="col-10 search-input">
							<div class="radio-productCode">
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="category" name="cate_code"
										aria-label="Default select example" onchange="changeFirstOption()">
										<option selected>대분류</option>
										<c:forEach items="${cateList }" var="cate">
											<option value="${cate.cate_code}">${cate.cate_name}</option>
										</c:forEach>

									</select>
								</div>
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="middle-select" name="subcate_code"
										disabled="" aria-label="Default select example" onchange="changeSecondOption()">
										<option selected>중분류</option>
										
									</select>
								</div>
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="small-select" name="subcate_code"
										disabled="" aria-label="Default select example">
										<option selected value="">소분류</option>
										<div id="bot-layer"></div>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- option db처리 나중에 -->
				<div class="plus_layer">
					<div class="container container-option container-option-topPadding bottomline" id="option_whole_wrap">
						<div class="row optionGroup1 option-wrap">
							<div class="col-2 status-name-600" id="option-layer-name">옵션 (가구)</div>
							<div class="col-10 search-input option_container" id="option_input">
								
								<div class="filtering-layer">
									<div class="color_option mt-3 row">
										<c:forEach items="${wholeList }" var="perList" begin="0">
										<div class="col-2 option_title status-name-600 checkTitle" style="font-size: 13px" id="${perList[0].filter_id }">${perList[0].filter_name }</div>
										<div class="col-10 color_options" style="padding-bottom: 1rem;">
											<c:forEach items="${perList }" var="item" begin="1">
											<div class="form-check form-check-display">
												<input class="form-check-input form-check-input-margin checking"
													type="checkbox" value="${item.filter_id }" id="${item.filter_id }" name="${perList[0].filter_name }"/> 
													<label class="form-check-label" for="${item.filter_id }"> ${item.filter_name }
												</label>
											</div>
											</c:forEach>
										</div>
									</c:forEach>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					</div>
						
				
				<!-- 상품추가 -->
				
				<div
					class="container container-option container-option-topPadding bottomline" style="border-top: 1px solid #ced4da;">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600 point_col">상품 추가</div>
						<div class="col-10 search-input option_container">
						
							<div class="color_option row bottomline2" style="padding-bottom:0.7rem;">
									<div class="col-2 option_title verti" style="font-size: 13px">첫번째 옵션</div>
									<div class="col-4 color_options" style="border-right: 1px solid #dbdbdb;">
										<input type="text" class="form-control option_name_input" id="option1_name" name="option1_name"
										placeholder="옵션명 ex.색상" />
									</div>
									<div class="col-2 option_title verti" style="font-size: 13px">두번째 옵션</div>
									<div class="col-4 color_options">
										<input type="text" class="form-control option_name_input" id="option2_name" name="option2_name" placeholder="옵션명 ex.사이즈" />
									</div>
							</div>
							<div class="plus-layer">
								<div id="product_plus" class="color_option mt-3 row" style="width: 100%;">
										<div id="product_plus_count" class="col-2 option_title" style="font-size: 13px">상품</div>
										<div class="col-10 color_options row product_wrap" id="product_wrap0">
											<input type="text" class="form-control option_name_input" style="width:300px" id="product_title" name="product_title"
											placeholder="상품명" />
											<div class="pro_option_flex row">
												<p class="col-2">첫번째 옵션 값</p>
												<input type="text" class="col-4 form-control mt-2 option_name_input" style="width:150px" id="option1" name="option1"
												placeholder="ex. 바이올렛" />
												<p class="col-2">두번째 옵션 값</p>
												<input type="text" class="col-4 form-control mt-2 option_name_input" style="width:150px" id="option2" name="option2"
												placeholder="ex. SS" />
											</div>
											<div class="pro_option_flex row">
												<p class="col-2">가격</p>
												<input type="number" class="col-4 form-control mt-2 option_name_input" style="width:150px" id="product_price" name="product_price"
												placeholder="(원)" />
												<p class="col-2">수량</p>
												<input type="number" class="col-4 form-control mt-2 option_name_input" style="width:150px" id="product_quantity" name="product_quantity"
												placeholder="(개)" />
											</div>
										</div>
								</div>
							</div>
					
							
						</div>
					</div>
				</div>

				<div class="card text-dark my-4 box-shadow">
					<div class="card-header card-header-text">제품 정보 기입</div>
					<div class="card-body">
						<table class="table">
							<tbody class="table_body">
								<tr class="verticalAlignCenter">
									<th scope="row" style="width: 5%">1</th>
									<td style="width: 35%">품명</td>
									<td style="width: 60%"><input
										class="form-control input-custom" name="table-productTitle" id="table-productTitle"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">2</th>
									<td>KC 인증 필 유무</td>
									<td><input class="form-control input-custom" name="table-kc" id="table-kc"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">3</th>
									<td>색상</td>
									<td><input class="form-control input-custom"
										placeholder="상단에 선택한 option값을 적어주세요." name="table-color" id="table-color"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">4</th>
									<td>구성품</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-component" id="table-component"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">5</th>
									<td>주요 소재</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-material" id="table-material"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">6</th>
									<td>제조사,수입품의 경우 수입자를 함께 표시</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-manufacturer" id="table-manufacturer"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">7</th>
									<td>제조국</td>
									<td><input class="form-control input-custom"
										placeholder="ex.한국" name="table-country" id="table-country"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">8</th>
									<td>크기</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-size" id="table-size"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">9</th>
									<td>배송, 설치비용</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-delivery" id="table-delivery"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">10</th>
									<td>품질보증기준</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-qa" id="table-qa"/></td>
								</tr>
								<tr class="verticalAlignCenter notBorder">
									<th scope="row">11</th>
									<td>A/S 책임자와 전화번호</td>
									<td><input class="form-control input-custom" name="table-cstel" id="table-cstel"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="card text-dark mb-4 box-shadow">
					<div class="card-header card-header-text">판매금액</div>
					<div class="card-body">
						<div class="row align_custom">
							<div class="col-2 col-lg-2 status-name-600">판매가</div>
							<div class="col-10 col-lg-6">
								<div class="input-group">
									<input type="number" name="whole_price" id="represent_price"
										class="product_input form-control input-custom"
										placeholder="판매가" aria-label="whole_price"
										aria-describedby="basic-addon2" /> 
									<span class="input-group-text input-custom" id="basic-addon2">원</span>
								</div>
								<div class="mt-3 mb-2">
									<span class="price_sub_title">* 오조의집 쇼핑을 통한 주문일 경우 오조의집
										매출연동수수료 5%가 과금됩니다.<br />
									</span> <span class="price_sub_title">실제 상품 페이지에 대표로 표시될 가격을
										적어주세요.</span>
								</div>
							</div>
						</div>
						<div class="row padding_custom">
							<div class="col-2 col-lg-2 borderRight">
								<div class="section_title status-name-600-not">할인</div>
								<div class="section_sub_title mt-4" style="font-size: 12px">*
									기본할인</div>
							</div>
							<div class="col-10 col-lg-6">
								<div class="btn_group">
									<button type="button" id="sale_set"
										class="btn btn-size btn-secondary btn_custom_left"
										style="margin-right: -3px">설정함</button>
									<button type="button" id="sale_notset"
										class="btn btn-size btn-outline-secondary btn_custom_right"
										style="margin-left: -3px">설정안함</button>
								</div>
								<div class="mt-2" style="font-size: 11px">판매가에서 즉시 할인이 가능한
									할인 유형으로 할인된 가격으로 상품을 판매할 수 있습니다.</div>

								<div class="col-6 mt-2">
									<div class="input-group input-group-sm">
										<input type="number" class="sale_percent_input form-control"
											style="font-size: 11px" placeholder="할인율" id="sale_ratio" name="sale_ratio"
											aria-label="sale_ratio" aria-describedby="basic-addon2" />
										<span class="input-group-text" id="basic-addon2"
											style="font-size: 11px">%</span>
									</div>
								</div>
								
								<!--enter event 가격 받아서 계산하기-->
								<div class="sale_price_layer mt-4">
									<span style="font-size: 12px">할인가</span> 
									<div>
										<span class="sale_price">15,300원</span>
										<span class="mi_saleprice" style="font-size: 12px">(2,700원할인)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 이미지업로드 해오기 -->
				<div class="card text-dark mb-4 box-shadow">
					<div class="card-header card-header-text">상품이미지</div>
					<div class="card-body">
						<div class="align_custom">
							<div class="center_img">
								<h1 style="font-size: 12px">[대표이미지] 권장크기 : 1000 x 1000(윈도
									대상 750 x 1000)</h1>
								<div class="photos">
									<!-- 대표사진 -->
									<div id="thisphoto">
										<div class="photo_layer mt-4" id="photo_layer0">
											<button type="button" class="btn photo_del_btn" onclick="delPhoto(this)">
												<i class="fa-regular fa-circle-xmark"></i>
											</button>
											<!-- input tag를 숨긴다음에 button을 눌렀을 때 file 업로드 창 열리게-->
											<input type="file" name="main_photo" id="main_photo0" class="main_photo"
												style="display: none" onchange="changeValue(this)"
												accept="image/*" />
											<button type="button" class="main_photo_btn photo_upload" id="photo_upload0" onclick="mainFileUpload(this)">
												<div class="photo_upload_layer">
													<i class="fa-solid fa-camera upload_icon"></i> <span
														class="upload_title"> 사진올리기 </span> <span
														class="upload_sub_title"> (*최대 5장까지) </span>
												</div>
												
											</button>

											
	
											<div class="image_show" id="image_show0"></div>
										</div>
									</div>
									<!--  -->
								</div>

								<!--사진 추가 버튼-->
								<div class="photo_plus_layer mt-2">
									<button type="button" class="main_photo_btn photo_plus" onclick="mainPhotoplus()">
										<div class="photo_plus_upload_layer">
											<i class="fa-solid fa-plus"></i>
										</div>
									</button>
								</div>
							</div>
						</div>
						
						<!-- 상품 상세 이미지-->
						<div class="mt-3">
							<div class="detail_img_header">
								<p style="font-size: 12px">[상세이미지] 권장크기 : 1000 x 1000(윈도 대상
									750 x 1000) *최대 10개까지만 가능합니다.</p>
								<button type="button" class="btn btn-custom" onclick="plus_list()">
									<i class="fa-solid fa-plus"></i> 이미지 추가
								</button>
							</div>
							<div class="detail_file_list mt-3">
								<table class="table table-hover table-box-style">
									<thead>
										<tr class="content-table-title">
											<td class="option-line" style="width: 70%">업로드 예정 파일</td>
											<td class="option-line" style="width: 20%">처리</td>
										</tr>
									</thead>
									<tbody class="table_body_style" id="table-content-plus">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="card text-dark mb-4 box-shadow">
					<div class="card-header card-header-text">상세설명</div>
					<div class="card-body">
						<div class="form-floating">
							<textarea class="form-control write-textarea" name="post_content"
								placeholder="Leave a comment here" id="floatingTextarea"
								style="height: 10rem"></textarea>
							<label for="floatingTextarea"
								style="color: #828282; font-size: 11px">: 제품 상세 설명</label>
						</div>

						<div class="mt-3 content_text">* 제품 상세 페이지 상단에 들어갑니다.</div>
					</div>
				</div>

				<!-- 배송은 아직 -->
				<div class="row layer_custom">
					<div class="col-12 col-md-6">
						<div class="fix-height card text-dark mb-4 box-shadow">
							<div class="card-header card-header-text">배송</div>
							<div class="card-body">
								<div class="row">
									<div class="col-6 vert_line">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="shipping_info1" value="free" id="flexRadioDefault1" checked /> <label
												class="form-check-label" for="flexRadioDefault1">
												무료배송 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="shipping_info1" value="original" id="flexRadioDefault2" /> <label
												class="form-check-label" for="flexRadioDefault2">
												일반배송 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="shipping_info1" value="cargo" id="flexRadioDefault3" /> <label
												class="form-check-label" for="flexRadioDefault3">
												화물배송 </label>
										</div>
										<div class="form-check">
											<input style="margin-left: 0.5rem;" class="form-control input-custom" id="post_shipfee" name="post_shipfee" type="number" placeholder="배송비(숫자만)">
										</div>
							
									</div>
									<div class="col-6">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="shipping_info2" value="package" id="ship_package2_1" checked /> <label
												class="form-check-label" for="ship_package2_1"> 묶음
												배송 가능 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="shipping_info2" value="not package" id="ship_package2_2" /> <label
												class="form-check-label" for="ship_package2_2"> 묶음
												배송 불가능 </label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6 change_mar">
						<div class="fix-height card text-dark mb-4 box-shadow">
							<div class="card-header card-header-text">반품,교환</div>
							<div class="card-body">
								<div class="form-floating">
									<textarea class="form-control write-textarea" name="refund_content"
										placeholder="Leave a comment here" id="floatingTextarea"></textarea>
									<label for="floatingTextarea"
										style="color: #828282; font-size: 11px">: 반품 정책 상세 설명</label>
								</div>

								<div class="mt-3 content_text">ex)
									우채국택배/반품배송비(3,000원)/교환배송비(6000원)/직접문의</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="card text-dark my-4 box-shadow">
							<div class="card-header card-header-text">배송</div>
							<div class="card-body">
								<table class="table">
									<tbody class="table_body">
										<tr class="verticalAlignCenter">
											<th scope="row" style="width: 5%">1</th>
											<td style="width: 35%">배송</td>
											<td style="width: 60%"><input
												class="form-control input-custom" name="shiptable_info" id="shiptable_info"/></td>
										</tr>
										<tr class="verticalAlignCenter">
											<th scope="row">2</th>
											<td>배송비</td>
											<td><input class="form-control input-custom" name="shiptable_fee" id="shiptable_fee"/></td>
										</tr>
										<tr class="verticalAlignCenter">
											<th scope="row">3</th>
											<td>도서산간 추가배송비</td>
											<td>
												<input class="form-control input-custom" name="shiptable_plusfee" id="shiptable_plusfee"/></td>
										</tr>
										<tr class="verticalAlignCenter">
											<th scope="row">4</th>
											<td>배송불가 지역</td>
											<td><input class="form-control input-custom" name="shiptable_unable" id="shiptable_unable"/></td>
										</tr>
										<tr class="verticalAlignCenter">
											<th scope="row">5</th>
											<td>비례 배송비</td>
											<td><input class="form-control input-custom" name="shiptable_propotionalfee" id="shiptable_propotionalfee"/></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="col-12 col-md-6">
						<div class="card text-dark my-4 box-shadow">
							<div class="card-header card-header-text">교환/환불</div>
							<div class="card-body">
								<table class="table">
									<tbody class="table_body">
										<tr class="verticalAlignCenter">
											<th scope="row" style="width: 5%">1</th>
											<td style="width: 35%">반품배송비</td>
											<td style="width: 60%"><input
												class="form-control input-custom" name="refundtable_fee" id="refundtable_fee"/></td>
										</tr>
										<tr class="verticalAlignCenter">
											<th scope="row">2</th>
											<td>교환배송비</td>
											<td><input class="form-control input-custom" name="exchangetable_fee" id="exchangetable_fee"/></td>
										</tr>
										<tr class="verticalAlignCenter">
											<th scope="row">3</th>
											<td>보내실 곳</td>
											<td>
												<input class="form-control input-custom" name="refundtable_address" id="refundtable_address"/></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				<div class="text-end mb-5">
					<button class="btn btn-outline-secondary btn-size" type="reset">취소</button>
					<button type="button" class="btn btn-secondary btn-size" onclick="gatherData()">등록하기</button>
				</div>

			</form>
		</div>
	</main>
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

<script>


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

</body>
</html>