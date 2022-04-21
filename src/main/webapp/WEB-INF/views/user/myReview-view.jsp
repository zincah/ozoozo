<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta property="og:title" content="내가 작성한 리뷰" />
    <meta property="og:type" content="website" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myPage-nav-style.css" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myReview-view-style.css" />
    <link rel="stylesheet" href="resources/css/user_css/inha/footer-style.css" />
    <style type="text/css">
      address {
        font-style: normal;
      }
    </style>
    <title>내가 작성한 리뷰</title>
  </head>
  <body>
  <header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage">
      <!-- nav -->
      <div class="mypage-nav">
        <nav class="page-navigation mypage-nav-owner">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a href="myPage.html" target="self">프로필</a>
            </li>
            <li class="mypage-nav-item">
              <a href="#" target="self">나의 쇼핑</a>
            </li>
            <li class="mypage-nav-item">
              <a class="active" href="#" target="self">나의 리뷰</a>
            </li>
            <li class="mypage-nav-item">
              <a href="#" target="self">설정</a>
            </li>
          </ul>
        </nav>
        <nav class="page-navigation mypage-nav-content">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a href="myReview-write.html" target="self">리뷰쓰기</a>
            </li>
            <li class="mypage-nav-item">
              <a class="active select" href="#" target="self"
                >내가 작성한 리뷰</a
              >
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- content -->
    <div class="my-review-list container">
      <div
        class="virtualized-list my-review-list__list"
        style="
          padding-top: 0px;
          padding-bottom: 0px;
          transform: translateY(0px);
        "
      >
        <div>
          <div class="my-review-list__list__item">
            <div class="my-review-list__list__item__wrap">
              <div class="my-review-list__list__item__product">
                <a
                  class="my-review-list__list__item__product__name"
                  href="/productions/388323/selling"
                  >[가구레시피] 국내생산/후기인증 튼튼한 조립식 3단 전자렌지대
                  다용도수납장 주방선반</a
                >
                <div class="my-review-list__list__item__product__explain">
                  화이트 (슬라이드돼요!)
                </div>
                <div class="my-review-list__list__item__product__info">
                  <span
                    class="my-review-list__list__item__product__info__star"
                    aria-label="별점 5.0점"
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-250"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-250">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-250" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-250)"
                        xlink:href="#star-path-250"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-251"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-251">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-251" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-251)"
                        xlink:href="#star-path-251"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-252"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-252">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-252" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-252)"
                        xlink:href="#star-path-252"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-253"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-253">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-253" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-253)"
                        xlink:href="#star-path-253"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-254"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-254">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-254" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-254)"
                        xlink:href="#star-path-254"
                      ></use></svg
                  ></span>
                  <div class="my-review-list__list__item__product__info__text">
                    매운쌀국수 | 2022.03.14 | 오늘의집 리뷰
                  </div>
                </div>
                <div class="my-review-list__list__item__product__content">
                  깔끔해~~ 조립도 쉬워 ~~ 근데 오지게 무거워~~~ 중간 선반은
                  절반까지만 빠져~~
                </div>
              </div>
              <div>
                <div class="my-review-list__list__item__insert">수정</div>
                <img
                  class="my-review-list__list__item__image"
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
                  srcset="
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x
                  "
                />
              </div>
            </div>
          </div>
        </div>
        <div>
          <div class="my-review-list__list__item">
            <div class="my-review-list__list__item__wrap">
              <div class="my-review-list__list__item__product">
                <a
                  class="my-review-list__list__item__product__name"
                  href="/productions/559128/selling"
                  >[쿠오레] 전자레인지 MC-A211GW / 전자렌지/ 20L</a
                >
                <div class="my-review-list__list__item__product__explain">
                  MC-A211GW 화이트 20L
                </div>
                <div class="my-review-list__list__item__product__info">
                  <span
                    class="my-review-list__list__item__product__info__star"
                    aria-label="별점 5.0점"
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-255"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-255">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-255" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-255)"
                        xlink:href="#star-path-255"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-256"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-256">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-256" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-256)"
                        xlink:href="#star-path-256"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-257"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-257">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-257" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-257)"
                        xlink:href="#star-path-257"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-258"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-258">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-258" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-258)"
                        xlink:href="#star-path-258"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-259"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-259">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-259" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-259)"
                        xlink:href="#star-path-259"
                      ></use></svg
                  ></span>
                  <div class="my-review-list__list__item__product__info__text">
                    매운쌀국수 | 2022.03.14 | 오늘의집 리뷰
                  </div>
                </div>
                <div class="my-review-list__list__item__product__content">
                  디자인 깔끔하니 예쁘고 성능도 그냥 전자레인지같음. 근데 BBQ
                  치킨 박스는 들어가긴 하는데 회전을 못함 ㅋㅋㅋㅋ
                </div>
              </div>
              <div>
                <div class="my-review-list__list__item__insert">수정</div>
                <img
                  class="my-review-list__list__item__image"
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
                  srcset="
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x
                  "
                />
              </div>
            </div>
          </div>
        </div>
        <div>
          <div class="my-review-list__list__item">
            <div class="my-review-list__list__item__wrap">
              <div class="my-review-list__list__item__product">
                <a
                  class="my-review-list__list__item__product__name"
                  href="/productions/961963/selling"
                  >[신일] [단톡특가] 전기 압력밥솥 미니 원룸 1등급 소형 3인용
                  SCJ-R020WH</a
                >
                <div class="my-review-list__list__item__product__explain">
                  화이트(SCJ-R020WH)
                </div>
                <div class="my-review-list__list__item__product__info">
                  <span
                    class="my-review-list__list__item__product__info__star"
                    aria-label="별점 5.0점"
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-260"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-260">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-260" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-260)"
                        xlink:href="#star-path-260"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-261"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-261">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-261" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-261)"
                        xlink:href="#star-path-261"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-262"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-262">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-262" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-262)"
                        xlink:href="#star-path-262"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-263"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-263">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-263" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-263)"
                        xlink:href="#star-path-263"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-264"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-264">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-264" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-264)"
                        xlink:href="#star-path-264"
                      ></use></svg
                  ></span>
                  <div class="my-review-list__list__item__product__info__text">
                    매운쌀국수 | 2022.03.13 | 오늘의집 리뷰
                  </div>
                </div>
                <div class="my-review-list__list__item__product__content">
                  소형인데 압력기능 있는걸 골라서 샀는데 예쁘고 좋습니다. 밥맛
                  좋아요. 근데 1시간 이상 보온해놓기만 해도 밥이 쫌 누래집니다.
                  밥은 식혀서 냉동보관 하세요.
                </div>
              </div>
              <div>
                <div class="my-review-list__list__item__insert">수정</div>
                <img
                  class="my-review-list__list__item__image"
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
                  srcset="
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x
                  "
                />
              </div>
            </div>
          </div>
        </div>
        <div>
          <div class="my-review-list__list__item">
            <div class="my-review-list__list__item__wrap">
              <div class="my-review-list__list__item__product">
                <a
                  class="my-review-list__list__item__product__name"
                  href="/productions/628174/selling"
                  >[노와] [단독]독일 주방명품 IH 쿡웨어 7P 세트 (멀티핸들
                  포함)</a
                >
                <div class="my-review-list__list__item__product__explain">
                  쿡웨어 세트
                </div>
                <div class="my-review-list__list__item__product__info">
                  <span
                    class="my-review-list__list__item__product__info__star"
                    aria-label="별점 5.0점"
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-265"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-265">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-265" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-265)"
                        xlink:href="#star-path-265"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-266"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-266">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-266" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-266)"
                        xlink:href="#star-path-266"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-267"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-267">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-267" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-267)"
                        xlink:href="#star-path-267"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-268"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-268">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-268" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-268)"
                        xlink:href="#star-path-268"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-269"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-269">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-269" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-269)"
                        xlink:href="#star-path-269"
                      ></use></svg
                  ></span>
                  <div class="my-review-list__list__item__product__info__text">
                    매운쌀국수 | 2022.03.13 | 오늘의집 리뷰
                  </div>
                </div>
                <div class="my-review-list__list__item__product__content">
                  7p에 이 가격(할인당시)이면 정말 잘 산것같네요. 아무 무리없이
                  쓰고있습니다.
                </div>
              </div>
              <div>
                <div class="my-review-list__list__item__insert">수정</div>
                <img
                  class="my-review-list__list__item__image"
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
                  srcset="
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x
                  "
                />
              </div>
            </div>
          </div>
        </div>
        <div>
          <div class="my-review-list__list__item">
            <div class="my-review-list__list__item__wrap">
              <div class="my-review-list__list__item__product">
                <a
                  class="my-review-list__list__item__product__name"
                  href="/productions/562699/selling"
                  >[자일렉] [8차 완판/4월11일 순차 출고] 에이블 핸디형/스틱
                  스탠드 무선청소기 ZL-274H</a
                >
                <div class="my-review-list__list__item__product__explain">
                  단품
                </div>
                <div class="my-review-list__list__item__product__info">
                  <span
                    class="my-review-list__list__item__product__info__star"
                    aria-label="별점 5.0점"
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-270"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-270">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-270" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-270)"
                        xlink:href="#star-path-270"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-271"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-271">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-271" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-271)"
                        xlink:href="#star-path-271"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-272"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-272">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-272" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-272)"
                        xlink:href="#star-path-272"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-273"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-273">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-273" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-273)"
                        xlink:href="#star-path-273"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-274"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-274">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-274" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-274)"
                        xlink:href="#star-path-274"
                      ></use></svg
                  ></span>
                  <div class="my-review-list__list__item__product__info__text">
                    매운쌀국수 | 2022.03.13 | 오늘의집 리뷰
                  </div>
                </div>
                <div class="my-review-list__list__item__product__content">
                  네 디자인 깔끔하고 예쁘고요, 성능 좋아보이네요. 파워가 총
                  2단계가 있는데 1단계는 나름 조용하면서도 흡입력 좋고 2단계는
                  일반 청소기 같네요. 굿
                </div>
              </div>
              <div>
                <div class="my-review-list__list__item__insert">수정</div>
                <img
                  class="my-review-list__list__item__image"
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
                  srcset="
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x
                  "
                />
              </div>
            </div>
          </div>
        </div>
        <div>
          <div class="my-review-list__list__item">
            <div class="my-review-list__list__item__wrap">
              <div class="my-review-list__list__item__product">
                <a
                  class="my-review-list__list__item__product__name"
                  href="/productions/254111/selling"
                  >[쉐어룸] 샌드베이 페르시안 주방/발매트 2size</a
                >
                <div class="my-review-list__list__item__product__explain">
                  50x150cm
                </div>
                <div class="my-review-list__list__item__product__info">
                  <span
                    class="my-review-list__list__item__product__info__star"
                    aria-label="별점 4.0점"
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-280"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-280">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-280" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-280)"
                        xlink:href="#star-path-280"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-281"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-281">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-281" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-281)"
                        xlink:href="#star-path-281"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-282"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-282">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-282" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-282)"
                        xlink:href="#star-path-282"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-283"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-283">
                          <rect x="0" y="0" width="24" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-283" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-283)"
                        xlink:href="#star-path-283"
                      ></use></svg
                    ><svg
                      fill="#ff778e"
                      width="1em"
                      height="1em"
                      preserveAspectRatio="xMidYMid meet"
                      viewBox="0 0 24 24"
                    >
                      <defs>
                        <path
                          id="star-path-284"
                          d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"
                        ></path>
                        <clipPath id="star-clip-284">
                          <rect x="0" y="0" width="0" height="24"></rect>
                        </clipPath>
                      </defs>
                      <use xlink:href="#star-path-284" fill="#DBDBDB"></use>
                      <use
                        clip-path="url(#star-clip-284)"
                        xlink:href="#star-path-284"
                      ></use></svg
                  ></span>
                  <div class="my-review-list__list__item__product__info__text">
                    매운쌀국수 | 2020.11.22 | 오늘의집 리뷰
                  </div>
                </div>
                <div class="my-review-list__list__item__product__content">
                  발매트 예뻐요 사진 그대로인듯 그리고 길이나 크기도 적당하고
                  부드러워요
                </div>
              </div>
              <div>
                <div class="my-review-list__list__item__insert">수정</div>
                <img
                  class="my-review-list__list__item__image"
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1"
                  srcset="
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x,
                    https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x
                  "
                />
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
</html>
