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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href="resources/css/user_css/zinc/ozoedit.css?var=1212" rel="stylesheet" />
    <link href="resources/css/user_css/zinc/ozomypageheader.css" rel="stylesheet"/>

</head>
<script>
$(document).ready(function(){
	
	
	
	/* 파일 업로드 */
	const realUpload = document.querySelector('.real-upload');
 	const upload = document.querySelector('.profile_btn');

 	upload.addEventListener('click', () => realUpload.click());

 	
 	
 	
 		
 		if(${info.user_img ne null} ){
 	 		
 	 		$("#image_show").css({display:"flex"})
 	 		$("#image_show").html('<img class="upload_img" src="${info.user_img}" style="visibility: visible; object-fit: contain;">')
 	 	}else{
 	 		
 	 	}
 		

 });

 
	
	
	function changeValue(input) {
			
			console.log(1234567890);
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
	  var container = document.getElementById('image_show');
	  container.appendChild(newImage);
	  $('#image_show').css({"display":"flex"});
	  
	  return toto =1; 
	}
	
	function delPhoto(delit){
  	  var parentId = delit.parentNode.id;
  	  var checkSu = parentId.substr(-1);
  	  
  	  var container = document.getElementById('image_show');
  	  if(container.hasChildNodes()){
  		  container.removeChild(container.firstChild);
  		  $('#image_show').hide();
  		  $("#image_show").text("")
  	  }
  	  
  	  
    }
	

	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName(".radioValue");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
	
	var toto;
	function areyouchange(roro){
		console.log("ome")
		return toto = 1;
	}
function updatebtn(btn){
	 //form data생성
    var formData = new FormData();
    var radioVal = $("input:radio[name='radioValue']:checked").val();
    //데이터담기
    var data = {   
				"user_nickname": $(".nickname").val(),
				"user_birth": $(".user_birth").val(),
				"comment": $(".user_comment").val(),
				"gender": radioVal
                } 
   console.log(data)
    console.log(toto)
   if(toto==1){
     // input class 값 
     var fileInput = $('.real-upload');
    // fileInput 개수를 구한다.
    for (var i = 0; i < fileInput.length; i++) {
    	if (fileInput[i].files.length > 0) {
    		for (var j = 0; j < fileInput[i].files.length; j++) {
    			console.log(" fileInput[i].files[j] :::"+ fileInput[i].files[j]); 
    			
    			 // formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.   
    			 formData.append('myphoto', $('.real-upload')[i].files[j]);
    		}
    	}
    } 
   }
  // 'key'라는 이름으로 위에서 담은 data를 formData에 append한다. type은 json   
   formData.append('key', new Blob([ JSON.stringify(data) ], {type : "application/json"})); 
 
  // ajax 처리 부분  
 //- contentType : false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
 //- processData : false로 선언 시 formData를 string으로 변환하지 않음 
  
 
    $.ajax({  
       url:'mypageupload.com',
       method:'POST',
       data: formData,
       contentType: false,              // * 중요 *
       processData: false, 				// * 중요 *					
       enctype : 'multipart/form-data', // * 중요 *
       success: function(data) { 
    	   
    	   alert("정보가 변경되었습니다.");
       }
  

 })  
}

</script>
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
                <a href="/house/out.com"class="edit_user_info_header_secession">탈퇴하기</a>
            </div>
		
             <!-- 수정 부분 -->
          
                
                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title setmargin">
                        이메일
                        <div class="edit_user_info_item_title_sub">
                            *필수항목
                        </div>
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="email_input">
                                <input type="text" class="h_email form_control" placeholder="이메일" value="${info.user_email}" disabled>
                                <span class="input_seperator">@</span>
                                <select class="t_eamail form_control" disabled>
                                    <option value="" disabled="">선택해주세요</option>
                                    <option value="naver.com" ${mandu.user_email eq 'naver.com' ? 'selected="selected"' : '' }>naver.com</option>
                                    <option value="hanmail.net" ${mandu.user_email eq 'hanmail.net' ? 'selected="selected"' : '' }>hanmail.net</option>
                                    <option value="daum.net" ${mandu.user_email eq 'daum.net' ? 'selected="selected"' : '' }>daum.net</option>
                                    <option value="gmail.com" ${mandu.user_email eq 'gmail.com' ? 'selected="selected"' : '' }>gmail.com</option>
                                    <option value="nate.com" ${mandu.user_email eq 'nate.com' ? 'selected="selected"' : '' }>nate.com</option>
                                    <option value="hotmail.com" ${mandu.user_email eq 'hotmail.com' ? 'selected="selected"' : '' }>hotmail.com</option>
                                    <option value="outlook.com" ${mandu.user_email eq 'outlook.com' ? 'selected="selected"' : '' }>outlook.com</option>
                                    <option value="icloud.com" ${mandu.user_email eq 'icloud.com' ? 'selected="selected"' : '' }>icloud.com</option>
                                    <option value="_manual">직접입력</option>
                                </select>
                            </div>
                            <div class="email_input_warn">이메일을 변경하시려면 운영진한테 이메일을 보내주세요</div>
                        </div>
                    </div>

                    
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title setmargin">
                        별명
                        <div class="edit_user_info_item_title_sub">
                            *필수항목
                        </div>
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="char_input">
                                <input type="text" class="nickname form_control" placeholder="별명" value="${info.nickname}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title setmargin">
                        성별
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="gender_input">
                                <ul class="radio_group_input">
                                    <li>
                                        <input type="radio" class="form_radio" name="radioValue" onclick="checkOnlyOne(this)" value="true" checked>
                                        남성
                                    </li>
                                    <li>
                                        <input type="radio" class="form_radio" name="radioValue" onclick="checkOnlyOne(this)" value="false" >
                                        여성
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

            
                </div>

                <div class="edit_user_info_item" style="margin-top: 10px;">
                    <div class="edit_user_info_item_title setmargin">
                        생년월일
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="char_input">
                                <input type="text" class="user_birth form_control" placeholder="생년월일" value="${info.user_birth}" >
                            </div>
                        </div>
                    </div>
                </div>

                <div class="edit_user_info_item">
                    <div class="edit_user_info_item_title setmargin">
                        프로필 이미지
                    </div>

                    <div class="edit_user_info_item_body">
                        <div class="edit_user_info_item_body_wrap">
                            <div class="profile_layer">
                                <div class="profile_btn_wrap">
                                    
                                    <input type="file" class="real-upload" onchange="changeValue(this)"  accept="image/*" style=display:none   multiple  >
                                    <button class="profile_btn">
                                     <img class="profile_img" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/avatar.webp">
                                     
                                     </button> 
                                     
                                    
                                    
                                    <div id="image_show" class="image_show" >
                                    
                                   
                                   
                                    </div>
                                    <button class="delete_btn" onclick="delPhoto(this)" >삭제</button>
                                    
                                    
                                    
                                    
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
                                <input type="text" class="user_comment form_control" placeholder="한줄소개" value="${info.comment}">
                            </div>
                        </div>
                    </div>
                </div>

                <button class="update_btn_position update_btn"  onclick="updatebtn(this)">
                    회원정보수정
                </button>
         
           
        </div>

    </div>
   
<footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>


    
</body>
</html>