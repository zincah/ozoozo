<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/user_css/header/memberout.css?var=1">
</head>
<script>

function statuschange(){
	
	
	 if( $('#_3UImz').is(':checked') ){
	
		 $.ajax({
	  		url: "stopit.com",
	  		type:'post',
	  		contentType : 'application/json; charset=UTF-8',
	  		dataType : 'text',
	  		success : function(resp){
	  			
	  			if(resp == 'success'){
	  				alert("탈퇴 신청이 완료되었습니다. 몇일 내로 탈퇴가 완료됩니다.");
	  				document.location = '/house/logout.com'
	  			}
	  		},
	  		error:function(request, status, error){
	  			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	  		}
	  		
	  		
		}); 
	 
	}else{
		alert("회원탈퇴 신청내용을 확인하여 체크해주세요.")
		
	} 
  		
  	}
	


</script>
<body>
  <!-- 헤더 -->
  <!-- 바디  -->

    
        <div class="css-gz4wgi e187gapo9">
            <h1 class="css-114qsva e187gapo8">회원탈퇴 신청</h1>
            <div class="css-1cltfo6 evfva9a4">
                <div class="css-1nnxwro evfva9a3">회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해주세요.</div>
                <div class="css-0 evfva9a2">
                    <div class="css-15t02j8 e187gapo7">
                        <h3>회원탈퇴 시 처리내용</h3>
                        <ul>
                            <li>오조의집 포인트·쿠폰은 소멸되며 환불되지 않습니다.</li>
                            <li>오조의집 구매 정보가 삭제됩니다.</li>
                            <li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는
                                분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.</li>
                        </ul>
                        <h3>회원탈퇴 시 게시물 관리</h3>
                        <p>회원탈퇴 후 오늘의집 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로
                            불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</p>
                        <h3>회원탈퇴 후 재가입 규정</h3>
                        <p>탈퇴 회원이 재가입하더라도 기존의 오늘의집 포인트는 이미 소멸되었기 때문에 양도되지 않습니다.</p>
                    </div>
                    <div class="css-xb73h0 e187gapo5">
                        <div><label class="_3xqzr _4VN_z">
                                <div class="_3zqA8"><input id="_3UImz" type="checkbox" class="_3UImz" name="confirmed"
                                        value=""><span class="_2mDYR"><svg width="1em" height="1em" viewBox="0 0 16 16"
                                            class="_2UftR">
                                            <path fill="currentColor"
                                                d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
                                            </path>
                                        </svg></span></div><span class="_1aN3J">위 내용을 모두 확인하였습니다.&nbsp;<span
                                        class="css-alijph e187gapo3">필수</span></span>
                            </label></div>
                        <div>고객센터 <b>1670-0876</b></div>
                    </div>
                </div>
            </div>
            
           
            <div class="css-zjik7 e187gapo1">
            <button class="_3Z6oR _3s8ZZ _2tsrJ css-1s8op8d e187gapo0"
                    type="submit" onclick="statuschange()">탈퇴신청</button>
                    <button class="_3Z6oR _3AsCW _2tsrJ css-1s8op8d e187gapo0"
                    type="button">취소하기</button></div>
        </div>
    
  <!-- 푸터  -->

</body>
</html>