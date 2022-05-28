<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/user_css/header/public.css?var=1">
    <link rel="stylesheet" href="resources/css/user_css/header/customer.css?var=1">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
	<script>
	
	$(document).ready(function(){
	
			
			$(".getKey").click(function(){
				var item = $(this).attr('id');
				var gourl = "getCS.com?key="+item;
				console.log(gourl);
				
				
				$.ajax({
			  		url: gourl,
			  		type:'get',
			  		contentType : 'application/json; charset=UTF-8',
			  		dataType : 'json',
			  		success : function(resp){
			  			$(".faq__contents__group").html("");
			  			var qna = ""
			  			
			  			$.each(resp,function(index,item){
			  				
			  				qna += '<section  class="faq__contents__item">'+
		                       ' <div class="faq__contents__item__question cs_'+item["customer_no"]+'" >'+item["customer_question"]+
		                       '<svg width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet" style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">'+
		                       ' <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path></svg></div>'+
		                       '<div class="faq__contents__item__answer" ><p>'+item["customer_answer"]+'</p></div></section>'+
		                       '<script>'+
		                     '$(document).ready(function(){'+
		                         '$(".faq__contents__item__answer").hide();'+
		                         '$(".cs_'+item["customer_no"]+'", this).click(function(){'+
		                             'var open = $(this).siblings("div");'+
		                             '$(open[0]).slideToggle();'+
		                         '});'+
		                     '});'+
		                	'<'+'/'+'script>'
			  			})
			  				$(".faq__contents__group").append(qna);	
			  		}
			  		})
			  		

			})
			
			
		
		
	
		});
	
	


	
	
		
	
	</script>
	
	
	
<title>Document</title>
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    
   <div class="layout">
        <!--헤더 -->
	
        <!--메인 -->
        <div id="contact-us">
            <div class="container--my-page">
                <article id="customer-center" class="customer-center">
                    <h1 class="customer-center__title">고객센터</h1>
                    <div class="row">
                        <section class="col-12 col-md-6 customer-center__contact">
                            <address>운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)<br>이메일 :&nbsp;<a href="/contacts/new"
                                    style="text-decoration: underline;">이메일 문의하기</a><button
                                    class="customer-center__contact__btn-copy-email" type="button">이메일 주소 복사</button><br>전화
                                :&nbsp;<a href="tel:1670-0876" style="text-decoration: underline;">1670-0876</a></address><button
                                class="btn btn-md btn-priority customer-center__contact__btn-inquiry" type="button" onclick="popup()">1:1 카톡
                                상담하기</button>
                        </section>
                        <section class="col-12 col-md-6 customer-center__faq">
                            <ul class="customer-center__faq__list">
                                <li><a id="s_ship" class="customer-center__faq__item" >배송은 얼마나
                                        걸리나요?</a></li>
                                <li><a id="s_order" class="customer-center__faq__item">주문 취소는 어떻게
                                        하나요?</a></li>
                                <li><a id="s_product" class="customer-center__faq__item"
                                        >제품의 자세한 정보를 알고 싶어요.</a></li>
                                <li><a id="s_error" class="customer-center__faq__item"
                                       >제품이 불량일 때는?</a></li>
                                <li><a id="s_kakao" class="customer-center__faq__item"
                                        >카카오 계정으로 로그인하면 이미 가입되었다고 합니다.</a></li>
                            </ul>
                        </section>
                    </div>
                </article>
                
                <section class="col-12 customer-center__contact--mobile">
                    <p class="customer-center__contact--mobile__operating">운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)</p>
                    <div class="customer-center__contact--mobile__buttons"><button
                            class="btn btn-sm btn-priority customer-center__contact--mobile__button" type="button" onclick="popup()">1:1 카톡
                            상담하기</button><a class="btn btn-sm btn-light customer-center__contact--mobile__button"
                            href="/contacts/new">이메일 문의하기</a><a href="tel:1670-0876"
                            class="btn btn-sm btn-light customer-center__contact--mobile__button">전화 문의하기</a></div>
                </section>
            </div>
        </div>
        
        <!--자주하는 질문 -->
        <article id="faq" class="faq">
            <nav class="faq__nav">
                <ul class="faq__nav__list">
                    <li class="faq__nav__item faq__nav__item--active"><a href="/house/CScenter.com">전체</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="order">주문/결제</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="transport" >배송관련</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="cancel" >취소/환불</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="refund" >반품/교환</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="document" >증빙서류발급</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="login" >로그인/회원정보</a></li>
                    <li class="faq__nav__item"><a class="getKey" id="service" >서비스/기타</a></li>
                </ul>
            </nav>
            
            <article class="faq__contents">
            
                <section id="faq__contents__group" class="faq__contents__group">
               
                    <c:forEach items="${list}" var="CS">
                    <section id="${CS.customer_keyword}" class="faq__contents__item box_${CS.customer_no}">
                        <div id="cs_${CS.customer_no}" class="faq__contents__item__question cs_${CS.customer_no}" >${CS.customer_question}<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div  class="faq__contents__item__answer css_${CS.customer_no}" >
                            <p>${CS.customer_answer} </p>
                        </div>
                        
                    </section>
                    <!-- 원래자리 -->
                   
                    
                     <script>
                     $(document).ready(function(){
				           /* 카테고리 토글 */
                         $(".faq__contents__item__answer").hide();
                         $(".cs_${CS.customer_no}", this).click(function(){
                             var open = $(this).siblings("div");
                             
                             $(open[0]).slideToggle();
                         });
                     });
                	</script>
                    </c:forEach>
                    
                </section>
                 
            </article>
        </article>
        <script>
        
        function syncDelay(milliseconds){
        	 var start = new Date().getTime();
        	 var end=0;
        	 while( (end-start) < milliseconds){
        	     end = new Date().getTime();
        	 }
        	}
        function popup(){
            var url = "http://pf.kakao.com/_xdFEDb/chat";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        
        
        
        $("#s_ship").on("click",function(){
    	   		
				$(".faq__contents__item__answer").hide();
				//height 라는 변수에 t1 이라는 이름의 클래스명을 가진 위치값을 받아온다.
			 	 var height = $("#cs_14").offset();
				//animate의안에 들어가는 매개 변수는 1번째는 움직일 위치 2번째는 속도이다.
			    //heigh의 top 위치로 이동 시킨다.
			    $("html, body").animate({scrollTop: height.top-300}, 400); 
			    $("#cs_14").trigger('click');
			
			}
		
    	})
    	   
    	 

		    
         
   		 $("#s_order").on("click",function(){
   			 $(".faq__contents__item__answer").hide();
   			//height 라는 변수에 t1 이라는 이름의 클래스명을 가진 위치값을 받아온다.
   		 	 var height = $("#cs_35").offset();

   			//animate의안에 들어가는 매개 변수는 1번째는 움직일 위치 2번째는 속도이다.
   		    //heigh의 top 위치로 이동 시킨다.
   		    $("html, body").animate({scrollTop: height.top-300}, 400); 
   		    $("#cs_35").trigger('click');
            
   		})
   		
   		
   		 $("#s_product").on("click",function(){
   			 $(".faq__contents__item__answer").hide();
   			//height 라는 변수에 t1 이라는 이름의 클래스명을 가진 위치값을 받아온다.
   		 	 var height = $("#cs_59").offset();

   			//animate의안에 들어가는 매개 변수는 1번째는 움직일 위치 2번째는 속도이다.
   		    //heigh의 top 위치로 이동 시킨다.
   		    $("html, body").animate({scrollTop: height.top-300}, 400); 
   		    $("#cs_59").trigger('click');
              
   		    
   		})
   		
   		 
   		 $("#s_error").on("click",function(){
   			 $(".faq__contents__item__answer").hide();
   			//height 라는 변수에 t1 이라는 이름의 클래스명을 가진 위치값을 받아온다.
   		 	 var height = $("#cs_38").offset();

   			//animate의안에 들어가는 매개 변수는 1번째는 움직일 위치 2번째는 속도이다.
   		    //heigh의 top 위치로 이동 시킨다.
   		    $("html, body").animate({scrollTop: height.top-300}, 400); 
   		    $("#cs_38").trigger('click');
              
   		    
   		})
   		
   		
   		 $("#s_kakao").on("click",function(){
   			 $(".faq__contents__item__answer").hide();
   			//height 라는 변수에 t1 이라는 이름의 클래스명을 가진 위치값을 받아온다.
   		 	 var height = $("#cs_50").offset();

   			//animate의안에 들어가는 매개 변수는 1번째는 움직일 위치 2번째는 속도이다.
   		    //heigh의 top 위치로 이동 시킨다.
   		    $("html, body").animate({scrollTop: height.top-300}, 400); 
   		    $("#cs_50").trigger('click');
              
   		    
   		})
       
      

		</script>
        <!--푸터 -->
<footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>


   </div>
    
</body>
</html>