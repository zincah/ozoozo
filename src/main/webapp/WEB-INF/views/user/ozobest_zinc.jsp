<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="resources/css/user_css/zinc/ozobest.css" rel="stylesheet" type="text/css" />
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
				class="ranking_type_filter ranking_type_filter_left ranking_type_filter_left_active">실시간
					베스트</li>
			</a>
			<a class="link_to_rank" href="#">
				<li id="right" class="ranking_type_filter ranking_type_filter_right">역대
					베스트</li>
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
			var left = document.getElementById('left');
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
			});
		</script>

		<div class="">
			<div class="row">
				<!--for문-->
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="resources/assets/img/k.webp">
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
										<div class="item_tag tag_img">
											<span>1</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/deal2.webp">
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
										<div class="item_tag tag_img">
											<span>2</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/deal3.webp">
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
										<div class="item_tag tag_img">
											<span>3</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/deal4.webp">
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
										<div class="item_tag taggrey_img">
											<span>4</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/best4.webp">
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
										<div class="item_tag taggrey_img">
											<span>5</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/best3.webp">
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
										<div class="item_tag taggrey_img">
											<span>6</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/best2.webp">
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
										<div class="item_tag taggrey_img">
											<span>7</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/best1.jpg">
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
										<div class="item_tag taggrey_img">
											<span>8</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
				<div class="col-12 col-md-12 col-lg-3">
					<div class="deals_list_wrap">
						<article class="deals_item">
							<a href="#" style="text-decoration: none;">
								<div class="deals_item_wrap">
									<div class="deals_item_pic_out">
										<div class="deals_item_pic">
											<div class="item_ani">
												<img class="images" src="sources/deal1.webp">
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
										<div class="item_tag taggrey_img">
											<span>9</span>
										</div>
									</div>
									<div class="deals_item_content">
										<div class="deals_item_header">
											<span class="deals_item_header_brand">브랜드</span> <span
												class="deals_item_header_name">[1+1] 여기에는 이름을 적으면 될 듯
												어쩌구저쩌구 블라블라 안녕 안녕</span>
										</div>
										<div class="deals_item_body_price">
											<span class="sale_percent">50%</span> <span class="price">10,000</span>
										</div>
										<div class="deals_item_review">
											<div class="review_icon">
												<i class="fa-solid fa-star" style="color: #6AC8FE"></i>
											</div>
											<div class="review_score">4.6</div>
											<div class="review_count">리뷰 3,641</div>
										</div>
										<div class="best_item_info">
											<svg id="freeship_icon" class="icon" aria-label="무료배송"
												width="47" height="20" viewBox="0 0 47 20"
												preserveAspectRatio="xMidYMid meet">
												<g fill="none" fill-rule="evenodd">
												<rect width="47" height="20" fill="#000" fill-opacity=".07"
													fill-rule="nonzero" rx="4"></rect>
												<path fill="#757575"
													d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"></path></g></svg>
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
			</div>
		</div>
	</div>
<footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>



</body>
</html>