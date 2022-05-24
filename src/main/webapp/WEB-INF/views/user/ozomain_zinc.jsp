<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="resources/css/user_css/zinc/ozomain.css?var=21"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
<script>

	let rank = 'latestRanking';
	var firstscroll = 0;
	var page = 0; // 페이징

	$(document).ready(function(){
		
		totalCount = ${totalCount};
		
		$(".banner_link").click(function(e){
			e.preventDefault();
		});
		
		$(document).on("click",".b_blue",function(){
		var gun =  $(this).attr('id')
		
		
		
		
		
		
		/* var uid = sessionStorage.getItem('User_Num');
		console.log(uid)
		if(uid !=null){ */
			
		
		
		 $.ajax({
			url:"userscrap.com",
			type: 'post',
			data: JSON.stringify(gun),
			contentType:'application/json; charset=UTF-8',
			dataType: 'text',
			success: function(resp){
				setTimeout(function(){}, 400);
				$('#'+gun).find("#blue").css({fill:"#ff778e"});
				$('#'+gun).remove()
				$('#s_'+gun).append('<button class="item_bookmark b_none" id='+gun+'>'+
						'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon">'+
						'<defs>'+
 					    '<path id="scrap-icon-3-b" '+
						'		d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"&gt;'+
						'<filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>'+
						'<feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>'+
						'<feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>'+
						'<filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>'+
						'<feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite>'+
						'<feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>'+
						'<g id="blue" fill="#ff778e" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">'+
						'<use fill="#000" filter="url(#scrap-icon-3-a)"></use>'+
						'<use fill="#FFF" fill-opacity=".4"></use>'+
						'<use fill="#000" filter="url(#scrap-icon-3-c)"></use>'+
						'<path id="blueshadow" stroke="#ff778e" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>'+
						'</button>');
				console.log($('.b_none'));	
				
			}
			}) ;

		 
		/* }else{
			alert("로그인 해주세요");
		} */
			
		})
	
	 $(document).on("click",".b_none",function(){
		 var so =  $(this).attr('id')
			
		 /* 	var uid = sessionStorage.getItem('User_Num');
		 	console.log(uid)
		if(uid !=null){ */
			
			$.ajax({
				url:"scrapdelete.com",
				type: 'post',
				data: JSON.stringify(so),
				contentType:'application/json; charset=UTF-8',
				dataType: 'text',
				success: function(resp){
					setTimeout(function(){}, 400);
					$('#'+so).find("#blue").css({fill:"none"});
					$('#'+so).find("#blueshadow").css({stroke:"#FFF"})
					$('#'+so).remove()
					$('#s_'+so).append('<button class="item_bookmark b_blue" id='+so+'>'+
						'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="inactive-icon">'+
						'<defs>'+
 					    '<path id="scrap-icon-3-b" '+
						'		d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"&gt;'+
						'<filter id="scrap-icon-3-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>'+
						'<feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>'+
						'<feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>'+
						'<filter id="scrap-icon-3-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox">'+
						'<feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur>'+
						'<feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>'+
						'<feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite>'+
						'<feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>'+
						'<g id="blue" fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">'+
						'<use fill="#000" filter="url(#scrap-icon-3-a)"></use>'+
						'<use fill="#FFF" fill-opacity=".4"></use>'+
						'<use fill="#000" filter="url(#scrap-icon-3-c)"></use>'+
						'<path id="blueshadow" stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>'+
						'</button>');
					console.log($('#'+so));			
				}
				}) 
	/* 	}else{
			alert("로그인 해주세요");
		} */
	
		});  
		
		
		// 인기순 판매순 순위 매기기
		$(".dropdown_btn").click(function(){
			
			page = 0;
			rank = $(this).val();
			var ranktext = $(this).text();
			
			var html = '\
			<svg class="caret" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet">\
			<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>'
			
			$("#filter_btn").html(ranktext + html);
			alert(ranktext);
			
			
			var ranking = { "ranking" : rank };
			
			$.ajax({
		  		url:'mainRanking.com',
		  		method:'post',
		  		data: JSON.stringify(ranking),
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
				"page" : page,
				"ranking" : rank
		}
		
		console.log(searchMap)
		
		
		$.ajax({
	  		url:'getProductList.com',
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
	<div class="store_main">
		<!--carousel-->
		<div class="carousel_layout">

			<!-- for 문 -->
			<c:forEach items="${bannerList }" var="banner">
				<div class="carousel_frame">
					<a class="banner_link" href="${banner.banner_id }"> <!-- large image -->
						<div class="carousel_banner">
							<img class="banner_img_first" src="${banner.banner_urlbig }">
						</div> <!-- small image -->
						<div class="carousel_banner_sm">
							<img class="banner_img_second" src="${banner.banner_urlsm }">
						</div>
					</a>
				</div>
			</c:forEach>

			<!-- 이미지 양 옆 버튼 -->
			<div></div>

			<!-- 이미지 밑에 1/10 이런거 -->

			<!-- 5초마다 한번씩 사진 바뀌는 슬라이드 쇼 -->
			<script type="text/javascript">
				let slideIndex = 0;
				showSlides();

				function showSlides() {
					let i;
					let slides = document
							.getElementsByClassName("carousel_frame");
					for (i = 0; i < slides.length; i++) {
						slides[i].style.display = "none";
					}
					slideIndex++;
					if (slideIndex > slides.length) {
						slideIndex = 1
					}
					slides[slideIndex - 1].style.display = "block";
					setTimeout(showSlides, 3000);
				}
			</script>

		</div>



		<section class="container store_index_section">

			<div class="store_index_header">
				<p class="store_index_header_text" style="color: black;">오늘의딜</p>
				<a href="todaydeal.com" class="move_deals"
					style="text-decoration: none;">더보기</a>
			</div>

			<div class="row store_index_deals_container">
			
					<c:forEach items="${todayDealList }" var="deal">
	               <div class="col-12 col-md-4 col-lg-3">
	                  <div class="deals_list_wrap">
	                  <c:choose>
	                                    <c:when test="${deal.checkit eq true}">
	                                   
	                                    <div class="item_timer b_${deal.post_id }" >
	                                    <div>1일 남음</div>
	                                    </div>
	                                    <div id="s_${deal.post_id}"></div>
	                                    <button class="item_bookmark b_none" id="${deal.post_id }" >
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
	                                    <c:when test="${deal.checkit eq false}">
	                                    <div class="item_timer b_${deal.post_id }" >
	                                    <div>1일 남음</div>
	                                    </div>
	                                    <div id="s_${deal.post_id}"></div>
	                                    <button class="item_bookmark b_blue" id="${deal.post_id }"  >
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
	                     
	                        <a href="productPage.com?p=${deal.post_id }&deal=true" style="text-decoration: none; width: 100%;">
	                           <div class="deals_item_wrap">
	                              <div class="deals_item_pic_out">
	                                 <div class="deals_item_pic">
	                                    <div class="item_ani">
	                                       <img class="images" src="${deal.photo_url }">
	                                    </div>
	                                 </div>
	                       
	                                    
	                                
	                              </div>
	                              <div class="deals_item_content">
	                                 <div class="deals_item_header">
	                                    <span class="deals_item_header_brand">${deal.company_name }</span>
	                                    <span class="deals_item_header_name">${deal.post_name }</span>
	                                 </div>
	                                 <div class="deals_item_body_price">
	                                    <span class="sale_percent">${deal.deal_saleratio}%</span> <span
	                                       class="price">${deal.sale_price }</span>
	                                 </div>
	                                 <div class="deals_item_review">
	                                    <div class="review_icon">
	                                       <i class="fa-solid fa-star" style=""></i>
	                                    </div>
	                                    <div class="review_score">${deal.star_ratio }</div>
	                                 </div>
	                              </div>
	                           </div>
	                        </a>
	                     </article>
	                  </div>
	               </div>
	            </c:forEach>

			</div>

			<!-- 반응형 오늘의 딜 버튼 -->
			<a href="#">
				<div class="move_deals_btn">
					<span>오늘의 딜 더보기</span>
				</div>
			</a>

		</section>

		<section class="container store_index_category">
			<p class="store_index_category_text" style="color: black;">카테고리</p>
			<div class="category_whole">
				<!--button 하고 다음 category layout 처리도 해줘야함-->
				<div class="category_right_layout">
					<button class="category_btn_right" id="category_btn_right">
						<svg width="32" height="32" viewBox="0 0 32 32"
							preserveAspectRatio="xMidYMid meet">
							<g fill="none" fill-rule="evenodd">
							<rect width="32" height="32" fill="#000" fill-opacity=".26"
								rx="16"></rect>
							<path fill="#FFF" fill-rule="nonzero"
								d="M12 21.13l1.5 1.54L20 16l-6.5-6.67-1.5 1.54L17 16z"></path></g></svg>
					</button>
				</div>
				<div class="category_left_layout">
					<button class="category_btn_left" id="category_btn_left">
						<svg width="32" height="32" viewBox="0 0 32 32"
							preserveAspectRatio="xMidYMid meet">
							<g fill="none" fill-rule="evenodd">
							<rect width="32" height="32" fill="#000" fill-opacity=".26"
								rx="16"></rect>
							<path fill="#FFF" fill-rule="nonzero"
								d="M20 10.87l-1.5-1.54L12 16l6.5 6.67 1.5-1.54L15 16z"></path></g></svg>
					</button>
				</div>
				<div class="category_list" id="category_list">
					<!--for문 해야하나?-->
					<div class="category_item_wrap">
						<a href="category.com?catecode=1">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate1.webp">
								<div class="category_item_title">가구</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=2">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate2.webp">
								<div class="category_item_title">패브릭</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=16">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate3.webp">
								<div class="category_item_title">조명</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=3">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate4.webp">
								<div class="category_item_title">가전</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=4">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate5.webp">
								<div class="category_item_title">주방용품</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=5">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate6.webp">
								<div class="category_item_title">데코/식물</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=7">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate7.webp">
								<div class="category_item_title">수납정리</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=6">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate8.webp">
								<div class="category_item_title">생활용품</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=1_10500">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate9.webp">
								<div class="category_item_title">서랍/수납장</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=8">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate10.webp">
								<div class="category_item_title">생필품</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=9">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate11.webp">
								<div class="category_item_title">공구DIY</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=10">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate12.webp">
								<div class="category_item_title">인테리어시공</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=11">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate13.webp">
								<div class="category_item_title">반려동물</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=12">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate14.webp">
								<div class="category_item_title">캠핑용품</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=13">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate15.webp">
								<div class="category_item_title">실내운동</div>
							</div>
						</a>
					</div>
					<div class="category_item_wrap">
						<a href="category.com?catecode=15">
							<div class="category_item">
								<img class="category_item_image"
									src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/cate16.webp">
								<div class="category_item_title">렌탈</div>
							</div>
						</a>
					</div>
				</div>
			</div>

			<script src="resources/js/userjs/category_move.js"
				type="text/javascript"></script>
		</section>

		<section class="container store_index_best">
			<div class="store_index_best_header">
				<p class="store_index_best_text" style="color: black;">인기상품</p>
				<button class="filter_btn" id="filter_btn">
					최신순
					<svg class="caret" width="8" height="8" viewBox="0 0 8 8"
						preserveAspectRatio="xMidYMid meet">
						<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path></svg>
				</button>
			</div>

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

			<script>
				var filter_btn = document.getElementById("filter_btn");
				var dropdown = document.getElementById("dropdown");

				filter_btn.addEventListener('mouseenter', function() {
					dropdown.style.display = 'block';
				});

				dropdown.addEventListener('mouseleave', function() {
					dropdown.style.display = 'none';
				});
			</script>

			<!-- 인기 아이템 나열 -->
			<div class="row best_production" id="itemLayer">
			
				  <c:forEach items="${productList }" var="product">
		               <div class="col-12 col-md-4 col-lg-3">
		                  <div  class="deals_list_wrap">
		                    <c:choose>
		                                    <c:when test="${product.checkit eq true}">
		                                     <div id="s_${product.post_id}"></div>
		                                    <button class="item_bookmark b_none" id="${product.post_id }">
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
		                                    <path id="blueshodow" stroke="#ff778e"
		                                                d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
		                                    
		                                    </button>
		                                    </c:when>
		                                    <c:when test="${product.checkit eq false}">
		                                    <div id="s_${product.post_id}"></div>
		                                    <button class="item_bookmark b_blue" id="${product.post_id }">
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
		                                    <g id="blue" fill="none" fill-rule="nonzero"
		                                          transform="matrix(1 0 0 -1 0 24)">
		                                    <use fill="#000" filter="url(#scrap-icon-3-a)"
		                                          ></use>
		                                    <use fill="#FFF" fill-opacity=".4"></use>
		                                    <use fill="#000" filter="url(#scrap-icon-3-c)"
		                                          ></use>
		                                    <path id="blueshodow" stroke="#FFF"
		                                          d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
		                                    </button>
		                                    </c:when>
		                                    </c:choose>
		                     <article class="deals_item">		                     
		                        <a id="${product.post_id }" href="productPage.com?p=${product.post_id }" style="text-decoration: none; width: 100%;">
		                           <div class="deals_item_wrap">
		                              <div class="deals_item_pic_out">
		                                 <div class="deals_item_pic">
		                                 
		                                    <div class="item_ani">
		                                       <img class="images" src="${product.photo_url}">
		                                       </div>
		                                      
		                                  
		                                 </div>
		                              </div>
		                                 
		                              <div class="deals_item_content">
		                                 <div class="deals_item_header">
		                                    <span class="deals_item_header_brand">${product.company_name }</span>
		                                    <span class="deals_item_header_name">${product.post_name }</span>
		                                 </div>
		                                 <div class="deals_item_body_price">
		                                    <span class="sale_percent">${product.sale_ratio }%</span> <span
		                                       class="price sale_price">${product.sale_price }</span>
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
		               </div>
		            </c:forEach>
						
			</div>
		</section>
	</div>


	
	<div class="footer_topH" style="width:100%"></div>
	<!-- paging -->


	<footer>
		<jsp:include page="./footer/footer.jsp"></jsp:include>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>