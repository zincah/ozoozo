<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta property="og:title" content="내가 작성한 리뷰" />
    <meta property="og:type" content="website" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myPage-nav-style.css"/>
    <link rel="stylesheet" href="resources/css/user_css/inha/myReview-view-style.css"/>
    <link rel="stylesheet" href="resources/css/user_css/zinc/myreview.css?var=12"/>
    <link rel="stylesheet" href="resources/css/user_css/inha/footer-style.css"/>
    <link rel="stylesheet" href="resources/css/admincss/fonts.css?var=1" rel="stylesheet" />
    <script type="text/javascript" src="resources/js/adminjs/jquery-3.6.0.min.js"></script>
    <style type="text/css">
      address {
        font-style: normal;
      }
    </style>
    <title>내가 작성한 리뷰</title>
    <script>

    	$(document).ready(function(){
    		
    		$(".upload-button").click(function(){
    			upload_photo();
    			$(".select-picture").show();
    		})
    		
    		$(".review-modal__close").click(function(){
    			alert("작업하던 내용이 유실됩니다.");
    			// modal 띄우는 거로 바꾸기
    			$(".thismodal").hide();
    		})
    		
    		$(".select-picture__delete").click(function(){
    			alert("사진이 삭제됩니다.");
    			$("input[name=main_photo]").val("");
    			$(".upload_img").remove();
    			$(".select-picture").hide();
    		})
    		
    		$(".openmodal").click(function(){
    			
    			var code = $(this).val();
    			openmodal(code);
    			$(".thismodal").show();
    		})
    		
    		$(".rating-input__star").click(function(){
    			
    			var star = $(this).find('input').val();

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
    			
    		})
    		
    	})
    	
    	function openmodal(code){
    		
    		
    		
    		$.ajax({
		  		url:'getReviewInfo.com',
		  		method:'post',
		  		data: JSON.stringify(code),
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
		  			
		  			
		  			// input setting
		  			$("input[name=reproduct_id]").val([resp.product_id]);
		  			$("input[name=reseller_id]").val([resp.seller_id]);
		  			$("input[name=repost_id]").val([resp.od_postid]);
		  			$("input[name=order_id]").val([resp.order_id]);
		  			
		  		}
    		});

    	}
    	
        function upload_photo(){
            $("#review_photo").click();
          }

        function changeValue(input) {
          var checkId = input.id;
          var checkSu = checkId.substr(-1);

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
          var container = $(".select-picture");
          container.append(newImage);

        }

          // 사진업로드 기능
          function photoUpload(){

            var formData = new FormData();
            
            var fileInput = $("#review_photo");

            for (var i = 0; i < fileInput.length; i++) {
              if (fileInput[i].files.length > 0) {
                for (var j = 0; j < fileInput[i].files.length; j++) {
                  console.log(" mainFileInput[i].files[j] :::"+ fileInput[i].files[j]);

                  // formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.
                  formData.append('reviewphoto', $('#review_photo')[i].files[j]);
                }
              }
            }
            
            var starcount = $(".rating-input__star1").length;
        	$("input[name=rating]").val(starcount);
        	

            $.ajax({
              url: 'uploadReview.com',
              method:'post',
              data: formData,
              contentType: false,
              processData: false,
              async: false,
              dataType: 'text',
              success: function(resp) {
                alert("성공!");
                console.log(resp);
                $("input[name=review_image]").val(resp);
                $(".review-modal__form").submit();
				
              },
              error: function(jqXHR){
                //alert(jqXHR.responseText);
                alert("리뷰 등록에 실패했습니다. 다시한번 시도해주세요 ^^")
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
              <a href="/house/myreview.com" target="self">나의 리뷰</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/edit.com" target="self">설정</a>
            </li>
          </ul>
        </nav>
        <nav class="page-navigation mypage-nav-content">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a class="active select" href="">리뷰쓰기</a>
            </li>
            <li class="mypage-nav-item">
              <a class="" href="/house/myreview.com" target="self">내가 작성한 리뷰</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    
    
    
    
    <!-- content -->
    <div class="my-review-list container">
    	
    	<c:forEach items="${prereviewlist }" var="prereview">
    	<div class="reviewlayer" style="margin-bottom: 2rem;">
    		<div class="areview-my-home__review-list__item">
    			<img class="areview-my-home__review-list__item__image" src="${prereview.photo_url }">
    			<a class="areview-my-home__review-list__item__wrap" href="productPage.com?p=${prereview.od_postid }">
    			<span class="areview-my-home__review-list__item__wrap__brand">${prereview.company_name }</span>
    			<span class="areview-my-home__review-list__item__wrap__name">${prereview.post_name }</span>
    			<span class="areview-my-home__review-list__item__wrap__option">${prereview.option1_name }: ${prereview.option1 } 
    				<c:if test="${prereview.option2 ne null }">
    					/ ${prereview.option2_name }: ${prereview.option2 }
    				</c:if>
    			</span>
    			<span class="areview-my-home__review-list__item__wrap__point-info">포토 500P 일반 100P</span></a>
    			<div class="areview-my-home__review-list__item__review-btn">
    			<div class="areview-my-home__review-list__item__review-btn__from">오조의집 구매</div>
    			<button class="a_3Z6oR a_1myYS a_1BDvx areview-my-home__review-list__item__review-btn__button review_write_btn openmodal" value="${prereview.order_id }">리뷰쓰기</button>
    			</div>
    		</div>
    	</div>
    	</c:forEach>

    </div>
    
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
						<form class="review-modal__form" action="reviewInsert.com" method="post">
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
									<button class="button button--color-blue button--size-50 button--shape-4 select-picture__delete" type="button">
										삭제
									</button>
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
							<input type="hidden" name="rating" value="">
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

	<div style="margin-bottom: 2rem;"></div>
	
    <footer>
		<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
  </body>
</html>
