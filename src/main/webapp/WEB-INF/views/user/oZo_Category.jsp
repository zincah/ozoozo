<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="resources/css/user_css/zinc/ozocategory_main.css?var=1"
	rel="stylesheet" />
<link href="resources/css/user_css/zinc/ozoper_photo_cate.css?var=11"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="resources/js/userjs/bookmark.js?var=12"></script>	
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"

	crossorigin="anonymous"></script>
<script>

		var filterList = [];
		var totalCount;
		let rank = 'latestRanking'; // 최신순으로 기본 세팅
		
    	var firstscroll = 0;
    	var page = 0;
		
        $(document).ready(function(){
        	
            $(".filter_btn").on('click', function(){
                console.log(this.value);
                
                var filter = $(this).val();

            });
            
            
            $("input[name=checking]").change(function(){
            	
            	var filter = $(this).val();
            	
            	if($(this).prop('checked')==true){
            		plusList(filter);
            	}else{
            		removeList(filter);
            	}
            	
            })
            
            // filtering 초기화 버튼
            $(".reset_btn").click(function(){

            	filterList = []; // 배열 초기화
            	$("input[name=checking]").prop("checked", false); // 모든 체크박스 해제
            	$(".category_filter_control_tag_item").remove(); // 리스트 아이템 요소 다 제거
            	$(".category_filter_output_wrap").hide(); // 리스트 띄우는 부분 숨기기

            	
            	filtering(filterList);
            });

            /* 카테고리 토글 */
            $(".category_tree_child_layer").hide();
            $(".category_entry_expand", this).click(function(){
                var open = $(this).parents("div").siblings("div");
                //console.log(open[0]);
                $(open[0]).slideToggle();
            });


            
            
            // 이동
            $(".movetitle").on("click", function(e){
            	e.preventDefault();
            	
            	$("#actionForm").find("input[name='catecode']").val($(this).attr("href"));
            	$("#actionForm").submit();
            });
            

            $(".subcate").click(function(){
            	$("#category_head").html("");
            	var code = $(this).attr("id");

            	movelink(code);
            })
            
            $(".botcate").click(function(){
            	$("#category_head").html("");
            	var code = $(this).attr("id");

            	movelink(code);
            })
            
            // filter
            $(".filter_btn").click(function(event){

            	//alert($(this).val());
            	if($(this).val() == '오늘의딜'){ // 오늘의딜은 버튼임으로 검증
            		
            		var filter = $(this).val();
            		
            		// filtersize = 1
            		
            		if(filterList.length >= 1){
            			
            			var filtercnt = 0;
            			
            			for(var i=0; i<filterList.length; i++){
            				filtercnt++;
            				if(filter == filterList[i]){
                    			removeList(filter);
                    			break;
                    		}else if(filtercnt==filterList.length){
                    			plusList(filter);
                    			break;
                    		}
                    	}

            		}else if(filterList.length == 0){
            			plusList(filter);
            		}
            		
            	}else{
            		
            		console.log("다른거");
            		var name = $(this).val();
                	
                	if($("#"+name+"").css("display")=='none'){
                		$(".dropping").hide();
                		$("#"+name+"").show();
                	}else{
                		$("#"+name+"").hide();
                	}
            	}

            })
            
            
            totalCount = ${totalCount};
            
            
            // 인기순 판매순 순위 매기기
    		$(".dropdown_btn").click(function(){
    			
    			page = 0; // page를 다시 0으로 초기화
    			rank = $(this).val();
    			var ranktext = $(this).text();
    			
    			var html = '\
    			<svg class="caret" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet">\
    			<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>'
    			
    			$("#item_filter_btn").html(ranktext + html);
    			alert(ranktext);

    			filtering(filterList);

    		})
    		


        });
        
    	
    	
    	// 무한스크롤 페이징
    	$(window).on("scroll", function(event){
    		
    		console.log(totalCount);

    		var scrollTop = $(window).scrollTop();
    		var windowHeight = $(window).height();
    		var documentHeight = $(document).height();
    		var isBottom=scrollTop+windowHeight + 100 >= documentHeight;

    		
    		
    		if(isBottom){
    			
    			if(totalCount%12 == 0){
    				console.log(totalCount/12)
    				var pag = parseInt(totalCount/12-1); 
    			}else{
    				var pag = parseInt(totalCount/12); 
    			}


    			console.log("pag"+ pag);
    			console.log("page: " + page)
    			if(page == pag){ 
    				return;
    			}
    			
    			page++;
    			getProductList(page, filterList);
    		}
    	});
    	
		function getProductList(thispage, filterList){

			var whole = [];
        	var cates = [];
        	var page = [];
        	var ranklist = [];
        	
        	cates.push($("#top").val());
        	cates.push(""+parseInt($("#mid").val()/100));
        	cates.push($("#sub").val());
        	
        	page.push(thispage);
        	ranklist.push(rank);
        	
			whole.push(filterList);
			whole.push(cates);
			whole.push(page);
			whole.push(ranklist);

			
			$.ajax({
		  		url:'getProductListCate.com',
		  		method:'post',
		  		data: JSON.stringify(whole),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
					$("#product-layer").append(resp);
		  				
		  		},
		  		error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		  		});
			
		}
        
        
        
        // 체크박스를 체크했을 때 리스트에 추가해주는 jquery
        function plusList(filter){
        	filterList.push(filter);
        	console.log("plus");
			console.log(filterList);
			
			if(filterList.length == 1){
				$(".category_filter_output_wrap").show(); 
			}

			var html = '<li class="category_filter_control_tag_item" id="'+filter+'">\
							<button class="category_filter_tag">\
							<div>'+filter+'</div>\
							<i class="fa-solid fa-xmark"></i>\
							</button>\
							</li>';
							
			
			$(".category_filter_control_tag_list").append(html);

			// filtering ajax 연결
			filtering(filterList);
        }
        
        // 동적요소 새롭게 이벤트 넣을 때
        $(document).on('click', '.category_filter_control_tag_item button', function(){
            var it = $(this).parent('li').attr("id");
            removeList(it);
            
            $("input[name=checking]:checked").each(function(){
            	if(it == $(this).val()){
            		$(this).prop("checked", false);
            	}
            })
        });
        

        
        // 체크박스를 해제했을 때 해당 요소 삭제하는 jquery
        function removeList(filter){
        	for(var i=0; i<filterList.length; i++){
        		if(filter == filterList[i]){
        			filterList.splice(i, 1);
					$(".category_filter_control_tag_item").eq(i).remove();
        			break;
        		}
        	}
        	console.log(filterList);
        	
        	if(filterList.length == 0){
				$(".category_filter_output_wrap").hide(); 
			}
        	
        	filtering(filterList);
        }
        
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
        	
        	var top = parseInt(code/10000);
        	var sub = code;
        	
        	var whole = top+"_"+sub;

        	$("#actionForm").find("input[name='catecode']").val(whole);
        	$("#actionForm").submit();

        }
        
        function filtering(list){
        	
        	// thispage 무조건 0으로 해서 전송
        	page = 0;
        	
        	var whole = [];
        	var cates = [];
        	var ranklist = [];
        	
        	cates.push($("#top").val());
        	cates.push(""+parseInt($("#mid").val()/100));
        	cates.push($("#sub").val());
        	
        	ranklist.push(rank);
        	
			whole.push(list);
			whole.push(cates);
			whole.push(ranklist);
			
			console.log(whole);

        	// 배송, 가격 필터링 추가해야함
			
        	
        	$.ajax({
    	  		url:'getFilterList.com',
    	  		method:'post',
    	  		data: JSON.stringify(whole),
    	  		contentType : 'application/json; charset=UTF-8',
    	  		dataType : 'html',
    	  		success : function(resp){
    				
    	  			$("#product-layer").html(resp);
    	  			totalCount = $("#filterCount").val();
                	$(".item_count").text("전체 " + totalCount);

    	  				
    	  		},
    	  		error : function(request, status, error) {
    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}
    	  		});
        	
        	
        	
        }
        
        $(document).ready(function(){
    		
    		$(".banner_link").click(function(e){
    			e.preventDefault();
    		});
    	
    		
    		
    		
    	
    	
    	
    	 
    	});
        
      
		
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
							<a class="movetitle" href="${title.cate_code }">${title.cate_name }</a>
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
					
					<form action="category.com" method="get" id="actionForm">
						<input type="hidden" name="catecode" value="">
					</form>
				</div>

				<div class="category_content col-12 col-md-9">
					<div class="category_header">
						<div class="category_header_title">
							<span>${title.cate_name }</span>
							<c:if test="${catename.size() > 0 }">
								<svg class="icon" width="8" height="8" viewBox="0 0 8 8" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path></svg>
								 <span>${catename[0].subcate_name }</span>
								<c:if test="${catename.size() > 1}">
									<svg class="icon" width="8" height="8" viewBox="0 0 8 8" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path></svg>
									 <span>${catename[1].subcate_name }</span>
								</c:if>
							</c:if>
						</div>
						<input type="hidden" value="${title.cate_code }" id="top">
						<input type="hidden" value="${catename[0].subcate_code }" id="mid">
						<input type="hidden" value="${catename[1].subcate_code }" id="sub">
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
									<a href="/house/category.com?catecode=${cateList[0].top_catecode }_${cateList[0].subcate_code}"> 
										<div class="navi_text" id="${cateList[0].subcate_code }">${cateList[0].subcate_name }</div>
									</a>
								</li>
							</c:forEach>
							
						</ul>
					</div>

					<div class="category_filter_control_layer">
						<ul class="category_filter_control_list">
							<!--for문-->
							<c:forEach items="${optionList }" var="option">
								<c:if test="${option[0].filter_name == '오늘의딜'}">
									<li class="category_filter_control_list_item">
										<button class="filter_btn" value="${option[0].filter_name }">
											<svg class="icon" width="12" height="10" fill="none"
												preserveAspectRatio="xMidYMid meet">
												<path
													d="M4.51 6.84L10.322.85 11.5 1.993 4.569 9.138.5 5.35l1.119-1.202L4.51 6.84z"
													fill="#C2C8CC"></path></svg>
											${option[0].filter_name }
										</button>
									</li>
								</c:if>
								<c:if test="${option[0].filter_name != '오늘의딜'}">
									<li class="category_filter_control_list_item">
										<button class="filter_btn" value="${option[0].filter_name }">
										${option[0].filter_name }
										<svg class="chevron" width="12" height="12"
											preserveAspectRatio="xMidYMid meet">
											<g fill="none" fill-rule="evenodd">
											<path d="M0 0h12v12H0z"></path>
											<path fill="currentColor" fill-rule="nonzero"
												d="M2.154 3L1 4.125 6 9l5-4.875L9.846 3 6 6.75z"></path></g></svg>

										</button>
										<!-- dropdown : 사용인원 -->
											
										<div class="dropdown_panel location dropping" id="${option[0].filter_name }">
											<ul class="property_filter_dropdown">
											<c:forEach items="${option }" var="item" begin="1">
												
												<li class="property_filter_dropdown_list">
													<button class="property_filter_dropdown_btn">
														<div class="property_filter_dropdown_item">
															<div class="_3zqA8 input-type">
																<input type="checkbox" class="_3UImz" value="${item.filter_name }" name="checking">
																<span class="_2mDYR">
																<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
																<span>${item.filter_name }</span>
														</div>
													</button>
												</li>
												</c:forEach>
											</ul>
										</div>
									</li>
								</c:if>

							</c:forEach>
							<!--  
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
								</button>-->
								<!-- dropdown 배송 -->
									<div class="dropdown_panel location dropping" id="배송">
										<ul class="property_filter_dropdown">
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="무료배송" name="checking1">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>무료배송</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="일반배송" name="checking1">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>일반배송</span>
													</div>
												</button>
											</li>
											<li class="property_filter_dropdown_list">
												<button class="property_filter_dropdown_btn">
													<div class="property_filter_dropdown_item">
														<div class="_3zqA8 input-type">
															<input type="checkbox" class="_3UImz" value="화물배송" name="checking1">
															<span class="_2mDYR">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR"><path fill="currentColor" d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path></svg></span></div>
														<span>화물배송</span>
													</div>
												</button>
											</li>
										</ul>
									</div>
							</li>
						</ul>
					</div>

						
					
						
					<!-- 선택한 태그 나오게 하는 거-->
					<div class="category_filter_output_wrap">
						<div class="category_filter_control_package">
							<div class="category_filter_control_pack">
								<ul class="category_filter_control_tag_list">
									
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
						<div class="item_count">전체 ${totalCount} </div>
						<button class="item_filter_btn" id="item_filter_btn">
							최신순
							<svg class="caret" width="8" height="8" viewBox="0 0 8 8"
								preserveAspectRatio="xMidYMid meet">
								<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>
						</button>

						<!-- dropdown -->
						<div class="dropdown_wrap" id="dropdown">
							<ul class="dropdown_list">
								<li>
									<button class="dropdown_btn" value="saleRanking">판매순</button>
								</li>
								<li>
									<button class="dropdown_btn" value="popularRanking">인기순</button>
									<!-- 스크랩순 -->
								</li>
								<li>
									<button class="dropdown_btn" value="reviewRanking">많은 리뷰순</button>
								</li>
								<li>
									<button class="dropdown_btn" value="highpriceRanking">높은 가격순</button>
								</li>
								<li>
									<button class="dropdown_btn" value="rowpriceRanking">낮은 가격순</button>
								</li>
								<li>
									<button class="dropdown_btn" value="latestRanking">최신순</button>
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

					<div class="photos row" id="product-layer">
						<c:forEach items="${productList }" var="product">
						<div class="deals_list_wrap col-6 col-lg-4">
							<article class="deals_item">
							 <c:choose>
	                                    <c:when test="${product.checkit eq true}">
	                                   
	                                    <div class="item_timer b_${product.post_id }" >
	                                    </div>
	                                    <div id="s_${product.post_id}"></div>
	                                    <button class="item_bookmark b_none" id="${product.post_id }" >
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
	                                    <g id="blue" fill="#ff778e" fill-rule="nonzero"
	                                                transform="matrix(1 0 0 -1 0 24)">
	                                    <use fill="#000" filter="url(#scrap-icon-3-a)" ></use>
	                                    <use fill="#FFF" fill-opacity=".4" ></use>
	                                    <use fill="#000" filter="url(#scrap-icon-3-c)" ></use>
	                                    <path id="blueshadow" stroke="#ff778e"
	                                                d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
	                                     </button>
	                                    </c:when>
	                                    <c:when test="${product.checkit eq false}">
	                                    <div class="item_timer b_${product.post_id }" >
	                                    </div>
	                                    <div id="s_${product.post_id}"></div>
	                                    <button class="item_bookmark b_blue" id="${product.post_id }"  >
	                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
	                                       height="24" viewBox="0 0 24 24" class="inactive-icon">
	                                    <defs>
	                                     <path id="scrap-icon-3-b" >
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
	                                    <g id="blue" fill="none" fill-rule="nonzero"
	                                          transform="matrix(1 0 0 -1 0 24)">
	                                    <use fill="#000" filter="url(#scrap-icon-3-a)"
	                                          ></use>
	                                    <use fill="#FFF" fill-opacity=".4"></use>
	                                    <use fill="#000" filter="url(#scrap-icon-3-c)"
	                                          ></use>
	                                    <path id="blueshadow" stroke="#FFF"
	                                          d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
	                                     </button>
	                                    </c:when>
	                                    </c:choose>
								<a href="productPage.com?p=${product.post_id }" style="text-decoration: none; width: 100%;">
									<div class="deals_item_wrap">
									
										<div class="deals_item_pic_out">
											<div class="deals_item_pic">
												<div class="item_ani">
													<img class="images" src="${product.photo_url }">
												</div>
											</div>
											
										</div>
										
										<div class="deals_item_content">
											<div class="deals_item_header">
												<span class="deals_item_header_brand">${product.company_name }</span> 
												<span class="deals_item_header_name">
				                               	<c:if test="${product.deal_status eq '게시' }">
													<span style="color: #f77;">[오늘의 딜]</span>
				                               	</c:if>
				                               	${product.post_name }</span>
											</div>
											<div class="deals_item_body_price">
												<c:if test="${product.deal_status eq null }">
			                                    <span class="sale_percent">${product.sale_ratio }%</span> 
			                                    <span class="price sale_price">${product.sale_price }</span>
			                                    </c:if>
			                                    <c:if test="${product.deal_status eq '게시' }">
			                                    <span class="sale_percent">${product.deal_saleratio }%</span> 
			                                    <span class="price sale_price">
			                                    	<fmt:formatNumber value="${product.deal_saleprice }" pattern="#,###"/>
			                                    </span>
			                                    </c:if>
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




