<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>SignUp Page</title>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/dh/DivSignUp.css?var=1'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/dh/block.css'>
    <link rel='stylesheet' type='text/css'  href='resources/css/user_css/dh/font.css'>
    <script src='main.js'></script>
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
                        <li class="sns">
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
                            <a href=""><svg width="48" height="48" viewBox="0 0 48 48" preserveAspectRatio="xMidYMid meet">
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
                            <a href="">
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
                            	<input class="email_1" placeholder="이메일" name="user_email1">
                            </span>
                            <span class="golbang">@</span>
                            <span class="emailSpan">
                                <select class="emailSelect" name="user_email2">
                                    <option value disabled>선택해주세요</option>
                                    <option value="naver.com">naver.com</option> 
                                    <option value="hanmail.com">hanmail.com</option> 
                                    <option value="daum.com">daum.com</option> 
                                    <option value="gmail.com">gmail.com</option> 
                                    <option value="nate.com">nate.com</option> 
                                    <option value="hotmail.com">hotmail.com</option> 
                                    <option value="outlook.com">outlook.com</option> 
                                    <option value="manual">직접입력</option> 
                                </select>
                                <!--<button>
                                    <svg>
                                        <!-- v 자 이미지 넣기
                                    </svg>
                                </button>-->
                            </span>
                        </div>
                    </div>  
                    <div class="emailBtn_div">
                        <button class="emailBtn" name="">이메일 인증하기</button>
                    </div><!-- email end -->
                <!-- 비밀번호 -->
                    <div class="password_div">
                        <label class="passwordLogo">비밀번호</label>
                        <div class="passwordInform">영문,숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
                        <input class="passwordInput" name="user_pw" type="password" placeholder="비밀번호" value>
                    </div><!-- 비밀번호 end-->

                <!-- 비밀번호 확인 -->
                    <div class="confirmPassword_div">
                        <label class="passwordLogo">비밀번호 확인</label>
                        <div class="passwordInform">영문,숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
                        <input class="passwordInput" name="confirm_pw" type="password" placeholder="비밀번호 확인" value>
                    </div><!-- 비밀번호 확인 end-->
                <!-- 닉네임 입력란-->
                    <div class="nickname_div">
                        <label class="nicknameLogo">닉네임</label>
                        <div class="nicknameInform">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</div>
                        <input class="nicknameInput"  name="nickname" placeholder="별명 (2~15자)" value="">
                    </div><!-- 닉네임 end -->
                <!-- 약관 동의 -->
                    <div class="agree_div">
                        <label class="agreeLogo">약관동의</label>
                        <div class="agreeBox">
                            <div class="agree1_div"><!-- 전체 동의 div -->
                                <lable class="agreeOption">
                                    <div class="agreecheck_div">
                                        <input type="checkbox" class="agreeCheck" name="agreeAll">
                                    </div>
                                    <span class="agreeSpan">
                                        <div class="agree1Logo">전체동의</div>
                                    </span>
                                </lable>
                            </div>
                            <label class="agreeOption"><!-- 만 14세 div -->
                                <div class="agreecheck_div">
                                    <input type="checkbox" class="" name="agree1" value="">
                                </div>
                                <div class="agreeBottom_div">만 14세 이상입니다.
                                    <span class="agreeP">(필수)</span>
                                </div>
                            </label>
                            <label class="agreeOption"><!-- 이용약관 label -->
                                <div class="agreecheck_div">
                                    <input type="checkbox" class="" name="agree2" value="">
                                </div>
                                <div class="agreeBottom_div">
                                    <a target="_blank" class="" href="">이용약관</a>
                                    <span class="agreeP">(필수)</span>
                                </div>
                            </label>
                            <label class="agreeOption"><!-- 개인정보 동의 label -->
                                <div class="agreecheck_div">
                                    <input type="checkbox" class="" name="agree3" value="">
                                </div>
                                <div class="agreeBottom_div">
                                    <a target="_blank" class="" href="">개인정보수집 및 이용동의</a>
                                    <span class="agreeP">(필수)</span>
                                </div>
                            </label>
                            <label class="agreeOption"><!-- 이벤트 프로모션 동의 label -->
                                <div class="agreecheck_div">
                                    <input type="checkbox" class="" name="agreePromotion" name="agree" value="agree">
                                </div>
                                <div class="agreeBottom_div">
                                    <a target="_blank" class="" href="">이벤트, 프로모션 알림 메일 및 SMS 수신</a>
                                    <span class="agreeP_Choice">(선택)</span>
                                </div>
                            </label>
                        </div>
                    </div>
                    <button class="SginUpBtn" type="submit">회원가입하기</button>
                </form>
                <p class="areadyId">이미 아이디가 있으신가요?
                    <a href="/house/login.com" class="LoginBtn">로그인</a>
                </p>
            </div>
        </div>
</body>
</html>