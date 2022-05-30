<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호변경</title>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
    <link href="resources/css/user_css/zinc/ozopassword.css?var=1" rel="stylesheet"/>
    <link href="resources/css/user_css/zinc/ozomypageheader.css?var=1" rel="stylesheet"/>
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage-dh">
        <div class="mypage-nav">
          <nav class="page-navigation mypage-nav-owner">
            <ul style="transform: translateX(0px); margin: 0px">
              <li class="mypage-nav-item">
                <a href="/house/m_myPage.com" target="self">프로필</a>
              </li>
              <li class="mypage-nav-item">
                <a href="/house/myshopping.com" target="self">나의 쇼핑</a>
              </li>
              <li class="mypage-nav-item">
                <a href="/house/review.com" target="self">나의 리뷰</a>
              </li>
              <li class="mypage-nav-item">
                <a class="active" href="/house/edit.com" target="self">설정</a>
              </li>
            </ul>
          </nav>
        </div>
    </div>
    <div class="area-position-mypage-dh">
        <div class="mypage-nav">
          <nav class="page-navigation mypage-nav-owner">
            <ul style="transform: translateX(0px); margin: 0px">
              <li class="mypage-nav-item">
                <a href="/house/m_edit.com" target="self" style="font-size: 15px;">회원정보수정</a>
              </li>
              <li class="mypage-nav-item">
                <a class="active" href="#" target="self" style="font-size: 15px;">비밀번호변경</a>
              </li>
            </ul>
          </nav>
        </div>
    </div>


    <div class="update_password">
        
        <div class="update_password_wrap">
            <div class="update_password_title">
                비밀번호 변경
            </div>

            <form action="userPassword_change.com" method="post">
                <div class="update_password_section">
                    <div class="update_password_section_title">
                        새 비밀번호
                    </div>
                    <div class="update_password_section_content">
                        영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.
                    </div>
                    <div class="input_group">
                        <div class="input_group_form">
                            <input id="pass_check" type="password" class="form_control input-dh" name="change_pass">
                        </div>
                        <div class="expert-form-group__error error_first" id="error1">
                            <svg width="20" height="20" viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet"><circle cx="10" cy="10" r="10" fill="#F77"></circle><path fill="#FFF" d="M9.42 11.98l-.25-4.43-.06-1.67h1.78l-.06 1.67-.25 4.43H9.42zm.58 3.19c-.62 0-1.1-.5-1.1-1.15 0-.65.48-1.16 1.1-1.16.62 0 1.1.5 1.1 1.16 0 .64-.48 1.15-1.1 1.15z"></path></svg>
                            비밀번호는 영문, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.
                        </div>
                    </div>
                    
                </div>

                <div class="update_password_section_re">
                    <div class="update_password_section_title">
                        새 비밀번호
                    </div>
                    <div class="input_group">
                        <div class="input_group_form">
                            <input type="password" class="form_control input-dh" id="repass_check" name="change_repass">
                        </div>
                        <div class="expert-form-group__error error_second" id="error2">
                            <svg width="20" height="20" viewBox="0 0 20 20" preserveAspectRatio="xMidYMid meet"><circle cx="10" cy="10" r="10" fill="#F77"></circle><path fill="#FFF" d="M9.42 11.98l-.25-4.43-.06-1.67h1.78l-.06 1.67-.25 4.43H9.42zm.58 3.19c-.62 0-1.1-.5-1.1-1.15 0-.65.48-1.16 1.1-1.16.62 0 1.1.5 1.1 1.16 0 .64-.48 1.15-1.1 1.15z"></path></svg>
                            비밀번호가 일치하지 않습니다.
                        </div>
                    </div>
                </div>

                <button class="update_password_btn">비밀번호 변경</button>

                <!-- 비밀번호 검증 js -->
                <script>

                    var check = document.getElementById("pass_check");
                    var recheck = document.getElementById("repass_check");
                    let regPass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
                    var error1 = document.getElementById('error1');
                    var error2 = document.getElementById('error2');

                    check.addEventListener('keyup', function(){
                    if(check.value.length == 0){
                    	$(".error_first").text("필수 입력 사항입니다.");		
                    	error1.style.display = 'block';
                    	$(".update_password_btn").prop("disabled",true);
                        $(check).addClass('error');
                    }else if(!regPass.test(check.value)){
                    	$(".error_first").text("비밀번호는 영문, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");	
                            error1.style.display = 'block';
                            $(".update_password_btn").prop("disabled",true);
                            $(check).addClass('error');
                        }else{
                            error1.style.display = 'none';
                            $(".update_password_btn").prop("disabled",false);
                            $(check).removeClass('error');
                        }
                        repass();
                    });

                    recheck.addEventListener('keyup', function(){
                    	repass();
                    });
                    function repass(){
                        if(recheck.value != check.value){
                            error2.style.display = 'block';
                            $(".update_password_btn").prop("disabled",true);
                            $(recheck).addClass('error');
                        }else{
                            error2.style.display = 'none';
                            $(".update_password_btn").prop("disabled",false);
                            $(recheck).removeClass('error');
                        }
					}
                </script>
            </form>
        </div>
    </div>
     <footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
</body>
</html>