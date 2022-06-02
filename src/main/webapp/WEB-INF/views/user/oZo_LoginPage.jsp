<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="resources/css/user_css/zinc/ozologin.css?var=1" rel="stylesheet" />
     <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        $(document).ready(function(){
            $("#nonmember_btn").click(function(){
                $("#nonmember").toggle("slow", function(){});
            })
        });
        
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
        

    </script>
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="login_layout">
        <div class="login_main">
            <a aria-label="오조의집" href="#" class="link_to_homepage">
                <div class="logo"><a href="/house/main.com"><img src="resources/assets/img/ozohouse-logo.svg" alt="오조의집"></a></div>
            </a>
            <form method="post" class="login_form" action="login.com">

				<!-- kakao -->
				<input type="hidden" name="kaemail" id="kaemail">
				<input type="hidden" name="kanickname" id="kanickname">
				
                <div class="input_wrap">
                    <input class="input_form input_pat" type="text" name="user_email" placeholder="이메일">
                </div>
                <div class="input_wrap">
                    <input class="input_form input_pat" type="password" name="user_pw" placeholder="비밀번호">
                </div>

                <button class="login_btn_area login_btn login_btn_shape">로그인</button>
                <div class="login_info">
                    <a href="/house/passwordReset.com">비밀번호 재설정</a>
                    <a href="/house/signUp.com">회원가입</a>
                </div>
                <div class="social_text">SNS계정으로 간편 로그인/회원가입</div>
                
                <div class="social_icon">
                    <div style="display:none;">
                        <a datatype="facebook" class="css-l0qndx e1ufx3to0" href="/users/auth/facebook"><svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><path fill="#3B5998" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path><path fill="#FFF" d="M25.77 35V24h3.384v-3.385h-3.385v-2.538c-.012-.756.08-1.285 1.693-1.692h1.692V13h-3.385c-3.25 0-4.52 1.84-4.23 5.077v2.538H19V24h2.538v11h4.231z"></path></g></svg></a>
                    </div>
                    <div>
                        <a datatype="kakao" class="css-l0qndx e1ufx3to0" href="javascript:kakaoLogin();"><svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><path fill="#FFEB00" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path><path fill="#3C2929" d="M24 11.277c8.284 0 15 5.306 15 11.85 0 6.545-6.716 11.85-15 11.85-.92 0-1.822-.066-2.697-.191l-6.081 4.105a.43.43 0 0 1-.674-.476l1.414-5.282C11.777 31.031 9 27.335 9 23.127c0-6.544 6.716-11.85 15-11.85zm6.22 8.407c-.416 0-.718.297-.718.707v5.939c0 .41.289.686.718.686.41 0 .718-.295.718-.686v-1.932l.515-.526 1.885 2.57c.277.374.426.54.691.568.037.003.075.005.112.005.154 0 .66-.04.716-.563.038-.293-.137-.52-.348-.796l-2.043-2.675 1.727-1.743.176-.196c.234-.26.353-.39.353-.587.009-.422-.34-.652-.687-.661-.274 0-.457.15-.57.262l-2.528 2.634v-2.3c0-.422-.288-.706-.717-.706zm-9.364 0c-.56 0-.918.432-1.067.837l-2.083 5.517a.84.84 0 0 0-.065.315c0 .372.31.663.706.663.359 0 .578-.162.69-.51l.321-.97h2.999l.313.982c.111.335.34.498.7.498.367 0 .655-.273.655-.62 0-.056-.017-.196-.081-.369l-2.019-5.508c-.187-.53-.577-.835-1.069-.835zm-2.92.064h-4.452c-.417 0-.642.337-.642.654 0 .3.168.652.642.652h1.51v5.21c0 .464.274.752.716.752.443 0 .718-.288.718-.751v-5.21h1.508c.474 0 .643-.352.643-.653 0-.317-.225-.654-.643-.654zm7.554-.064c-.442 0-.717.287-.717.75v5.707c0 .497.28.794.75.794h2.674c.434 0 .677-.321.686-.627a.642.642 0 0 0-.17-.479c-.122-.13-.3-.2-.516-.2h-1.99v-5.195c0-.463-.274-.75-.717-.75zm-4.628 1.306l.008.01 1.083 3.265h-2.192L20.842 21a.015.015 0 0 1 .028 0z"></path></g></svg></a>
                    </div>
                    <div>
                        <a datatype="naver" class="css-l0qndx e1ufx3to0" href="${naverurl}"><svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><path fill="#00C63B" d="M0 24C0 10.745 10.745 0 24 0s24 10.745 24 24-10.745 24-24 24S0 37.255 0 24z"></path><path fill="#FFF" d="M21 25.231V34h-7V15h7l6 8.769V15h7v19h-7l-6-8.769z"></path></g></svg></a>
                    </div>
                </div>
                <!--고객센터로 이동-->
                <a class="move_cs_center" href="/house/CScenter.com">로그인에 문제가 있으신가요?</a>
                
                <section class="nonmember_layer" style="display:none;">
                     <button id="nonmember_btn" type="button" class="nonmember_order_btn">비회원 주문 조회하기</button>
                     <div id="nonmember" class="login_non_member hide" sytle="overflow: hidden;">
                        <form>
                            <input class="input_form input_pat nonmember_input" name="id" placeholder="주문번호">
                            <input class="input_form input_pat nonmember_input" name="email" placeholder="이메일">
                            <button class="login_btn login_btn_shape" type="submit">주문조회</button>
                        </form>

                     </div>
                </section>
            </form>

        </div>

        <footer class="login_footer">
            © &nbsp;
            <a href="#" target="_blank">ozo's house, Co., Ltd</a>
            . All Rights Reserved  
        </footer>
    </div>

</body>
</html>

