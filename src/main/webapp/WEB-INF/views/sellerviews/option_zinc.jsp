<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

				<!-- 옵션 패브릭 시작 -->
				<div class="plus_layer" style="display:none;">
					<div class="container container-option container-option-topPadding bottomline" id="option_whole_wrap">
						<div class="row optionGroup1 option-wrap">
							<div class="col-2 status-name-600">옵션 (패브릭)</div>
							<div class="col-10 search-input option_container" id="option_input0">
						
								<div class="radio-productCode">
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<select class="form-select selectState" id="using_people" name="using_people"
											aria-label="Default select example">
											<option selected>사용계절</option>
											<option value="1">봄/가을(간절기)</option>
											<option value="2">여름</option>
											<option value="3">겨울</option>
											<option value="4">사계절</option>
										</select>
									</div>
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<select class="form-select selectState" id="rental" name="rental"
											aria-label="Default select example">
											<option selected>상품유형</option>
											<option value="y">해외직구보기</option>
											<option value="n">해외직구제외</option>
										</select>
									</div>
								</div>
								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">색상</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" name="colorcheck" value="white" id="colorcheck1" /> <label
												class="form-check-label" for="colorcheck1"> 화이트
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="black" id="colorcheck2" /> <label
												class="form-check-label" for="colorcheck2"> 블랙
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="brown" id="colorcheck3" /> <label
												class="form-check-label" for="colorcheck3"> 브라운
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="gold" id="colorcheck4" /> <label
												class="form-check-label" for="colorcheck4"> 골드
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="orange" id="colorcheck5" /> <label
												class="form-check-label" for="colorcheck5"> 오렌지
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="green" id="colorcheck6" /> <label
												class="form-check-label" for="colorcheck6"> 그린
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="navy" id="colorcheck7" /> <label
												class="form-check-label" for="colorcheck7"> 네이비
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="pink" id="colorcheck8" /> <label
												class="form-check-label" for="colorcheck8"> 핑크
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="transparent" id="colorcheck9" /> <label
												class="form-check-label" for="colorcheck9"> 투명
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="grey" id="colorcheck10" /> <label
												class="form-check-label" for="colorcheck10"> 그레이
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="beige" id="colorcheck11" /> <label
												class="form-check-label" for="colorcheck11"> 베이지
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="silver" id="colorcheck12" /> <label
												class="form-check-label" for="colorcheck12"> 실버
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="red" id="colorcheck13" /> <label
												class="form-check-label" for="colorcheck13"> 레드
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="yellow" id="colorcheck14" /> <label
												class="form-check-label" for="colorcheck14"> 옐로우
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="blue" id="colorcheck15" /> <label
												class="form-check-label" for="colorcheck15"> 블루
											</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="violet" id="colorcheck16" /> <label
												class="form-check-label" for="colorcheck16">
												바이올렛 </label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="multi" id="colorcheck17" /> <label
												class="form-check-label" for="colorcheck17"> 멀티
											</label>
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">패턴/프린트</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="rigth" id="woodcheck1" /> <label
												class="form-check-label" for="woodcheck1">무지</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="middle" id="woodcheck2" /> <label
												class="form-check-label" for="woodcheck2">살사 프린팅</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">체크</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">페르시안</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">에스닉</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">트로피컬</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">카모플라쥬</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">캐릭터</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">지브라</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">뱀피/스네이크</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">스트라이프</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">도트</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">헤링본</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">플라워</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">페이즐리</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">레터링</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">기하학</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">젖소</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="dark" id="woodcheck3" /> <label
												class="form-check-label" for="woodcheck3">호피/레오파트</label>
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">소재</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="wood" id="meterialcheck1" /> <label
												class="form-check-label" for="meterialcheck1">순면</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="nature" id="meterialcheck2" /> <label
												class="form-check-label" for="meterialcheck2">마/린넨</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="ceramic" id="meterialcheck3" /> <label
												class="form-check-label" for="meterialcheck3">쉬폰</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="glass" id="meterialcheck4" /> <label
												class="form-check-label" for="meterialcheck4">울/양모</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="plastic" id="meterialcheck5" /> <label
												class="form-check-label" for="meterialcheck5">레이스</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="concrete" id="meterialcheck6" /> <label
												class="form-check-label" for="meterialcheck6">폴리에스테르</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="leather" id="meterialcheck7" /> <label
												class="form-check-label" for="meterialcheck7">나일론</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="suede" id="meterialcheck8" /> <label
												class="form-check-label" for="meterialcheck8">플리스</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="velvet" id="meterialcheck9" /> <label
												class="form-check-label" for="meterialcheck9">텐셀</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="process wood" id="meterialcheck10" /> <label
												class="form-check-label" for="meterialcheck10">모피/피</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="artificial marble" id="meterialcheck11" /> <label
												class="form-check-label" for="meterialcheck11">인조가죽</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="volcanic stone" id="meterialcheck12" /> <label
												class="form-check-label" for="meterialcheck12">면혼방</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="steel" id="meterialcheck13" /> <label
												class="form-check-label" for="meterialcheck13">벨벳/벨루어</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="rattan" id="meterialcheck14" /> <label
												class="form-check-label" for="meterialcheck14">실크</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="natural leather" id="meterialcheck15" /> <label
												class="form-check-label" for="meterialcheck15">극세사</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="fabric" id="meterialcheck16" /> <label
												class="form-check-label" for="meterialcheck16">메쉬</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17">폴리프로필렌</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17">아크릴</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17">레이온/인견</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17">모달</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17">천연가죽</label>
										</div>
										<div class="form-check form-check-display">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="mash" id="meterialcheck17" /> <label
												class="form-check-label" for="meterialcheck17">실리콘</label>
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row">
									<div class="col-2 option_title" style="font-size: 13px">사이즈</div>
									<div class="col-10 color_options bottomline2">
										<div class="form-check form-check-display rightline">
											<input class="form-check-input form-check-input-margin"
												type="checkbox" value="" id="size-check" /> <label
												class="form-check-label" for="size-check"> 직접입력 </label>
										</div>
										<div class="size_input">
											<input class="form-control size-option-input" name="size" type="text"
												id="self-option-size" />
										</div>
									</div>
								</div>

								<div class="color_option mt-3 row mb-1">
									<div class="col-2 option_title" style="font-size: 13px">가격</div>
									<div class="col-10 color_options">
										<div class="price-layer">
											<input class="form-control price-option-input" type="text"
												id="price-per-option" />
											<p style="margin-left: 1rem">원</p>
										</div>
										<p style="margin-left: 1rem; color: #ff778e; font-size: 11px">*실제
											판매가를 적어주세요.(할인가 x)</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 옵션2 끝 -->

</body>
</html>