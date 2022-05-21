<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta property="og:title" content="내가 작성한 리뷰" />
    <meta property="og:type" content="website" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myPage-nav-style.css" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myReview-view-style.css?var=23" />
    <link rel="stylesheet" href="resources/css/user_css/zinc/reviewmodal.css?var=2" />
    <link rel="stylesheet" href="resources/css/user_css/inha/footer-style.css" />
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <style type="text/css">
      address {
        font-style: normal;
      }
    </style>
    <title>내가 작성한 리뷰</title>
    <script>

    	$(document).ready(function(){
    		
    		$(".modifybtn").click(function(){
    			var id = $("input[name=review_id]").val();
    			openmodal(id);
    			$(".thismodal").show();
    		})
    		
    		$(".review-modal__close").click(function(){
    			alert("작업하던 내용이 유실됩니다.");
    			// modal 띄우는 거로 바꾸기
    			$(".thismodal").hide();
    		})
    		
    		$(".rating-input__star").click(function(){
    			var star = $(this).find('input').val();
    			checkstar(star);
    		})

    	});
    	
    	function checkstar(star){
    		if(star == 5){
				$("#star5").attr('class', 'rating-input__star1');
				$("#star4").attr('class', 'rating-input__star1');
				$("#star3").attr('class', 'rating-input__star1');
				$("#star2").attr('class', 'rating-input__star1');
				$("#star1").attr('class', 'rating-input__star1');
			}else if(star == 4){
				$("#star5").attr('class', 'rating-input__star');
				$("#star4").attr('class', 'rating-input__star1');
				$("#star3").attr('class', 'rating-input__star1');
				$("#star2").attr('class', 'rating-input__star1');
				$("#star1").attr('class', 'rating-input__star1');
			}else if(star == 3){
				$("#star5").attr('class', 'rating-input__star');
				$("#star4").attr('class', 'rating-input__star');
				$("#star3").attr('class', 'rating-input__star1');
				$("#star2").attr('class', 'rating-input__star1');
				$("#star1").attr('class', 'rating-input__star1');
			}else if(star == 2){
				$("#star5").attr('class', 'rating-input__star');
				$("#star4").attr('class', 'rating-input__star');
				$("#star3").attr('class', 'rating-input__star');
				$("#star2").attr('class', 'rating-input__star1');
				$("#star1").attr('class', 'rating-input__star1');
			}else if(star == 1){
				$("#star5").attr('class', 'rating-input__star');
				$("#star4").attr('class', 'rating-input__star');
				$("#star3").attr('class', 'rating-input__star');
				$("#star2").attr('class', 'rating-input__star');
				$("#star1").attr('class', 'rating-input__star1');
			}
    	}
    	
    	
		function openmodal(id){
    		
    		
    		
    		$.ajax({
		  		url:'getMyReview.com',
		  		method:'post',
		  		data: JSON.stringify(id),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(resp){
		  			
		  			
		  			console.log(resp);

		  			$("#brandimg").attr('src', ''+[resp.photo_url]+'');
		  			$("#company_name").text(''+[resp.company_name]+'');
		  			$("#post_name").text(''+[resp.post_name]+'');
		  			
		  			var options;
		  			if([resp.option2] != null){
		  				options = [resp.option1_name] + ':' + [resp.option1] + " / "
		  				+ [resp.option2_name] + ":" + [resp.option2];
		  			}else{
		  				options = [resp.option1_name] + ':' + [resp.option1];
		  			}
		  			
		  			$("#options").text(options);
		  			
		  			if([resp.review_image]!=null){
		  				$(".select-picture").show();
		  				var oriImage = document.createElement("img");
		  	          	oriImage.setAttribute("class", "upload_img");
		  	          	oriImage.src = [resp.review_image];
		  	        	oriImage.style.visibility = "visible";
		  	      		oriImage.style.objectFit = "contain";
		  	          	$(".select-picture").append(oriImage);
		  			}
		  			
		  			console.log([resp.recontent]);
		  			$("input[name=recontent]").append([resp.recontent]);
		  			
		  			var star = [resp.rating];
		  			checkstar(star);

		  			// input setting
		  			$("input[name=reproduct_id]").val([resp.reproduct_id]);
		  			$("input[name=reseller_id]").val([resp.reseller_id]);
		  			$("input[name=repost_id]").val([resp.repost_id]);
		  			
		  			if(resp == null){
		  				alert("창을 끄고 다시한번 시도해주세요");
		  			}
		  			
		  		}
    		});

    	}
    
    
    </script>
  </head>
  <body>
  <header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage">
      <!-- nav -->
      <div class="mypage-nav">
        <nav class="page-navigation mypage-nav-owner">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a class="active" href="/house/myPage.com" target="self">프로필</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/myshopping.com" target="self">나의 쇼핑</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/review.com" target="self">나의 리뷰</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/edit.com" target="self">설정</a>
            </li>
          </ul>
        </nav>
        <nav class="page-navigation mypage-nav-content">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a class="" href="/house/review.com">리뷰쓰기</a>
            </li>
            <li class="mypage-nav-item">
              <a class="active select" href="/house/review_view.com">내가 작성한 리뷰</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    
	    <!-- content -->
	    <div class="my-review-list container">
	      <div class="virtualized-list my-review-list__list" style="padding-top: 0px; padding-bottom: 0px; transform: translateY(0px);">

			<c:forEach items="${myreviewlist }" var="myreview">
				<div>
		          <div class="my-review-list__list__item">
		            <div class="my-review-list__list__item__wrap">
		              <div class="my-review-list__list__item__product">
		                <a class="my-review-list__list__item__product__name" href="productPage.com?p=${myreview.repost_id }">
		                <input type="hidden" name="review_id" value="${myreview.review_id }">
		                <div class="my-review-list__list__item__product__explain">
		                  [${myreview.company_name }]${myreview.post_name }
		                </div>
		                <div class="acss-176vqvk">
		                  ${myreview.option1_name }: ${myreview.option1 } 
		    				<c:if test="${myreview.option2 ne null }">
		    					/ ${myreview.option2_name }: ${myreview.option2 }
		    				</c:if>
		                </div>
		                <div class="my-review-list__list__item__product__info">
		                  <span class="my-review-list__list__item__product__info__star" aria-label="별점 점">
		                  	<!-- 별 for문 -->
							<c:if test="${myreview.rating eq 5 }">
								<div class="my-review-list__list__item__product__info__text__fill">
			                  		<i class="fa-solid fa-star"></i>
			                  	</div>
			                  	<div class="my-review-list__list__item__product__info__text__fill">
			                  		<i class="fa-solid fa-star"></i>
			                  	</div>
			                  	<div class="my-review-list__list__item__product__info__text__fill">
			                  		<i class="fa-solid fa-star"></i>
			                  	</div>
			                  	<div class="my-review-list__list__item__product__info__text__fill">
			                  		<i class="fa-solid fa-star"></i>
			                  	</div>
			                  	<div class="my-review-list__list__item__product__info__text__fill">
			                  		<i class="fa-solid fa-star"></i>
			                  	</div>
							</c:if>
							<c:if test="${myreview.rating eq 4 }">
							<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
							</c:if>
							<c:if test="${myreview.rating eq 3 }">
							<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
		                  	<div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
							</c:if>
							<c:if test="${myreview.rating eq 2 }">
							<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
			                <div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
			                <div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
							</c:if>
							<c:if test="${myreview.rating eq 1 }">
							<div class="my-review-list__list__item__product__info__text__fill">
		                  		<i class="fa-solid fa-star"></i>
		                  	</div>
		                  	<div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
			                <div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
			                <div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
			                <div class="my-review-list__list__item__product__info__text">
			                  		<i class="fa-solid fa-star"></i>
			                </div>
							</c:if>
		                  </span>
		                  <div class="my-review-list__list__item__product__info__text" style="margin-left: 1rem;">
		                  	<fmt:formatDate value="${myreview.created_at }" pattern="yyyy.MM.dd" />
		                  </div>
		                </div>
		                <div class="my-review-list__list__item__product__content">
		                  ${myreview.recontent }
		                </div>
		                </a>
		              </div>
		              <div>
		                <div class="my-review-list__list__item__insert modifybtn">수정</div>
		                <input type="hidden" value="${myreview.review_id }" name="review_id">
		                <c:if test="${myreview.review_image ne null }">
		                	<img style="width:100px" src="${myreview.review_image }">
		                </c:if>
		              </div>
		            </div>
		          </div>
		        </div>	
			</c:forEach>
	      </div>
	    </div>
	    
	    <!-- modal -->
	   <div class="thismodal" style="display:none;">
		<div class="_1SpqS review-modal__modal__wrap open open-active">
			<div class="_3OUv-">
				<div tabindex="-1" class="_2mP0n review-modal__modal">
					<div class="review-modal">
						<div class="review-modal__title">리뷰 쓰기
						<button type="button" class="review-modal__close">
							<i class="fa-solid fa-x"></i>
						</button>
						</div>
						<div class="review-modal__point-explain">
							포토리뷰&nbsp;<span class="review-modal__point-explain__value">500P</span>,&nbsp; 일반리뷰&nbsp;<span class="review-modal__point-explain__value">100P</span>
						</div>
						<form class="review-modal__form" action="reviewModify.com" method="post">
							<div class="review-modal__form__product">
								<img class="review-modal__form__product__image" id="brandimg" src="">
								<div class="review-modal__form__product__contents">
								<div class="review-modal__form__product__contents__brand" id="company_name">스칸디앤홈</div>
								<div class="review-modal__form__product__contents__name" id="post_name">[5%쿠폰]먼지없는 헤링본 사이잘룩 워셔블 사계절 카페트 4colors 8size</div>
								<div class="review-modal__form__product__contents__options" id="options">색상: 03_베이지 / 사이즈: 150x200</div>
							</div>
							</div>
							<div class="review-modal__section">
							<div class="review-modal__section__title">별점 평가</div>
							<div class="review-modal__form__star__wrap">
							<div class="review-modal__form__star">
							<div class="review-modal__form__star__value">
							<ul class="rating-input">
								<li><label class="rating-input__star" aria-label="별점 1점" id="star1">
									<input type="radio" value="1">
									<i class="fa-solid fa-star"></i>
									</label>
								</li>
								<li><label class="rating-input__star" aria-label="별점 2점" id="star2">
									<input type="radio" value="2">
									<i class="fa-solid fa-star"></i>
									</label>
								</li>
								<li><label class="rating-input__star" aria-label="별점 3점" id="star3">
									<input type="radio" value="3">
									<i class="fa-solid fa-star"></i>
									</label>
								</li>
								<li><label class="rating-input__star" aria-label="별점 4점" id="star4">
									<input type="radio" value="4">
									<i class="fa-solid fa-star"></i>
									</label>
								</li>
								<li><label class="rating-input__star" aria-label="별점 5점" id="star5">
									<input type="radio" value="5">
									<i class="fa-solid fa-star"></i>
									</label>
								</li>
							</ul>
							</div>
							</div>
							</div>
							</div>
							<div class="review-modal__section">
								<div class="review-modal__section__title">사진 첨부 (선택) </div>
								<div class="review-modal__section__explain">사진을 첨부해주세요. (최대 1장)</div>
								<div class="select-picture" style="display:none;">
									<img class="select-picture__contents" src="">
								</div>
								<input type="file" name="main_photo" id="review_photo" class="main_photo"
			                       style="display: none" onchange="changeValue(this)"
			                       accept="image/*" />
								<button class="button button--color-blue-inverted button--size-50 button--shape-4 upload-button" type="button">
									사진 첨부하기
								</button>
							</div>
							<div class="review-modal__section">
								<div class="review-modal__section__title">리뷰 작성</div>
								<textarea name="recontent" placeholder="자세하고 솔직한 리뷰는 다른 고객에게 큰 도움이 됩니다. (최소 20자 이상)" class="form-control text-area-input review-modal__form__review-input" style="height: 56px;"></textarea>
							</div>
							
							<input type="hidden" name="reproduct_id" value="">
							<input type="hidden" name="reseller_id" value="">
							<input type="hidden" name="order_id" value="">
							<input type="hidden" name="repost_id" value="">
							<input type="hidden" name="rating" value="1">
							<input type="hidden" name="review_image" value="">
							
							
							<button class="button button--color-blue button--size-50 button--shape-4 review-modal__form__submit" onclick="photoUpload()">완료</button>
						</form>
						<div class="review-modal__explain">
							<ul>
								<li>포인트는 최초 작성한 리뷰를 기준으로 지급됩니다.</li>
								<li>상품과 무관한 내용이나 사진, 동일 문자 반복 등의 부적합한 리뷰는&nbsp; 사전 경고 없이 삭제 및 포인트 회수될 수 있습니다.</li>
							</ul>
						</div>
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
