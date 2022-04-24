<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,viewport-fit=cover">
    <title>예쁜템들 모여사는 오조의집</title>

    <link rel="stylesheet" href="resources/css/user_css/young/my_shopping.css">
    <link rel="stylesheet" href="resources/css/user_css/young/footer.css">
    <link rel="stylesheet" href="resources/css/user_css/young/my_shopping_status.css">

    <style data-emotion="css 1yajzey" data-s="">
        .css-1yajzey {
            margin-top: 50px;
            box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.15);
            padding: 30px;
        }

        @media (max-width: 767px) {
            .css-1yajzey {
                padding: 30px 16px;
            }
        }
    </style>



<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage">
        <div class="mypage-nav">
            <nav class="page-navigation mypage-nav-owner">
                <ul style="transform: translateX(0px); ">
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

            <nav class="page-navigation mypage-nav-content">
                <ul style="transform: translateX(0px); margin: 0px">
                    <li class="mypage-nav-item">
                        <a class="active" href="#" target="self">주문배송내역 조회</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#" target="self">상품문의내역</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#" target="self">포인트</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#" target="self">공지사항</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#" target="self">고객센터</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="layout">
            <div class="order-list container">
                <div class="order-list__menu"><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">입금대기</div>
                            <div class="order-list__menu__list__value">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">결제완료</div>
                            <div class="order-list__menu__list__value">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">배송준비</div>
                            <div class="order-list__menu__list__value">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">배송중</div>
                            <div class="order-list__menu__list__value">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">배송완료</div>
                            <div class="order-list__menu__list__value">0</div>
                        </div>
                    </a><a class="order-list__menu__list" href="#">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title order-list__menu__list__title--focus">구매확정</div>
                            <div class="order-list__menu__list__value">5</div>
                        </div>
                    </a></div>
                <div>
                    <div>
                        <div class="css-1yajzey ehoya3o0">
                            <div class="filter css-rzn8ck">
                                <div class="filter-bar">
                                    <div class="filter-bar__control-list">
                                        <ul class="filter-bar__control-list__left">
                                            <li
                                                class="filter-bar__control-list__item filter-bar__control-list__item--icon">
                                                <button class="filter-bar__control-list__icon" type="button"
                                                    title="필터 전체"><svg class="icon" width="24" height="24"
                                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                                        <path fill="#BDBDBD"
                                                            d="M18.284 4H5.716a.7.7 0 0 0-.61.362.668.668 0 0 0 0 .724l3.963 6.978c.353.632.97 1.348.971 2.076v6.181c.002.24-.054.388.149.558.203.17.343.118.444.095l3.29-1.257c.283-.095.321-.369.317-.676v-4.9c0-.73.338-1.445.69-2.077l3.963-6.978a.668.668 0 0 0 0-.724.7.7 0 0 0-.61-.362z">
                                                        </path>
                                                    </svg></button>
                                            </li>
                                            <li class="filter-bar__control-list__item">
                                                <div class="drop-down panel-drop-down filter-bar-control"><button
                                                        class="button button--color-blue-light-very-more button--size-50 button--shape-4 filter-bar-control__button active">기간<svg
                                                            class="icon" width="12" height="12" viewBox="0 0 12 12"
                                                            fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                            <path
                                                                d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z">
                                                            </path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="filter-bar__control-list__item">
                                                <div class="drop-down panel-drop-down filter-bar-control"><button
                                                        class="button button--color-blue-light-very-more button--size-50 button--shape-4 filter-bar-control__button active">주문상태<svg
                                                            class="icon" width="12" height="12" viewBox="0 0 12 12"
                                                            fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                            <path
                                                                d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z">
                                                            </path>
                                                        </svg></button></div>
                                            </li>
                                        </ul>
                                    </div>
                                    <ul class="filter-bar__tag-list">
                                        <li class="filter-bar__tag-list__item"><button
                                                class="button button--color-blue button--size-50 button--shape-4 filter-bar__tag"
                                                type="button">구매확정<svg class="icon" width="12" height="12"
                                                    viewBox="0 0 12 12" fill="currentColor"
                                                    preserveAspectRatio="xMidYMid meet">
                                                    <path
                                                        d="M6 4.94L3.879 2.817l-1.061 1.06L4.939 6 2.818 8.121l1.06 1.061L6 7.061l2.121 2.121 1.061-1.06L7.061 6l2.121-2.121-1.06-1.061L6 4.939zM6 12A6 6 0 1 1 6 0a6 6 0 0 1 0 12z">
                                                    </path>
                                                </svg></button></li>
                                        <li class="filter-bar__tag-list__item"><button
                                                class="button button--color-blue button--size-50 button--shape-4 filter-bar__tag"
                                                type="button">6개월 전<svg class="icon" width="12" height="12"
                                                    viewBox="0 0 12 12" fill="currentColor"
                                                    preserveAspectRatio="xMidYMid meet">
                                                    <path
                                                        d="M6 4.94L3.879 2.817l-1.061 1.06L4.939 6 2.818 8.121l1.06 1.061L6 7.061l2.121 2.121 1.061-1.06L7.061 6l2.121-2.121-1.06-1.061L6 4.939zM6 12A6 6 0 1 1 6 0a6 6 0 0 1 0 12z">
                                                    </path>
                                                </svg></button></li>
                                        <li class="filter-bar__tag-list__item"><button
                                                class="filter-bar__tag-list__clear" type="button">초기화</button></li>
                                    </ul>
                                </div>
                            </div>
                            <section class="css-idjloq e1yy3fi630">
                                <div class="css-sw3pq5 e1yy3fi629">
                                    <div class="css-145bbay e1yy3fi628"><span class="divider">79471063</span>2021.12.07
                                    </div><a class="css-1buj0y e1yy3fi627"
                                        href="http://127.0.0.1:3000/orders.html">상세보기</a>
                                </div>
                                <div>
                                    <div class="css-1ra10s7 e1yy3fi626">
                                        <h3 class="css-7c5cag e1yy3fi624">구매확정<span class=""> ·</span><span> 12/9
                                                (목)</span><span class="status"> 도착완료</span></h3>
                                        <div class="css-gw5lra e1yy3fi625">
                                            <div class="css-5y01s9 e1yy3fi623">
                                                <picture>
                                                    <source type="image/webp"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                                    <img class="css-1nuap3l e1yy3fi622"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=144&amp;h=144&amp;c=c"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/1548313879650_ZHhOpk1Ch.jpg?w=360&amp;h=360&amp;c=c 3x">
                                                </picture>
                                                <div class="css-1khw1py e1yy3fi621">
                                                    <div class="css-1jgx3ye e1yy3fi620"><a
                                                            class="css-1hnr1vy e1yy3fi619"
                                                            href="/brands/home?query=%EB%AA%A8%EB%82%98%EC%BD%94%EC%98%AC%EB%A6%AC%EB%B8%8C">모나코올리브</a><a
                                                            class="css-g5ex4y e1yy3fi618"
                                                            href="http://127.0.0.1:3000/orders.html">[12%쿠폰] 무타공 초간편
                                                            1분설치 스테인레스 수건걸이</a>
                                                    </div>
                                                    <div class="css-1jgx3ye e1yy3fi620">
                                                        <div class="css-137xxwq e1yy3fi617">1분설치 수건걸이</div>
                                                        <div class="css-13mg6pb e1yy3fi616"><span
                                                                class="divider">4,900원</span>1개</div>
                                                        <div class="css-5b05l4 e1yy3fi615"><span>일반택배</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="css-1yl0oty e1yy3fi614"><button onclick="shippingInfo()"
                                                    class="css-klr9vj">배송추적</button>
                                                <script>
                                                    function shippingInfo() {
                                                        window.open("http://127.0.0.1:3000/shipping.html", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=0,left=0,width=350,height=599");
                                                    }

                                                </script>
                                            </div>
                                        </div>
                                        <div class="css-lq5sl4 e1yy3fi613">
                                            <div class="css-13iurt9 e1yy3fi612">무료배송</div>
                                            <div class="css-i1jsxi e1yy3fi611">모나코올리브<a href="tel:070-4407-9501"
                                                    class="css-1hm59ir e1yy3fi610">070-4407-9501</a></div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="css-idjloq e1yy3fi630">
                                <div class="css-sw3pq5 e1yy3fi629">
                                    <div class="css-145bbay e1yy3fi628"><span class="divider">77300489</span>2021.11.22
                                    </div><a class="css-1buj0y e1yy3fi627" href="/orders/77300489">상세보기</a>
                                </div>
                                <div>
                                    <div class="css-1ra10s7 e1yy3fi626">
                                        <h3 class="css-7c5cag e1yy3fi624">구매확정<span class=""> ·</span><span> 11/24
                                                (수)</span><span class="status"> 도착완료</span></h3>
                                        <div class="css-gw5lra e1yy3fi625">
                                            <div class="css-5y01s9 e1yy3fi623">
                                                <picture>
                                                    <source type="image/webp"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                                    <img class="css-1nuap3l e1yy3fi622"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=144&amp;h=144&amp;c=c"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=360&amp;h=360&amp;c=c 3x">
                                                </picture>
                                                <div class="css-1khw1py e1yy3fi621">
                                                    <div class="css-1jgx3ye e1yy3fi620"><a
                                                            class="css-1hnr1vy e1yy3fi619"
                                                            href="/brands/home?query=%EB%B2%A0%EC%9D%B4%EC%A7%81%ED%86%A4">베이직톤</a><a
                                                            class="css-g5ex4y e1yy3fi618" href="/orders/77300489">[오늘의딜]
                                                            [5%쿠폰] 노스베어 프리미엄 10mm 라셀 극세사차렵이불 SS/Q/K/LK</a></div>
                                                    <div class="css-1jgx3ye e1yy3fi620">
                                                        <div class="css-137xxwq e1yy3fi617">컬러: 10mm라셀극세사(소프트 베이지) /
                                                            사이즈: 슈퍼싱글(SS) 이불단품</div>
                                                        <div class="css-13mg6pb e1yy3fi616"><span
                                                                class="divider">59,800원</span>1개</div>
                                                        <div class="css-5b05l4 e1yy3fi615"><span>일반택배</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="css-1yl0oty e1yy3fi614"><button class="css-klr9vj">배송추적</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="css-1ra10s7 e1yy3fi626">
                                        <h3 class="css-7c5cag e1yy3fi624">구매확정<span class=""> ·</span><span> 11/24
                                                (수)</span><span class="status"> 도착완료</span></h3>
                                        <div class="css-gw5lra e1yy3fi625">
                                            <div class="css-5y01s9 e1yy3fi623">
                                                <picture>
                                                    <source type="image/webp"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                                    <img class="css-1nuap3l e1yy3fi622"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=144&amp;h=144&amp;c=c"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160405524122572244.jpg?w=360&amp;h=360&amp;c=c 3x">
                                                </picture>
                                                <div class="css-1khw1py e1yy3fi621">
                                                    <div class="css-1jgx3ye e1yy3fi620"><a
                                                            class="css-1hnr1vy e1yy3fi619"
                                                            href="/brands/home?query=%EB%B2%A0%EC%9D%B4%EC%A7%81%ED%86%A4">베이직톤</a><a
                                                            class="css-g5ex4y e1yy3fi618" href="/orders/77300489">[오늘의딜]
                                                            [5%쿠폰] 노스베어 프리미엄 10mm 라셀 극세사차렵이불 SS/Q/K/LK</a></div>
                                                    <div class="css-1jgx3ye e1yy3fi620">
                                                        <div class="css-137xxwq e1yy3fi617">추가상품 - SS침대패드(소프트 베이지)</div>
                                                        <div class="css-13mg6pb e1yy3fi616"><span
                                                                class="divider">34,800원</span>1개</div>
                                                        <div class="css-5b05l4 e1yy3fi615"><span>일반택배</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="css-1yl0oty e1yy3fi614"><button class="css-klr9vj">배송추적</button>
                                            </div>
                                        </div>
                                        <div class="css-lq5sl4 e1yy3fi613">
                                            <div class="css-13iurt9 e1yy3fi612">무료배송</div>
                                            <div class="css-i1jsxi e1yy3fi611">구르미애<a href="tel:1577-1886"
                                                    class="css-1hm59ir e1yy3fi610">1577-1886</a></div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="css-idjloq e1yy3fi630">
                                <div class="css-sw3pq5 e1yy3fi629">
                                    <div class="css-145bbay e1yy3fi628"><span class="divider">77299357</span>2021.11.22
                                    </div><a class="css-1buj0y e1yy3fi627" href="/orders/77299357">상세보기</a>
                                </div>
                                <div>
                                    <div class="css-1ra10s7 e1yy3fi626">
                                        <h3 class="css-7c5cag e1yy3fi624">구매확정<span class=""> ·</span><span> 11/23
                                                (화)</span><span class="status"> 도착완료</span></h3>
                                        <div class="css-gw5lra e1yy3fi625">
                                            <div class="css-5y01s9 e1yy3fi623">
                                                <picture>
                                                    <source type="image/webp"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                                    <img class="css-1nuap3l e1yy3fi622"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=144&amp;h=144&amp;c=c"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161094644800159461.jpg?w=360&amp;h=360&amp;c=c 3x">
                                                </picture>
                                                <div class="css-1khw1py e1yy3fi621">
                                                    <div class="css-1jgx3ye e1yy3fi620"><a
                                                            class="css-1hnr1vy e1yy3fi619"
                                                            href="/brands/home?query=%EC%A0%95%EB%A6%AC%EC%83%9D%ED%99%9C">정리생활</a><a
                                                            class="css-g5ex4y e1yy3fi618" href="/orders/77299357">마르케
                                                            스웨이드 호텔 티슈케이스</a></div>
                                                    <div class="css-1jgx3ye e1yy3fi620">
                                                        <div class="css-137xxwq e1yy3fi617">그레이</div>
                                                        <div class="css-13mg6pb e1yy3fi616"><span
                                                                class="divider">9,900원</span>1개</div>
                                                        <div class="css-5b05l4 e1yy3fi615"><span>일반택배</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="css-1yl0oty e1yy3fi614"><button class="css-klr9vj">배송추적</button>
                                            </div>
                                        </div>
                                        <div class="css-lq5sl4 e1yy3fi613">
                                            <div class="css-13iurt9 e1yy3fi612">선결제배송비 3,000원</div>
                                            <div class="css-i1jsxi e1yy3fi611">정리생활<a href="tel:031-322-9338"
                                                    class="css-1hm59ir e1yy3fi610">031-322-9338</a></div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="css-idjloq e1yy3fi630">
                                <div class="css-sw3pq5 e1yy3fi629">
                                    <div class="css-145bbay e1yy3fi628"><span class="divider">74322262</span>2021.10.26
                                    </div><a class="css-1buj0y e1yy3fi627" href="/orders/74322262">상세보기</a>
                                </div>
                                <div>
                                    <div class="css-1ra10s7 e1yy3fi626">
                                        <h3 class="css-7c5cag e1yy3fi624">구매확정<span class=""> ·</span><span> 10/29
                                                (금)</span><span class="status"> 도착완료</span></h3>
                                        <div class="css-gw5lra e1yy3fi625">
                                            <div class="css-5y01s9 e1yy3fi623">
                                                <picture>
                                                    <source type="image/webp"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=144&amp;h=144&amp;c=c&amp;webp=1"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=360&amp;h=360&amp;c=c&amp;webp=1 3x">
                                                    <img class="css-1nuap3l e1yy3fi622"
                                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=144&amp;h=144&amp;c=c"
                                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/161647061896987794.jpg?w=360&amp;h=360&amp;c=c 3x">
                                                </picture>
                                                <div class="css-1khw1py e1yy3fi621">
                                                    <div class="css-1jgx3ye e1yy3fi620"><a
                                                            class="css-1hnr1vy e1yy3fi619"
                                                            href="/brands/home?query=%EC%9D%B4%EC%9D%B4%EA%B3%B5%EB%B8%8C%EC%9D%B4%EC%83%B5">이이공브이샵</a><a
                                                            class="css-g5ex4y e1yy3fi618" href="/orders/74322262">캡슐
                                                            감성라운드 휴지케이스 3colors</a></div>
                                                    <div class="css-1jgx3ye e1yy3fi620">
                                                        <div class="css-137xxwq e1yy3fi617">화이트</div>
                                                        <div class="css-13mg6pb e1yy3fi616"><span
                                                                class="divider">5,000원</span>1개</div>
                                                        <div class="css-5b05l4 e1yy3fi615"><span>일반택배</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="css-1yl0oty e1yy3fi614"><button class="css-klr9vj">배송추적</button>
                                            </div>
                                        </div>
                                        <div class="css-lq5sl4 e1yy3fi613">
                                            <div class="css-13iurt9 e1yy3fi612">선결제배송비 3,000원</div>
                                            <div class="css-i1jsxi e1yy3fi611">이이공브이샵<a href="tel:032-661-2203"
                                                    class="css-1hm59ir e1yy3fi610">032-661-2203</a></div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
             
        </div>
    </div>
    </div>
  <footer>
    				<jsp:include page="./footer/footer.jsp"></jsp:include>
    		</footer>

</body>
</head>

</html>