<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ozo_brandshop</title>
    <link href="resources/css/user_css/zinc/ozoshop_main.css?var=12" rel="stylesheet"/>
    <link href="resources/css/user_css/zinc/ozoper_photo_cate.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
            integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
            crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script type="text/javascript"
	src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="resources/js/userjs/bookmark.js?var=12"></script>
    <script>
    
    	let rank = 'latestRanking';
    	let totalCount;
    	let brandcode;
    	
       	var firstscroll = 0;
       	var page = 0;

        $(document).ready(function(){
        	
        	totalCount = ${totalCount};
        	brandcode = ${seller.seller_id};

            $(".filter_btn").on('click', function(){
                console.log(this.value);
                $(".category_filter_output_wrap").show();

                $(".category_filter_control_tag_item button div").text(this.value);
            });

            /* 카테고리 토글 */
            $(".category_tree_child_layer").hide();
            $(".category_entry_expand", this).click(function(){
                var open = $(this).parents("div").siblings("div");
                console.log(open[0]);
                $(open[0]).slideToggle();
            });

            $(".reset_btn").click(function(){
                $(".category_filter_output_wrap").hide();
            });

            /* modal */
            $(".brand_info_modal_close", this).click(function(){
                $(".modal_layer").hide();
            });

            $(".info_action").click(function(){
                $(".modal_layer").show();
            });
            
            
            $(".moveTitle").click(function(){
            	
            	
            })
            
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
			
			
			var searchMap = { 
					"brandcode" : brandcode,
					"ranking" : rank 
			};
			
			$.ajax({
		  		url:'brandshopRank.com',
		  		method:'post',
		  		data: JSON.stringify(searchMap),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'html',
		  		success : function(resp){
					
		  			$("#itemLayer").html(resp); // filtering data 넣어주기
		  			
		  				
		  		},
		  		error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		  		});
			
			
			
			})

        });
        
     // 무한 스크롤

   	
   	$(window).on("scroll", function(event){
   		
   		//console.log("window.innerHeight : ${window.innerHeight}");
   	    //console.log("window.scrollY : ${window.scrollY}");
   	    //console.log("document.body.offsetHeight : ${document.body.offsetHeight}");
   		
   		var scrollTop = $(window).scrollTop();
   		//console.log("scrollTop : " + scrollTop);

   		var windowHeight = $(window).height();
   		//console.log("windowHeight : " + windowHeight);
   		
   		var documentHeight = $(document).height();
   		//console.log("documentHeight : " + documentHeight);
   		
   		// scroll 위치...
   		var isBottom=scrollTop+windowHeight + 100 >= documentHeight;

   		if(isBottom){
   			
   			if(totalCount%12 == 0){
				console.log(totalCount/12)
				var pag = parseInt(totalCount/12-1); 
			}else{
				var pag = parseInt(totalCount/12); 
			}
   			
   			if(page == pag){ // productList개수/4 인 몫 값을 가져와야 함
   				return;
   			}
   			
   			page++;
   			getProductList(page);

   		}
   	});
   	
   	
	function getProductList(page){
	
		console.log("thispage :" +page);
		
		
		var searchMap = {
				"brandcode" : brandcode,
				"page" : page,
				"ranking" : rank
		}
		
		console.log(searchMap)
		
		
		$.ajax({
	  		url:'brandshopPaging.com',
	  		method:'post',
	  		data: JSON.stringify(searchMap),
	  		contentType : 'application/json; charset=UTF-8',
	  		dataType : 'html',
	  		success : function(resp){
				$("#itemLayer").append(resp);
	  			
	  		},
	  		error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	  		});
		
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
                <article class="brand_profile">
                	<c:if test="${seller.seller_representpic ne null}">
	                    <div class="brand_profile_image">
	                        <img src="${seller.seller_representpic }">
	                    </div>
	                 </c:if>

                    <div class="brand_profile_content">

                        <p class="brand_profile_content_title">${seller.company_name}</p>
                        <p class="brand_profile_overview" value="${brandStarRatio }">
                        <c:choose>
							<c:when test="${brandStarRatio >= 4.5}">
	                        	<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
                        	</c:when>
                        	<c:when test="${brandStarRatio >= 3.5}">
	                        	<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
                        	</c:when>
                        	<c:when test="${brandStarRatio >= 2.5}">
	                        	<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
                        	</c:when>
                        	<c:when test="${brandStarRatio >= 1.5}">
	                        	<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
                        	</c:when>
                        	<c:when test="${brandStarRatio >= 0.5}">
	                        	<span class="fillstar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
                        	</c:when>
                        	<c:otherwise>
                        		<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
								<span class="nonestar"><i class="fa-solid fa-star"></i></span>
                        	</c:otherwise>
                        </c:choose>
                            <span class="brand-profile__count">${brandStarRatio }</span>
                        </p>
                    </div>

                </article>


                <section class="category_list">
                		<c:if test="${sublist == null}">
                		<div class="category_list_title">
                			<c:forEach items="${toplist }" var="top">
                				<div class="firsttitlelayer">
									<a class="movetitle" href="brandshop.com?brandcode=${seller.seller_id}&catecode=${top.cate_code }">${top.cate_name }</a>
								</div>
							</c:forEach>
						</div>
						</c:if>
						
						<c:if test="${sublist.size()  > 0 }">
						<div class="category_list_title">
							<a class="movetitle" href="brandshop.com?brandcode=${seller.seller_id}&catecode=${title.cate_code }">${title.cate_name }</a>
						</div>
						<ul class="category_tree">
							
							<c:forEach items="${sublist }" var="sub">
								<li class="category_entry">
									<div class="category_entry_header">
										<a href="brandshop.com?brandcode=${seller.seller_id}&catecode=${title.cate_code }_${sub[0].subcate_code }" class="category_entry_move subcate">${sub[0].subcate_name }</a>
										<c:if test="${sub[1] != null }">
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
											<c:forEach items="${sub }" var="sm" begin="1">
											<li class="category_tree_children_entry">
												<a href="brandshop.com?brandcode=${seller.seller_id}&catecode=${title.cate_code }_${sm.subcate_code }" class="botcate">${sm.subcate_name }</a>
											</li>
											</c:forEach>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>

						<ul class="category_list_others">
							
							<c:forEach items="${others }" var="other">
								<li class="category_list_others_item">
								<a href="brandshop.com?brandcode=${seller.seller_id}&catecode=${other.cate_code }" class="movetitle">${other.cate_name }</a></li>
							</c:forEach>
							
						</ul>
						</c:if>
				</section>
            </div>

            <div class="category_content col-12 col-md-9">
                <div class="category_header">
                    <div class="category_header_title">
                    	<span style="font-weight: 600;">모든 상품</span>
                        <span class="brandname">
                        	(<a href="brandshop.com?brandcode=${seller.seller_id}" class="link">${seller.company_name}</a>)
                        </span>
                    </div>
                </div>

                <div class="brand_header_wrap">

                    <nav class="brand_header_menu_wrap">
                        <ul class="brand_header_menu_list">
                            <!--for문-->
                            <c:forEach items="${toplist }" var="top"> 
                            <li class="brand_header_menu_list_item_wrap">
                                <div class="brand_header_menu_list_item">
                                    <a href="#">
                                        <div class="brand_header_menu_list_item_name">
                                            ${top.cate_name }
                                        </div>
                                    </a>
                                </div>
                            </li>
                            </c:forEach>


                        </ul>
                    </nav>

                </div>



                <section class="brand_product_section">

                    <div class="filter">

                      
                        <div class="item_count_layer">
                            <div class="item_count">전체 ${totalCount }</div>
                            <button class="item_filter_btn" id="item_filter_btn">최신순
                                <svg class="caret" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet"><path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>
                            </button>

                            <!-- dropdown -->
                            <div class="dropdown_wrap" id="dropdown">
                                <ul class="dropdown_list">
                                    <li>
                                        <button class="dropdown_btn" value="saleRanking">판매순</button>
                                    </li>
                                    <li>
                                        <button class="dropdown_btn" value="popularRanking">인기순</button>
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

                    </div>


                </section>

                <div class="photos row" id="itemLayer">
                    <c:forEach items="${shopItemList }" var="shopItem">
                        <div class="deals_list_wrap col-6 col-lg-4">
                        <c:choose>
	                                    <c:when test="${shopItem.checkit eq true}">
	                                    <div id="s_${shopItem.post_id}"></div>
	                                    <button class="item_bookmark b_none" id="${shopItem.post_id }" >
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
	                                    <c:when test="${shopItem.checkit eq false}">
	                                    <div id="s_${shopItem.post_id}"></div>
	                                    <button class="item_bookmark b_blue" id="${shopItem.post_id }"  >
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
                            <article class="deals_item">
                                <a href="/house/productPage.com?p=${shopItem.post_id }" style="text-decoration: none; width: 100%;">
                                    <div class="deals_item_wrap">
                                        <div class="deals_item_pic_out">
                                            <div class="deals_item_pic">
                                                <div class="item_ani">
                                                    <img class="images" src="${shopItem.photo_url }">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="deals_item_content">
                                            <div class="deals_item_header">
                                                <span class="deals_item_header_brand">${shopItem.company_name}</span>
                                                <span class="deals_item_header_name">${shopItem.post_name}</span>
                                            </div>
                                            <div class="deals_item_body_price">
                                                <span class="sale_percent">${shopItem.sale_ratio}%</span>
                                                <span class="price">${shopItem.sale_price}</span>
                                            </div>
                                            <div class="deals_item_review">
                                                <div class="review_icon">
                                                    <i class="fa-solid fa-star" style="color:#ff778e"></i>
                                                </div>
                                                <div class="review_score">${shopItem.star_ratio }</div>

                                            </div>
                                            <div class="best_item_info">
                                                <svg id="freeship_icon" class="icon" aria-label="무료배송" width="47" height="20" viewBox="0 0 47 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="47" height="20" fill="#000" fill-opacity=".07" fill-rule="nonzero" rx="4"></rect><path fill="#757575" d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
                                                <svg id="saleprice_icon" class="icon" aria-label="특가" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet"><rect width="30" height="20" fill="#F77" rx="4"></rect><path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path></svg>
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

<!--modal-->
<div class="modal_layer">
    <div class="option_modal modal_background">
        <div class="modal_content_wrap">
            <button class="brand_info_modal_close btn_position">
                <svg class="icon-md" width="20" height="20" viewBox="0 0 20 20" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M11.6 10l7.1 7.1-1.6 1.6-7.1-7.1-7.1 7.1-1.6-1.6L8.4 10 1.3 2.9l1.6-1.6L10 8.4l7.1-7.1 1.6 1.6z"></path></svg>
            </button>
            <div class="carted_option_change_content modal_content">

                <article class="brand_modal_info">
                    <h1>쌀국수죠아</h1>
                </article>
                <ul class="brand_info_content_list">
                    <!--for문-->
                    <li class="brand_info_content_list_item">
                        <img src="sources/brandinfo1.webp">
                    </li>
                    <li class="brand_info_content_list_item">
                        <img src="sources/brandinfo2.webp">
                    </li>
                    <li class="brand_info_content_list_item">
                        <img src="sources/brandinfo3.webp">
                    </li>
                </ul>


            </div>
        </div>
    </div>
</div>
<footer>
    <jsp:include page="./footer/footer.jsp"></jsp:include>
</footer>

</body>
</html>

