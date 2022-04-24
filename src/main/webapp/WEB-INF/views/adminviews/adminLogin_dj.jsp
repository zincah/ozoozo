<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/admincss/adminLogin.css">
<link rel="stylesheet" href="resources/css/admincss/fonts.css">
<!-- 
    <link rel="stylesheet" href="public.css">
     -->
<title>Document</title>
</head>
<body>
	<div class="layout">
		<!--헤더 -->

		<!--메인-->
		<main class="css-1ifuc5y-Main ebon26m4">
			<div class="css-1ky0uw5-FormWrap ebon26m3">
				<a aria-label="오늘의집" class="css-1a5fr2v-LogoLink ebon26m2" href="#">
				<img src="resources/assets/img/ozohouse-logo.svg" alt="오조의집" class="css-1fmg6kf-OhouseLogo ebon26m1">&nbsp;관리자센터</a> 
				<a href="" class="mtext"></a>

				<!-- admin,seller login -->
				<form class="css-18fd3as-FormContent e7sx0344" action="login.admin" method="post">
					<div class="css-14zpkc9-InputFieldWrap e7sx0343">
						<input type="text" class="_3ASDR _2wjXG css-ov0qvl-FormInputField e7sx0342" value="" name="admin_code" position="top" placeholder="사원코드">
					</div>
					<div class="css-14zpkc9-InputFieldWrap e7sx0343">
						<input type="password" class="_3ASDR _2wjXG css-1uzhxvg-FormInputField e7sx0342" value="" name="admin_password" position="bottom" placeholder="비밀번호">
					</div>
					<button class="_1eWD8 _3SroY _27do9 css-15i71tl-SubmitButton e7sx0340" type="submit">
						로그인
					</button>
					
					<section class="css-6ofxvx-Actions e5voaya1">
						<a class="css-a6x0yj-ActionLink e5voaya0" href="/users/password/new">비밀번호 재설정</a>
						<a class="css-a6x0yj-ActionLink e5voaya0" href="/partner/applications/new">판매자 신청</a>
					</section>
				</form>
			</div>
			
			<footer class="css-1a7naln-Footer ebon26m0">
				© &nbsp;<a href="https://www.bucketplace.co.kr/" target="_blank"
					rel="noopener noreferrer">bucketplace, Co., Ltd.</a>. All Rights
				Reserved
			</footer>
		</main>
		<!--푸터-->
	</div>


</body>
</html>