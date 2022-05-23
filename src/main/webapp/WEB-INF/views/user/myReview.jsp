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
              <a href="/house/m_myPage.com">프로필</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/myshopping.com">나의 쇼핑</a>
            </li>
            <li class="mypage-nav-item">
              <a class="active" href="/house/review.com">나의 리뷰</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/m_edit.com">설정</a>
            </li>
          </ul>
        </nav>
        <nav class="page-navigation mypage-nav-content">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a class="active select" href="/house/review.com">리뷰쓰기</a>
            </li>
            <li class="mypage-nav-item">
              <a class="" href="/house/review_view.com">내가 작성한 리뷰</a>
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
    	
    	<c:if test="${prereviewlist.size() == 0 }">
    		<div style="margin-bottom: 10rem; display:flex; flex-direction: column; align-items: center;">
    			<svg class="icon" width="101" height="96" preserveAspectRatio="xMidYMid meet">
                <g fill="none" fill-rule="evenodd">
                    <path fill="#E5E5E5"
                        d="M72.175 85.73c.49-.11.988-.195 1.484-.268 5.406-.798 10.943-.275 16.349-1.082 2.373-.355 4.983-1.17 6.093-3.3.324-.622.48-1.415.102-2.006-.466-.728-1.478-.814-2.342-.823l-22.077-.229c-2.91-.03-5.831-.06-8.722.284-3.293.39-6.506 1.26-9.742 1.982a110.284 110.284 0 0 1-16.987 2.422c-5.32.34-10.968-.522-16.215.351-1.105.183-1.81.431-2.903.181-1.128-.258-2.331-.534-3.494-.394-2.217.267-4.501 1.104-6.787 1.476-1.805.293-3.745 1.085-4.47 2.764-.707 1.644.047 3.638 1.377 4.835 1.332 1.197 3.115 1.745 4.865 2.117 7.908 1.681 16.106.432 24.19.56 5.696.09 11.383.868 17.074.604 5.691-.265 11.567-1.701 15.861-5.445 1.186-1.035 2.248-2.24 3.612-3.024.846-.487 1.777-.791 2.732-1.005">
                    </path>
                    <path fill="#FFF"
                        d="M47.948 88.65c-2.889-.108-5.777-.224-8.666-.322-1.807-.062-2.821-.01-4.473-.822-.482-.237-1.05-.412-1.55-.212-1.453.582-2.128 2.942-3.593 3.737-1.816.986-4.491-.168-6.11-1.06-.467-.257-.955-.556-1.175-1.041-.208-.458-.134-.988-.056-1.485l1.588-10.09c-1.582-.589-3.84-.924-4.53.617-.174.391-.193.83-.21 1.258l-.202 5.236c-.047 1.194-.099 2.417-.55 3.524-.449 1.108-1.386 2.096-2.569 2.265-1.306.187-2.589-.68-3.264-1.814-.674-1.135-.857-2.488-.96-3.804-.42-5.388.172-11.203-2.66-15.805-.691-1.122-1.564-2.124-2.241-3.253-.82-1.364-1.337-2.884-1.848-4.39-1.826-5.375-3.67-10.86-3.745-16.535-.05-3.754.681-7.476 1.597-11.118.358-1.422.748-2.875.599-4.334-.167-1.62-.982-3.097-1.372-4.678-.475-1.915-.314-3.924-.15-5.89.154-1.846.323-3.75 1.183-5.39.736-1.404 1.925-2.513 3.144-3.528A46.304 46.304 0 0 1 18.32 2.404c1.498-.609 2.698-.043 3.702 1.198.699.865 1.2 1.881 1.948 2.703.796.875 1.836 1.49 2.888 2.033 1.138.586 2.358 1.114 3.639 1.1 1.16-.013 2.273-.472 3.43-.57 1.156-.095 2.52.342 2.885 1.444.11.334.114.694.11 1.046-.048 3.528-.895 7.135.059 10.532.31 1.106.557 2.136.266 3.272-.34 1.321-.971 2.568-1.357 3.878-.296 1.01-.944 3.26-.23 4.227.354.482 1.449.706 1.987.97.718.353 1.417.744 2.099 1.161 1.312.804 2.558 1.715 3.758 2.679 2.209 1.774 4.105 3.961 6.346 5.643 2.243 1.684 5.561 1.968 7.583 3.938 2.164 2.108 3.923 4.62 5.256 7.326 1.32 2.68 2.233 5.55 2.817 8.477.257 1.29.239 2.055-.03 3.288-.306 1.392-.313 3.062.21 4.399.092.232.207.465.401.62.237.188.555.234.855.263 3.704.363 7.395-.594 10.985-1.571 2.764-.752 5.862-3.335 8.263-4.898 3.801-2.472 6.036-4.92 10.13-6.867.894-.424 2.043-.695 2.798-.06.524.442.677 1.206.556 1.88-.12.673-.47 1.28-.813 1.871l-1.147 1.974c-.187.32-.377.646-.648.9-.354.33-.817.512-1.255.718-1.683.793-3.112 2.026-4.62 3.114-2.525 1.82-5.304 3.249-8.071 4.671-1.187.61-2.376 1.22-3.62 1.708a19.761 19.761 0 0 1-7.838 1.344c-1.25-.042-2.503-.203-3.744-.053-.898.11-2.259.435-2.797 1.252-.43.653-.44 1.619-.813 2.345-1.029 2.003-2.54 3.79-4.422 5.037-4.16 2.758-6.952 3.438-11.939 3.254">
                    </path>
                    <path fill="#000"
                        d="M31.466 10.957c.916-.354 3.078-1.453 3.794-.791.602.557.093 3.167.126 4.02.095 2.404.487 4.797.66 7.196.228 3.125.43 6.273-1.148 9.113-2.943 5.3-8.359 6.93-14.04 5.674-1.354-.3-1.932 1.782-.574 2.083 10.565 2.339 18.526-4.813 18.02-15.387-.106-2.18-.37-4.344-.58-6.514-.206-2.128.333-4.603-.084-6.628-.691-3.362-4.517-1.71-6.748-.85-1.283.497-.726 2.586.574 2.084">
                    </path>
                    <path fill="#000"
                        d="M22.227 7.546c2.83.947 5.505 1.94 8.015 3.602 1.161.77 2.245-1.1 1.09-1.864-2.67-1.77-5.52-2.814-8.531-3.821-1.322-.442-1.888 1.644-.574 2.083">
                    </path>
                    <path fill="#000"
                        d="M5.838 29.892c-3.35-3.624-2.984-8.988-2.117-13.514.74-3.866 3.222-6.2 6.511-8.129 3.595-2.109 8.24-4.51 12.378-5.339l-1.328-.754c.424 1.113.51 2.424.332 3.595-.207 1.36 1.874 1.946 2.084.574.235-1.545.233-3.258-.333-4.744-.22-.575-.708-.878-1.329-.754C16.47 1.94 9.125 5.468 5.105 9.324c-5.37 5.15-5.839 16.637-.795 22.096.945 1.023 2.47-.508 1.528-1.528">
                    </path>
                    <path fill="#000"
                        d="M10.009 25.653c.086 1.258.958 2.19 2.172 2.501 1.344.347 2.728-.256 3.585-1.3.875-1.067-.644-2.604-1.527-1.528-.336.41-.775.811-1.344.768-.232-.017-.706-.156-.726-.44-.095-1.38-2.256-1.39-2.16 0">
                    </path>
                    <path fill="#000"
                        d="M14.115 25.416c-.175 1.29-.088 2.582.987 3.484 1.196 1.003 3.16 1.197 4.346.068 1.008-.96-.521-2.485-1.528-1.527-.365.348-1.253.074-1.544-.305-.144-.186-.188-.392-.204-.618-.008-.131.005-.262.012-.392.016-.273-.004-.009.014-.135.078-.583-.14-1.153-.754-1.33-.503-.143-1.25.178-1.33.755m-2.647-4.156c1.853 0 1.856-2.88 0-2.88-1.853 0-1.856 2.88 0 2.88m11.046 3.772c1.852 0 1.856-2.88 0-2.88-1.853 0-1.856 2.88 0 2.88M2.632 30.139C-.006 40.239-.4 51.257 3.736 61.117c3.36 8.007 9.633 15.795 18.746 16.764 1.381.147 1.37-2.014 0-2.16-8.863-.943-15.555-10.155-17.697-18.27-2.43-9.207-2.47-17.554-.07-26.738.351-1.345-1.732-1.92-2.083-.574">
                    </path>
                    <path fill="#000"
                        d="M24.147 72.819c-.05 3.955-1.262 7.506-2.51 11.204-.61 1.811-1.514 4.18-.915 6.122 1.154 3.742 7.303 3.036 10.135 1.985 2.447-.908 2.52-3.231 3.042-5.564.87-3.893 1.602-7.817 2.286-11.747 1.278-7.34 3.18-15.026.929-22.35-.407-1.324-2.493-.76-2.083.575 1.79 5.82.684 11.653-.301 17.52-.867 5.16-1.773 10.319-2.914 15.428-.43 1.926-.295 2.705-2.228 3.693-1.443.739-2.445.95-4.021.927-3.17-.049-2.964-2.375-2.258-4.752 1.3-4.382 2.94-8.399 2.998-13.041.017-1.39-2.143-1.391-2.16 0M17.69 88.983c-3.105.688-4.927-.015-5.11-3.554-.087-1.687-.099-3.382-.169-5.071-.137-3.313-.401-6.44-1.214-9.656-.34-1.347-2.425-.776-2.083.574 1.385 5.475.524 11.008 1.504 16.48.76 4.241 4.048 4.107 7.647 3.31 1.357-.3.782-2.383-.574-2.083m.386-11.81c.19 1.158.32 2.32.415 3.49.112 1.376 2.273 1.388 2.16 0-.11-1.36-.27-2.716-.492-4.064-.096-.58-.808-.892-1.329-.755-.613.162-.849.756-.754 1.329">
                    </path>
                    <path fill="#000"
                        d="M37.233 35.637c5.842 2.587 9.402 8.065 15.182 10.59 7.643 3.342 11.472 11.536 12.35 19.611.889 8.163.069 16.186-8.087 20.187-3.264 1.601-6.53 1.574-10.07 1.508-3.162-.06-9.286.837-11.842-1.265-1.067-.877-2.603.643-1.528 1.527 2.747 2.26 7.29 1.808 10.648 1.862 3.88.064 7.884.459 11.624-.804 7.055-2.384 11.497-8.482 11.768-15.89.312-8.522-1.756-17.522-7.325-24.168-2.979-3.554-6.965-3.92-10.434-6.718-3.799-3.064-6.633-6.285-11.196-8.305-1.26-.558-2.36 1.303-1.09 1.865">
                    </path>
                    <path fill="#000"
                        d="M66.342 77.592c6.598 2.26 14.03.187 19.902-3.16 3.361-1.917 6.427-4.39 9.128-7.155 1.793-1.835 4.715-4.441 5.028-7.195.667-5.872-6.295-3.214-8.616-1.102-6.772 6.166-13.97 12.627-23.845 12.077-1.389-.077-1.386 2.083 0 2.16 4.94.275 9.686-1.298 14.003-3.624 2.317-1.248 4.49-2.763 6.505-4.453 1.925-1.615 3.948-4.41 6.114-5.619 1.61-1.362 4.493-1.668 4.01.74-.56 1.455-2.275 2.812-3.007 3.631a51.194 51.194 0 0 1-2.617 2.752c-2.204 2.13-4.617 4.035-7.254 5.602-5.502 3.269-12.504 5.412-18.776 3.263-1.318-.45-1.884 1.635-.575 2.083">
                    </path>
                    <path fill="#F6C8D2"
                        d="M26.058 31.271c3.07 0 3.075-4.772 0-4.772-3.07 0-3.075 4.772 0 4.772M5.995 22.57c3.07 0 3.075-4.772 0-4.772-3.07 0-3.076 4.772 0 4.772">
                    </path>
                    <path fill="#C5F2FF"
                        d="M33.561 19.904c.29 1.645-.13 3.339-.762 4.885-.633 1.546-1.48 2.997-2.109 4.544-.573 1.406-.549 3.16.544 4.214.403.388.927.714 1.476.817 1.24.23 2.564.058 3.54-.741.977-.798 1.275-2.26 1.295-3.52a5.706 5.706 0 0 0-.224-1.592c-.799-2.918-3.49-5.593-3.76-8.607">
                    </path>
                    <path fill="#000"
                        d="M33.812 21.798c-.1.945-.375 1.961-.828 3.067-.317.773-.691 1.533-1.053 2.268-.364.739-.741 1.503-1.056 2.276-.474 1.165-.628 2.909.498 3.993.422.408.91.68 1.374.765 1.328.245 2.526-.002 3.377-.698 1.029-.842 1.207-2.473 1.22-3.37a5.488 5.488 0 0 0-.217-1.535c-.342-1.251-1.059-2.49-1.752-3.69-.578-.999-1.168-2.02-1.563-3.076m-.09 12.862c-.339 0-.69-.033-1.048-.1-.54-.1-1.1-.409-1.579-.869-1.27-1.224-1.112-3.153-.59-4.433.32-.786.7-1.557 1.067-2.302.36-.729.73-1.482 1.042-2.242.662-1.616.93-3.025.815-4.288a5.95 5.95 0 0 1-.066-.504l.396-.052c.028.164.05.332.067.501.263 1.48 1.092 2.913 1.896 4.303.705 1.221 1.436 2.484 1.79 3.784.166.6.24 1.139.233 1.647-.02 1.18-.272 2.777-1.368 3.673-.709.58-1.628.882-2.654.882">
                    </path>
                    <path fill="#000"
                        d="M34.008 23.481c-.14.508-.323 1.034-.547 1.58-.323.79-.702 1.557-1.068 2.3-.36.731-.733 1.487-1.04 2.242-.446 1.096-.502 2.58.377 3.429.346.332.75.561 1.11.628.68.126 1.97.217 2.957-.59.868-.71 1.02-2.172 1.032-2.98.008-.42-.058-.875-.199-1.39-.325-1.187-.993-2.344-1.701-3.568-.314-.543-.632-1.092-.921-1.65m-.284 11.694a6.31 6.31 0 0 1-1.144-.108c-.639-.119-1.293-.476-1.843-1.006-1.197-1.154-1.476-3.116-.71-4.998.327-.803.711-1.583 1.082-2.336.356-.72.723-1.465 1.028-2.21.625-1.528.883-2.85.78-4.023a6.781 6.781 0 0 1-.068-.527.716.716 0 0 1 1.417-.188c.03.175.055.35.072.53.248 1.371 1.019 2.704 1.83 4.106.722 1.25 1.47 2.541 1.842 3.907.178.646.26 1.232.25 1.791-.02 1.289-.307 3.04-1.556 4.063-.803.657-1.835.999-2.98.999">
                    </path>
                    <path fill="#000"
                        d="M34.06 24.005c-.117.366-.255.745-.414 1.131-.321.787-.697 1.55-1.061 2.288-.37.752-.742 1.503-1.048 2.255-.42 1.032-.48 2.426.332 3.208.318.307.685.516 1.008.576.647.12 1.868.208 2.794-.548.806-.66.946-2.055.958-2.828a4.757 4.757 0 0 0-.192-1.334c-.318-1.163-.98-2.308-1.681-3.52-.234-.404-.47-.814-.696-1.228m-.34 9.938c-.355 0-.672-.041-.915-.087-.399-.073-.841-.321-1.213-.68-.947-.913-.896-2.49-.425-3.649.311-.764.685-1.522 1.046-2.255.373-.756.746-1.513 1.064-2.287a14.2 14.2 0 0 0 .538-1.558l.136-.49.234.452c.287.553.605 1.104.913 1.637.719 1.241 1.394 2.409 1.726 3.621.145.534.213 1.008.205 1.447-.013.842-.175 2.369-1.104 3.13-.693.567-1.518.719-2.204.719m-.157-14.555a.515.515 0 0 0-.516.563c.015.17.037.34.067.51.107 1.223-.153 2.57-.793 4.133-.305.746-.673 1.49-1.027 2.21-.375.761-.757 1.535-1.083 2.335-.735 1.806-.474 3.682.664 4.779.522.504 1.14.841 1.74.953 1.535.284 2.951-.023 3.961-.848 1.19-.975 1.464-2.666 1.484-3.912a6.18 6.18 0 0 0-.244-1.736c-.366-1.34-1.107-2.62-1.822-3.859-.822-1.421-1.6-2.764-1.854-4.171a7.014 7.014 0 0 0-.072-.53.513.513 0 0 0-.505-.427m.16 15.987a6.48 6.48 0 0 1-1.181-.11c-.675-.126-1.366-.502-1.945-1.06-1.256-1.21-1.553-3.258-.756-5.217.331-.814.716-1.594 1.088-2.349.358-.725.722-1.464 1.022-2.196.615-1.504.866-2.79.766-3.93a6.145 6.145 0 0 1-.069-.527.914.914 0 0 1 .792-.99.919.919 0 0 1 1.022.749c.031.18.056.36.074.545.24 1.322 1 2.635 1.804 4.026.73 1.26 1.482 2.563 1.863 3.954.181.665.265 1.269.257 1.847-.022 1.331-.322 3.143-1.63 4.215-.835.683-1.91 1.043-3.107 1.043">
                    </path>
                </g>
            </svg>
	            <span style="margin-top: 2rem;">
	            리뷰를 작성할 상품이 없습니다.
	            </span>
    		</div>
    	</c:if>

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

		<c:if test="${prereviewlist.size() < 3 or myreviewlist.size() > 0}">
			<div style="margin-top: 20rem;"></div>
		</c:if>
	
    <footer>
		<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
  </body>
</html>
