<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="resources/css/user_css/zinc/ozobest.css?var=1"
	rel="stylesheet" type="text/css" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<jsp:include page="./header/OzoH.jsp"></jsp:include>
	</header>

	<div class="container">
		<ol class="best_list" id="rank_layer">
			<a class="link_to_rank" href="#">
				<li id="left"
				class="ranking_type_filter ranking_type_filter_left ranking_type_filter_left_active">실시간베스트</li>
			</a>

		</ol>

		<div class="ranking_category_filter" id="cate_filter">
			<ol class="ranking_category_whole_list">
				<li class="ranking_category_list"><a href="#">전체</a></li>
				<li class="ranking_category_list"><a href="#">가구</a></li>
				<li class="ranking_category_list"><a href="#">패브릭</a></li>
				<li class="ranking_category_list"><a href="#">조명</a></li>
				<li class="ranking_category_list"><a href="#">가전</a></li>
				<li class="ranking_category_list"><a href="#">주방용품</a></li>
				<li class="ranking_category_list"><a href="#">데코.식물</a></li>
				<li class="ranking_category_list"><a href="#">수납.정리</a></li>
				<li class="ranking_category_list"><a href="#">생활용품</a></li>
				<li class="ranking_category_list"><a href="#">생필품</a></li>
				<li class="ranking_category_list"><a href="#">공구.DIY</a></li>
				<li class="ranking_category_list"><a href="#">인테리어시공</a></li>
				<li class="ranking_category_list"><a href="#">반려동물</a></li>
				<li class="ranking_category_list"><a href="#">캠핑용품</a></li>
				<li class="ranking_category_list"><a href="#">실내운동</a></li>
				<li class="ranking_category_list"><a href="#">유아.아동</a></li>
				<li class="ranking_category_list"><a href="#">렌탈</a></li>
				<li class="ranking_category_list"><a href="#">식품</a></li>
			</ol>
		</div>

		<!-- button 효과 -->
		<script>
		/* 	var left = document.getElementById('left');
			var right = document.getElementById('right');
			var best = document.getElementById('rank_layer');
			var filter = document.getElementById('cate_filter');

			left.addEventListener("click", function() {
				right.classList.remove('ranking_type_filter_right_active');
				left.classList.add('ranking_type_filter_left_active');
				best.style.backgroundColor = "#fff";
				filter.style.display = 'none';
			});

			right.addEventListener("click", function() {
				right.classList.add('ranking_type_filter_right_active');
				left.classList.remove('ranking_type_filter_left_active');
				best.style.backgroundColor = 'rgb(247, 248, 250)';
				filter.style.display = 'block';
			}); */
			$(document).ready(function(){
				
				
			
				
				
				
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
			
			
			 
			});
		</script>

		<div class="">
			<div class="row">
				<!--for문-->
				<c:forEach items="${bestlist }" var="bestlist" varStatus="status">

					<div class="col-12 col-md-4 col-lg-3">
						<div class="deals_list_wrap">
							<article class="deals_item">
						<div class="ranking-product-item__img-wrap__number ranking-product-item__img-wrap__number__gray"><span><c:out value='${status.count }' /></span></div>
								<div class="item_tag tag_img">
									<span></span>
								</div>
								<c:choose>
									<c:when test="${bestlist.checkit eq true}">

										<div class="item_timer s_${bestlist.post_id }"></div>
										<div id="s_${bestlist.post_id}"></div>
										<button class="item_bookmark b_none" id="${bestlist.post_id }">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" class="inactive-icon">
	                                    <defs>
	                                    <path id="scrap-icon-3-b"
													d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path>
	                                    <filter id="scrap-icon-3-a"
													width="150%" height="150%" x="-25%" y="-25%"
													filterUnits="objectBoundingBox">
	                                    <feOffset in="SourceAlpha"
													result="shadowOffsetOuter1"></feOffset>
	                                    <feGaussianBlur
													in="shadowOffsetOuter1" result="shadowBlurOuter1"
													stdDeviation="1.5"></feGaussianBlur>
	                                    <feComposite in="shadowBlurOuter1"
													in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>
	                                    <feColorMatrix
													in="shadowBlurOuter1"
													values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>
	                                    <filter id="scrap-icon-3-c"
													width="150%" height="150%" x="-25%" y="-25%"
													filterUnits="objectBoundingBox">
	                                    <feGaussianBlur in="SourceAlpha"
													result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur>
	                                    <feOffset in="shadowBlurInner1"
													result="shadowOffsetInner1"></feOffset>
	                                    <feComposite
													in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1"
													operator="arithmetic" result="shadowInnerInner1"></feComposite>
	                                    <feColorMatrix
													in="shadowInnerInner1"
													values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>
	                                    <g id="blue" fill="#ff778e"
													fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">
	                                    <use fill="#000"
													filter="url(#scrap-icon-3-a)"></use>
	                                    <use fill="#FFF" fill-opacity=".4"></use>
	                                    <use fill="#000"
													filter="url(#scrap-icon-3-c)"></use>
	                                    <path id="blueshadow"
													stroke="#ff778e"
													d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
										</button>
									</c:when>
									<c:when test="${bestlist.checkit eq false}">
										<div class="item_timer s_${bestlist.post_id }"></div>
										<div id="s_${bestlist.post_id}"></div>
										<button class="item_bookmark b_blue" id="${bestlist.post_id }">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" class="inactive-icon">
	                                    <defs>
	                                     <path id="scrap-icon-3-b">
	                                          d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path>
	                                    <filter id="scrap-icon-3-a"
													width="150%" height="150%" x="-25%" y="-25%"
													filterUnits="objectBoundingBox">
	                                    <feOffset in="SourceAlpha"
													result="shadowOffsetOuter1"></feOffset>
	                                    <feGaussianBlur
													in="shadowOffsetOuter1" result="shadowBlurOuter1"
													stdDeviation="1.5"></feGaussianBlur>
	                                    <feComposite in="shadowBlurOuter1"
													in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite>
	                                    <feColorMatrix
													in="shadowBlurOuter1"
													values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter>
	                                    <filter id="scrap-icon-3-c"
													width="150%" height="150%" x="-25%" y="-25%"
													filterUnits="objectBoundingBox">
	                                    <feGaussianBlur in="SourceAlpha"
													result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur>
	                                    <feOffset in="shadowBlurInner1"
													result="shadowOffsetInner1"></feOffset>
	                                    <feComposite
													in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1"
													operator="arithmetic" result="shadowInnerInner1"></feComposite>
	                                    <feColorMatrix
													in="shadowInnerInner1"
													values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs>
	                                    <g id="blue" fill="none"
													fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">
	                                    <use fill="#000"
													filter="url(#scrap-icon-3-a)"></use>
	                                    <use fill="#FFF" fill-opacity=".4"></use>
	                                    <use fill="#000"
													filter="url(#scrap-icon-3-c)"></use>
	                                    <path id="blueshadow" stroke="#FFF"
													d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
										</button>
									</c:when>
								</c:choose>
								<a href="productPage.com?p=${bestlist.post_id }&deal=true"
									style="text-decoration: none; width: 100%;">
									<div class="deals_item_wrap">
										<div class="deals_item_pic_out">
											<div class="deals_item_pic">
												<div class="item_ani">
													<img class="images" src="${bestlist.photo_url }">
												</div>
											</div>



										</div>
										<div class="deals_item_content">
											<div class="deals_item_header">
												<span class="deals_item_header_brand">${bestlist.company_name }</span>
												<span class="deals_item_header_name">${bestlist.post_name }</span>
											</div>
											<div class="deals_item_body_price">
												<span class="sale_percent">${bestlist.sale_ratio}%</span> <span
													class="price">${bestlist.sale_price }</span>
											</div>
											<div class="deals_item_review">
												<div class="review_icon">
													<i class="fa-solid fa-star" style=""></i>
												</div>
												<div class="review_score">${bestlist.star_ratio }</div>
											</div>
										</div>
									</div>
								</a>
							</article>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="./footer/footer.jsp"></jsp:include>
	</footer>



</body>
</html>