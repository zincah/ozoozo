<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/sellercss/fonts.css?var=1" rel="stylesheet" />
<link href="resources/css/sellercss/styles.css" rel="stylesheet" />
<link href="resources/css/sellercss/insertProduct.css?var=1" rel="stylesheet" />
<script type="text/javascript" src="resources/js/sellerjs/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script>
      $(document).ready(function () {
        $(".sale_price_layer").hide();

        $(".sale_percent_input").keydown(function (key) {
          if (key.keyCode == 13) {
            $(".sale_price_layer").show();
            event.preventDefault();
          } else if ($(".sale_percent_input").text() == "") {
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

        /* file upload */
        $(".photo_upload").click(function () {
          $("#main_file").click();
        });

        /* file plus */
        var i = 0;

        $(".photo_plus").click(function () {
          i++;

          var html = '<div class="photo_layer mt-4" id="photo_layer">\
                        <input type="file" name="main_file" id="main_file" style="display:none" onchange="changeValue(this)"/>\
                        <button type="button" class="main_photo_btn photo_upload" onclick="fileupload()">\
                            <div class="photo_upload_layer">\
                                <i class="fa-solid fa-camera upload_icon"></i>\
                                <span class="upload_title">\
                                    사진올리기\
                                </span>\
                                <span class="upload_sub_title">\
                                    (*최대 5장까지)\
                                </span>\
                            </div>\
                        </button>\
                        <div class="image-show" id="image-show"></div>\
                    </div>';

          if (i < 5) {
            $(".photos").append(html);
          } else {
            alert("더이상 추가 되지 않습니다.");
          }
        });

        /* 세일 설정 jquery */
        $("#sale_notset").click(function () {
          $("#sale_notset").removeClass("btn-outline-secondary").addClass("btn-secondary");
          $("#sale_set").removeClass("btn-secondary").addClass("btn-outline-secondary");
          $(".sale_percent_input").attr("disabled", "true");
        });

        /* 여기 안됨 */
        $("#sale_set").click(function () {
          $("#sale_set").removeClass("btn-outline-secondary").addClass("btn-secondary");
          $("#sale_notset").removeClass("btn-secondary").addClass("btn-outline-secondary");
          $(".sale_percent_input").removeAttr("disabled");
        });
      });

      function fileupload() {
        $("#main_file").click();
      }

      /* file 이름 나옴 */
      function changeValue(input) {
        var file = input.files[0]; //선택된 파일 가져오기

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
        var container = document.getElementById("image-show");
        container.appendChild(newImage);
        $(".image-show").show();
      }
      
      function gatherData(){
    	  
    	  if($(".optionGroup1").is("#using_people") == true) {
				alert("hi");
    		}else{
    			alert("no");
    		}
    	  
    	  var hi = $(".optionGroup1");
    	  console.log(hi);

      }
      
      
    </script>
	<script type="text/javascript" src="resources/js/sellerjs/plus_photo.js"></script>
	<script type="text/javascript" src="resources/js/sellerjs/option_clone.js"></script>
</head>

<jsp:include page="header/header.jsp"></jsp:include>

<div id="layoutSidenav_content">
	<main style="background-color: #f5f5f5">
		<div class="container-fluid px-4">
			<h1 class="mt-4 insert_title">상품등록</h1>
			<ol class="breadcrumb bottomline header-custom">
				<li class="breadcrumb-item active">Product registration</li>
				<li>
					<div class="option-plus-btn">
						<button class="btn btn-secondary" type="button"
							onclick="option_plus()">
							옵션추가 <i class="fa-solid fa-plus"></i>
						</button>
					</div>
				</li>
			</ol>

			<form method="post" action="index.seller" enctype="multipart/form-data">
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600" id="option-name">브랜드명(상호명)</div>
						<div class="col-4 search-input status-name-400">ozo
							chair(ozo)</div>
						<div class="col-2 status-name-600">대표명</div>
						<div class="col-4 search-input status-name-400">이영</div>
					</div>
				</div>
				<input type="hidden" value="brand_name">
				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600">상품명</div>
						<div class="col-10 search-input">
							<input type="text" class="form-control input-custom" name="product_name"/>
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
									<select class="form-select selectState" id="large-select" name="category_name"
										aria-label="Default select example">
										<option selected>대분류</option>
										<option value="1">가구</option>
										<option value="2">패브릭</option>
										<option value="3">조명</option>
										<option value="4">가전</option>
										<option value="5">주방용품</option>
										<option value="6">데코/식물</option>
										<option value="7">수납/정리</option>
									</select>
								</div>
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="middle-select" name="subcategory1"
										disabled="" aria-label="Default select example">
										<option selected>중분류</option>
										<option value="1">메트리스</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
									</select>
								</div>
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<select class="form-select selectState" id="small-select" name="subcategory2"
										disabled="" aria-label="Default select example">
										<option selected>소분류</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="plus_layer">
					<div
						class="container container-option container-option-topPadding bottomline"
						id="option_whole_wrap">
						<div class="row optionGroup1 option-wrap">
							<div class="col-2 status-name-600">옵션 (가구)</div>
							<div class="col-10 search-input option_container"
								id="option_input0">
								
								<div class="radio-productCode">
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<select class="form-select selectState" id="using_people" name="using_people"
											aria-label="Default select example">
											<option selected>사용인원</option>
											<option value="1">1인</option>
											<option value="2">2인</option>
											<option value="3">3인</option>
											<option value="4">4인</option>
											<option value="5">5인</option>
											<option value="6">6인</option>
											<option value="7">7인</option>
											<option value="8">8인이상</option>
										</select>
									</div>
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<select class="form-select selectState" name="place"
											aria-label="Default select example">
											<option selected>사용공간</option>
											<option value="living room">거실</option>
											<option value="bed room">침실</option>
											<option value="kitchen">주방</option>
											<option value="dress room">옷방</option>
											<option value="study room">서재/공부방</option>
											<option value="kid room">아이방</option>
										</select>
									</div>
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<select class="form-select selectState" name="rental"
											aria-label="Default select example">
											<option selected>상품유형</option>
											<option value="y">렌탈상품</option>
											<option value="n">렌탈상품 x</option>
										</select>
									</div>
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<select class="form-select selectState" name="refurbish"
											aria-label="Default select example">
											<option selected>리퍼상품 유무</option>
											<option value="y">리퍼상품</option>
											<option value="n">리퍼상품 x</option>
										</select>
									</div>
								</div>
								<div class="color_option mt-3 row mb-1">
										<div class="col-2 option_title" style="font-size: 13px">옵션명</div>
										<div class="col-10 color_options bottomline2">
											<div class="price-layer">
												<input class="form-control option-title-input" type="text" 
												id="price-per-option" name="title"/>
											</div>
										</div>
								</div>
								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">색상</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="white" id="colorcheck1" /> <label
												class="form-check-label" for="colorcheck1"> 화이트
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="black" id="colorcheck2" /> <label
												class="form-check-label" for="colorcheck2"> 블랙
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="brown" id="colorcheck3" /> <label
												class="form-check-label" for="colorcheck3"> 브라운
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="gold" id="colorcheck4" /> <label
												class="form-check-label" for="colorcheck4"> 골드
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="orange" id="colorcheck5" /> <label
												class="form-check-label" for="colorcheck5"> 오렌지
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="green" id="colorcheck6" /> <label
												class="form-check-label" for="colorcheck6"> 그린
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="navy" id="colorcheck7" /> <label
												class="form-check-label" for="colorcheck7"> 네이비
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="pink" id="colorcheck8" /> <label
												class="form-check-label" for="colorcheck8"> 핑크
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="transparent" id="colorcheck9" /> <label
												class="form-check-label" for="colorcheck9"> 투명
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="grey" id="colorcheck10" /> <label
												class="form-check-label" for="colorcheck10"> 그레이
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="beige" id="colorcheck11" /> <label
												class="form-check-label" for="colorcheck11"> 베이지
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="silver" id="colorcheck12" /> <label
												class="form-check-label" for="colorcheck12"> 실버
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="red" id="colorcheck13" /> <label
												class="form-check-label" for="colorcheck13"> 레드
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="yellow" id="colorcheck14" /> <label
												class="form-check-label" for="colorcheck14"> 옐로우
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="blue" id="colorcheck15" /> <label
												class="form-check-label" for="colorcheck15"> 블루
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="violet" id="colorcheck16" /> <label
												class="form-check-label" for="colorcheck16">
												바이올렛 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="multi" id="colorcheck17" /> <label
												class="form-check-label" for="colorcheck17"> 멀티
											</label>
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">우드톤</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="rigth" id="woodcheck1" /> <label
												class="form-check-label" for="woodcheck1"> 밝은
												우드톤 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="middle" id="woodcheck2" /> <label
												class="form-check-label" for="woodcheck2"> 중간
												우드톤 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3"> 어두운
												우드톤 </label>
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">소재</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="wood" id="meterialcheck1" /> <label
												class="form-check-label" for="meterialcheck1"> 원목
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="nature" id="meterialcheck2" /> <label
												class="form-check-label" for="meterialcheck2"> 천연
												대리석 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="ceramic" id="meterialcheck3" /> <label
												class="form-check-label" for="meterialcheck3"> 세라믹
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="glass" id="meterialcheck4" /> <label
												class="form-check-label" for="meterialcheck4"> 유리
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="plastic" id="meterialcheck5" /> <label
												class="form-check-label" for="meterialcheck5">
												플라스틱 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="concrete" id="meterialcheck6" /> <label
												class="form-check-label" for="meterialcheck6">
												콘크리트 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="leather" id="meterialcheck7" /> <label
												class="form-check-label" for="meterialcheck7">
												인조가죽 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="suede" id="meterialcheck8" /> <label
												class="form-check-label" for="meterialcheck8">
												스웨이드 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="velvet" id="meterialcheck9" /> <label
												class="form-check-label" for="meterialcheck9"> 벨벳
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="process wood" id="meterialcheck10" /> <label
												class="form-check-label" for="meterialcheck10"> 가공목
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="artificial marble" id="meterialcheck11" /> <label
												class="form-check-label" for="meterialcheck11">
												인조대리석 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="volcanic stone" id="meterialcheck12" /> <label
												class="form-check-label" for="meterialcheck12"> 화산석
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="steel" id="meterialcheck13" /> <label
												class="form-check-label" for="meterialcheck13">
												철재/스틸 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="rattan" id="meterialcheck14" /> <label
												class="form-check-label" for="meterialcheck14"> 라탄
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="natural leather" id="meterialcheck15" /> <label
												class="form-check-label" for="meterialcheck15">
												천연가죽 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="fabric" id="meterialcheck16" /> <label
												class="form-check-label" for="meterialcheck16"> 패브릭
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17"> 매쉬
											</label>
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">사이즈</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display rightline">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="" id="size-check" /> <label
												class="form-check-label" for="size-check"> 직접입력 </label>
										</div>
										<div class="size_input">
											<input class="form-control size-option-input" name="size" type="text"
												id="self-option-size" />
										</div>
									</div>

									<div class="color_option mt-3 row mb-1">
										<div class="col-2 option_title" style="font-size: 13px">가격</div>
										<div class="col-10 color_options">
											<div class="price-layer">
												<input class="form-control price-option-input" type="text"
													id="price-per-option" />
												<p style="margin-left: 1rem">원</p>
											</div>
											<p style="margin-left: 1rem; color: #ff778e; font-size: 11px">*실제
												판매가를 적어주세요.(할인가 x)</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="container container-option container-option-topPadding bottomline">
					<div class="row optionGroup1">
						<div class="col-2 status-name-600">재고 수량</div>
						<div class="col-10 search-input flex_custom">
							<input type="text" class="form-control quantity_option" name="count"
								placeholder="추후에 수정 가능합니다." />
							<p>개</p>
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
										class="form-control input-custom" name="table-productTitle"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">2</th>
									<td>KC 인증 필 유무</td>
									<td><input class="form-control input-custom" name="table-kc"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">3</th>
									<td>색상</td>
									<td><input class="form-control input-custom"
										placeholder="상단에 선택한 option값을 적어주세요." name="table-color"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">4</th>
									<td>구성품</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-component"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">5</th>
									<td>주요 소재</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-material"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">6</th>
									<td>제조사,수입품의 경우 수입자를 함께 표시</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-manufacturer"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">7</th>
									<td>제조국</td>
									<td><input class="form-control input-custom"
										placeholder="ex.한국" name="table-country"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">8</th>
									<td>크기</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-size"/></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">9</th>
									<td>배송, 설치비용</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-delivery" /></td>
								</tr>
								<tr class="verticalAlignCenter">
									<th scope="row">10</th>
									<td>품질보증기준</td>
									<td><input class="form-control input-custom"
										placeholder="ex.상세페이지 참조" name="table-qa"/></td>
								</tr>
								<tr class="verticalAlignCenter notBorder">
									<th scope="row">11</th>
									<td>A/S 책임자와 전화번호</td>
									<td><input class="form-control input-custom" name="table-cstel"/></td>
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
									<input type="text"
										class="product_input form-control input-custom"
										placeholder="판매가" aria-label="product_price"
										aria-describedby="basic-addon2" /> <span
										class="input-group-text input-custom" id="basic-addon2">원</span>
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
										<input type="text" class="sale_percent_input form-control"
											style="font-size: 11px" placeholder="할인율"
											aria-label="product_price" aria-describedby="basic-addon2" />
										<span class="input-group-text" id="basic-addon2"
											style="font-size: 11px">%</span>
									</div>
								</div>
								<!--enter event-->
								<div class="sale_price_layer mt-4">
									<span style="font-size: 12px">할인가</span> <span
										class="sale_price">15,300원
										<span style="font-size: 12px">(2,700원할인)</span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card text-dark mb-4 box-shadow">
					<div class="card-header card-header-text">상품이미지</div>
					<div class="card-body">
						<div class="align_custom">
							<div class="center_img">
								<h1 style="font-size: 12px">[대표이미지] 권장크기 : 1000 x 1000(윈도
									대상 750 x 1000)</h1>
								<div class="photos">
									<div class="photo_layer mt-4" id="photo_layer">
										<!-- input tag를 숨긴다음에 button을 눌렀을 때 file 업로드 창 열리게-->
										<input type="file" name="main_file" id="main_file"
											style="display: none" onchange="changeValue(this)"
											accept="image/*" />
										<button type="button" class="main_photo_btn photo_upload">
											<div class="photo_upload_layer">
												<i class="fa-solid fa-camera upload_icon"></i> <span
													class="upload_title"> 사진올리기 </span> <span
													class="upload_sub_title"> (*최대 5장까지) </span>
											</div>
										</button>

										<div class="image-show" id="image-show"></div>
									</div>
								</div>

								<!--사진 추가 버튼-->
								<div class="photo_plus_layer mt-2">
									<!-- input tag를 숨긴다음에 button을 눌렀을 때 file 업로드 창 열리게-->
									<input type="file" name="main_file" id="main_file"
										style="display: none" />
									<button type="button" class="main_photo_btn photo_plus">
										<div class="photo_plus_upload_layer">
											<i class="fa-solid fa-plus"></i>
										</div>
									</button>
									<div class="photo_wrap">
										<img src="sources/best1.jpg" />
									</div>
								</div>
							</div>
						</div>
						<!-- 상품 상세 이미지-->
						<div class="mt-3">
							<div class="detail_img_header">
								<p style="font-size: 12px">[상세이미지] 권장크기 : 1000 x 1000(윈도 대상
									750 x 1000) *최대 10개까지만 가능합니다.</p>
								<button type="button" class="btn btn-custom"
									onclick="plus_list()">
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
									<tbody id="table-content-plus" class="table_body_style"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="card text-dark mb-4 box-shadow">
					<div class="card-header card-header-text">상세설명</div>
					<div class="card-body">
						<div class="form-floating">
							<textarea class="form-control write-textarea"
								placeholder="Leave a comment here" id="floatingTextarea"
								style="height: 10rem"></textarea>
							<label for="floatingTextarea"
								style="color: #828282; font-size: 11px">: 제품 상세 설명</label>
						</div>

						<div class="mt-3 content_text">* 제품 상세 페이지 상단에 들어갑니다.</div>
					</div>
				</div>

				<div class="row layer_custom">
					<div class="col-12 col-md-6">
						<div class="fix-height card text-dark mb-4 box-shadow">
							<div class="card-header card-header-text">배송</div>
							<div class="card-body">
								<div class="row">
									<div class="col-6 vert_line">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="ship_package1" id="flexRadioDefault1" checked /> <label
												class="form-check-label" for="flexRadioDefault1">
												무료배송 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="ship_package1" id="flexRadioDefault2" /> <label
												class="form-check-label" for="flexRadioDefault2">
												일반배송 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="ship_package1" id="flexRadioDefault3" /> <label
												class="form-check-label" for="flexRadioDefault3">
												화물배송 </label>
										</div>
									</div>
									<div class="col-6">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="ship_package2" id="ship_package2_1" checked /> <label
												class="form-check-label" for="ship_package2_1"> 묶음
												배송 가능 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="ship_package2" id="ship_package2_2" /> <label
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
									<textarea class="form-control write-textarea"
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

				<div class="text-end mb-5">
					<button class="btn btn-outline-secondary btn-size" type="reset">취소</button>
					<!-- type="button" 없애야함 -->
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
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="resources/js/sellerjs/insertProduct.js"></script>
</body>
</html>