<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta property="og:title" content="님의 마이페이지" />
    <meta property="og:type" content="website" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myPage-style.css?var=1" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myPage-nav-style.css" />
    <link rel="stylesheet" href="resources/css/user_css/inha/footer-style.css" />
    <style type="text/css">
      address {
        font-style: normal;
      }
    </style>
    <title>님의 마이페이지</title>
  </head>
  <body>
  <header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    <div class="area-position-mypage">
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
        <!--
        <nav class="page-navigation mypage-nav-content">
          <ul style="transform: translateX(0px); margin: 0px">
            <li class="mypage-nav-item">
              <a class="active select" href="#" target="self">프로필</a>
            </li>
            <li class="mypage-nav-item">
              <a href="#" target="self">나의 쇼핑</a>
            </li>
            <li class="mypage-nav-item">
              <a href="#" target="self">나의 리뷰</a>
            </li>
            <li class="mypage-nav-item">
              <a href="#" target="self">설정</a>
            </li>
          </ul>
        </nav>-->
      </div>
      <div class="mypage-profile-container">
        <div class="mypage-profile-inner">
          <div class="mypage-profile">
            <div class="mypage-profile-img-item">
              <div class="mypage-profile-img-container">
                <div class="mypage-profile-img-area">
                <c:set value="${info.user_img}"></c:set>
                <c:if test="${info.user_img ne null}">
                  <img class="mypage-profile-img" src="${info.user_img}" />
                  </c:if>
                   <c:if test="${info.user_img eq null}">
                  <img class="mypage-profile-img" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/avatar.webp" />
                  </c:if>
                </div>
                <div class="mypage-profile-text-area">
                  <div class="mypage-profile-name">${info.nickname}</div>
                </div>
              </div>
            </div>
            <div class="mypage-profile-content-container">
              <div class="mypage-profile-content-top">
                <div class="mypage-profile-content">
                  <svg
                    class="mypage-profile-content-scrapbook-icon"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                    preserveAspectRatio="xMidYMid meet"
                  >
                    <path
                      fill-rule="evenodd"
                      transform="matrix(1 0 0 -1 0 23.033)"
                      d="M12.943 6.342a2 2 0 0 1-1.886 0L3 2.032V20.5a.5.5 0 0 0 .5.5h17a.5.5 0 0 0 .5-.5V2.033l-8.057 4.309zm-.471-.882l8.056-4.31A1 1 0 0 1 22 2.034V20.5a1.5 1.5 0 0 1-1.5 1.5h-17A1.5 1.5 0 0 1 2 20.5V2.033a1 1 0 0 1 1.472-.882l8.056 4.31a1 1 0 0 0 .944 0z"
                    ></path>
                  </svg>
                  <div class="mypage-profile-content-text">
                    <span>스크랩북</span>
                    <span class="mypage-profile-content-value">0</span>
                  </div>
                </div>
                <div class="mypage-profile-content">
                  <svg
                    class="mypage-profile-content-coupon-icon"
                    width="51"
                    height="29"
                    viewBox="0 0 51 29"
                    preserveAspectRatio="xMidYMid meet"
                  >
                    <g fill="none" fill-rule="evenodd">
                      <path
                        d="M46.493 1a3.5 3.5 0 012.48 1.025A3.482 3.482 0 0150 4.497h0v20.006A3.501 3.501 0 0146.493 28h0H4.507a3.5 3.5 0 01-2.48-1.025A3.482 3.482 0 011 24.503h0V4.497A3.501 3.501 0 014.507 1h0z"
                        stroke="#757575"
                        fill="#FFF"
                      ></path>
                      <path
                        fill="#757575"
                        d="M7.167 1.06h1.111v26.32H7.167z"
                      ></path>
                      <path
                        d="M32.722 12.26c-.926-1.73-2.658-2.8-4.706-2.8h0c-2.895 0-5.294 2.382-5.294 5.6 0 2.658 2.4 5.04 5.294 5.04 2.048 0 3.78-1.07 4.706-2.8"
                        stroke="#757575"
                        stroke-width="3"
                        stroke-linecap="round"
                      ></path>
                    </g>
                  </svg>
                  <div class="mypage-profile-content-text">
                    <span>쿠폰</span>
                    <span class="mypage-profile-content-value">0</span>
                  </div>
                </div>
                <div class="mypage-profile-content-point">
                  <svg
                    class="mypage-profile-content-point-icon"
                    width="40"
                    height="29"
                    viewBox="0 0 40 29"
                    preserveAspectRatio="xMidYMid meet"
                  >
                    <title>icon/ic_point</title>
                    <g
                      transform="translate(-5 .5)"
                      stroke="#757575"
                      fill="none"
                      fill-rule="evenodd"
                    >
                      <g transform="translate(23.889 6.16)" fill="#FFF">
                        <path
                          d="M.5 3.86h20.111v13.585c0 .316-.248.59-.599.852-.5.374-1.234.705-2.14.986-1.873.581-4.46.937-7.316.937-2.857 0-5.444-.356-7.316-.937-.907-.281-1.642-.612-2.14-.986-.351-.263-.6-.536-.6-.852h0V3.86z"
                        ></path>
                        <ellipse
                          cx="10.556"
                          cy="3.36"
                          rx="10.056"
                          ry="2.86"
                        ></ellipse>
                        <path
                          d="M0 12.88c0 1.856 4.602 3.36 10.278 3.36h0c5.676 0 10.278-1.504 10.278-3.36M0 7.84c0 1.856 4.602 3.36 10.278 3.36h0c5.676 0 10.278-1.504 10.278-3.36"
                        ></path>
                      </g>
                      <ellipse
                        fill="#FFF"
                        cx="18.889"
                        cy="14"
                        rx="13.389"
                        ry="13.5"
                      ></ellipse>
                      <path
                        d="M13.889 15.68h6.667c1.756.415 3.333-1.182 3.333-3.36 0-1.759-1.572-3.36-3.333-3.36h-3.334v11.2"
                        stroke-linecap="round"
                        stroke-width="3"
                      ></path>
                    </g>
                  </svg>
                  <div class="mypage-profile-content-text">
                    <span>포인트</span>
                    <span class="mypage-profile-content-value">0</span>
                  </div>
                </div>
              </div>
              <div class="mypage-profile-content-midline"></div>
              <div class="mypage-profile-content-bottom">
                <div class="mypage-profile-content-code">
                  <span class="mypage-profile-content-code-title"
                    >나의 추천코드</span
                  ><span class="mypage-profile-content-code-number"
                    >HIATJ2U4</span
                  >
                </div>
                <div class="mypage-profile-content-explain">
                  <span class="mypage-profile-content-explain-text">
                    나는 5000P, 친구는 5000원 쿠폰</span
                  ><a
                    class="mypage-profile-content-button button-color button-size"
                    href="#"
                    >추천하기</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <section class="container store_index_best">
      <div class="store_index_best_header">
        <p class="store_index_best_text" style="color: black">스크랩북</p>
        <button class="filter_btn" id="filter_btn">
          편집
          <svg
            class="caret"
            width="8"
            height="8"
            viewBox="0 0 8 8"
            preserveAspectRatio="xMidYMid meet"
          >
            <path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path>
          </svg>
        </button>
      </div>

      <div class="row best_production">
        <!-- for 문 -->
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best1.jpg" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best2.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best3.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best4.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best5.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best6.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best7.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
        <div class="col-12 col-md-4 col-lg-3">
          <div class="deals_list_wrap">
            <article class="deals_item">
              <a href="#" style="text-decoration: none">
                <div class="deals_item_wrap">
                  <div class="deals_item_pic_out">
                    <div class="deals_item_pic">
                      <div class="item_ani">
                        <img class="images" src="../sources/best8.webp" />
                      </div>
                    </div>
                    <button class="item_bookmark">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        class="inactive-icon"
                      >
                        <defs>
                          <path
                            id="scrap-icon-3-b"
                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"
                          ></path>
                          <filter
                            id="scrap-icon-3-a"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feOffset
                              in="SourceAlpha"
                              result="shadowOffsetOuter1"
                            ></feOffset>
                            <feGaussianBlur
                              in="shadowOffsetOuter1"
                              result="shadowBlurOuter1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feComposite
                              in="shadowBlurOuter1"
                              in2="SourceAlpha"
                              operator="out"
                              result="shadowBlurOuter1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowBlurOuter1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"
                            ></feColorMatrix>
                          </filter>
                          <filter
                            id="scrap-icon-3-c"
                            width="150%"
                            height="150%"
                            x="-25%"
                            y="-25%"
                            filterUnits="objectBoundingBox"
                          >
                            <feGaussianBlur
                              in="SourceAlpha"
                              result="shadowBlurInner1"
                              stdDeviation="1.5"
                            ></feGaussianBlur>
                            <feOffset
                              in="shadowBlurInner1"
                              result="shadowOffsetInner1"
                            ></feOffset>
                            <feComposite
                              in="shadowOffsetInner1"
                              in2="SourceAlpha"
                              k2="-1"
                              k3="1"
                              operator="arithmetic"
                              result="shadowInnerInner1"
                            ></feComposite>
                            <feColorMatrix
                              in="shadowInnerInner1"
                              values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"
                            ></feColorMatrix>
                          </filter>
                        </defs>
                        <g
                          fill="none"
                          fill-rule="nonzero"
                          transform="matrix(1 0 0 -1 0 24)"
                        >
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-a)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#FFF"
                            fill-opacity=".4"
                            href="#scrap-icon-3-b"
                          ></use>
                          <use
                            fill="#000"
                            filter="url(#scrap-icon-3-c)"
                            href="#scrap-icon-3-b"
                          ></use>
                          <path
                            stroke="#FFF"
                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div class="deals_item_content">
                    <div class="deals_item_header">
                      <span class="deals_item_header_brand">브랜드</span>
                      <span class="deals_item_header_name"
                        >[1+1] 여기에는 이름을 적으면 될 듯 어쩌구저쩌구
                        블라블라 안녕 안녕</span
                      >
                    </div>
                    <div class="deals_item_body_price">
                      <span class="sale_percent">50%</span>
                      <span class="price">10,000</span>
                    </div>
                    <div class="deals_item_review">
                      <div class="review_icon">
                        <i class="fa-solid fa-star" style="color: #ff778e"></i>
                      </div>
                      <svg
                        class="review-icon"
                        width="14"
                        height="14"
                        viewBox="0 0 24 24"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <path
                          fill="currentColor"
                          fill-rule="evenodd"
                          d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"
                        ></path>
                      </svg>
                      <div class="review_score">4.6</div>
                      <div class="review_count">리뷰 3,641</div>
                    </div>
                    <div class="best_item_info">
                      <svg
                        id="freeship_icon"
                        class="icon"
                        aria-label="무료배송"
                        width="47"
                        height="20"
                        viewBox="0 0 47 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <g fill="none" fill-rule="evenodd">
                          <rect
                            width="47"
                            height="20"
                            fill="#000"
                            fill-opacity=".07"
                            fill-rule="nonzero"
                            rx="4"
                          ></rect>
                          <path
                            fill="#757575"
                            d="M12.73 5.38v3.96h-6.6V5.38h6.6zm-2.68 9.43H8.76v-3.25H5v-1.03h8.86v1.03h-3.81v3.25zm1.4-6.49V6.41H7.43v1.91h4.04zm11.08 2.7h-1.42v1.54h2.26v1.02h-8.86v-1.02h2.24v-1.53h-1.1V7.78h5.32V6.65H15.6V5.63h6.66V8.8h-5.33v1.18h5.61v1.04zm-4.53 0v1.54h1.87v-1.53H18zm14.37 3.78h-1.23V9.86h-.8v4.49h-1.2V5.18h1.2v3.66h.8V5h1.23v9.8zm-4.2-2.54h-3.9V6.01h1.27v2.26h1.36V6h1.28v6.26zm-1.27-1.01v-2h-1.36v2h1.36zm14.49 1.71c0 1.13-1.25 1.82-3.41 1.82s-3.42-.7-3.42-1.82 1.25-1.82 3.4-1.82c2.18 0 3.43.7 3.43 1.82zm-3.41-6.05c-.5 1.13-2.1 1.9-3.51 2.1l-.54-1c1.64-.17 3.39-1.06 3.39-2.54V5.2h1.33v.28c0 1.48 1.99 2.47 3.4 2.53l-.55 1.01c-1.31-.18-3.03-.97-3.52-2.1zm4.42 3.78h-8.86V9.66h3.79V8.4h1.29v1.26h3.78v1.03zm-2.33 2.27c0-.5-.83-.8-2.1-.8s-2.08.3-2.08.8c0 .51.81.8 2.08.8s2.1-.29 2.1-.8z"
                          ></path>
                        </g>
                      </svg>
                      <svg
                        id="saleprice_icon"
                        class="icon"
                        aria-label="특가"
                        width="30"
                        height="20"
                        viewBox="0 0 30 20"
                        preserveAspectRatio="xMidYMid meet"
                      >
                        <rect width="30" height="20" fill="#F77" rx="4"></rect>
                        <path
                          fill="#fff"
                          d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </div>
              </a>
            </article>
          </div>
        </div>
      </div>
    </section>
    <footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
  </body>
</html>
