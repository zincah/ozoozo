<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/user_css/header/calculation.css">
    <link rel="stylesheet" href="resources/css/user_css/header/public.css">
    <title>Document</title>
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="layout">
    <!--헤더 -->

    <!--메인-->
    <main class="_2u6kP">
        <div class="_2VbEo">
            <header class="_2CEFF">주문/결제</header>
            <section class="clDqQ">
                <div class="checkout-container vtJfv">
                    <div class="_2jygH">배송지</div>
                    <div class="_3KNiw"></div>
                    <div><button type="button" class="_1RJj6">변경</button></div>
                </div>
                <div class="_254uw">
                    <div class="checkout-container _1DIXR">
                        <div class="_1F8DA">
                            <div class="_3O4wQ">황동준</div>
                            <div>
                                <div class="_4du--">기본배송지</div>
                            </div>
                        </div>
                        <div class="_2yz9T">경기 고양시 일산동구 숲속마을1로 116 (풍동) 숲속마을7단지아파트, 708동1302호</div>
                        <div class="_3mlQK">
                            <div class="_1HCV8">황동준</div>
                            <div class="_27nmi">010-4534-3412</div>
                        </div>
                        <div class="css-18azwi1 e84q8kd0">
                            <div class="_3Bt8k"><select class="_3ASDR _1qwAY _3K8Q8">
                                    <option value="0">배송시 요청사항을 선택해주세요</option>
                                    <option value="1">부재시 문앞에 놓아주세요</option>
                                    <option value="2">배송전에 미리 연락주세요</option>
                                    <option value="3">부재시 경비실에 맡겨 주세요</option>
                                    <option value="4">부재시 전화주시거나 문자 남겨 주세요</option>
                                    <option value="5">직접입력</option>
                                </select><svg width="1em" height="1em" viewBox="0 0 10 10" fill="currentColor"
                                    class="IgBXR">
                                    <path d="M0 3l5 5 5-5z"></path>
                                </svg></div>
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
                    <div class="checkout-container _d-EX"><label class="lQNTs css-1icqu5k e126uv4s3">
                            <div class="css-1bp0feq e126uv4s2">이름</div>
                            <div class="css-14o29br e126uv4s1"><input class="_3ASDR _1qwAY" name="name" maxlength="10"
                                    value="황동준"></div>
                        </label><label class="css-1icqu5k e126uv4s3">
                            <div class="css-1bp0feq e126uv4s2">이메일</div>
                            <div class="css-yby15j e126uv4s1">
                                <div class="_1pGtv">
                                    <div class="_1a7bp jTtMl">
                                        <div class="_2EQGD _1a7bp _1m42e"><input class="_3ASDR _1qwAY" type="email"
                                                placeholder="이메일" title="이메일 앞부분" maxlength="20" value="dong073"></div><span
                                            class="_1r4AF">@</span>
                                    </div>
                                    <div class="jTtMl _2tUrR">
                                        <div class="_1a7bp">
                                            <div class="_3Bt8k"><select class="_3ASDR _1qwAY _3K8Q8 _2RTFg">
                                                    <option value="" disabled="">선택해주세요</option>
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
                                                </select><svg width="1em" height="1em" viewBox="0 0 10 10"
                                                    fill="currentColor" class="IgBXR">
                                                    <path d="M0 3l5 5 5-5z"></path>
                                                </svg></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label><label class="css-1icqu5k e126uv4s3">
                            <div class="css-1bp0feq e126uv4s2">휴대전화</div>
                            <div class="css-14o29br e126uv4s1">
                                <div class="_2Z2K1">
                                    <div class="_2ixif">
                                        <div class="_3Bt8k"><select class="_3ASDR _1qwAY _3K8Q8" name="phone1">
                                                <option value="" disabled="">선택</option>
                                                <option value="0">010</option>
                                                <option value="1">011</option>
                                                <option value="2">016</option>
                                                <option value="3">017</option>
                                                <option value="4">018</option>
                                                <option value="5">019</option>
                                            </select><svg width="1em" height="1em" viewBox="0 0 10 10" fill="currentColor"
                                                class="IgBXR yPMDv">
                                                <path d="M0 3l5 5 5-5z"></path>
                                            </svg></div>
                                    </div>
                                    <div class="UYZ4Z"><input class="_3ASDR _1qwAY" type="tel" placeholder="입력해주세요" size="1"
                                            maxlength="9" value="4534-3412"></div>
                                </div>
                            </div>
                        </label></div>
                </div>
            </section>
            <section class="clDqQ">
                <div class="checkout-container vtJfv">
                    <div class="_2jygH">주문상품</div>
                    <div class="_3KNiw"></div>
                </div>
                <div class="_254uw">
                    <section class="checkout-container _3aT7b">
                        <div class="css-wclqjc egkpco10">
                            <div class="css-114dac7 e1qx8gyn5">
                                <div class="css-s5xdrg e1qx8gyn4">
                                    <div class="css-1d4irc7 e1qx8gyn3">주식회사 유한상사</div>
                                    <div class="css-o69atw e1qx8gyn2"><span class="css-1ohhab7 e1qx8gyn1">배송비</span>0원</div>
                                </div>
                            </div>
                            <div>
                                <div class="css-1deqzke e1l2pwkp8">
                                    <picture>
                                        <source type="image/webp"
                                            src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=72&amp;h=72&amp;c=c&amp;webp=1"
                                            srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=256&amp;h=256&amp;c=c&amp;webp=1 3x">
                                        <img class="css-15hitpz e1l2pwkp7"
                                            src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=72&amp;h=72&amp;c=c"
                                            srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=144&amp;h=144&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161777914306431945.jpg?w=256&amp;h=256&amp;c=c 3x">
                                    </picture>
                                    <div class="css-17fh4sh e1l2pwkp6">
                                        <div class="css-tobrwt e1l2pwkp5">[25%쿠폰]3겹 순수소프트 롤화장지 (27Mx30롤)x2팩</div>
                                        <ul class="css-rvb3re e1l2pwkp4">
                                            <li>3겹 순수소프트 롤화장지 (27Mx30롤)x2백</li>
                                        </ul>
                                        <div class="css-18cz9pp e1l2pwkp3"><span
                                                class="css-1r6ecne e1l2pwkp2">38,400원</span>
                                            <div class="css-1tcfgij e1l2pwkp1"></div><span
                                                class="css-1fgdtzk e1l2pwkp0">1개</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                        <div class="css-q3e0y4 e1tvvqht2"><span>쿠폰 코드가 있으신가요?</span>
                            <div class="css-1wmw4cz e1tvvqht1"><svg width="16" height="17" viewBox="0 0 16 17" fill="none"
                                    preserveAspectRatio="xMidYMid meet">
                                    <path d="M3 5.16663L8 9.99908L13 5.16663L14 6.08373L8 11.8333L2 6.08373L3 5.16663Z"
                                        fill="#424242"></path>
                                </svg></div>
                        </div>
                        <div class="" style="display: none; height: 0px; overflow: hidden;">
                            <div class="css-drntii e1tvvqht0">
                                <div class="checkout-container">
                                    <div class="css-1khn195 eg30oap5">
                                        <div class="css-1rz2yl2 eg30oap4"><input class="_3ASDR _1qwAY" value="">
                                            <div class="css-1pkqci5 eg30oap3"><button
                                                    class="_1eWD8 _3SroY _3VwZT">확인</button></div>
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
                        <div class="Ux4aQ"><input class="_3ASDR _1qwAY _3kWHq _2FPtt" name="mileageCost" type="tel"
                                pattern="\d*" disabled="" value="0"><button class="_1eWD8 _2wuTD _3VwZT _3VzHU _2FPtt"
                                disabled="" type="button">전액사용</button></div>
                        <div class="_2xq8i">사용 가능 포인트<span class="_1xjJk">0 P</span></div>
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
                        <div class="css-2pv01r e149t0mw4"><button type="button" class="css-1jzgr0t e149t0mw3">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                    <img alt="카드 아이콘" class="css-1i2eqgi e149t0mw2"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_card.png?w=360&amp;h=360&amp;c=c 3x">
                                </picture>
                                <div class="css-10z9090 e149t0mw1">카드</div>
                            </button><button type="button" class="css-8sa7n1 e149t0mw3">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=256&amp;h=256&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=360&amp;h=360&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=480&amp;h=480&amp;c=c&amp;webp=1 3x">
                                    <img alt="무통장입금 아이콘" class="css-1i2eqgi e149t0mw2"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=144&amp;h=144&amp;c=c"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=256&amp;h=256&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=360&amp;h=360&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_vbank.png?w=480&amp;h=480&amp;c=c 3x">
                                </picture>
                                <div class="css-9n3kbk e149t0mw1">무통장입금</div>
                            </button><button type="button" class="css-1jzgr0t e149t0mw3">
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
                            </button><button type="button" class="css-1jzgr0t e149t0mw3">
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
                            </button><button type="button" class="css-1jzgr0t e149t0mw3">
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
                            </button><button type="button" class="css-1jzgr0t e149t0mw3">
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
                            </button><button type="button" class="css-1jzgr0t e149t0mw3">
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
                            </button><button type="button" class="css-1jzgr0t e149t0mw3">
                                <picture>
                                    <source type="image/webp"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                    <img alt="핸드폰 아이콘" class="css-1i2eqgi e149t0mw2"
                                        src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=144&amp;h=144&amp;c=c"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_phone.png?w=360&amp;h=360&amp;c=c 3x">
                                </picture>
                                <div class="css-10z9090 e149t0mw1">핸드폰</div>
                            </button></div>
                        <div class="" style="overflow: hidden;"></div>
                    </div>
                </div>
            </section>
        </div>
        <section class="_15YWr">
            <div class="sticky-container _3L1d-" style="position: sticky; top: 81px; transition: top 0.1s ease 0s;">
                <div class="sticky-child" style="position: relative;">
                    <div class="_1_Tld">
                        <div class="_2lpRj">
                            <div class="_1tHaf">
                                <div class="_3TNPF">결제금액</div>
                                <div class="_2JEof">
                                    <div class="_34k6S">총 상품 금액</div>
                                    <div class="_25zAE ySGW6">38,400원</div>
                                </div>
                                <div class="_2JEof">
                                    <div class="_34k6S">배송비</div>
                                    <div class="_25zAE">0원</div>
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
                                    <div class="_2YW1B"><span class="_1vQx0">38,400</span>&nbsp;원<div class="_1-Gyq"><span
                                                class="csPTb">116 P</span>&nbsp;적립 예정</div>
                                    </div>
                                </div>
                            </div>
                            <div class="css-1in19nv eir4d5m7"><label for="checkout-agree" class="css-17jncej eir4d5m6">
                                    <div class="_3zqA8 css-2szu7b eir4d5m5"><input type="checkbox" class="_3UImz"
                                            id="checkout-agree" name="isAgree" value=""><span class="_2mDYR"><svg
                                                width="1em" height="1em" viewBox="0 0 16 16" class="_2UftR">
                                                <path fill="currentColor"
                                                    d="M6.185 10.247l7.079-7.297 1.435 1.393-8.443 8.703L1.3 8.432l1.363-1.464z">
                                                </path>
                                            </svg></span></div>
                                    <div>아래 내용에 모두 동의합니다. (필수)</div>
                                </label>
                                <div class="" style="overflow: hidden;"></div>
                                <div class="css-127as0t eir4d5m3"><button type="button" class="css-wgo8z eir4d5m2">개인정보 수집
                                        이용 및 제 3자 제공 동의<svg fill="none" viewBox="0 0 16 10"
                                            preserveAspectRatio="xMidYMid meet" class="css-cr6fx6 eir4d5m1">
                                            <path d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                        </svg></button>
                                    <div class="policy-list" style="overflow: hidden;"></div>
                                    <div class="css-fmrpws eir4d5m0">본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.</div>
                                </div>
                            </div>
                        </div><button class="_1eWD8 _3SroY _27do9 y-RI2" type="button">38,400원 결제하기</button>
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

    
</body>
</html>