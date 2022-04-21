<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta property="og:title" content="리뷰 쓰기" />
    <meta property="og:type" content="website" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myPage-nav-style.css" />
    <link rel="stylesheet" href="resources/css/user_css/inha/myReview-write-style.css" />
    <link rel="stylesheet" href="resources/css/user_css/inha/footer-style.css" />
    <style type="text/css">
      address {
        font-style: normal;
      }
    </style>
    <title>리뷰 쓰기</title>
  </head>
  <body class="modalScroll">
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
              <a class="active select" href="#" target="self">리뷰쓰기</a>
            </li>
            <li class="mypage-nav-item">
              <a href="myReview-view.html" target="self">내가 작성한 리뷰</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- content -->
    <div class="container review-my-home">
      <div class="review-my-home__search">
        <div class="review-my-home__search__title">내가 사용하는 상품 리뷰쓰기</div>
        <form class="review-my-home__search__form">
          <div class="review-my-home__search__form__wrap"><input placeholder="브랜드명 혹은 상품명 입력" class="form-control review-my-home__search__form__input" value="" /><button class="_3Z6oR _3AsCW _1BDvx review-my-home__search__form__button" type="submit">검색</button></div>
        </form>
      </div>
      <div class="virtualized-list review-my-home__review-list" style="padding-top: 0px; padding-bottom: 0px; transform: translateY(0px)">
        <div style="">
          <div class="review-my-home__review-list__item">
            <img class="review-my-home__review-list__item__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 3x" /><a class="review-my-home__review-list__item__wrap" href="/productions/348334/selling"><span class="review-my-home__review-list__item__wrap__brand">한빛카페트</span><span class="review-my-home__review-list__item__wrap__name">[오늘의딜]헤링본 발탄 사이잘룩 러그 먼지없는 워셔블 사계절 8colors 8size </span><span class="review-my-home__review-list__item__wrap__option">색상: 베이지 / 사이즈: 170x230cm</span><span class="review-my-home__review-list__item__wrap__point-info">포토 500P 일반 100P</span></a>
            <div class="review-my-home__review-list__item__review-btn">
              <div class="review-my-home__review-list__item__review-btn__from">오조의집 구매</div>
              <button id="modalOpenBtn" class="_3Z6oR _1myYS _1BDvx review-my-home__review-list__item__review-btn__button">리뷰쓰기</button>
            </div>
          </div>
        </div>
        <div style="">
          <div class="review-my-home__review-list__item">
            <img class="review-my-home__review-list__item__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159055684818490279.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159055684818490279.jpg?gif=1&amp;w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159055684818490279.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159055684818490279.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 3x" /><a class="review-my-home__review-list__item__wrap" href="/productions/336645/selling"><span class="review-my-home__review-list__item__wrap__brand">MF매직하우스</span><span class="review-my-home__review-list__item__wrap__name">(당일발송) 무볼트 드레스룸 조립식 싱글행거 + 고무망치 증정</span><span class="review-my-home__review-list__item__wrap__option">무볼트 드레스룸 싱글행거</span><span class="review-my-home__review-list__item__wrap__point-info">포토 500P 일반 100P</span></a>
            <div class="review-my-home__review-list__item__review-btn">
              <div class="review-my-home__review-list__item__review-btn__from">오조의집 구매</div>
              <button id="modalOpenBtn" class="_3Z6oR _1myYS _1BDvx review-my-home__review-list__item__review-btn__button">리뷰쓰기</button>
            </div>
          </div>
        </div>
        <div style="">
          <div class="review-my-home__review-list__item">
            <img class="review-my-home__review-list__item__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/163644425725869006.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/163644425725869006.jpg?gif=1&amp;w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/163644425725869006.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/163644425725869006.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 3x" /><a class="review-my-home__review-list__item__wrap" href="/productions/310686/selling"><span class="review-my-home__review-list__item__wrap__brand">하우스레시피</span><span class="review-my-home__review-list__item__wrap__name">화이트 빨래건조대 원룸</span><span class="review-my-home__review-list__item__wrap__option">화이트</span><span class="review-my-home__review-list__item__wrap__point-info">포토 500P 일반 100P</span></a>
            <div class="review-my-home__review-list__item__review-btn">
              <div class="review-my-home__review-list__item__review-btn__from">오조의집 구매</div>
              <button id="modalOpenBtn" class="_3Z6oR _1myYS _1BDvx review-my-home__review-list__item__review-btn__button">리뷰쓰기</button>
            </div>
          </div>
        </div>
        <div style="">
          <div class="review-my-home__review-list__item">
            <img class="review-my-home__review-list__item__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159477840693468357.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159477840693468357.jpg?gif=1&amp;w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159477840693468357.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/159477840693468357.jpg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 3x" /><a class="review-my-home__review-list__item__wrap" href="/productions/409246/selling"><span class="review-my-home__review-list__item__wrap__brand">파란들가구</span><span class="review-my-home__review-list__item__wrap__name">베르제 LPM 접이식 다용도 사각 밥상 테이블 3colors (보호캡증정)</span><span class="review-my-home__review-list__item__wrap__option">화이트</span><span class="review-my-home__review-list__item__wrap__point-info">포토 500P 일반 100P</span></a>
            <div class="review-my-home__review-list__item__review-btn">
              <div class="review-my-home__review-list__item__review-btn__from">오조의집 구매</div>
              <button id="modalOpenBtn" class="_3Z6oR _1myYS _1BDvx review-my-home__review-list__item__review-btn__button">리뷰쓰기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
 <footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>
    <!-- 리뷰 모달 -->
    <div id="react-modal" class="react-modal react-modal--center review-modal__modal__wrap open open-active">
      <div class="react-modal__content-wrap">
        <div class="react-modal__content review-modal__modal">
          <div class="review-modal">
            <div class="review-modal__title">
              리뷰 쓰기<button type="button" id="modalCloseBtn" class="review-modal__close">
                <svg class="review-modal__close__icon" width="20" height="20" viewBox="0 0 20 20" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path fill-rule="nonzero" d="M11.6 10l7.1 7.1-1.6 1.6-7.1-7.1-7.1 7.1-1.6-1.6L8.4 10 1.3 2.9l1.6-1.6L10 8.4l7.1-7.1 1.6 1.6z"></path></svg>
              </button>
            </div>
            <div class="review-modal__point-explain">
              <svg class="review-modal__point-explain__icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M12 0c6.627 0 12 5.373 12 12s-5.373 12-12 12S0 18.627 0 12 5.373 0 12 0zm1 5H9.897l-.194.01C8.746 5.11 8 5.934 8 6.938v10.569l.01.198c.097.977.905 1.74 1.887 1.74 1.047 0 1.896-.868 1.896-1.938v-2.29H13l.248.006c2.479-.01 4.752-2.186 4.752-5.115C18 7.375 15.683 5 13 5zm0 3.875l.135.011c.543.087 1.072.672 1.072 1.222 0 .755-.558 1.265-1.108 1.236l-1.306-.003V8.875H13z"></path></svg>포토리뷰&nbsp;<span class="review-modal__point-explain__value">500P</span>,&nbsp; 일반리뷰&nbsp;<span class="review-modal__point-explain__value">100P</span>
            </div>
            <form class="review-modal__form">
              <div class="review-modal__form__product">
                <img class="review-modal__form__product__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=160&amp;h=160&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162546495592646634.jpg?gif=1&amp;w=320&amp;h=320&amp;c=c&amp;webp=1 3x" />
                <div class="review-modal__form__product__contents">
                  <div class="review-modal__form__product__contents__brand">한빛카페트</div>
                  <div class="review-modal__form__product__contents__name">[5%쿠폰]헤링본 발탄 사이잘룩 러그 먼지없는 워셔블 사계절 8colors 8size</div>
                  <div class="review-modal__form__product__contents__options">색상: 베이지 / 사이즈: 170x230cm</div>
                </div>
              </div>
              <div class="review-modal__section">
                <div class="review-modal__section__title">별점 평가</div>
                <div class="review-modal__form__star__wrap">
                  <div class="review-modal__form__star">
                    <div class="review-modal__form__star__label">내구성</div>
                    <div class="review-modal__form__star__value">
                      <ul class="rating-input">
                        <li>
                          <label class="rating-input__star" aria-label="별점 1점"
                            ><input type="radio" value="1" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 2점"
                            ><input type="radio" value="2" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 3점"
                            ><input type="radio" value="3" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 4점"
                            ><input type="radio" value="4" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 5점"
                            ><input type="radio" value="5" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="review-modal__form__star">
                    <div class="review-modal__form__star__label">가격</div>
                    <div class="review-modal__form__star__value">
                      <ul class="rating-input">
                        <li>
                          <label class="rating-input__star" aria-label="별점 1점"
                            ><input type="radio" value="1" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 2점"
                            ><input type="radio" value="2" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 3점"
                            ><input type="radio" value="3" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 4점"
                            ><input type="radio" value="4" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 5점"
                            ><input type="radio" value="5" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="review-modal__form__star">
                    <div class="review-modal__form__star__label">디자인</div>
                    <div class="review-modal__form__star__value">
                      <ul class="rating-input">
                        <li>
                          <label class="rating-input__star" aria-label="별점 1점"
                            ><input type="radio" value="1" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 2점"
                            ><input type="radio" value="2" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 3점"
                            ><input type="radio" value="3" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 4점"
                            ><input type="radio" value="4" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 5점"
                            ><input type="radio" value="5" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="review-modal__form__star">
                    <div class="review-modal__form__star__label">배송</div>
                    <div class="review-modal__form__star__value">
                      <ul class="rating-input">
                        <li>
                          <label class="rating-input__star" aria-label="별점 1점"
                            ><input type="radio" value="1" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 2점"
                            ><input type="radio" value="2" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 3점"
                            ><input type="radio" value="3" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 4점"
                            ><input type="radio" value="4" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                        <li>
                          <label class="rating-input__star" aria-label="별점 5점"
                            ><input type="radio" value="5" /><svg class="star" fill="currentColor" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 36 36"><path fill-rule="evenodd" d="M18 30.7l-9 3.8c-1.5.7-2.6-.2-2.5-1.8l.8-9.7L1 15.6c-1-1.3-.6-2.6 1-3l9.5-2.2 5-8.3c1-1.5 2.3-1.5 3.1 0l5 8.3 9.6 2.2c1.6.4 2 1.7 1 3L28.7 23l.8 9.7c.1 1.6-1 2.5-2.5 1.8l-9-3.8z"></path></svg
                          ></label>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="review-modal__section">
                <div class="review-modal__section__title">사진 첨부 (선택) <img class="review-modal__form__photo-point" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/157654714042406347.png?gif=1&amp;w=240&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/157654714042406347.png?gif=1&amp;w=360&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/157654714042406347.png?gif=1&amp;w=480&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/157654714042406347.png?gif=1&amp;w=720&amp;webp=1 3x" /></div>
                <div class="review-modal__section__explain">오늘의집에 올렸던 사진에서 고르거나 새로운 사진을 첨부해주세요. (최대 1장)</div>
                <div class="select-my-card">
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722267554286432.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164722261566583531.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718289353676538.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718282905658625.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/164718275300352895.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027751_hZAfT.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027720_2ehFh.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027720_2ehFh.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027720_2ehFh.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027720_2ehFh.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027625_dlj1YXyC.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027625_dlj1YXyC.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027625_dlj1YXyC.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027625_dlj1YXyC.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                  <div class="select-my-card__content">
                    <img class="select-my-card__content__image" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027477_X8mXb.jpeg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027477_X8mXb.jpeg?gif=1&amp;w=360&amp;h=360&amp;c=c&amp;webp=1 1.5x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027477_X8mXb.jpeg?gif=1&amp;w=480&amp;h=480&amp;c=c&amp;webp=1 2x, https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/1606027477_X8mXb.jpeg?gif=1&amp;w=720&amp;h=720&amp;c=c&amp;webp=1 3x" />
                    <div class="round-checkbox-input round-checkbox-input--blue">
                      <label class="round-checkbox-input__label"
                        ><input class="round-checkbox-input__input" type="checkbox" /><span class="round-checkbox-input__icon"
                          ><svg class="check" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#FFF" d="M9.9 14.6l7-7.3 1.5 1.4-8.4 8.7-5-4.6 1.4-1.5z"></path></svg></span
                      ></label>
                    </div>
                  </div>
                </div>
                <button class="button button--color-blue-inverted button--size-50 button--shape-4 upload-button" type="button">
                  <svg viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M21.1 4c.5 0 .9.4.9.9v14.2c0 .5-.4.9-.9.9H2.9a.9.9 0 01-.9-.9V4.9c0-.5.4-.9.9-.9h18.2zm-.91 1.8H3.8v10.85l5.54-6.27c.12-.17.38-.17.52 0l3.1 3.54c.06.06.08.14.06.2l-.4 1.84c-.02.14.15.23.23.12l3.16-3.43a.27.27 0 01.38 0l3.79 4.12V5.8zm-3.37 4.8a1.47 1.47 0 01-1.47-1.45c0-.81.66-1.46 1.47-1.46s1.48.65 1.48 1.46c0 .8-.66 1.45-1.48 1.45z"></path></svg> 사진 첨부하기
                </button>
              </div>
              <div class="review-modal__section">
                <div class="review-modal__section__title">리뷰 작성</div>
                <textarea placeholder="자세하고 솔직한 리뷰는 다른 고객에게 큰 도움이 됩니다. (최소 20자 이상)" class="form-control text-area-input review-modal__form__review-input" style="height: 56px"></textarea>
                <div class="review-modal__form__review-input__length"><span class="review-modal__form__review-input__length__value">0</span></div>
              </div>
              <button class="button button--color-blue button--size-50 button--shape-4 review-modal__form__submit" type="submit">완료</button>
            </form>
            <div class="review-modal__policy">
              <div class="review-modal__policy__button">
                <span>오늘의집 리뷰 정책</span><svg class="icon" width="16" height="17" viewBox="0 0 16 17" fill="none" preserveAspectRatio="xMidYMid meet"><path d="M3 5.16663L8 9.99908L13 5.16663L14 6.08373L8 11.8333L2 6.08373L3 5.16663Z" fill="#424242"></path></svg>
              </div>
              <div class="" style="overflow: hidden"></div>
            </div>
            <div class="review-modal__explain">
              <ul>
                <li>포인트는 최초 작성한 리뷰를 기준으로 지급됩니다.</li>
                <li>상품과 무관한 내용이나 사진, 동일 문자 반복 등의 부적합한 리뷰는&nbsp; 사전 경고 없이 삭제 및 포인트 회수될 수 있습니다.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="../js/myReview-write-js.js"></script>
  </body>
</html>
