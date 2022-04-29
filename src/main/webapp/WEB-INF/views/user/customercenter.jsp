<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/user_css/header/public.css?var=1">
    <link rel="stylesheet" href="resources/css/user_css/header/customer.css?var=1">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<title>Document</title>
</head>
<body>
<header>
    	<jsp:include page="./header/OzoH.jsp"></jsp:include>
    </header>
    
   <div class="layout">
        <!--헤더 -->
	
        <!--메인 -->
        <div id="contact-us">
            <div class="container--my-page">
                <article id="customer-center" class="customer-center">
                    <h1 class="customer-center__title">고객센터</h1>
                    <div class="row">
                        <section class="col-12 col-md-6 customer-center__contact">
                            <address>운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)<br>이메일 :&nbsp;<a href="/contacts/new"
                                    style="text-decoration: underline;">이메일 문의하기</a><button
                                    class="customer-center__contact__btn-copy-email" type="button">이메일 주소 복사</button><br>전화
                                :&nbsp;<a href="tel:1670-0876" style="text-decoration: underline;">1670-0876</a></address><button
                                class="btn btn-md btn-priority customer-center__contact__btn-inquiry" type="button">1:1 카톡
                                상담하기</button>
                        </section>
                        <section class="col-12 col-md-6 customer-center__faq">
                            <ul class="customer-center__faq__list">
                                <li><a class="customer-center__faq__item" href="/customer_center#배송관련__배송은+얼마나+걸리나요">배송은 얼마나
                                        걸리나요?</a></li>
                                <li><a class="customer-center__faq__item" href="/customer_center#취소+환불__주문+취소는+어떻게+하나요">주문 취소는 어떻게
                                        하나요?</a></li>
                                <li><a class="customer-center__faq__item"
                                        href="/customer_center#서비스+기타__제품의+자세한+정보는+어떻게+알+수+있나요">제품의 자세한 정보를 알고 싶어요.</a></li>
                                <li><a class="customer-center__faq__item"
                                        href="/customer_center#반품+교환__제품이+불량입니다.+반품+혹은+교환은+어떻게+하나요">제품이 불량일 때는?</a></li>
                                <li><a class="customer-center__faq__item"
                                        href="/customer_center#로그인+회원정보__카카오+계정으로+로그인+하면+'이미+카카오로+가입하신+이메일입니다'+라고+나오는데+어떻게+해야+하나요">카카오
                                        계정으로 로그인하면 이미 가입되었다고 합니다.</a></li>
                            </ul>
                        </section>
                    </div>
                </article>
                
                <section class="col-12 customer-center__contact--mobile">
                    <p class="customer-center__contact--mobile__operating">운영시간 : 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)</p>
                    <div class="customer-center__contact--mobile__buttons"><button
                            class="btn btn-sm btn-priority customer-center__contact--mobile__button" type="button">1:1 카톡
                            상담하기</button><a class="btn btn-sm btn-light customer-center__contact--mobile__button"
                            href="/contacts/new">이메일 문의하기</a><a href="tel:1670-0876"
                            class="btn btn-sm btn-light customer-center__contact--mobile__button">전화 문의하기</a></div>
                </section>
            </div>
        </div>
        
        <!--자주하는 질문 -->
        <article id="faq" class="faq">
            <nav class="faq__nav">
                <ul class="faq__nav__list">
                    <li class="faq__nav__item faq__nav__item--active"><a href="/customer_center#전체">전체</a></li>
                    <li class="faq__nav__item"><a href="/customer_center#주문+결제">주문/결제</a></li>
                    <li class="faq__nav__item"><a id="customer_keyword" href="/customer_center#배송관련">배송관련</a></li>
                    <li class="faq__nav__item"><a id="customer_keyword" href="/customer_center#취소+환불">취소/환불</a></li>
                    <li class="faq__nav__item"><a id="customer_keyword" href="/customer_center#반품+교환">반품/교환</a></li>
                    <li class="faq__nav__item"><a id="customer_keyword" href="/customer_center#증빙서류발급">증빙서류발급</a></li>
                    <li class="faq__nav__item"><a id="customer_keyword" href="/customer_center#로그인+회원정보">로그인/회원정보</a></li>
                    <li class="faq__nav__item"><a id="customer_keyword" href="/customer_center#서비스+기타">서비스/기타</a></li>
                </ul>
            </nav>
            
            <article class="faq__contents">
            
                <section id="faq__contents__group" class="faq__contents__group">
               
                    <c:forEach items="${list}" var="CS">
                    <section id="" class="faq__contents__item">
                        <div class="faq__contents__item__question" onclick=onclick22() >${CS.customer_question}<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div  class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>${CS.customer_answer} </p>
                        </div>
                        
                    </section>
                    <!-- 원래자리 -->

                    </c:forEach>
                </section>
                
            </article>
        </article>
        
        <!--푸터 -->
<footer>
    	<jsp:include page="./footer/footer.jsp"></jsp:include>
    </footer>


   </div>
    
</body>
</html>