<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
    <title>예쁜템들 모여사는 오조의집</title>

    <link rel="stylesheet" href="resources/css/user_css/young/my_shopping.css?var=13">
    <link rel="stylesheet" href="resources/css/user_css/young/footer.css">
    <link rel="stylesheet" href="resources/css/user_css/young/my_shopping_status.css?var=3">
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script
 		 src="https://code.jquery.com/jquery-3.3.1.min.js"
 		 integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  		crossorigin="anonymous">
	</script>
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style data-emotion="css 1yajzey" data-s="">
        .css-1yajzey {
            margin-top: 50px;
            box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.15);
            padding: 30px;
        }

        @media (max-width: 767px) {
            .css-1yajzey {
                padding: 30px 16px;
            }
        }
    </style>
	<script>
	 window.onload = function(){
		 pl_js = [];
		 wide_js = [];
		 $.ajax({
				url:'paymentLog_list.com',	
			  		method:'post',
			  		data: JSON.stringify(),
			  		contentType : 'application/json; charset=UTF-8',
			  		dataType : 'json',
			  		success : function(pl_li){
			  			pl_js = pl_li;
	  		  		$.ajax({
	  	    			url:'wide_list.com',	
	  	  		  		method:'post',
	  	  		  		data: JSON.stringify(),
	  	  		  		contentType : 'application/json; charset=UTF-8',
	  	  		  		dataType : 'json',
	  	  		  		success : function(wide_li){
	  	  		  			wide_js = wide_li;
	  	  		  		$.ajax({
		  	    			url:'date_filter.com',	
		  	  		  		method:'post',
		  	  		  		data: JSON.stringify(),
		  	  		  		contentType : 'application/json; charset=UTF-8',
		  	  		  		dataType : 'json',
		  	  		  		success : function(date_filter){
		  	  		  			date_js = date_filter;
		  	  		  			each_price();
		  	  		  			count_method();
		  	  		  		for(i =0; i < date_js.length; i++){
								dateStr = $("." + date_js[i].order_num + "_time").text();
								dateStr = dateStr.substr(0, 10);
								dateStr = dateStr.replace(/-/gi, ".");
								$("." + date_js[i].order_num + "_time").text(dateStr);
							}
		  	  		  		}	
		  	    		})
	  	  		  		}	
	  	    		})
			  	}	
			})
			
	 }
	</script>
	

<body>

	<script>
	function int_comma(num){
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function each_price(){
		for(i = 0; i < pl_js.length; i++){
			for(j = 0; j < wide_js.length; j++){
				if(pl_js[i].product_id == wide_js[j].product_id){
				$("."+ pl_js[i].order_num + "_" + wide_js[j].product_id + "_won").text(int_comma(pl_js[i].payment));
			
				}
			}
		}
	}
	function count_method(){
		pay_wait = 0;
		pay_success = 0;
		ship_ready = 0;
		shipping = 0;
		ship_success = 0;
		buy = 0;
		for(i = 0; i < pl_js.length; i++){
			if(pl_js[i].order_status == "입금대기"){
				pay_wait++;
			}else if(pl_js[i].order_status == "결제완료"){
				pay_success++;
			}else if(pl_js[i].order_status == "배송준비중"){
				ship_ready++;
			}else if(pl_js[i].order_status == "배송중"){
				shipping++;
			}else if(pl_js[i].order_status == "배송완료"){
				ship_success++;
			}else if(pl_js[i].order_status == "구매확정"){
				buy++;
			}
		}
		$(".pay_wait").text(pay_wait);
		$(".pay_success").text(pay_success);
		$(".ship_ready").text(ship_ready);
		$(".shipping").text(shipping);
		$(".ship_success").text(ship_success);
		$(".buy").text(buy);
	}
	function buy_check(param, this_class){
		console.log(param);
		$(this_class).remove();
		ex_text = $("#" + param + "_status").text().split("·");
		ex_text[0] = "구매확정";
		$("#" + param + "_status").text(ex_text[0] + "·" + ex_text[1]);
		  $.ajax({
  			url:'buy_check.com',	
		  		method:'post',
		  		data: JSON.stringify(param),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(){
		  			
		  		}
		 }) 
	}
	function refund(UID){
		jQuery.ajax({
		      "url": "refunt_request.com", // 예: http://www.myservice.com/payments/cancel
		      "type": "POST",
		      "contentType": "application/json",
		      "data": JSON.stringify({
		        "merchant_uid": String(UID), // 예: ORD20180131-0000011
		        "cancel_request_amount": 100, // 환불금액 
		        "reason": "테스트 결제 환불" // 환불사유
		      }),
		      "dataType": "json"
		    }).done(function(result){
		    	if(result == "1"){
		    		alert("환불 성공");
		    		jQuery.ajax({
					      "url": "refunt_request_DB.com", 
					      "type": "POST",
					      "contentType": "application/json",
					      "data": JSON.stringify(UID),
					      "dataType": "json"
					    }).done(function(result){
					    	console.log(result);
					    });
		    		refund_text_change(UID);
		    	}else {
		    		alert("환불 실패");
		    	}
		    	
		    });
	}
	
	function refund_text_change(class_name){
		$("." + class_name + "_status" ).text("환불처리");
	}
	</script>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage">
        <div class="mypage-nav">
            <nav class="page-navigation mypage-nav-owner">
                <ul style="transform: translateX(0px); ">
                     <li class="mypage-nav-item">
              <a href="/house/m_myPage.com">프로필</a>
            </li>
            <li class="mypage-nav-item">
              <a class="active" href="/house/shopping.com">나의 쇼핑</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/review.com">나의 리뷰</a>
            </li>
            <li class="mypage-nav-item">
              <a href="/house/edit.com">설정</a>
            </li>
                </ul>
            </nav>

            <nav class="page-navigation mypage-nav-content">
                <ul style="transform: translateX(0px); margin: 0px">
                    <li class="mypage-nav-item">
                        <a class="active" href="#">주문배송내역 조회</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#">상품문의내역</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="/house/CScenter.com">고객센터</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="layout">
            <div class="order-list container">
                <div class="order-list__menu"><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">입금대기</div>
                            <div class="order-list__menu__list__value pay_wait">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">결제완료</div>
                            <div class="order-list__menu__list__value pay_success">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">배송준비</div>
                            <div class="order-list__menu__list__value ship_ready">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">배송중</div>
                            <div class="order-list__menu__list__value shipping">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">배송완료</div>
                            <div class="order-list__menu__list__value ship_success">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title order-list__menu__list__title--focus">구매확정</div>
                            <div class="order-list__menu__list__value buy">0</div>
                        </div>
                    </a></div>
                <div>
                    <div>
                        <div class="css-1yajzey ehoya3o0">
                            <c:forEach var="i" begin="0" end="${fn:length(date_filter)-1}">
                            <c:set var="order_num" value="${date_filter[i].order_num }"/>
                            <section class="css-idjloq e1yy3fi630">
                                <div class="css-sw3pq5 e1yy3fi629">
                                    <div class="css-145bbay e1yy3fi628 "><span class="divider">${date_filter[i].order_num }</span><span class="dh_edit ${date_filter[i].order_num }_time">${date_filter[i].order_date}</span>
                                    </div>
                                    <c:if test="${date_filter[i].refund_id eq '' }">
                                    <a class="css-1buj0y e1yy3fi627" onclick="refund(${date_filter[i].order_num })">환불하기</a>
                                	</c:if>
                                </div>
                               <c:forEach var="j" begin="0" end="${fn:length(pl_li)-1}">
                               <c:if test="${order_num eq pl_li[j].order_num}">
                               <c:set var="postid" value="${pl_li[j].od_postid }"/>
                               <c:set var="tell_check" value="${pl_li[fn:length(pl_li)-1].seller_id }"/>
                                <div>
                                    <div class="css-1ra10s7 e1yy3fi626">
                                        <h3 class="css-7c5cag e1yy3fi624 ${date_filter[i].order_num }_status" id="${pl_li[j].order_id}_status">
                                        <c:choose>
                                        <c:when test="${pl_li[j].refund_id eq '' }">
                                        ${pl_li[j].order_status}
                                        </c:when>
                                        <c:otherwise>
                                        환불처리
                                        </c:otherwise>
                                        </c:choose>
                                        <span class=""> ·</span>
                                        <span> 
                                        	<c:choose>
                                        		<c:when test="${pl_li[j].shipfinish_date ne null }">
                                        			<fmt:formatDate value="${pl_li[j].shipfinish_date}" pattern="MM/dd" />
                                        		</c:when>
                                        		<c:otherwise>
                                        			<fmt:formatDate value="${pl_li[j].order_date}" pattern="MM/dd" />
                                        		</c:otherwise>
                                        	 </c:choose>
                                                (${pl_li[j].day })
                                        </span>
                                        <span class="status">
                                         <c:if test="${pl_li[j].shipfinish_date ne null }">
                                          배송완료
                                         </c:if>
                                         </span>
                                         </h3>
                                        <div class="css-gw5lra e1yy3fi625">
                                            <div class="css-5y01s9 e1yy3fi623">
                                                <picture>
                                                    <source type="image/webp"
                                                        src="${wide_li[j].photo_url }">
                                                    <img class="css-1nuap3l e1yy3fi622"
                                                        src="${wide_li[j].photo_url }">
                                                </picture>
                                                <div class="css-1khw1py e1yy3fi621">
                                                    <div class="css-1jgx3ye e1yy3fi620"><a
                                                            class="css-1hnr1vy e1yy3fi619"
                                                            href="/brands/home?query=%EB%AA%A8%EB%82%98%EC%BD%94%EC%98%AC%EB%A6%AC%EB%B8%8C">${wide_li[j].company_name }</a><a
                                                            class="css-g5ex4y e1yy3fi618"
                                                            href="http://127.0.0.1:3000/orders.html"> ${wide_li[j].post_name }</a>
                                                    </div>
                                                    <div class="css-1jgx3ye e1yy3fi620">
                                                        <div class="css-137xxwq e1yy3fi617">${wide_li[j].option1_name } : ${wide_li[j].option1}
															<c:if test="${wide_li[j].option2 ne '' }">
															/	${wide_li[j].option2_name } : ${wide_li[j].option2}
															</c:if>
														</div>
                                                        <div class="css-13mg6pb e1yy3fi616"><span
                                                                class="divider ${pl_li[j].order_num}_${pl_li[j].product_id}_won">0원</span>${pl_li[j].quantity }개</div>
                                                        <div class="css-5b05l4 e1yy3fi615"><span>일반택배</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="css-1yl0oty e1yy3fi614">
                                            	<button class="css-klr9vj">배송추적</button>
                                                <c:if test="${pl_li[j].order_status == '배송완료'}">
                                                <button class="css-klr9vj" onclick="buy_check(${pl_li[j].order_id}, this)">구매확정</button>
                                                </c:if> <!-- 배송완료된 애들만 보이게 -->
                                            </div>
                                        </div>
                                        <c:choose>
                                        <c:when test="${pl_li[j].order_num ne pl_li[j+1].order_num }">
                                        <div class="css-lq5sl4 e1yy3fi613">
                                            <div class="css-13iurt9 e1yy3fi612">무료배송</div>
                                            <div class="css-i1jsxi e1yy3fi611">${wide_li[j].company_name }<a href="tel:070-4407-9501"
                                                    class="css-1hm59ir e1yy3fi610">${wide_li[j].shop_tell }</a></div>
                                        </div>
                                        </c:when>
                                        <c:when test="${wide_li[j].seller_id ne wide_li[j+1].seller_id }">
                                        <div class="css-lq5sl4 e1yy3fi613">
                                            <div class="css-13iurt9 e1yy3fi612">무료배송</div>
                                            <div class="css-i1jsxi e1yy3fi611">${wide_li[j].company_name }<a href="tel:070-4407-9501"
                                                    class="css-1hm59ir e1yy3fi610">${wide_li[j].shop_tell }</a></div>
                                        </div>
                                        </c:when>
                                        </c:choose>
	                                    </div>
                                </div>
                                </c:if>
                                </c:forEach>
                            </section>
                            </c:forEach>
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
</head>

</html>