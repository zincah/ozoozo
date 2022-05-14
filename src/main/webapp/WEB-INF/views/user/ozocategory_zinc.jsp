<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="resources/css/user_css/zinc/ozocategory_main.css?var=21"
	rel="stylesheet" />
<link href="resources/css/user_css/zinc/ozoper_photo_cate.css?var=12"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script>

        $(document).ready(function(){

            $(".filter_btn").on('click', function(){
                console.log(this.value);
                $(".category_filter_output_wrap").show(); 
                
                $(".category_filter_control_tag_item button div").text(this.value);
            });

            /* 카테고리 토글 */
            $(".category_tree_child_layer").hide();
            $(".category_entry_expand", this).click(function(){
                var open = $(this).parents("div").siblings("div");
                //console.log(open[0]);
                $(open[0]).slideToggle();
            });

            $(".reset_btn").click(function(){
                $(".category_filter_output_wrap").hide();
            });
            
            
            // 이동
            $(".movetitle").on("click", function(e){
            	e.preventDefault();
            	
            	$("#actionForm").find("input[name='topcate_code']").val($(this).attr("href"));
            	$("#actionForm").submit();
            });
            

            $(".subcate").click(function(){
            	$("#category_head").html("");
            	var code = $(this).attr("id");
            	var subtitle = $(this).text();
            	
            	var html = ' > <a id="">'+subtitle+'</a>';
            	$("#category_head").append(html);
            	movelink(code);
            })
            
            $(".botcate").click(function(){
            	$("#category_head").html("");
            	var code = $(this).attr("id");
            	var subtitle = $(this).parents("div").siblings("div").find(".subcate").text();
            	var bottitle = $(this).text();
            	
            	var html = ' > <a id="">'+subtitle+'</a> > <a id="">'+bottitle+'</a>';
            	$("#category_head").append(html);
            	movelink(code);
            })
            
            // filter
            $(".filter_btn").click(function(event){

            	//alert($(this).val());
            	var name = $(this).val();
            	
            	if($("#"+name+"").css("display")=='none'){
            		$(".dropping").hide();
            		$("#"+name+"").show();
            	}else{
            		$("#"+name+"").hide();
            	}
            	

            })
            
            


        });
        
        // 어떻게 드롭다운이 바로 밑에 뜨게 하지
        function checkPosition(name){
        	
        	var filterLayer = $(".category_filter_control_layer");
            filterLayer.click(function(event){
            	//var x = event.pageX;
            	//var y = event.pageY;
            	
            	//var x = event.clientX;
            	//var y = event.clientY;
            	
            	console.log(x);
            	console.log(y);
            	
            	$("#"+name+"").css("top", y);
            	$("#"+name+"").css("left", x);

            })
        }
        
        function movelink(code){
        	
        	console.log(code);
        	
        	
        	
        	
        }
      
		
		</script>
</head>
<body>
	<header>
		<jsp:include page="./header/OzoH.jsp"></jsp:include>
	</header>
	
	<div class="category_container container">
		<div class="category_wrap">
			<div class="category row">
				<div class="category_side_bar col-12 col-md-3">
					<section class="category_list">
						<div class="category_list_title">
							<a id="${title.cate_code }" href="#">${title.cate_name }</a>
						</div>
						<ul class="category_tree">
							
							<c:forEach items="${wholeList }" var="cateList">
								<li class="category_entry">
									<div class="category_entry_header">
										<a id="${cateList[0].subcate_code }" class="category_entry_move subcate">${cateList[0].subcate_name }</a>
										<c:if test="${cateList[1] != null }">
										<button class="category_entry_expand">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
										</c:if>
									</div> <!--버튼 누르면 밑에 토글다운 생기게-->
	
									<div class="category_tree_child_layer" style="overflow: hidden;">
										<ul class="category_tree_children">
											<c:forEach items="${cateList }" var="cate" begin="1">
											<li class="category_tree_children_entry">
												<a id="${cate.subcate_code }" class="botcate">${cate.subcate_name }</a>
											</li>
											</c:forEach>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>

						<ul class="category_list_others">
							<c:forEach items="${others }" var="other">
								<li class="category_list_others_item"><a href="${other.cate_code }" class="movetitle">${other.cate_name }</a></li>
							</c:forEach>
							
						</ul>
					</section>
					
					<form action="m_category.com" method="get" id="actionForm">
						<input type="hidden" name="topcate_code" value="">
					</form>
				</div>

				<div class="category_content col-12 col-md-9">
					<div class="category_header">
						<div class="category_header_title">
							<a href="#" id="${title.cate_code }">${title.cate_name }</a>
							<span id="category_head"></span>
						</div>
						<div class="category_banner">
							<div class="carousel_frame">
								<a href="#"> <!-- large image -->
									<div class="carousel_banner">
										<img class="banner_img" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/banner1.jpg">
									</div>
								</a>
							</div>

							<div class="carousel_frame">
								<a href="#"> <!-- large image -->
									<div class="carousel_banner">
										<img class="banner_img" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/banner2.jpg">
									</div>
								</a>
							</div>
							<div class="paginator_item">
								<ul class="carousel_paginator">
									<li class="pagi_one">
										<span class="carousel_paginator__page selected" data-key="1"></span>
									</li>
									<li class="pagi_two">
										<span class="carousel_paginator__page" data-key="2"></span></li>
								</ul>
							</div>


							<script type="text/javascript">
                                let slideIndex = 0;
                                showSlides();
                
                                function showSlides() {
                                let i;
                                let slides = document.getElementsByClassName("carousel_frame");
                                let paginator = document.getElementsByClassName("carousel_paginator__page");

                                for (i = 0; i < slides.length; i++) {
                                    slides[i].style.display = "none";
                                    paginator[i].classList.remove("selected");
                                }
                                slideIndex++;
                                if (slideIndex > slides.length) {slideIndex = 1}    
                                slides[slideIndex-1].style.display = "block";
                                paginator[slideIndex-1].classList.add("selected");
                                
                                setTimeout(showSlides, 2500);
                                }
                            </script>

						</div>
					</div>

					<div class="category_navi">
						<ul class="category_navi_list">
							<c:forEach items="${wholeList }" var="cateList">
								<li class="category_navi_list_item">
									<a href="#"> 
										<div class="navi_text" id="${cateList[0].subcate_code }">${cateList[0].subcate_name }</div>
									</a>
								</li>
							</c:forEach>
							
						</ul>
					</div>

					<div class="category_filter_control_layer">
						<ul class="category_filter_control_list">
							<!--for문-->
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="오늘의딜">
									<svg class="icon" width="12" height="10" fill="none"
										preserveAspectRatio="xMidYMid meet">
										<path
											d="M4.51 6.84L10.322.85 11.5 1.993 4.569 9.138.5 5.35l1.119-1.202L4.51 6.84z"
											fill="#C2C8CC"></path></svg>
									오늘의딜
								</button>
								
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="사용인원">
									사용인원
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
									<!-- dropdown : 사용인원 -->
									<div class="dropdown_panel1 location1 dropping" id="사용인원">
										<ul class="property_filter_dropdown">
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>1인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>2인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>3인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>4인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>5인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>6인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>7인</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>8인</span>
													</div>
												</button>
											</li>
										</ul>
									</div>
							</li>
							<li class="category_filter_control_list_item" style="postion:relative">
								<button class="filter_btn" value="우드톤">
									우드톤
									<svg class="chevron" width="12" height="12" preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd"><path d="M0 0h12v12H0z"></path><path fill="currentColor" fill-rule="nonzero" d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg></button>
								
									<div class="dropdown_panel2 location2 dropping" id="우드톤">
										<ul class="property_filter_dropdown">
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>밝은 우드톤</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>중간 우드톤</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>어두운 우드톤</span>
													</div>
												</button>
											</li>
										</ul>
									</div>

							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="색상">
									색상
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="리퍼상품">
									리퍼 상품
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="공간별상품">
									공간별 상품
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="소재">
									소재
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="특가">
									특가
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="상품유형">
									상품유형
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="가격">
									가격
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
							<li class="category_filter_control_list_item">
								<button class="filter_btn" value="배송">
									배송
									<svg class="chevron" width="12" height="12"
										preserveAspectRatio="xMidYMid meet">
										<g fill="none" fill-rule="evenodd">
										<path d="M0 0h12v12H0z"></path>
										<path fill="currentColor" fill-rule="nonzero"
											d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>
								</button>
							</li>
						</ul>
					</div>

						
					
						
					<!-- 선택한 태그 나오게 하는 거-->
					<div class="category_filter_output_wrap">
						<div class="category_filter_control_package">
							<div class="category_filter_control_pack">
								<ul class="category_filter_control_tag_list">
									<li class="category_filter_control_tag_item">
										<button class="category_filter_tag">
											<div></div>
											<svg class="icon" width="12" height="12"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd" opacity=".5">
												<path d="M0 0h12v12H0z"></path>
												<path fill="currentColor" fill-rule="nonzero"
													d="M9.778 1.5l.722.75-3.778 3.722L6.75 6l-.028.028L10.5 9.75l-.722.75L6 6.745 2.222 10.5 1.5 9.75l3.777-3.723L5.25 6l.027-.027L1.5 2.25l.722-.75L6 5.255 9.778 1.5z"></path></g></svg>
										</button>
									</li>
								</ul>
							</div>
							<button class="reset_btn">
								<svg class="icon" width="1em" height="1em" viewBox="0 0 20 20"
									preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd">
									<path d="M0 0h20v20H0z"></path>
									<path fill="currentColor" fill-rule="nonzero"
										d="M8.958.833c3.844 0 7.157 2.488 8.417 6.019l.887-1.538a.834.834 0 011.444.833L17.67 9.671a.833.833 0 01-1.138.305l-3.524-2.035a.833.833 0 11.833-1.443l2.054 1.186C14.943 4.654 12.174 2.5 8.958 2.5c-4.022 0-7.291 3.353-7.291 7.5s3.269 7.5 7.291 7.5c2.47 0 4.73-1.272 6.075-3.35a.833.833 0 011.399.905c-1.647 2.546-4.43 4.112-7.474 4.112C4.006 19.167 0 15.058 0 10S4.006.833 8.958.833z"></path></g></svg>
								초기화
							</button>
						</div>
					</div>

					<div class="item_count_layer">
						<div class="item_count">전체 153,760개</div>
						<button class="item_filter_btn" id="item_filter_btn">
							인기순
							<svg class="caret" width="8" height="8" viewBox="0 0 8 8"
								preserveAspectRatio="xMidYMid meet">
								<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>
						</button>

						<!-- dropdown -->
						<div class="dropdown_wrap" id="dropdown">
							<ul class="dropdown_list">
								<li>
									<button class="dropdown_btn">판매순</button>
								</li>
								<li>
									<button class="dropdown_btn">인기순</button>
								</li>
								<li>
									<button class="dropdown_btn">많은 리뷰순</button>
								</li>
								<li>
									<button class="dropdown_btn">유저사진 많은순</button>
								</li>
								<li>
									<button class="dropdown_btn">높은 가격순</button>
								</li>
								<li>
									<button class="dropdown_btn">낮은 가격순</button>
								</li>
								<li>
									<button class="dropdown_btn">최신순</button>
								</li>
							</ul>
						</div>
					</div>

					<!-- dropdown js -->
					<script>
                        var filter_btn = document.getElementById("item_filter_btn");
                        var dropdown = document.getElementById("dropdown");
        
                        filter_btn.addEventListener('mouseenter', function(){
                            dropdown.style.display = 'block';
                        });
        
                        dropdown.addEventListener('mouseleave', function(){
                            dropdown.style.display = 'none';
                        });
        
                    </script>

					<div class="photos row">
						<c:forEach items="${productList }" var="product">
						<div class="deals_list_wrap col-6 col-lg-4">
							<article class="deals_item">
								<a href="#" style="text-decoration: none; width: 100%;">
									<div class="deals_item_wrap">
										<div class="deals_item_pic_out">
											<div class="deals_item_pic">
												<div class="item_ani">
													<img class="images" src="${product.photo_url }">
												</div>
											</div>
											<button class="item_bookmark">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" class="inactive-icon">
													<defs>
													<path id="scrap-icon-3-b"
														d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path>
													<filter id="scrap-icon-3-a" width="150%" height="150%"
														x="-25%" y="-25%" filterUnits="objectBoundingBox">
													<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
													<feGaussianBlur in="shadowOffsetOuter1"
														result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>
													<feComposite in="shadowBlurOuter1" in2="SourceAlpha"
														operator="out" result="shadowBlurOuter1"></feComposite>
													<feColorMatrix in="shadowBlurOuter1"
														values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>
													<filter id="scrap-icon-3-c" width="150%" height="150%"
														x="-25%" y="-25%" filterUnits="objectBoundingBox">
													<feGaussianBlur in="SourceAlpha" result="shadowBlurInner1"
														stdDeviation="1.5"></feGaussianBlur>
													<feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>
													<feComposite in="shadowOffsetInner1" in2="SourceAlpha"
														k2="-1" k3="1" operator="arithmetic"
														result="shadowInnerInner1"></feComposite>
													<feColorMatrix in="shadowInnerInner1"
														values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>
													<g fill="none" fill-rule="nonzero"
														transform="matrix(1 0 0 -1 0 24)">
													<use fill="#000" filter="url(#scrap-icon-3-a)"
														href="#scrap-icon-3-b"></use>
													<use fill="#FFF" fill-opacity=".4" href="#scrap-icon-3-b"></use>
													<use fill="#000" filter="url(#scrap-icon-3-c)"
														href="#scrap-icon-3-b"></use>
													<path stroke="#FFF"
														d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
											</button>
										</div>
										
										<div class="deals_item_content">
											<div class="deals_item_header">
												<span class="deals_item_header_brand">${product.company_name }</span> 
												<span class="deals_item_header_name">${product.post_name }</span>
											</div>
											<div class="deals_item_body_price">
												<span class="sale_percent">${product.sale_ratio }%</span> 
												<span class="price">${product.sale_price }</span>
											</div>
											<div class="deals_item_review">
												<div class="review_icon">
													<i class="fa-solid fa-star" style=""></i>
												</div>
												<div class="review_score">${product.star_ratio }</div>
											</div>
											<div class="best_item_info">
												<c:if test="${product.shipping_info1 == 'free'}">
													<svg id="freeship_icon" class="icon" aria-label="무료배송"
														width="47" height="20" viewBox="0 0 47 20"
														preserveAspectRatio="xMidYMid meet">
														<g fill="none" fill-rule="evenodd">
														<rect width="47" height="20" fill="#000" fill-opacity=".07"
															fill-rule="nonzero" rx="4"></rect>
														<path fill="#757575"
															d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
												</c:if>
												<svg id="saleprice_icon" class="icon" aria-label="특가"
													width="30" height="20" viewBox="0 0 30 20"
													preserveAspectRatio="xMidYMid meet">
													<rect width="30" height="20" fill="#F77" rx="4"></rect>
													<path fill="#fff"
														d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
											</div>
										</div>
									</div>
								</a>
							</article>
						</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="./footer/footer.jsp"></jsp:include>
	</footer>
</body>
</html>




