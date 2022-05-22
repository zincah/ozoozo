<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="resources/css/user_css/header/calculation.css?var=2">
<link rel="stylesheet" href="resources/css/user_css/header/public.css">
<title>Document</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function(){
    	$.ajax({
			url:'pro_js.com',	
		  		method:'post',
		  		data: JSON.stringify(),
		  		contentType : 'application/json; charset=UTF-8',
		  		dataType : 'json',
		  		success : function(pro_li){
		  			pro_js = pro_li;
  		  		$.ajax({
  	    			url:'cart_js.com',	
  	  		  		method:'post',
  	  		  		data: JSON.stringify(),
  	  		  		contentType : 'application/json; charset=UTF-8',
  	  		  		dataType : 'json',
  	  		  		success : function(cart_li){
  	  		  			if(cart_li.length == 0){
  	  		  				return;
  	  		  			}
  	  		  			cart_js = cart_li;
  	  		  			console.log(cart_js);
  	  		  			console.log(pro_js);
  	  		  			each_price();
  	  		  		}	
  	    		})
		  		}	
		})
		email = "${address_true.user_email}";
    	email = email.split("@");
		$(".email1").val(email[0]);
		$(".email2").val(email[1]);
		phone = "${address_true.phone_num}";
		if("${address_true.phone_num}" != ''){
			phone = phone.split("-");
	    	$(".phone").val(phone[1] + "-" + phone[2]);
			
		}
    	
    	/* for(i=0; i < 10; i++){
    		console.log(payment_UID());
    	} */
    	
    }
	addr_bln = true;    
	console.log(addr_bln);
    </script>
    
    <c:if test="${address_li.size() ne 0 }" >
    	<script>
			addr_bln = false;				
			
    	</script>
    </c:if>
    
</head>
<body>
	<header>
		<script>
		function int_comma(num){
			return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function each_price(){
			var All_price = 0;
			var shipfee = 0;
			for(i=0; i < pro_js.length; i++){
				price = parseInt(pro_js[i].product_price);
				ea = parseInt(pro_js[i].cart_quantity);
				$("."+pro_js[i].product_id+"_won").text(int_comma(price * ea) + "원");
				$("."+pro_js[i].product_id+"_ea").text(ea+"개");
				All_price += price * ea;
				shipfee += pro_js[i].product_shipfee * ea
			}
			all_price(All_price,shipfee);
		}
		var final_price = 0;
		function all_price(price, shipfee){
			$(".all_price").text(int_comma(price) + "원");
			$(".shipfee").text(int_comma(shipfee) + "원");
			
			
			final_price = price + shipfee;
			
			fp = int_comma(final_price);
			$(".final_price").text(fp);
			var point = final_price * 0.003;
			$(".point").text(Math.floor(point) + " P");
			$(".payment_Btn").text(fp + "원 결제하기")
		}
		function select_email(this_class){
			$(".emiurti3").remove();
			$(".emiurti0").addClass("email2");
		}
		
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                } 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	                
	            }
	        }).open();
	    }
		function payment_click(){
			console.log(${addr_boolean});
			if(${addr_boolean}){
				
			}
		}
		function addr_change(){
			$(".addr_change_div").show();
		}
		function addr_change_close(){
			$(".addr_change_div").hide();
		}
		var way_payment ="card";
		function payment_change(this_class){
	 		$(".css-8sa7n1").addClass("css-1jzgr0t");
		    $(".css-8sa7n1").removeClass("css-8sa7n1");
		    $(this_class).removeClass("css-1jzgr0t");
			$(this_class).addClass("css-8sa7n1");
			$(".css-9n3kbk").addClass("css-10z9090");
			$(".css-9n3kbk").removeClass("css-9n3kbk");
			
			son = $(this_class).find(".css-10z9090");
			$(son).addClass("css-9n3kbk");
			$(son).removeClass("css-10z9090");
			way_payment = this_class.id;
		}
		function address_add(){
			addr_li = [];
			addr_li.push($("#shipID").val()); //배송지명
			addr_li.push($(".recipient").val()); //받는 사람
			addr_li.push($("#sample6_postcode").val()); // 5자리
			addr_li.push($("#sample6_address").val()); // 주소
			addr_li.push($("#sample6_detailAddress").val()); // 추가 주소
			phone = $('input[name=phone]').val();
			phone1 = phone.substr(0,4);
			phone2 = phone.substr(4,8);
			addr_li.push($('select[name=phone1]').val() + "-" + phone1 + "-" + phone2); // 추가 주소
			//addr_li.push($(".shipmemo").val()); //배송 메모
			$.ajax({
    			url: "addr_insert.com", 
    			method: "POST",
	            headers: { "Content-Type": "application/json" },
	            dataType : 'json',
	            data: JSON.stringify(addr_li),
	            success : function(){
	            }
	        })
		}
		function addr_add_btn(){
			
		}
		// 여기서 부터 결제
		  var IMP = window.IMP; // 생략 가능
	    IMP.init("imp90839936"); // 예: imp00000000
	    //결제 요청하기
	    function requestPay() {
	    	email = $(".email1").val() + "@" + $(".email2").val();
	    	checkBox = $('input[name=isAgree]').is(':checked');
	    	if(${post_li.size()} == 1){
	    		title = "${post_li[0].post_name}";
	    	}else{
	    		ea = parseInt(${post_li.size()} - 1);
	    		console.log(email);
	    		console.log("수량 : " + ea);
	    		title = "${post_li[0].post_name} 외 " + ea + "개";
	    	}
	    	if($('input[name=name]').val() == ''){
	    		alert("이름을 입력해 주세요.");
	    		return;
	    	}else if($('input[name=email]').val() == ''){
	    		alert("이메일을 입력해 주세요.");
	    		return;
	    	}else if($(".email2").val() == '' ){
	    		alert("이메일 형식이 올바르지 않습니다.");
	    		return;
	    	}else if($('input[name=phone]').val() == ''){
				alert("핸드폰번호를 작성해 주세요.");
				return
	    	}else if($("#shipID").val() == ''){
	    		alert("배송지명을 입력해주세요.");
	    		return;
	    	}else if($('input[name=recipient]').val() == ''){
	    		alert("받는분 성함을 입력해주세요.");
	    		return;
	    	}else if($(".2phone").val() == ''){
	    		alert("주문자 핸드폰 번호를 입력해주세요.");
	    		return;
	    	}else if($('#sample6_postcode').val() == ''){
	    		alert("주소를 선택해주세요.");
	    		return;
	    	}else if(!checkBox){
	    		alert("개인정보 동의를 해주세요.");
	    		return;
	    	}
	    	if(addr_bln){
	    		address_add();
	    	}
			phone_ = $("select[name=phone1]").val() + "-" + $('input[name=phone]').val();	    	
	    	address = "${address_true.address1}"
	    	address = address.replace("[","").split("]");
			console.log(address);	    	
	    	
	        // IMP.request_pay(param, callback) 결제창 호출
	        IMP.request_pay({ // param
	            pg: "html5_inicis",
	            pay_method: way_payment,
	            merchant_uid: parseInt(payment_UID()),
	            name: title,
	            amount: 100,//final_price,
	            buyer_email: email,
	            buyer_name: $('input[name=name]').val(),
	            buyer_tel: phone_,
	            buyer_addr: address[1],
	            buyer_postcode: address[0]
	        }, function (rsp) { // callback
	            if (rsp.success) {
	                // 결제 성공 시 로직 
	                payment_success(rsp);
	            } else {
	                // 결제 실패 시 로직,
	                alert("결제에 실패했습니다. 실패 원인: " + rsp.error_msg);
	            }
	        });
	      }
		function payment_success(rsp){
			console.log(rsp);
			$.ajax({
    			url: "payment/ajax.com", // 예: https://www.myservice.com/payments/complete
    			method: "POST",
	            headers: { "Content-Type": "application/json" },
	            dataType : 'json',
	            data: JSON.stringify ({
	                imp_uid: rsp.imp_uid, //imp 번호
	                merchant_uid: parseInt(rsp.merchant_uid), //고유번호
	                pay_method: way_payment,// 결제 방법
	                paid_amount: rsp.paid_amount,// 가격
	                paid_at: rsp.paid_at //결제 승인 시각
	            }),
	            success : function(){
	            	alert("결제 성공! 이용해 주셔서 감사합니다.");
	            	payment_after_cart_delete();
	            	location.href = 'http://localhost:8080/house/myshopping.com';
	            }
	        })
		}  
		function payment_after_cart_delete(){
			$.ajax({
    			url: "cart_delete.com", // 예: https://www.myservice.com/payments/complete
    			method: "POST",
	            headers: { "Content-Type": "application/json" },
	            dataType : 'json',
	            data: JSON.stringify(),
	            success : function(){
	            	console.log("삭제 성공");
	            }
	        })
		}
		 function payment_UID(){
			 first_num = randomNum(1,9);
			 var num = "0000000" + randomNum(0,9999999);
			 num = num.slice(-7);
			 return first_num  + num;
		 }
		 function randomNum(min, max){
			 var randNum = Math.floor(Math.random()*(max-min+1)) + min; 
			 return randNum; 
			 }

		  
		  
		  //결제 정보 전달하기
	    
	    //결제번호, 주문번호 추출하기
	    
	    //결제 응답 처리하기
	   
	</script>

		<jsp:include page="./header/OzoH.jsp"></jsp:include>
	</header>
	<div class="layout">
		<!--헤더 -->

		<!--메인-->
		<main class="_2u6kP">
			<div class="_2VbEo">
				<header class="_2CEFF">주문/결제</header>
				<c:choose>
					<c:when test="${address_li.size() ne 0 }" >
						<section class="clDqQ">
							<div class="checkout-container vtJfv">
								<div class="_2jygH">배송지</div>
								<div class="_3KNiw"></div>
								<div>
									<button type="button" class="_1RJj6" onClick="addr_change()">변경</button>
								</div>
							</div>
							<div class="_254uw">
								<div class="checkout-container _1DIXR">
									<div class="_1F8DA">
										<div class="_3O4wQ">${address_true.address_name}</div>
										<div>
											<div class="_4du--">기본배송지</div>
										</div>
									</div>
									<div class="_2yz9T" >${address_true.address1 },
										${address_true.address2 }</div>
									<div class="_3mlQK">
										<div class="_1HCV8">${address_true.receiver}</div>
										<div class="_27nmi">${address_true.phone_num}</div>
									</div>
									<div class="css-18azwi1 e84q8kd0">
										<div class="_3Bt8k">
											<select class="_3ASDR _1qwAY _3K8Q8 shipmemo">
												<option value="">배송시 요청사항을 선택해주세요</option>
												<option >부재시 문앞에 놓아주세요</option>
												<option >배송전에 미리 연락주세요</option>
												<option >부재시 경비실에 맡겨 주세요</option>
												<option >부재시 전화주시거나 문자 남겨 주세요</option>
												<option >직접입력</option>
											</select>
											<svg width="1em" height="1em" viewBox="0 0 10 10"
												fill="currentColor" class="IgBXR">
                                    <path d="M0 3l5 5 5-5z"></path>
                                </svg>
										</div>
									</div>
								</div>
							</div>
						</section>
						<section class="clDqQ">
							<div class="checkout-container vtJfv">
								<div class="_2jygH">주문자</div>
								<div class="_3KNiw"></div>
							</div>
							<div class="_254uw">
								<div class="checkout-container _d-EX">
									<label class="lQNTs css-1icqu5k e126uv4s3">
										<div class="css-1bp0feq e126uv4s2">이름</div>
										<div class="css-14o29br e126uv4s1">
											<input class="_3ASDR _1qwAY" name="name" maxlength="10"
												value="${address_true.receiver}">
										</div>
									</label><label class="css-1icqu5k e126uv4s3">
										<div class="css-1bp0feq e126uv4s2">이메일</div>
										<div class="css-yby15j e126uv4s1">
											<div class="_1pGtv">
												<div class="_1a7bp jTtMl">
													<div class="_2EQGD _1a7bp _1m42e">
														<input class="_3ASDR _1qwAY email1" type="email"
															name="email" placeholder="이메일" title="이메일 앞부분"
															maxlength="20" value="">
													</div>
													<span class="_1r4AF">@</span>
												</div>
												<div class="jTtMl _2tUrR">
													<div class="css-y0wgwc emiurti3">
														<input class="_3ASDR _1qwAY css-135vgro emiurti2 email2"
															type="email" title="이메일 뒷부분" maxlength="20" value="">
													</div>
													<div class="css-1d3w5wq emiurti1">
														<div class="_3Bt8k">
															<select class="_3ASDR _1qwAY _3K8Q8 css-7x8hv9 emiurti0"
																onchange="select_email(this)">
																<option value="" disabled="" selected="">선택해주세요</option>
																<option value="0">naver.com</option>
																<option value="1">hanmail.net</option>
																<option value="2">daum.net</option>
																<option value="3">gmail.com</option>
																<option value="4">kakao.com</option>
																<option value="5">nate.com</option>
																<option value="6">hotmail.com</option>
																<option value="7">outlook.com</option>
																<option value="8">icloud.com</option>
																<option value="9">직접 입력</option>
															</select>
															<svg width="1em" height="1em" viewBox="0 0 10 10"
																fill="currentColor" class="IgBXR">
            						<path d="M0 3l5 5 5-5z"></path>
            						</svg>
														</div>
													</div>
												</div>
											</div>
										</div>
									</label><label class="css-1icqu5k e126uv4s3">
										<div class="css-1bp0feq e126uv4s2">휴대전화</div>
										<div class="css-14o29br e126uv4s1">
											<div class="_2Z2K1">
												<div class="_2ixif">
													<div class="_3Bt8k">
														<select class="_3ASDR _1qwAY _3K8Q8">
															<option value="" disabled="">선택</option>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select>
														<svg width="1em" height="1em" viewBox="0 0 10 10"
															fill="currentColor" class="IgBXR yPMDv">
                                                <path d="M0 3l5 5 5-5z"></path>
                                            </svg>
													</div>
												</div>
												<div class="UYZ4Z">
													<input class="_3ASDR _1qwAY 2phone" type="tel"
														placeholder="입력해주세요" size="1" maxlength="9" value="">
												</div>
											</div>
										</div>
									</label>
								</div>
							</div>
						</section>
					</c:when>
					<c:otherwise>
						<section class="css-11hv2i2 e14xfypx5">
							<section class="css-19h7lru e14xfypx4">
								<div class="css-q6jijz e14xfypx3">주문자</div>
								<div class="css-6vqhdq e14xfypx2"></div>
							</section>
							<div class="css-1msvccc e14xfypx0">
								<section class="css-1s5pqoc eskht2b7">
									<label class="eskht2b5 css-19mgahg e126uv4s3">
										<div class="css-1bp0feq e126uv4s2">이름</div>
										<div class="css-14o29br e126uv4s1">
											<input class="_3ASDR _1qwAY 22ship_name" name="name" maxlength="10"
												value="">
										</div>
									</label> <label class="css-1icqu5k e126uv4s3">
										<div class="css-1bp0feq e126uv4s2">이메일</div>
										<div class="css-yby15j e126uv4s1">
											<div class="css-vqaf4p emiurti8">
												<div class="css-14kx49g emiurti7">
													<div class="css-abcfsy emiurti6">
														<input class="_3ASDR _1qwAY" type="email" name="email"
															placeholder="이메일" title="이메일 앞부분" maxlength="20" value="">
													</div>
													<span class="css-a5kq9u emiurti5">@</span>
												</div>
												<div class="css-15hj6g4 emiurti4">
													<div class="css-y0wgwc emiurti3">
														<input class="_3ASDR _1qwAY css-135vgro emiurti2 email2"
															type="email" title="이메일 뒷부분" maxlength="20" value="">
													</div>
													<div class="css-1d3w5wq emiurti1">
														<div class="_3Bt8k">
															<select class="_3ASDR _1qwAY _3K8Q8 css-7x8hv9 emiurti0"
																onchange="select_email(this)">
																<option value="" disabled="" selected="">선택해주세요</option>
																<option value="0">naver.com</option>
																<option value="1">hanmail.net</option>
																<option value="2">daum.net</option>
																<option value="3">gmail.com</option>
																<option value="4">kakao.com</option>
																<option value="5">nate.com</option>
																<option value="6">hotmail.com</option>
																<option value="7">outlook.com</option>
																<option value="8">icloud.com</option>
																<option value="9">직접 입력</option>
															</select>
															<svg width="1em" height="1em" viewBox="0 0 10 10"
																fill="currentColor" class="IgBXR">
            						<path d="M0 3l5 5 5-5z"></path>
            						</svg>
														</div>
													</div>
												</div>
											</div>
										</div>
									</label> <label class="css-1icqu5k e126uv4s3">
										<div class="css-1bp0feq e126uv4s2">휴대전화</div>
										<div class="css-14o29br e126uv4s1">
											<div class="_2Z2K1">
												<div class="_2ixif">
													<div class="_3Bt8k">
														<select class="_3ASDR _1qwAY _3K8Q8" name="phone1">
															<option value="" disabled="">선택</option>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select>
														<svg width="1em" height="1em" viewBox="0 0 10 10"
															fill="currentColor" class="IgBXR yPMDv">
            			<path d="M0 3l5 5 5-5z"></path>
            			</svg>
													</div>
												</div>
												<div class="UYZ4Z">
													<input class="_3ASDR _1qwAY phone" type="tel" name="phone"
														placeholder="입력해주세요" size="1" maxlength="9" value="">
												</div>
											</div>
											<div class="css-1nuhno9 eskht2b4">
												<button class="_1eWD8 _3SroY _3VwZT css-1d3w5wq eskht2b3"
													type="button">인증번호 발송</button>
											</div>
										</div>
									</label>
								</section>
							</div>
						</section>
						<section class="css-11hv2i2 e14xfypx5">
							<section class="css-19h7lru e14xfypx4">
								<div class="css-q6jijz e14xfypx3">배송지</div>
								<div class="css-6vqhdq e14xfypx2"></div>
								<button class="e3bjt0w0 css-4pfmkz" type="button">위와
									동일하게 채우기</button>
							</section>
							<div class="css-1msvccc e14xfypx0">
								<section class="css-svxxd2 e3bjt0w1">
									<label class="css-1icqu5k e126uv4s3"><div
											class="css-1bp0feq e126uv4s2">배송지명</div>
										<div class="css-14o29br e126uv4s1">
											<input class="_3ASDR _1qwAY" name="name" id="shipID" maxlength="20"
												value="">
										</div></label><label class="css-1icqu5k e126uv4s3"><div
											class="css-1bp0feq e126uv4s2">받는 사람</div>
										<div class="css-14o29br e126uv4s1">
											<input class="_3ASDR _1qwAY recipient" name="recipient" value="">
										</div></label><label class="css-1icqu5k e126uv4s3"><div
											class="css-1bp0feq e126uv4s2">연락처</div>
										<div class="css-14o29br e126uv4s1">
											<div class="_2Z2K1">
												<div class="_2ixif">
													<div class="_3Bt8k">
														<select class="_3ASDR _1qwAY _3K8Q8" name="phone1"><option
																value="" disabled="">선택</option>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
															<option value="6">02</option>
															<option value="7">031</option>
															<option value="8">032</option>
															<option value="9">033</option>
															<option value="10">041</option>
															<option value="11">042</option>
															<option value="12">043</option>
															<option value="13">044</option>
															<option value="14">051</option>
															<option value="15">052</option>
															<option value="16">053</option>
															<option value="17">054</option>
															<option value="18">055</option>
															<option value="19">061</option>
															<option value="20">062</option>
															<option value="21">063</option>
															<option value="22">064</option>
															<option value="23">070</option>
															<option value="24">080</option>
															<option value="25">050</option>
															<option value="26">012</option>
															<option value="27">059</option>
															<option value="28">직접 입력</option></select>
														<svg width="1em" height="1em" viewBox="0 0 10 10"
															fill="currentColor" class="IgBXR yPMDv">
															<path d="M0 3l5 5 5-5z"></path></svg>
													</div>
												</div>
												<div class="UYZ4Z">
													<input class="_3ASDR _1qwAY 2phone"  type="tel" name="phone"
														placeholder="입력해주세요" size="1" maxlength="9" value="">
												</div>
											</div>
										</div></label><label class="css-1icqu5k e126uv4s3"><div
											class="css-1bp0feq e126uv4s2">주소</div>
										<div class="css-yby15j e126uv4s1">
											<div>
												<div class="css-1jq486h e138ry6t2">
													<button class="_1eWD8 _2wuTD _3VwZT css-1maly7k e138ry6t1"
														onclick="sample6_execDaumPostcode()" type="button">주소찾기</button>
													<input class="_3ASDR _1qwAY css-1xfkvr7 e138ry6t0"
														id="sample6_postcode" disabled="" value="">
												</div>
												<div class="css-1a9pxps e138ry6t2">
													<textarea class="_3ASDR _1qwAY css-1xfkvr7 e138ry6t0"
														id="sample6_address" disabled="" rows="1"
														style="overflow: hidden; overflow-wrap: break-word; height: 40px;"></textarea>
												</div>
											</div>
											<input class="_3ASDR _1qwAY" name="extraAddress"
												id="sample6_detailAddress" placeholder="상세주소 입력"
												maxlength="50" value="">
										</div></label>
									<div class="css-18azwi1 e84q8kd5">
										<div class="_3Bt8k">
											<select class="_3ASDR _1qwAY _3K8Q8 shipmemo"><option
													value="0">배송시 요청사항을 선택해주세요</option>
												<option value="x">부재시 문앞에 놓아주세요</option>
												<option >배송전에 미리 연락주세요</option>
												<option >부재시 경비실에 맡겨 주세요</option>
												<option >부재시 전화주시거나 문자 남겨 주세요</option>
												<option >직접입력</option></select>
											<svg width="1em" height="1em" viewBox="0 0 10 10"
												fill="currentColor" class="IgBXR">
												<path d="M0 3l5 5 5-5z"></path></svg>
										</div>
									</div>
								</section>
							</div>
						</section>

					</c:otherwise>
				</c:choose>
				<section class="clDqQ">
					<div class="checkout-container vtJfv">
						<div class="_2jygH">주문상품</div>
						<div class="_3KNiw"></div>
					</div>
					<div class="_254uw">
						<section class="checkout-container _3aT7b">
							<c:forEach var="i" begin="0" end="${fn:length(post_li)-1}">
								<div class="css-wclqjc egkpco10">
									<div class="css-114dac7 e1qx8gyn5">
										<div class="css-s5xdrg e1qx8gyn4">
											<div class="css-1d4irc7 e1qx8gyn3">주식회사
												${post_li[i].company_name }</div>
											<div class="css-o69atw e1qx8gyn2">
												<span class="css-1ohhab7 e1qx8gyn1">배송비</span>개당
												${post_li[i].exStr}원
											</div>
										</div>
									</div>
									<c:forEach var="j" begin="0" end="${fn:length(pro_li)-1}">
										<c:if
											test="${pro_li[j].product_postid eq post_li[i].post_id }">
											<div>
												<div class="css-1deqzke e1l2pwkp8">
													<picture> <img class="css-15hitpz e1l2pwkp7"
														src="${post_li[i].photo_url }"> </picture>
													<div class="css-17fh4sh e1l2pwkp6">
														<div class="css-tobrwt e1l2pwkp5">[25%쿠폰]${post_li[i].post_name
															}</div>
														<ul class="css-rvb3re e1l2pwkp4">
															<li><c:choose>
																	<c:when test="${pro_li[j].option2 eq '' }">
                                            	${pro_li[j].option1 }
                                            </c:when>
																	<c:otherwise>
                                            	${pro_li[j].option1} / ${pro_li[j].option2 }
                                            </c:otherwise>
																</c:choose></li>
														</ul>
														<div class="css-18cz9pp e1l2pwkp3">
															<span
																class="css-1r6ecne e1l2pwkp2 ${pro_li[j].product_id}_won"></span>
															<div class="css-1tcfgij e1l2pwkp1"></div>
															<span
																class="css-1fgdtzk e1l2pwkp0 ${pro_li[j].product_id }_ea"></span>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:forEach>
						</section>
					</div>
				</section>
				<section class="clDqQ">
					<div class="checkout-container vtJfv">
						<div class="_2jygH">쿠폰</div>
						<div class="_3KNiw _1T_ur">사용 가능한 쿠폰이 없습니다</div>
					</div>
					<div class="_254uw">
						<div class="css-yepsdl e1tvvqht3">
							<div class="css-q3e0y4 e1tvvqht2">
								<span>쿠폰 코드가 있으신가요?</span>
								<div class="css-1wmw4cz e1tvvqht1">
									<svg width="16" height="17" viewBox="0 0 16 17" fill="none"
										preserveAspectRatio="xMidYMid meet">
                                    <path
											d="M3 5.16663L8 9.99908L13 5.16663L14 6.08373L8 11.8333L2 6.08373L3 5.16663Z"
											fill="#424242"></path>
                                </svg>
								</div>
							</div>
							<div class=""
								style="display: none; height: 0px; overflow: hidden;">
								<div class="css-drntii e1tvvqht0">
									<div class="checkout-container">
										<div class="css-1khn195 eg30oap5">
											<div class="css-1rz2yl2 eg30oap4">
												<input class="_3ASDR _1qwAY" value="">
												<div class="css-1pkqci5 eg30oap3">
													<button class="_1eWD8 _3SroY _3VwZT">확인</button>
												</div>
											</div>
											<div class="css-zdz8xi eg30oap2">
												<div class="" style="height: 0px; overflow: hidden;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="clDqQ">
					<div class="checkout-container vtJfv">
						<div class="_2jygH">포인트</div>
						<div class="_3KNiw _1T_ur">사용 가능한 포인트가 없습니다</div>
					</div>
					<div class="_254uw">
						<div class="checkout-container JsdI1">
							<div class="Ux4aQ">
								<input class="_3ASDR _1qwAY _3kWHq _2FPtt" name="mileageCost"
									type="tel" pattern="\d*" disabled="" value="0">
								<button class="_1eWD8 _2wuTD _3VwZT _3VzHU _2FPtt" disabled=""
									type="button">전액사용</button>
							</div>
							<div class="_2xq8i">
								사용 가능 포인트<span class="_1xjJk">0 P</span>
							</div>
						</div>
					</div>
				</section>
				<section class="clDqQ">
					<div class="checkout-container vtJfv">
						<div class="_2jygH">결제 수단</div>
						<div class="_3KNiw"></div>
					</div>
					<div class="_254uw">
						<div class="checkout-container css-1f3snd1 e7wda440">
							<div class="css-2pv01r e149t0mw4">
								<button type="button" class="css-8sa7n1 e149t0mw3" id="card"
									onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
									<img alt="카드 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=360&amp;h=360&amp;c=c 3x">
									</picture>
									<div class="css-9n3kbk e149t0mw1">카드</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3" id="vbank"
									onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=256&amp;h=256&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=360&amp;h=360&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=480&amp;h=480&amp;c=c&amp;webp=1 3x">
									<img alt="무통장입금 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=256&amp;h=256&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=360&amp;h=360&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=480&amp;h=480&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">무통장입금</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3"
									id="kakaopay" onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=256&amp;h=256&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=360&amp;h=360&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=480&amp;h=480&amp;c=c&amp;webp=1 3x">
									<img alt="카카오페이 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=256&amp;h=256&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=360&amp;h=360&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=480&amp;h=480&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">카카오페이</div>
									<div class="css-qdif5i e149t0mw0">최대1만원할인</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3" id="tosspay"
									onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
									<img alt="토스 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss.png?w=360&amp;h=360&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">토스</div>
									<div class="css-qdif5i e149t0mw0">최대6천원혜택</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3"
									id="naverpay" onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=256&amp;h=256&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=360&amp;h=360&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=480&amp;h=480&amp;c=c&amp;webp=1 3x">
									<img alt="네이버페이 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=256&amp;h=256&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=360&amp;h=360&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_naver.png?w=480&amp;h=480&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">네이버페이</div>
									<div class="css-qdif5i e149t0mw0">최대2.5%적립</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3" id="payco"
									onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
									<img alt="페이코 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_payco.png?w=360&amp;h=360&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">페이코</div>
									<div class="css-qdif5i e149t0mw0">최대3%적립</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3" id="chai"
									onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
									<img alt="차이 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_chai.png?w=360&amp;h=360&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">차이</div>
									<div class="css-qdif5i e149t0mw0">최대1만원혜택</div>
								</button>
								<button type="button" class="css-1jzgr0t e149t0mw3" id="phone"
									onclick="payment_change(this)">
									<picture>
									<source type="image/webp"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
									<img alt="핸드폰 아이콘" class="css-1i2eqgi e149t0mw2"
										src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=144&amp;h=144&amp;c=c"
										srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=360&amp;h=360&amp;c=c 3x">
									</picture>
									<div class="css-10z9090 e149t0mw1">핸드폰</div>
								</button>
							</div>
							<div class="" style="overflow: hidden;"></div>
						</div>
					</div>
				</section>
			</div>
			<section class="_15YWr">
				<div class="sticky-container _3L1d-"
					style="position: sticky; top: 81px; transition: top 0.1s ease 0s;">
					<div class="sticky-child" style="position: relative;">
						<div class="_1_Tld">
							<div class="_2lpRj">
								<div class="_1tHaf">
									<div class="_3TNPF">결제금액</div>
									<div class="_2JEof">
										<div class="_34k6S">총 상품 금액</div>
										<div class="_25zAE ySGW6 all_price"></div>
									</div>
									<div class="_2JEof">
										<div class="_34k6S">배송비</div>
										<div class="_25zAE shipfee"></div>
									</div>
									<div class="_2JEof">
										<div class="_34k6S">쿠폰 사용</div>
										<div class="_25zAE">0원</div>
									</div>
									<div class="_2JEof">
										<div class="_34k6S">포인트 사용</div>
										<div class="_25zAE">0원</div>
									</div>
									<div class="_1qFy7">
										<div class="_3hFjD">최종 결제 금액</div>
										<div class="_2YW1B">
											<span class="_1vQx0 final_price"></span>&nbsp;원
											<div class="_1-Gyq">
												<span class="csPTb point">116 P</span>&nbsp;적립 예정
											</div>
										</div>
									</div>
								</div>
								<div class="css-1in19nv eir4d5m7">
									<label for="checkout-agree" class="css-17jncej eir4d5m6">
										<div class="_3zqA8 css-2szu7b eir4d5m5">
											<input type="checkbox" class="_3UImz" id="checkout-agree"
												name="isAgree" value=""><span class="_2mDYR"><svg
													width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
                                                <path
														fill="currentColor"
														d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
                                                </path>
                                            </svg></span>
										</div>
										<div>아래 내용에 모두 동의합니다. (필수)</div>
									</label>
									<div class="" style="overflow: hidden;"></div>
									<div class="css-127as0t eir4d5m3">
										<button type="button" class="css-wgo8z eir4d5m2">
											개인정보 수집 이용 및 제 3자 제공 동의
											<svg fill="none" viewBox="0 0 16 10"
												preserveAspectRatio="xMidYMid meet"
												class="css-cr6fx6 eir4d5m1">
                                            <path
													d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                        </svg>
										</button>
										<div class="policy-list" style="overflow: hidden;"></div>
										<div class="css-fmrpws eir4d5m0">본인은 만 14세 이상이며, 주문 내용을
											확인하였습니다.</div>
									</div>
								</div>
							</div>
							<button class="_1eWD8 _3SroY _27do9 y-RI2 payment_Btn"
								type="button" onClick="requestPay()"></button>
						</div>
					</div>
				</div>
			</section>
		</main>


		<!--푸터-->
		<footer>
			<jsp:include page="./footer/footer.jsp"></jsp:include>
		</footer>
	</div>
	<c:if test="${address_li.size() ne 0 }">
	<div class="addr_change_div">
		<div class="_1SpqS _1MBhg open open-active">
			<div class="_3OUv- mHTb_ _2cK_F">
				<div tabindex="-1" class="_2mP0n _3iCqi y72e_">
					<div class="Jua8R">
						<header class="_1I4Z6">
							<div class="_2NWGa">
								<svg class="_22l5h" width="24" height="24" fill="currentColor"
									onClick="addr_change_close()" viewBox="0 0 24 24"
									preserveAspectRatio="xMidYMid meet">
									<path
										d="M12 11.3l8.13-8.14.7.7L12.72 12l8.13 8.13-.7.7L12 12.72l-8.13 8.13-.7-.7L11.28 12 3.16 3.87l.7-.71L12 11.29z"></path></svg>
							</div>
							<div class="_37oj5">배송지 선택</div>
						</header>
						<article class="_2XEGg">
							<div class="_3tS7D">
								<c:forEach var="i" begin="0" end="${fn:length(address_li)-1}">
									<div class="_1wQwu">
										<div class="_1-RcR">
											<div class="_2PF83">${address_li[i].address_name }</div>
											<c:if test="${address_li[i].addr_default eq true }">
												<div>
													<div class="_3Qh2J">기본배송지</div>
												</div>
											</c:if>
										</div>
										<div class="_2PBCS">${address_li[i].address1 },
											${address_li[i].address2 }</div>
										<div class="keo89">
											<div class="_2OXw7">${address_li[i].receiver }</div>
											<div class="_3EB5d">${address_li[i].phone_num }</div>
										</div>
										<div class="LdTP4">
											<div class="_1n3SH">
												<button class="_1eWD8 _2wYpN _1xT_u _7sIV3" type="button">삭제</button>
												<button class="_1eWD8 _2wYpN _1xT_u _7sIV3" type="button">수정</button>
											</div>
											<div class="_1n3SH">
												<button class="_1eWD8 _3SroY _1xT_u _7sIV3 _3ohIu"
													type="button">선택</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="_1-R1t">
								<button class="_1eWD8 _3SroY _3VwZT _1bxWR" onclick="addr_add_btn()">배송지 추가</button>
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
</body>
</html>