<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
    <link href="resources/css/user_css/zinc/ozomypageheader.css" rel="stylesheet"/>
    <link href="resources/css/user_css/zinc/ozoedit.css" rel="stylesheet" />
</head>
<body>
	<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="edit_user_info">
        <div class="area-position-mypage-dh">
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
            </div>
        </div>
        <div class="area-position-mypage-dh">
            <div class="mypage-nav">
              <nav class="page-navigation mypage-nav-owner">
                <ul style="transform: translateX(0px); margin: 0px">
                  <li class="mypage-nav-item">
                    <a class="active" href="edit.html" target="self" style="font-size: 15px;">회원정보수정</a>
                  </li>
                  <li class="mypage-nav-item">
                    <a href="ozopasswordModi_zinc.html" target="self" style="font-size: 15px;">비밀번호변경</a>
                  </li>
                </ul>
              </nav>
            </div>
        </div>

        <!-- main -->
        <div class="edit_user_info_wrap container">
            <div class="edit_user_info_header">
                <div class="edit_user_info_header_title">회원정보수정</div>
                <a class="edit_user_info_header_secession">탈퇴하기</a>
            </div>
		
            <!-- 수정 부분 -->
            <form action="#" method="post">
                
                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title">
                        이메일
                        <div class="edit_user_info_item_title_sub">
                            *필수항목
                        </div>
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="email_input">
                                <input type="text" class="form_control" placeholder="이메일" value="">
                                <span class="input_seperator">@</span>
                                <select class="form_control">
                                    <option value="" disabled="">선택해주세요</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="outlook.com">outlook.com</option>
                                    <option value="icloud.com">icloud.com</option>
                                    <option value="_manual">직접입력</option>
                                </select>
                            </div>
                            <div class="email_input_warn">이메일을 변경하시려면 운영진한테 이메일을 보내주세요</div>
                        </div>
                    </div>

                    
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title">
                        별명
                        <div class="edit_user_info_item_title_sub">
                            *필수항목
                        </div>
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="char_input">
                                <input type="text" class="form_control" placeholder="별명" value="ohhhni">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title">
                        성별
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="gender_input">
                                <ul class="radio_group_input">
                                    <li>
                                        <input type="radio" class="form_radio">
                                        남성
                                    </li>
                                    <li>
                                        <input type="radio" class="form_radio" checked>
                                        여성
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

            
                </div>

                <div class="edit_user_info_item" style="margin-top: 10px;">
                    <div class="edit_user_info_item_title">
                        생년월일
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="char_input">
                                <input type="text" class="form_control" placeholder="생년월일" value="1996-07-10">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title">
                        프로필 이미지
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="profile_layer">
                                <div class="profile_btn_wrap">
                                    <button class="delete_btn">삭제</button>
                                    <button class="profile_btn">
                                        <img class="profile_img" src="sources/face.png">
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title">
                        한줄소개
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="char_input">
                                <input type="text" class="form_control" placeholder="한줄소개" value="">
                            </div>
                        </div>
                    </div>
                </div>

                <button class="update_btn_position update_btn">
                    회원정보수정
                </button>
            </form>
           
        </div>

    </div>
<footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>


    
</body>
</html>