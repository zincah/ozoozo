<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>SignUp Page</title>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/dh/DivSignUp.css?var=1'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/dh/block.css?var=12'>
    <link rel="stylesheet" href="resources/css/admincss/fonts.css?var=1">
    <script type="text/javascript" src="resources/js/sellerjs/jquery-3.6.0.min.js"></script>
  	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  
  	<script>
  	
		//	fc7fc6f3684227823c32640d578cac9e
	    // 카카오 로그인 구현
	    window.Kakao.init("fc7fc6f3684227823c32640d578cac9e");
	    //console.log(Kakao.isInitialized()); // sdk 초기화?
	    
	    function kakaoLogin(){
	    	
	    	window.Kakao.Auth.login({
	    		scope:'profile_nickname,account_email',
	    		success: function(authObj){
	    			
	    			window.Kakao.API.request({
	    				url: '/v2/user/me',
	    				success: function(response){
	    					
	    					var accessToken = Kakao.Auth.getAccessToken();
	    					Kakao.Auth.setAccessToken(accessToken);
	    					
	    					console.log(JSON.stringify(response));
	    					
	    					var email = response.kakao_account.email;
	    					var name = response.properties.nickname;
	    					
	    					console.log(email);
	    					console.log(name);
	    					
	    					$("#kaemail").val(email);
	    					$("#kanickname").val(name);
	    					
	    					$(".login_form").submit();
	    					
	    				},
	    				fail: function(error) {
	    			        console.log(error);
	    			    }
	    			})
	    		}
	    		
	    		
	    	})
	    	
	    	
	    }
  		
  		function sendEmail(){
  			$(".emailBtn").removeClass('EmailBtn_true');
  			$(".emailBtn").prop("disabled", true);
  			
  			var codeDiv = $(".eqepphp7");
  			codeDiv.css("display" , "block");
  			
  			
  			var email = $(".email_1").val();
      		var email_S = $(".emailSelect");
      		var email_I = $(".emailInput");
      		
  			if($(email_S).val() == "manual") {
  				var email = {"email" : $("#email1").val() + "@" + $(email_I).val()}
  			}else if($(email_S).val() != null){
  				var email = {"email" : $("#email1").val() + "@" + $("#email2").val()}
  			}
  			console.log(JSON.stringify(email));
  			
  			$.ajax({
  		  		url:'sendEmail.com',
  		  		method:'post',
  		  		data: JSON.stringify(email),
  		  		contentType : 'application/json; charset=UTF-8',
  		  		dataType : 'json',
  		  		success : function(resp){
  		  		}
  		  	})
  		  	timer();
  		  	alert("이메일을 발송하였습니다. 발송된 코드를 적어주세요.");
  		}
  		var time = null;
  		function timer(){
  			var min = 3;
  			var second = 0;
  		  	clearInterval(time);
  		  	time = setInterval(function() {
  		  		if (second < 10){
  		  		$(".eqepphp2").text(min + ":0"+ second);
  		  		}else{
  		  		$(".eqepphp2").text(min + ":"+ second);
  		  		}
  		  		if ( second == 0){
  		  			if(min == 0){
  		  			 	clearInterval(time);
  		  				$(".eqepphp1").css("display","block");
  		  				$(".css-6iq7la").removeClass("eqepphp5");
  		  				$(".css-6iq7la").addClass("css-1fyq8cc");
  		  			}
  		  			min--;
  		  			second = 60;
  		  		}
  		  		second--;
  		  	},1000);
  		}
  		
  		function codeCheck(){
  			if($(".eqepphp3").val().length > 0 ){
  				$(".edfw59v0").prop("disabled", false);
  			}else{
  				$(".edfw59v0").prop("disabled", true);
  			}
  		}
  		
  		function email_Code_Check(){
  			var code = $(".eqepphp3").val();
  			$.ajax({
  		  		url:'email_code_check.com',
  		  		method:'post',
  		  		data: JSON.stringify(code),
  		  		contentType : 'application/json; charset=UTF-8',
  		  		dataType : 'json',
  		  		success : function(CodeAccess){
  		  			if(CodeAccess){
  		  				//$(".email_1").attr("disabled", true);
  		  				//$(".form-control").attr("disabled", true);
  		  				$(".emailBtn").text("이메일 인증 완료");
  		  				var codeDiv = $(".eqepphp7");
  		  				codeDiv.css("display" , "none");
  		  			alert("이메일 인증 완료.");
  		  				console.log("불린 값을 보낼건데.. " +CodeAccess);
  		  				ready_SignUp_email(CodeAccess);
  		  			}else{
  		  			$(".eqepphp1").css("display","block");
  		  				$(".eqepphp1").text("올바른 인증 코드가 아닙니다.");
  		  				$(".css-6iq7la").removeClass("eqepphp5");
		  				$(".css-6iq7la").addClass("css-1fyq8cc");
  		  			}
  		  		}
  		  	})
  		}
  	</script>
</head>
<body>
         <!-- 전체 창 -->
        <div class="main">
            <a href="/house/main.com"><img class="signUp_logo" src="resources/assets/img/ozohouse-logo.svg" alt="오조의집">
            </a>
            <!--가운데 메인 창-->
            <div class="real_main">
                <h1 class="SignUpLogo">회원가입</h1><br>
                <!-- SNS 간편하게 회원가입 -->
                <div class="SNS_div">
                    <div class="snsInform">
                        <h5 class="snsLogo">SNS계정으로 간편하게 회원가입</h5>
                    </div>
                    <ul class="snsList">
                        <li class="sns" style="display:none;">
                            <a href="">
                                <svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#3B5998" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
                                        <path fill="#FFF" d="M25.77 35V24h3.384v-3.385h-3.385v-2.538c-.012-.756.08-1.285 1.693-1.692h1.692V13h-3.385c-3.25 0-4.52 1.84-4.23 5.077v2.538H19V24h2.538v11h4.231z"></path>
                                    </g>
                                </svg>
                            </a>
                        </li>
                        <li class="sns">
                            <a href="javascript:kakaoLogin();"><svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#FFEB00" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z">
                                        </path>
                                        <path fill="#3C2929" d="M24 11.277c8.284 0 15 5.306 15 11.85 0 6.545-6.716 11.85-15 11.85-.92 0-1.822-.066-2.697-.191l-6.081 4.105a.43.43 0 0 1-.674-.476l1.414-5.282C11.777 31.031 9 27.335 9 23.127c0-6.544 6.716-11.85 15-11.85zm6.22 8.407c-.416 0-.718.297-.718.707v5.939c0 .41.289.686.718.686.41 0 .718-.295.718-.686v-1.932l.515-.526 1.885 2.57c.277.374.426.54.691.568.037.003.075.005.112.005.154 0 .66-.04.716-.563.038-.293-.137-.52-.348-.796l-2.043-2.675 1.727-1.743.176-.196c.234-.26.353-.39.353-.587.009-.422-.34-.652-.687-.661-.274 0-.457.15-.57.262l-2.528 2.634v-2.3c0-.422-.288-.706-.717-.706zm-9.364 0c-.56 0-.918.432-1.067.837l-2.083 5.517a.84.84 0 0 0-.065.315c0 .372.31.663.706.663.359 0 .578-.162.69-.51l.321-.97h2.999l.313.982c.111.335.34.498.7.498.367 0 .655-.273.655-.62 0-.056-.017-.196-.081-.369l-2.019-5.508c-.187-.53-.577-.835-1.069-.835zm-2.92.064h-4.452c-.417 0-.642.337-.642.654 0 .3.168.652.642.652h1.51v5.21c0 .464.274.752.716.752.443 0 .718-.288.718-.751v-5.21h1.508c.474 0 .643-.352.643-.653 0-.317-.225-.654-.643-.654zm7.554-.064c-.442 0-.717.287-.717.75v5.707c0 .497.28.794.75.794h2.674c.434 0 .677-.321.686-.627a.642.642 0 0 0-.17-.479c-.122-.13-.3-.2-.516-.2h-1.99v-5.195c0-.463-.274-.75-.717-.75zm-4.628 1.306l.008.01 1.083 3.265h-2.192L20.842 21a.015.015 0 0 1 .028 0z">
                                        </path>
                                    </g>
                                </svg>
                            </a>
                        </li>
                        <li class="sns">
                            <a href="${naverurl }">
                                <svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="#00C63B" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path>
                                        <path fill="#FFF" d="M21 25.231V34h-7V15h7l6 8.769V15h7v19h-7l-6-8.769z"></path>
                                    </g>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- 입력 창 -->
                <form action="signUpProc.com" method="post">
                    <div class="email_div">
                        <label class="emailLogo">이메일</label>
                        <div class="input_email">
                            <span class="emailSpan">
                            	<input id="email1" class="email_1 input-dh" placeholder="이메일" name="user_email1" oninput="checkEmail()">
                            </span>
                            <span class="golbang">@</span>
                            <span class="emailSpan">
                                <select id="email2" class="emailSelect form-control" name="user_email2"  onchange="emailWrite()" onclick="checkEmail()">
                                    <option value="" disabled selected>선택해주세요</option>
                                    <option value="naver.com">naver.com</option> 
                                    <option value="hanmail.com">hanmail.com</option> 
                                    <option value="daum.com">daum.com</option> 
                                    <option value="gmail.com">gmail.com</option> 
                                    <option value="nate.com">nate.com</option> 
                                    <option value="hotmail.com">hotmail.com</option> 
                                    <option value="outlook.com">outlook.com</option> 
                                    <option value="manual">직접입력</option> 
                                </select> 
                                <button class="email-input__domain__expand1" aria-label="초기화" type="button" tabindex="-1">
                                	<svg class="icon" width="10" height="10" preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;">
                                		<path fill-rule="evenodd" d="M0 3l5 5 5-5z">
                                		</path>
                                	</svg>
                                </button>
                                <input class="form-control emailInput" placeholder="입력해주세요" name="user_email3" size="1" value="" style="display:none" onInput="checkEmail()">
                                <button class="email-input__domain__expand2 active" aria-label="초기화" type="button" tabindex="-1" style="display:none" onclick="emailBtn()">
                               		 <svg class="icon" width="10" height="10" preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;">
                               		 <path fill-rule="evenodd" d="M5 4L8.5.3l1 1.1L6.2 5l3.5 3.6-1 1L5 6.1 1.4 9.6l-1-1L3.9 5 .4 1.5l1.1-1L5 3.8z">
                               		 </path>
                                	</svg>
                                </button>
                                <!--<button>
                                    <svg>
                                        <!-- v 자 이미지 넣기
                                    </svg>
                                </button>-->
                            </span>
                        </div>
                    </div>
                    <div class="css-1thr4j euhjq6q0 false_email" style="display:none">이메일 형식이 올바르지 않습니다.</div>  
                    <div class="emailBtn_div">
                        <button type="button" class="emailBtn" onclick="sendEmail()" disabled>이메일 인증하기</button>
                    </div>
				<div class="open expanded"
					style="overflow: hidden; margin-bottom: 20px;" >
					<div class="css-g8had9 eqepphp7" style="display:none">
						<div class="css-epwnf3 eqepphp6">이메일로 전송된 인증코드를 입력해주세요.</div>
						<div class="css-6iq7la eqepphp5">
							<div class="css-1cvdtkt eqepphp4">
								<input type="text" placeholder="인증코드 6자리 입력"
									class="css-jh3u7 eqepphp3" value="" oninput="codeCheck()"><span
									class="css-2ofpti eqepphp2"></span>
								<button class="_3Z6oR _3AsCW _2tsrJ css-1gabnbc edfw59v0"
									type="button" disabled onClick="email_Code_Check()">확인</button>
							</div>
							<div class="css-bxn4wb eqepphp1" style="display:none">인증코드가 만료되었습니다.</div>
						</div>
						<div class="css-1r0yqr6 eqepphp0">
							<div class="css-1vor8y5 ejevacd2">
								<svg width="14" height="14" viewBox="0 0 14 14" fill="none"
									preserveAspectRatio="xMidYMid meet" class="css-qamjgr ejevacd0">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M0.25 7C0.25 10.7279 3.27208 13.75 7 13.75C10.7279 13.75 13.75 10.7279 13.75 7C13.75 3.27208 10.7279 0.25 7 0.25C3.27208 0.25 0.25 3.27208 0.25 7ZM13 7C13 10.3137 10.3137 13 7 13C3.68629 13 1 10.3137 1 7C1 3.68629 3.68629 1 7 1C10.3137 1 13 3.68629 13 7ZM7.125 3.75C7.47018 3.75 7.75 4.02982 7.75 4.375C7.75 4.72018 7.47018 5 7.125 5C6.77982 5 6.5 4.72018 6.5 4.375C6.5 4.02982 6.77982 3.75 7.125 3.75ZM6.65 10.5H7.58333V5.83333H6.65V10.5Z"
										fill="#828C94"></path></svg>
								이메일을 받지 못하셨나요?<a class="css-3b6ywl ejevacd1" onClick="sendEmail()">이메일 재전송하기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- email end -->
                    
                <!-- 비밀번호 -->
                    <div class="password_div">
                        <label class="passwordLogo">비밀번호</label>
                        <div class="passwordInform">영문,숫자,특수 문자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
                        <input class="passwordInput input-dh" name="user_pw" type="password" placeholder="비밀번호" value oninput="checkPass()">
                        <div class="css-1thr4j euhjq6q0 false_pass" style="display : none"></div>
                    </div><!-- 비밀번호 end-->

                <!-- 비밀번호 확인 -->
                    <div class="confirmPassword_div">
                        <label class="repasswordLogo">비밀번호 확인</label>
                        <div class="passwordInform">영문,숫자,특수 문자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
                        <input class="repasswordInput input-dh" name="confirm_pw" type="password" placeholder="비밀번호 확인" value oninput="checkRePass()">
                        <div class="css-1thr4j euhjq6q0 false_repass" style="display : none">비밀번호가 일치하지 않습니다.</div>
                    </div><!-- 비밀번호 확인 end-->
                <!-- 닉네임 입력란-->
                    <div class="nickname_div">
                        <label class="nicknameLogo">닉네임</label>
                        <div class="nicknameInform">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</div>
                        <input class="nicknameInput input-dh"  name="nickname" placeholder="별명 (2~15자)" value="" oninput="checkNick()">
                        <div class="css-20k7wq euhjq6q0 false_nick"></div>
                    </div><!-- 닉네임 end -->
                <!-- 약관 동의 -->
                    <div class="agree_div">
                        <label class="agreeLogo">약관동의</label>
                        <div class="agreeBox">
                        <!-- 전체 동의 div -->
                            <div class="agree1_div">
							<label class="_3xqzr _4VN_z">
								<div class="_3zqA8">
									<input type="checkbox" class="_3UImz A_A" name="agreeAll" value="" onClick="allAgree()">
										<span class="_2mDYR">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
												<path fill="currentColor"
													d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z"></path>
											</svg>
										</span>
								</div>
								<span class="_1aN3J"><div class="css-gekkos e1hy3kq3">전체동의</div>
								</span>
							</label>
						</div>
                            <label class="_3xqzr _4VN_z"><!-- 만 14세 div -->
                                <div class="_3zqA8">
									<input type="checkbox" class="_3UImz" name="agree1" value="" onClick="Checked()">
									<span class="_2mDYR">
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
											<path fill="currentColor"
												d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
											</path>
										</svg>
									</span>
								</div>
								<div class="agreeBottom_div">만 14세 이상입니다.
                               		 <span class="agreeP">(필수)</span>
                          	  </div>
                            </label>
                            <label class="_3xqzr _4VN_z"><!-- 이용약관 label -->
                                <div class="_3zqA8">
								<input type="checkbox" class="_3UImz" name="agree2" value="" onClick="Checked()">
								<span class="_2mDYR">
									<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
										<path fill="currentColor"
											d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
										</path>
									</svg>
								</span>
							</div>
							<div class="agreeBottom_div">
                                    <a target="_blank" class="" href="">이용약관</a>
                                    <span class="agreeP">(필수)</span>
                                </div>
                            </label>
                            <label class="_3xqzr _4VN_z"><!-- 개인정보 동의 label -->
                               <div class="_3zqA8">
								<input type="checkbox" class="_3UImz" name="agree3" value="" onClick="Checked()">
								<span class="_2mDYR">
									<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
										<path fill="currentColor"
											d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
										</path>
									</svg>
								</span>
							</div>
							<div class="agreeBottom_div">
                                    <a target="_blank" class="" href="">개인정보수집 및 이용동의</a>
                                    <span class="agreeP">(필수)</span>
                                </div>
                            </label>
                            <label class="_3xqzr _4VN_z"><!-- 이벤트 프로모션 동의 label -->
                                <div class="_3zqA8">
								<input type="checkbox" class="_3UImz" name="agree4" value="" onClick="Checked()">
								<span class="_2mDYR">
									<svg width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
										<path fill="currentColor"
											d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
										</path>
									</svg>
								</span>
							</div>
							<div class="agreeBottom_div">
                                    <a target="_blank" class="" href="">이벤트, 프로모션 알림 메일 및 SMS 수신</a>
                                    <span class="agreeP_Choice">(선택)</span>
                                </div>
                            </label>
                        </div>
                    </div>
                    <button class="SignUpBtn" action="" method="post" onClick="return SignUpBtn();" >회원가입하기</button>
                </form>
                <p class="areadyId">이미 아이디가 있으신가요?
                    <a href="/house/login.com" class="LoginBtn">로그인</a>
                </p>
            </div>
        </div>
      <script>
      	function checkEmail(){
      		var email = $(".email_1").val();
      		var email_S = $(".emailSelect");
      		var email_I = $(".emailInput");
      		var email_ex = $(".emailInput").val();
      		
      		var blank_pattern = /\s/g;
      	  	var em = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      		if(blank_pattern.test(email) == true){
      			$(".false_email").text("공백 사용 금지.");
      			$(".false_email").css("display", "block");
      			$(".emailLogo").addClass('css-1azo586');
      			$(".email_1").addClass('error');
      			$(".form-control").addClass('error');
      			$(".emailBtn").removeClass('EmailBtn_true');
      			$(".emailBtn").prop("disabled", true);
      			return;
      		}else if(email.length == 0){
      			$(".false_email").text("이메일 형식이 올바르지 않습니다.");
      			$(".false_email").css("display", "block");
      			$(".emailLogo").addClass('css-1azo586');
      			$(".email_1").addClass('error');
      			$(".form-control").addClass('error');
      			$(".emailBtn").removeClass('EmailBtn_true');
      			$(".emailBtn").prop("disabled", true);
      			return;
      		}else if($(email_S).val() == null || $(email_S).val() == "manual" && !em.test(email_ex)){
      			$(".false_email").text("이메일 형식이 올바르지 않습니다.");
      			$(".false_email").css("display", "block");
      			$(".emailLogo").addClass('css-1azo586');
      			$(".email_1").addClass('error');
      			$(".form-control").addClass('error');
      			$(".emailBtn").removeClass('EmailBtn_true');
      			$(".emailBtn").prop("disabled", true);
      			return;
      		}else if(em.test(email_ex)  && $(email_S).val() == "manual" || $(email_S).val() != null){
      			$(".false_email").css("display", "none");
      			$(".emailLogo").removeClass('css-1azo586');
      			$(".email_1").removeClass('error');
      			$(".form-control").removeClass('error');
      			$(".emailBtn").addClass('EmailBtn_true');
      			$(".emailBtn").prop("disabled", false);
      			if ($(email_S).val() == "manual"){
      				var email = ($("#email1").val() + "@" + $(email_I).val());
      			}else{
      				var email = ($("#email1").val() + "@" + $("#email2").val());
      			}
      		}
      		$.ajax({
  		  		url:'Duplicate_Check_Email.com',
  		  		method:'post',
  		  		data: JSON.stringify(email),
  		  		contentType : 'application/json; charset=UTF-8',
  		  		dataType : 'json',
  		  		success : function(check_email){
  		  			if(check_email){
	  		  			$(".false_email").css("display", "none");
	  	      			$(".emailLogo").removeClass('css-1azo586');
	  	      			$(".email_1").removeClass('error');
	  	      			$(".form-control").removeClass('error');
	  	      			$(".emailBtn").addClass('EmailBtn_true');
	  	      			$(".emailBtn").prop("disabled", false);
  		  			}else{
	  		  			$(".false_email").text("이미 가입한 이메일입니다. '이메일 로그인'으로 로그인해주세요.");
		  		  		$(".false_email").css("display", "block");
			  		  	$(".emailLogo").addClass('css-1azo586');
			  			$(".email_1").addClass('error');
			  			$(".form-control").addClass('error');
			  			$(".emailBtn").removeClass('EmailBtn_true');
			  			$(".emailBtn").prop("disabled", true);
  		  			}
  		  		}
  		  	})
      		
      		
      		
      		/* if(email.length > 0 && email_S != null){
      			$(".false_email").css("display", "none");
      			$(".emailLogo").removeClass('css-1azo586');
      			$(".email_1").removeClass('error');
      			$(".emailSelect").removeClass('error');
      			$(".emailBtn").addClass('EmailBtn_true');
      		}else {
      			$(".false_email").css("display", "block")
      			$(".emailLogo").addClass('css-1azo586');
      			$(".email_1").addClass('error');
      			$(".emailSelect").addClass('error');
      			$(".emailBtn").removeClass('EmailBtn_true');
      		} */
      	}
      	
      	
      	function emailWrite(){
      		var email_S = $(".emailSelect").val();
      		if(email_S == "manual"){
      			$(".emailSelect").css("display", "none");
      			$(".emailInput").css("display", "block");
      			$(".email-input__domain__expand2").css("display", "block");
      			$(".email-input__domain__expand1").css("display", "none");
      		}
      	}
      	function emailBtn(){
      		$(".emailInput").val("");
      		$(".emailSelect").css("display", "block");
  			$(".emailInput").css("display", "none");
  			$(".email-input__domain__expand2").css("display", "none");
  			$(".email-input__domain__expand1").css("display", "block");
      	}
    	function checkPass(){
    		var pass = document.querySelector(".passwordInput").value;
    		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    		var repass = $(".repasswordInput").val();
    		var blank_pattern = /\s/g;
    		
    		var msg = $(".false_pass");
    		var Logo = $('.passwordLogo');
    		var passInput = $('.passwordInput');
    		
    		if(blank_pattern.test(pass) == true){
    			$('.false_pass').text("공백 사용금지.");
    			$(Logo).addClass("css-1azo586");
    			$(passInput).addClass("error");
    			$(msg).css("display", "block")
    		}else if(pass.length == 0){	
    			$('.false_pass').text("필수 입력 항목입니다.");
    			$(Logo).addClass("css-1azo586");
    			$(passInput).addClass("error");
    			$(msg).css("display", "block");
    		}else if(!reg.test(pass)){
    			$('.false_pass').text("비밀번호는 영문, 숫자 ,특수 문자를 포함하여 8자 이상이어야 합니다.");
    			$(Logo).addClass("css-1azo586");
    			$(passInput).addClass("error");
    			$(msg).css("display", "block");
    		}else{
    			$(Logo).removeClass("css-1azo586");
    			$(passInput).removeClass("error");
    			$(msg).css("display", "none");
    		}
    		if(pass == repass){
    			$('.repasswordLogo').removeClass("css-1azo586");
    			$('.repasswordInput').removeClass("error");
    			$('.false_repass').css("display", "none")
    			
    		}
        }
		function checkRePass(){
			var pass = $(".passwordInput").val();
			var repass = $(".repasswordInput").val();
			if(pass != repass){
				$('.repasswordLogo').addClass("css-1azo586");
    			$('.repasswordInput').addClass("error");
    			$('.false_repass').css("display", "block")
			}else{
				$('.repasswordLogo').removeClass("css-1azo586");
    			$('.repasswordInput').removeClass("error");
    			$('.false_repass').css("display", "none")
			}
        }
		function checkNick(){
			var nick = $('.nicknameInput');
			var nickVal = $(nick).val();
			var nickLogo = $('.nicknameLogo');
			var falseMsg = $('.false_nick');
			if(nickVal.length == 0 ){
				$(nick).addClass("error");
				$(nickLogo).addClass("css-1azo586");
				$(falseMsg).text("필수 입력 항목입니다.");
				return;
			}else if(nickVal.length == 1){
				$(nick).addClass("error");
				$(nickLogo).addClass("css-1azo586");
				$(falseMsg).text("2자 이상 입력해주세요.");
				return;
			}else if(nickVal.length > 15){
				$(nick).addClass("error");
				$(nickLogo).addClass("css-1azo586");
				$(falseMsg).text("15자 이하로 입력해주세요.");
				return;
			}else{
				$(nick).removeClass("error");
				$(nickLogo).removeClass("css-1azo586");
				$(falseMsg).text("");
				
			}
			$.ajax({
  		  		url:'Duplicate_Check_Nickname.com',
  		  		method:'post',
  		  		data: JSON.stringify(nickVal),
  		  		contentType : 'application/json; charset=UTF-8',
  		  		dataType : 'json',
  		  		success : function(check_Nickname){
  		  			if(check_Nickname){
	  		  			$(nick).removeClass("error");
	  					$(nickLogo).removeClass("css-1azo586");
	  					ready_SignUp_nickname(check_Nickname);
  		  			}else{
	  		  			$(nick).addClass("error");
	  					$(nickLogo).addClass("css-1azo586");
	  					$(falseMsg).text("사용 중인 별명입니다.");
	  		  		}
  		  		}
  		  	})
		}
		
		function allAgree(){
			if($('.A_A').is(':checked')){
				$('input:checkbox[name="agree1"]').prop('checked',true);
				$('input:checkbox[name="agree2"]').prop('checked',true);
				$('input:checkbox[name="agree3"]').prop('checked',true);
				$('input:checkbox[name="agree4"]').prop('checked',true);
			}else{
				$('input:checkbox[name="agree1"]').prop('checked',false);
				$('input:checkbox[name="agree2"]').prop('checked',false);
				$('input:checkbox[name="agree3"]').prop('checked',false);
				$('input:checkbox[name="agree4"]').prop('checked',false);
			}
		}
		
		function Checked(){
			if($('.A_A').is(':checked')){
				$('.A_A').prop('checked',false);
			}
		}
		
		/* 회원가입 버튼 전체 총 검사 */
		var email_check = null;
		var nick_check = null;
		
		
		
		function ready_SignUp_email(Email_match){
			email_check = Email_match;
		}
		
		function ready_SignUp_nickname(nick_match){
			nick_check = nick_match;
		}
		
		function SignUpBtn(){
			var pass = document.querySelector(".passwordInput").value;
			var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			var repass = $(".repasswordInput").val();
			var blank_pattern = /\s/g;
			
			var check1 = $('input:checkbox[name="agree1"]').is(':checked');
			var check2 = $('input:checkbox[name="agree2"]').is(':checked');
			var check3 = $('input:checkbox[name="agree3"]').is(':checked');
			
			
			if(!email_check){
				alert("이메일 인증을 해주세요.");
				return false;
			}else if(blank_pattern.test(pass) == true || pass.length == 0 || !reg.test(pass)){
				console.log(pass.length);
				alert("비밀번호가 올바르지 않습니다.");
				return false;
			}else if(pass != repass){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}else if(!nick_check){
				alert("별명이 올바르지 않습니다.");
				return false;
			}else if( !check1 || !check2 || !check3){
      			alert('필수 사항을 체크해주세요.');
      			return false;
      		}
			
			return true;
			
			
			
			
			
			
			
			
			
			
	/* 		var email = $(".email_1").val();
      		var email_S = $(".emailSelect").val();
      		
      		var pass = $(".passwordInput").val();
      		var repass = $(".repasswordInput").val();
    		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    		
    		var nick = $('.nicknameInput').val();
    		
    		var check1 = $('input:checkbox[name="agree1"]').is(':checked')
    		var check2 = $('input:checkbox[name="agree2"]').is(':checked')
    		var check3 = $('input:checkbox[name="agree3"]').is(':checked')
    		
      		if(email.length == 0 || email_S.length == null){
      			return false;
      		}else if(pass.length == 0){
      			return false;
      		}else if(!reg.test(pass)){
      			return false;
      		}else if(pass != repass){
      			return false;
      		}else if(nick.length < 2 || nick.length > 15){
      			return false;
      		}else if( !check1 || !check2 || !check3){
      			alert('hi');
      			return false;
      		}	 */
		}
      </script>
        
</body>
</html>