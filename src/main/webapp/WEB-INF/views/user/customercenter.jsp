<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/user_css/header/public.css">
    <link rel="stylesheet" href="resources/css/user_css/header/customer.css">
    
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
                    <li class="faq__nav__item"><a href="/customer_center#배송관련">배송관련</a></li>
                    <li class="faq__nav__item"><a href="/customer_center#취소+환불">취소/환불</a></li>
                    <li class="faq__nav__item"><a href="/customer_center#반품+교환">반품/교환</a></li>
                    <li class="faq__nav__item"><a href="/customer_center#증빙서류발급">증빙서류발급</a></li>
                    <li class="faq__nav__item"><a href="/customer_center#로그인+회원정보">로그인/회원정보</a></li>
                    <li class="faq__nav__item"><a href="/customer_center#서비스+기타">서비스/기타</a></li>
                </ul>
            </nav>
            <article class="faq__contents">
                <section id="faq__contents__group" class="faq__contents__group">
                    <section id="주문+결제__주문+내역은+어떻게+확인할+수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">주문 내역은 어떻게 확인할 수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑]을 통해 확인 가능합니다</p>
                        </div>
                    </section>
                    <section id="주문+결제__결제+방법은+어떤+것이+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">결제 방법은 어떤 것이 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>신용카드 및 체크카드, 무통장 입금, 휴대폰 소액결제, 네이버페이를 이용해 결제 가능합니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__비회원주문+및+전화주문이+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">비회원주문 및 전화주문이 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>전화주문은 준비중에 있습니다.</p>
                            <p> 비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__신용카드+무이자+할부가+되나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">신용카드 무이자 할부가 되나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__신용카드+결제+후+할부+개월+수를+변경+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">신용카드 결제 후 할부 개월 수를 변경 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>결제 후 결제 정보 변경은 불가능 합니다.</p>
                            <p>단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__가상계좌+은행을+변경+할+수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">가상계좌 은행을 변경 할 수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>한번 발급 받은 계좌번호는 변경이 불가능합니다.</p>
                            <p>재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__주문+후+결제+방법을+변경하고+싶은데+어떻게+해야+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>결제 후 결제 정보 변경은 불가능 합니다.</p>
                            <p>단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__결제+시+에러+메시지가+나오는+경우+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">결제 시 에러 메시지가 나오는 경우 해야하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기]를 통해 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__신용카드+안전결제(ISP)는+무엇인가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">신용카드 안전결제(ISP)는 무엇인가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>국민카드, BC카드는 인터넷 안전결제(ISP)로 결제가 진행됩니다.</p>
                            <p>결제진행시 나타나는 안내에 따라 결제하실 카드번호와 사용하시는 이메일 및 비밀번호를 입력하여 인터넷 안전결제(ISP)등록 후 결제를 진행해 주시면 됩니다.</p>
                            <p>단, 30만원 이상 결제 시에는 공인인증서가 필요합니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__가상계좌+입금은+언제+확인+되나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">가상계좌 입금은 언제 확인 되나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>입금 후 24시간 이내에 확인됩니다.</p>
                            <p>24시간 이후에도 입금확인이 되지 않는 경우 결제 금액과 입금한 금액이 같은지, 올바른 계좌로 입금하였는지 확인 후</p>
                            <p>[나의쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기]를 통해 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="주문+결제__가상계좌+입금인을+다르게+적은경우+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">가상계좌 입금인을 다르게 적은경우 어떻게 해야하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>입금인이 달라도 가상계좌번호만 같으면 문제없습니다.</p>
                        </div>
                    </section>
                </section>
                <section class="faq__contents__group">
                    <section id="배송관련__배송비는+얼마인가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">배송비는 얼마인가요?<svg width="1em" height="1em" viewBox="0 0 16 16"
                                preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집은 상품정보 중계 및 판매 매체이며, 판매 업체 별로 배송비 정책이 상이합니다각 상품상세페이지에서 배송비를 확인하실 수 있습니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__배송확인은+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">배송확인은 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필의 [나의쇼핑]을 통해 배송단계를 한눈에 보실 수 있습니다.</p>
                            <p>또한 배송이 시작되면 카카오톡 알림톡 또는 SMS로 안내메시지가 발송됩니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__배송은+얼마나+걸리나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">배송은 얼마나 걸리나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>상품 배송 기간은 배송 유형에 따라 출고 일자 차이가 있습니다.자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능하며, 배송 유형 별 기본 출고 기간은 아래와 같습니다.
                            </p>
                            <p>∙ 일반 택배 / 화물 택배 : 결제 후 1~3 영업일 이내 출고됩니다.</p>
                            <p>∙ 업체 직접 배송 : 배송 지역에 따라 배송 일자가 상이할 수 있으므로 상품 상세 페이지에서 확인 해주세요.</p>
                            <p></p>
                            <p>※ 영업일은 주말, 공휴일을 제외한 기간입니다.</p>
                            <p>※ 제조사의 사정에 따라 출고일은 지연될 수 있는 점 양해 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__여러+상품을+묶음+배송+받으려면+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">여러 상품을 묶음 배송 받으려면 어떻게 해야하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>각 상품별로 배송처가 상이할 수 있기 때문에 묶음 배송은 어렵습니다.</p>
                            <p>단, 배송처가 같은 경우 배송처의 정책에 따라 가능 할 수 있습니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__원하는+날짜로+맞춰서+배송을+받을수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">원하는 날짜로 맞춰서 배송을 받을수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>각 배송처 정책에 따라 상이할 수 있습니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__배송+시작+알림+메시지를+받았는데,+배송추적이+되지+않습니다.+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">배송 시작 알림 메시지를 받았는데, 배송추적이 되지 않습니다. 어떻게 해야하나요?<svg width="1em"
                                height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>송장번호 등록 후 1영업일 이내 또는 실제 상품배송이 진행됨과 동시에 배송추적이 가능합니다.</p>
                            <p></p>
                            <p>※ 배송처에서 배송이 시작되기 전, 송장을 먼저 출력 후 송장번호를 입력하는 경우가 있습니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__배송조회를+해보면+배송완료로+확인되는데+택배를+받지+못했습니다.+어떻게+해아하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">배송조회를 해보면 배송완료로 확인되는데 택배를 받지 못했습니다. 어떻게 해아하나요?<svg
                                width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>경비실 또는 무인택배함을 먼저 확인 부탁드립니다.</p>
                            <p>별도의 위탁 장소가 없는 경우 배송기사님께서 임의의 장소에 보관하셨을 수 있으니, 기사님께 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="배송관련__해외배송이+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">해외배송이 가능한가요?<svg width="1em" height="1em" viewBox="0 0 16 16"
                                preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>현재는 국내배송만 진행하고 있습니다.</p>
                        </div>
                    </section>
                </section>
                <section class="faq__contents__group">
                    <section id="취소+환불__주문+취소는+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">주문 취소는 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>판매처에서 주문을 확인하기 전이라면 언제든 취소하실 수 있으며, [나의 쇼핑 &gt; 주문배송내역 조회 &gt; 주문상세보기]에서 직접 주문취소하실 수 있습니다.</p>
                            <p></p>
                            <p>※ 이미 판매처에서 상품을 확인해 준비 중이라면, 직접 취소가 어렵습니다. 상세 페이지에 확인되는 판매자 연락처 또는 오늘의집 고객센터로 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="취소+환불__취소+후+환불은+언제되나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">취소 후 환불은 언제되나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>신용카드 및 체크카드의 경우 카드사에서 확인 절차를 거치는 관계로 평균 3~7일 영업일 이내 환불처리가 완료됩니다. </p>
                            <p>무통장 입금의 경우 평균 3영업일 이내 요청 하신 계좌로 환불됩니다.</p>
                            <p>휴대폰 소액결제의 경우 평균 3영업일 이내 환불 또는 취소 처리가 완료됩니다.</p>
                        </div>
                    </section>
                    <section id="취소+환불__여러+개의+상품을+주문했는데,+일부만+취소할+수도+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">여러 개의 상품을 주문했는데, 일부만 취소할 수도 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>신용카드 및 체크카드 또는 무통장 입금의 경우 배송 상태에 따라 결제후 부분 취소가 가능하며,배송상태에 따른 취소 가능 여부는 아래와 같습니다.</p>
                            <p>- 입금대기 및 결제완료 단계: 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 주문배송내역 조회]에서 즉시취소가능합니다.</p>
                            <p>- 배송준비중: 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기]로 취소 가능 여부 문의 부탁드립니다.</p>
                            <p>- 배송중 : 주문 취소가 불가능합니다. 수령후 반품 처리 부탁드립니다.</p>
                            <p></p>
                            <p>※ 단, 가상계좌로 입금 전이라면 부분 취소처리가 불가능하므로 재주문 부탁드립니다.</p>
                        </div>
                    </section>
                </section>
                <section class="faq__contents__group">
                    <section id="반품+교환__제품이+불량입니다.+반품+혹은+교환은+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">제품이 불량입니다. 반품 혹은 교환은 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>업체(브랜드)마다 발송처 및 반품절차가 다릅니다.</p>
                            <p>- 우측 상단 프로필 사진을 클릭 후 [나의쇼핑] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후 교환/반품 접수 후 진행 할수 있습니다. 교환/반품 접수 없이 임의로
                                반송한 경우에는 처리가 늦어질 수 있습니다.</p>
                            <p>- 교환/반품 접수 시 원활한 처리를 위해 불량 사진이 필요하오니, 가급적 사진을 첨부하여 주시기 바랍니다.</p>
                            <p>단, 구매확정 이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="반품+교환__제품의+교환+또는+반품을+할+수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">제품의 교환 또는 반품을 할 수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>상품을 수령하신 후 7일 이내에 교환, 반품이 가능하며, 고객님의 변심에 의한 교환/반품의 경우 배송비용이 부과될 수 있습니다.</p>
                            <p></p>
                            <p> ※ 단, 아래의 경우 교환/반품이 불가능합니다.</p>
                            <p>- 고객님의 책임 사유로 인해 상품 등이 멸실 또는 훼손된 경우</p>
                            <p>- 개봉 및 포장이 훼손으로 상품가치가 현저히 상실된 경우</p>
                            <p>- 시간 경과에 의해 재판매가 어려울정도로 상품 가치가 현저히 저하된 경우</p>
                            <p>- 고객주문 확인 후 상품제작에 들어가는 주문 제작 상품</p>
                            <p>- 직접 조립하는(DIY) 상폼을 조립 한 경우</p>
                        </div>
                    </section>
                    <section id="반품+교환__제품의+교환+또는+반품은+어떻게+신청+할+수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">제품의 교환 또는 반품은 어떻게 신청 할 수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>업체(브랜드)마다 발송처 및 반품절차가 다릅니다.</p>
                            <p>- 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 주문 상세보기] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후 교환/반품 접수 후 진행 할수 있습니다. </p>
                            <p>교환/반품 접수 없이 임의로 반송한 경우에는 처리가 늦어질 수 있습니다.</p>
                            <p>- 반품을 보내실때는 제품이 훼손되지 않도록 안전하게 충분히 포장 부탁드립니다.</p>
                            <p>단, 구매확정 이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="반품+교환__반품+시,+사은품도+같이+반품해야+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">반품 시, 사은품도 같이 반품해야 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>사은품도 같이 동봉하여 반품해 주셔야 반품처리가 완료됩니다.</p>
                        </div>
                    </section>
                    <section id="반품+교환__주문한+것과+다른+상품이+왔습니다.+어떻게+해아하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">주문한 것과 다른 상품이 왔습니다. 어떻게 해아하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기]를 통해 문의 주시면 확인 도움드리겠습니다.</p>
                        </div>
                    </section>
                </section>
                <section class="faq__contents__group">
                    <section id="증빙서류발급__세금계산서를+받고+싶은데+어떻게+해야+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">세금계산서를 받고 싶은데 어떻게 해야 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>세금계산서 발급은 어려우며, 결제 시 지출증빙 또는 현금영수증 발행은 가능합니다.</p>
                        </div>
                    </section>
                    <section id="증빙서류발급__주문+후+지출증빙/현금영수증+발행이+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">주문 후 지출증빙/현금영수증 발행이 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>주문 완료 후 지출증빙/현금영수증 발행은 불가능합니다. </p>
                            <p>지출증빙/현금영수증을 원하사는 경우 반드시 주문 시 "입금자 정보 입력"란에 지출증빙/소득공제 발행 신청을 선택 후 요청정보(주민등록번호/현금영수증
                                카드번호/휴대폰번호/사업자등록번호)를 입력하셔야 합니다.</p>
                        </div>
                    </section>
                    <section id="증빙서류발급__현금영수증+발급을+다른+사람으로+하고+싶습니다." class="faq__contents__item">
                        <div class="faq__contents__item__question">현금영수증 발급을 다른 사람으로 하고 싶습니다.<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>타인의 명의로 현금영수증 발급을 원하실경우 상품 주문 시 발급 받으실 고객님의 정보(주민등록번호/현금영수증 카드번호/휴대폰번호)를 입력해주시면 됩니다.</p>
                        </div>
                    </section>
                    <section id="증빙서류발급__주문건의+결제+금액을+나눠서+영수증+발행이+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">주문건의 결제 금액을 나눠서 영수증 발행이 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>주문하신 내역 중 일부 상품에 대해서만 분할로 영수증을 발급 받으실 수는 없습니다.</p>
                        </div>
                    </section>
                </section>
                <section class="faq__contents__group">
                    <section id="로그인+회원정보__카카오+계정으로+로그인+하면+'이미+카카오로+가입하신+이메일입니다'+라고+나오는데+어떻게+해야+하나요"
                        class="faq__contents__item">
                        <div class="faq__contents__item__question">카카오 계정으로 로그인 하면 '이미 카카오로 가입하신 이메일입니다' 라고 나오는데 어떻게 해야 하나요?<svg
                                width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>휴대전화 번호를 변경하셨거나 카카오톡 계정을 탈퇴하고 새로 가입하신 경우 이런 문제가 발생할 수 있습니다.이 경우 새로운 정보가 반영될 수 있도록 번거로우시더라도 고객센터로
                                문의 부탁드립니다.</p>
                            <p> 오늘의집 고객센터 1670-0876 (운영 시간 : 평일 09:00~18:00) - 마이페이지 &gt; 나의 쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기 - 카카오
                                플러스친구 '오늘의집 고객센터'로 문의</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__오늘의집에+가입한+적이+없는데+이미+가입된+이메일이라고+나와요.+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">오늘의집에 가입한 적이 없는데 이미 가입된 이메일이라고 나와요. 어떻게 하나요?<svg width="1em"
                                height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>현재 오늘의집은 회원 가입 시 이메일 인증 절차를 거치므로 이러한 문제가 발생되지 않지만 인증 절차 도입 전 다른 고객님께서 이메일을 잘못 입력하신 경우 '이미 가입한
                                이메일'이란 메시지가 노출될 수 있습니다.</p>
                            <p> 이는 고객님의 정보가 노출된 것이 아니니 걱정하지 마시고, 번거로우시겠지만 고객센터로 문의 부탁드립니다.</p>
                            <p> 오늘의집 고객센터 1670-0876 (운영 시간 : 평일 09:00~18:00) - 마이페이지 &gt; 나의 쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기 - 카카오
                                플러스친구 '오늘의집 고객센터'로 문의</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__오늘의집+웹에서는+애플+아이디로+로그인이+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">오늘의집 웹에서는 애플 아이디로 로그인이 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>애플 로그인은 앱에서만 사용이 가능합니다. 고객님들의 편의를 위해 웹에서도 애플 로그인이 가능하도록 현재 개발 중에 있습니다.</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__페이스북+간편+로그인+시도+시+'추가+정보+입력창과+이메일+주소+입력+시+이미+가입된+이메일입니다'라고+나오는데+어떻게+하나요"
                        class="faq__contents__item">
                        <div class="faq__contents__item__question">페이스북 간편 로그인 시도 시 '추가 정보 입력창과 이메일 주소 입력 시 이미 가입된 이메일입니다'라고
                            나오는데 어떻게 하나요?<svg width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>페이스북 계정을 변경하셨거나 새로 생성하여 간편 로그인 시도 시 이러한 오류가 발생될 수 있습니다.</p>
                            <p> 우선 로그인하시려는 페이스북 계정의 [메뉴 → 설정 및 개인정보 → 설정 → 앱 및 웹사이트 → 오늘의집 연동]이 정상적으로 되었는지 확인 부탁드리며, 정상적으로 로그인이
                                되지 않으시다면, 번거로우시겠지만 고객센터로 문의 부탁드립니다.</p>
                            <p> 오늘의집 고객센터 1670-0876 (운영 시간 : 평일 09:00~18:00) - 마이페이지 &gt; 나의 쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기 - 카카오
                                플러스친구 '오늘의집 고객센터'로 문의</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__비밀번호+변경은+어떻게하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">비밀번호 변경은 어떻게하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필 사진을 클릭 후 [마이홈 &gt; 설정 &gt; 비밀번호 변경] 페이지에서 비밀번호 변경이 가능합니다.</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__회원탈퇴+후+재가입이+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">회원탈퇴 후 재가입이 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 재가입은 언제든지 가능합니다.</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__회원정보를+수정하고+싶은데+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">회원정보를 수정하고 싶은데 어떻게 해야하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필 사진을 클릭 후 [마이홈 &gt; 설정 &gt; 회원정보수정] 페이지에서 회원 정보 수정이 가능합니다.</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__푸시+알림+설정은+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">푸시 알림 설정은 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>모바일앱을 통해 설정 가능하며 [마이페이지 &gt; 설정 &gt; 푸시 알림 설정]을 통해 푸시알림 수신 설정이 가능합니다.</p>
                        </div>
                    </section>
                    <section id="로그인+회원정보__회원탈퇴는+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">회원탈퇴는 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 PC 웹사이트 또는 모바일 앱에서 가능합니다.</p>
                            <p>PC 웹사이트: 우측 상단 프로필 사진 클릭 후 [마이페이지 &gt; 설정 &gt; 회원정보수정] 상단의 탈퇴하기 버튼 클릭해주세요.</p>
                            <p>모바일 앱: [마이페이지 &gt; 설정 &gt; 프로필 수정] 하단의 탈퇴하기 버튼을 클릭해주세요.</p>
                            <p>전문가 회원은 이메일 pro@bucketplace.net으로 문의해주시면 감사하겠습니다.</p>
                        </div>
                    </section>
                </section>
                <section class="faq__contents__group">
                    <section id="서비스+기타__&quot;좋아요&quot;를+누른+콘텐츠(사진/집들이/노하우/등)들은+어디서+볼+수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">"좋아요"를 누른 콘텐츠(사진/집들이/노하우/등)들은 어디서 볼 수 있나요?<svg width="1em"
                                height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>우측 상단 프로필 사진을 클릭 후 [마이홈 &gt; 좋아요] 페이지에서 확인 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__제품의+자세한+정보는+어떻게+알+수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">제품의 자세한 정보는 어떻게 알 수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>각 제품의 상세 페이지에서 확인 가능하며, 더욱 자세한 정보는 제품상세페이지 내 문의하기를 통해 판매 업체에 문의 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__좋지않은+댓글을+받았습니다.+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">좋지않은 댓글을 받았습니다. 어떻게 해야하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>댓글 아래에 신고 버튼을 눌러 댓글 신고가 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__인기게시글,+인기유저의+기준은+무엇인가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">인기게시글, 인기유저의 기준은 무엇인가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 추천 알고리즘에 따라 인기게시글과 유저가 뽑히게 됩니다.</p>
                            <p>많은 분들에게 공감되는 인테리어 사진을 통해 인기 유저가 되어보세요.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__오늘의집에서+다루는+컨텐츠는+어떤것이+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">오늘의집에서 다루는 컨텐츠는 어떤것이 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집에서 다루는 컨텐츠는 크게 사진, 온라인집들이, 전문가집들이, 노하우로 구분됩니다.</p>
                            <p>사진은 자신만의 인테리어 공간 및 소품등을 공유하는 소셜네트워크 공간입니다.여러분의 스타일링 사진을 자유롭게 올려주세요.</p>
                            <p>온라인집들이는 오늘의집 사용자들이 직접 집을 꾸민 후 인테리어에 후기와 구체적인 정보를 공유하는 컨텐츠 입니다. 여러분의 집을 소개하거나 다른 분의 집을 제보해주세요.</p>
                            <p>전문가집들이는 오늘의집의 인테리어 전문가들이 실제 시공 후 작성하는 포트폴리오 입니다.</p>
                            <p>노하우는 오늘의집유저, 파워블로거, 인테리어 전문가 분들이 만들어 가는 인테리어 가이드입니다. 여러분의 인테리어 관심을 언제나 열려있는 노하우 작가신청을 통해 공유해주세요.
                            </p>
                            <p></p>
                        </div>
                    </section>
                    <section id="서비스+기타__집들이와+노하우는+어떻게+업로드+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">집들이와 노하우는 어떻게 업로드 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 홈페이지 접속하신 다음 우측 상단 연필 모양 버튼 클릭 후 노하우 또는 집들이 업로드가 가능합니다.</p>
                            <p>모바일앱과 모바일웹은 지원하지 않으며 PC 웹사이트에서만 작성 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__인테리어+상담과+시공을+직접해주시나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">인테리어 상담과 시공을 직접해주시나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 전문가 찾기 서비스는 오늘의집 사용자와 인테리어 전문가님을 중개하는 서비스로, </p>
                            <p>오늘의집이 직접 상담과 시공을 진행하지 않습니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__전문가계정은+무엇인가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">전문가계정은 무엇인가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 전문가 계정은 홍보가 어려웠던 인테리어 전문가님에게</p>
                            <p>홍보를 효율적으로 관리하실 수 있게 마련된 계정입니다.</p>
                            <p>전문가 계정을 통해 오늘의집 100만 사용자들에게 더욱 손쉬운 홍보가 가능하니 많은 이용 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__전문가계정+신청은+어떻게하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">전문가계정 신청은 어떻게하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 전문가 전용 페이지 [Pro.ohou.se] 에서 가입 신청 하시거나,</p>
                            <p>[오늘의집 &gt; 회원가입 &gt; 시공전문가] 에서 신청하실 수 있습니다.</p>
                            <p>자세한 문의는 고객센터 혹은 카카오톡 '오늘의집 전문가'를 이용 부탁드립니다.!</p>
                        </div>
                    </section>
                    <section id="서비스+기타__모바일앱이+정상+동작하지+않아요.+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">모바일앱이 정상 동작하지 않아요. 어떻게 해야하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>먼저 사용하시는 어플리케이션 버전이 최신 버전인지 확인부탁드립니다.</p>
                            <p>최신 버전에서도 계속 장애가 발생한다면, [마이페이지 &gt; 설정 &gt; 의견보내기] 를 통해 신고 가능합니다.</p>
                            <p>신고시 반드시 사용하시는 플랫폼(안드로이드/iOS), 어플리케이션 버전 그리고 장애 내용과 발생되는 과정을 설명 부탁드립니다. </p>
                            <p>스크린샷을 첨부해 주시면 더욱 원활한 처리가 가능하니 참고 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__회원가입시+이미+가입된+이메일이라고+표시됩니다.+어떻게+해야하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">회원가입시 이미 가입된 이메일이라고 표시됩니다. 어떻게 해야하나요?<svg width="1em"
                                height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>contact@bucketplace.net으로 문의 부탁드립니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__오늘의집을+PC나+맥에서도+볼수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">오늘의집을 PC나 맥에서도 볼수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>가능합니다. 아이폰,안드로이드 어플리케이션과 함께 웹사이트도 제공하고있으며, 웹브라우저를 통해 https://ohou.se 로 접속하시면 보실 수 있습니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__오늘의집을+앱으로도+볼수+있나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">오늘의집을 앱으로도 볼수 있나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>가능합니다. 웹사이트와 함께 아이폰, 안드로이드 어플리케이션도 제공하고있으며, 앱스토어 또는 플레이스토어에서 "오늘의집"을 검색해 다운받을 수 있습니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__온라인+집들이에+우리집을+소개하고+싶어요.+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">온라인 집들이에 우리집을 소개하고 싶어요. 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집 PC 웹사이트에 접속하신 다음 우측 상단 연필 모양 버튼 클릭 후 집들이 선택 시 신청이 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__상담방법과+상담가능시간+유선번호는+어떻게+되나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">상담방법과 상담가능시간 유선번호는 어떻게 되나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>상담 시간은 평일 09:00 ~ 18:00 (주말 &amp; 공휴일 제외)이며, 전화번호는 1670-0876 입니다.</p>
                            <p>우측 상단 프로필 사진을 클릭 후 [나의쇼핑 &gt; 고객센터 &gt; 1:1 카톡 상담하기] 를 이용하시면 상담원과 채팅으로 더욱 빠르고 편리하게 문의 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__입점+및+제휴/광고+문의는+어떻게+하나요" class="faq__contents__item">
                        <div class="faq__contents__item__question">입점 및 제휴/광고 문의는 어떻게 하나요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>입점 신청은 https://partners.ohou.se/partner/applications/new 에서, </p>
                            <p>제휴/광고 문의는 https://ohou.se/contacts/new?type=request 페이지에서 신청 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__오늘의집+채용은+어디에서+확인+가능한가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">오늘의집 채용은 어디에서 확인 가능한가요?<svg width="1em" height="1em"
                                viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>http://bucketplace.co.kr/recruit 페이지에서 확인 가능합니다.</p>
                        </div>
                    </section>
                    <section id="서비스+기타__제가+쓴+리뷰가+블라인드+처리되었어요,+블라인드+처리+기준은+무엇인가요" class="faq__contents__item">
                        <div class="faq__contents__item__question">제가 쓴 리뷰가 블라인드 처리되었어요, 블라인드 처리 기준은 무엇인가요?<svg width="1em"
                                height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"
                                style="position: absolute; right: 0px; width: 12px; height: 12px; top: 50%; transition: transform 0.2s ease 0s; transform: translateY(-50%);">
                                <path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z">
                                </path>
                            </svg></div>
                        <div class="faq__contents__item__answer" style="max-height: 0px; opacity: 0; padding-top: 0px;">
                            <p>오늘의집은 상품의 실사용 정보를 얻기 힘든 가구 및 인테리어 제품 등의 구매 과정에서 해당 제품을 직접 사용한 유저들이 생생하고 진실된 리뷰를 올리고 이를 서로 활용하는
                                문화를 만들어가고자 합니다.</p>
                            <p></p>
                            <p>오늘의집을 이용해주시는 모두에게 유용하고 진실된 리뷰가 공유될 수 있도록, 다음 금지행위에 해당되는 리뷰는 오늘의집 서비스 이용 약관 제24조에 따라 고객에게 통보 없이 삭제
                                또는 블라인드 될 수 있습니다. 관련 문의사항은 고객센터로 문의주시기 바랍니다.</p>
                            <p></p>
                            <p>&lt;리뷰 작성 시 금지행위&gt;</p>
                            <p>1. 특정업체 또는 개인의 영리적 목적을 위한 리뷰 게시</p>
                            <p> - 판매자 또는 판매자의 이해관계인(가족 또는 직원 등)이 판매자의 상품에 대한 리뷰 게시</p>
                            <p> - 판매자 또는 판매자의 이해관계인이 경쟁사의 상품에 대한 부정적인 내용 등 비방 목적으로 인정될 수 있는 리뷰 게시</p>
                            <p> - 특정업체의 제품에 대하여 특정 내용의 리뷰 작성 조건으로 대가(예: 금전적 보상, 상품 할인, 무료 제품 제공 등)를 제공받고 이를 밝히지 않는 등 표시광고법령을
                                위반하는 내용의 리뷰 게시</p>
                            <p> - 동일 상품에 대해 반복적 리뷰 게시</p>
                            <p>2. 상품에 대한 부적합한 정보 게시</p>
                            <p> - 허위 또는 과장된 내용 게시</p>
                            <p> - 직접 작성하지 않았거나 구매한 상품과 관련 없는 내용, 사진 게시 (예: 상품 페이지 캡쳐, 타/유사상품 리뷰)</p>
                            <p>3. 타인의 권리 등을 침해할 수 있는 내용 게시</p>
                            <p> - 타인의 개인정보나 사생활을 공개하는 내용 게시(예: 타인의 전화번호, 이메일 주소, 우편 주소 등)</p>
                            <p> - 정당한 권한 없이 타인의 지식재산권, 기타 소유권, 명예, 신용 등을 침해하는 내용 게시</p>
                            <p>4. 불쾌함 등을 유발하거나 반사회적인 내용 게시</p>
                            <p> - 욕설, 폭언, 비방 등 타인에게 불쾌하거나 위협이 되는 내용 게시</p>
                            <p> - 불법물, 음란물 또는 청소년 유해 매체물 게시</p>
                            <p> - 범죄행위나 불법적인 행동을 전시 또는 조장하는 내용 게시 (예: 폭력, 불법 약물 사용, 미성년자 음주, 아동 또는 동물 학대 포함</p>
                            <p>5. 기타 부적절한 내용 게시</p>
                            <p> - 정보통신기기의 오작동을 일으킬 수 있는 악성코드나 데이터를 포함한 내용 게시(예: 피싱, 멀웨어 사이트 링크 등)</p>
                            <p> - 사기성 상품, 서비스, 사업 계획 등을 판촉하는 내용 게시</p>
                            <p>6. 기타 관련법령 및 이용약관, 운영정책에 위배되는 경우</p>
                        </div>
                    </section>
                    <script>
                        $(document).ready(function () {

                            /* 카테고리 토글 */
                            $(".faq__contents__item__answer").hide();
                            /* 토글 다운 밑의 메뉴를 우선 숨기고 */
                            $(".faq__contents__item__question", this).click(function () {
                                var open = $(this).parents(".faq__contents__item__answer").siblings(".faq__contents__item__answer").slide;
                                /* 위의 구문은 열고 싶어하는 토글 하단 메뉴까지 움직이는 걸 나타냄 */
                                /* 예를 들어 버튼의 부모중의 div 그 부분에서 형제중의 div */
                                console.log(open[0]);
                                /* 형제 중의 div에서 첫번째를 찍어보기 저는 근접해서 이렇게 찍었습니다. */
                                $(open[0]).slideToggle();
                                /* 클릭시 토글 하단 메뉴가 왔다갔다 켜지는 부분 */
                            });
                        });
                    </script>
                    
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