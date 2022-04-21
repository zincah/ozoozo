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

    <style type="text/css">
        address {
            font-style: normal;
        }
    </style>



<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage">
        <div class="mypage-nav">
            <nav class="page-navigation mypage-nav-owner">
                <ul style="transform: translateX(0px); margin: 0px">
                    <li class="mypage-nav-item">
                        <a href="#" target="self">프로필</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a class="active" href="#" target="self">나의 쇼핑</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#" target="self">나의 리뷰</a>
                    </li>
                    <li class="mypage-nav-item">
                        <a href="#" target="self">설정</a>
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
                    </a><a class="order-list__menu__list" href="http://127.0.0.1:3002/my_shopping_status.html">
                        <div class="order-list__menu__list__wrap">
                            <div class="order-list__menu__list__title">구매확정</div>
                            <div class="order-list__menu__list__value">0</div>
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
                                                        class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">기간<svg
                                                            class="icon" width="12" height="12" viewBox="0 0 12 12"
                                                            fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                            <path
                                                                d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z">
                                                            </path>
                                                        </svg></button></div>
                                            </li>
                                            <li class="filter-bar__control-list__item">
                                                <div class="drop-down panel-drop-down filter-bar-control"><button
                                                        class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">주문상태<svg
                                                            class="icon" width="12" height="12" viewBox="0 0 12 12"
                                                            fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                                            <path
                                                                d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z">
                                                            </path>
                                                        </svg></button></div>
                                            </li>
                                        </ul>
                                    </div>
                                    <ul class="filter-bar__tag-list"></ul>
                                </div>
                            </div>
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