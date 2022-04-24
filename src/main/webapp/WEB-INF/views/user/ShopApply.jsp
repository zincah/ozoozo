<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel='stylesheet' type='text/css'  href='../css/ShopApply/public.css'>
    <link rel='stylesheet' type='text/css'  href='../css/ShopApply/ShopApply.css'>
</head>
<body cz-shortcut-listen="true">
    <!-- header -->
    <header id="sales-application-gnb" class="sales-application-gnb">
        <span class="icon-page-sales-application__a-1" aria-hidden="true"></span>
      </header>
    <!-- main -->
    <main role="main" id="root">
        <div id="seller-layout--APPLICATION" class="seller-layout seller-layout--APPLICATION">
            <div class="container">
                <div class="justify-center seller-layout__header">
                    <h1 class="seller-layout__header__title">입점신청</h1>
                    <div class="row seller-layout__header__explain">
                        <ul class="seller-layout__header__explain__list">
                            <li>입점 신청을 하시면 내부 검토 후에 개별적으로 입점 가능 여부와 계약 절차를 안내드립니다.</li>
                            <li>입점 검토까지 시일이 다소 소요될 수 있으니,&nbsp; 고객센터를 통한 MD연락처 및 가능여부 문의는 피해주시길 바랍니다.</li>
                            <li>입점 불가의 경우 별도 회신을 드리지 못하는 점 양해 부탁 드립니다.</li>
                            <li>중복 입점 신청이 불가능합니다.&nbsp; 입점 신청이 불가능한 경우&nbsp;<a
                                    href="mailto:sellers@bucketplace.net">sellers@bucketplace.net</a>&nbsp;(수신전용 메일)로 문의 부탁드립니다.
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row justify-center seller-layout__divider">
                    <hr class="col-10 seller-layout__hr">
                </div>
            </div>
            <div class="container seller-layout__body">
                <form id="sales-form--application" class="sales-form sales-form--application" action="/partner/applications"
                    method="post" accept-charset="UTF-8"><input type="hidden" name="authenticity_token"
                        value="VaCidCCMNCd/uTcER9vtdmxOzEKo2dDCcUaXuHlDDxpEJ4O8U9sQbyzUuyCXb5iMJuI48O68ewgJG19kfVYXFQ==">
                    <div class="sales-form__section">
                        <div class="row">
                            <div class="offset-1 col-10">
                                <p class="sales-form__section__title">회사 정보</p>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__company"
                                    class="form-label sales-form__form-label">회사 이름<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="text" id="sales_application__company"
                                        name="sales_application[company]" class="form-control" placeholder="오늘의집" value="">
                                </div>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__license1"
                                    class="form-label sales-form__form-label">사업자 등록번호<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="tel" id="sales_application__license1"
                                        name="sales_application[license1]" class="form-control" placeholder="123" value=""><span
                                        class="sales-form__divider">-</span><input type="tel" id="sales_application__license2"
                                        name="sales_application[license2]" class="form-control" placeholder="45" value=""><span
                                        class="sales-form__divider">-</span><input type="tel" id="sales_application__license3"
                                        name="sales_application[license3]" class="form-control" placeholder="67890" value="">
                                </div>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__homepage"
                                    class="form-label sales-form__form-label">홈페이지</label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="text" id="sales_application__homepage"
                                        name="sales_application[homepage]" class="form-control" placeholder="www.ohou.se"
                                        value=""></div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-center seller-layout__divider">
                        <hr class="col-10 seller-layout__hr">
                    </div>
                    <div class="sales-form__section">
                        <div class="row">
                            <div class="offset-1 col-10">
                                <p class="sales-form__section__title">영업담당자 정보</p>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__sales"
                                    class="form-label sales-form__form-label">이름<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="text" id="sales_application__sales"
                                        name="sales_application[sales]" class="form-control" placeholder="집냥이" value=""></div>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__sales_phone1"
                                    class="form-label sales-form__form-label">전화번호<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="tel"
                                        id="sales_application__sales_phone1" name="sales_application[sales_phone1]"
                                        class="form-control" placeholder="010" value=""><span
                                        class="sales-form__divider">-</span><input type="tel"
                                        id="sales_application__sales_phone2" name="sales_application[sales_phone2]"
                                        class="form-control" placeholder="1234" value=""><span
                                        class="sales-form__divider">-</span><input type="tel"
                                        id="sales_application__sales_phone3" name="sales_application[sales_phone3]"
                                        class="form-control" placeholder="5678" value=""></div>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__email_username"
                                    class="form-label sales-form__form-label">이메일<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="text"
                                        id="sales_application__sales_email" name="sales_application[sales_email]"
                                        class="form-control" placeholder="zipnyang@ohou.se" value=""></div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-center seller-layout__divider">
                        <hr class="col-10 seller-layout__hr">
                    </div>
                    <div class="sales-form__section">
                        <div class="row">
                            <div class="offset-1 col-10">
                                <p class="sales-form__section__title">상품 정보</p>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__brand"
                                    class="form-label sales-form__form-label">대표브랜드 이름<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8">
                                <div class="sales-form__form-control-wrap"><input type="text" id="sales_application__brand"
                                        name="sales_application[brand]" class="form-control" placeholder="오늘의집 가구" value="">
                                </div>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__product_categories"
                                    class="form-label sales-form__form-label">취급 카테고리<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8"><input type="hidden" id="sales_application__product_categories"
                                    name="sales_application[product_categories]" value="">
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--주방"><input type="checkbox"
                                            id="sales_application__category--주방" name="sales_application[category--주방]"
                                            class="form-check category__checkbox" value="주방"><span
                                            class="check-img"></span>주방</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--헬스/반려/캠핑"><input type="checkbox"
                                            id="sales_application__category--헬스/반려/캠핑"
                                            name="sales_application[category--헬스/반려/캠핑]" class="form-check category__checkbox"
                                            value="헬스/반려/캠핑"><span class="check-img"></span>헬스/반려/캠핑</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--생활용품"><input type="checkbox"
                                            id="sales_application__category--생활용품" name="sales_application[category--생활용품]"
                                            class="form-check category__checkbox" value="생활용품"><span
                                            class="check-img"></span>생활용품</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--가구"><input type="checkbox"
                                            id="sales_application__category--가구" name="sales_application[category--가구]"
                                            class="form-check category__checkbox" value="가구"><span
                                            class="check-img"></span>가구</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--홈데코/조명"><input type="checkbox"
                                            id="sales_application__category--홈데코/조명" name="sales_application[category--홈데코/조명]"
                                            class="form-check category__checkbox" value="홈데코/조명"><span
                                            class="check-img"></span>홈데코/조명</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--시공/서비스"><input type="checkbox"
                                            id="sales_application__category--시공/서비스" name="sales_application[category--시공/서비스]"
                                            class="form-check category__checkbox" value="시공/서비스"><span
                                            class="check-img"></span>시공/서비스</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--렌탈"><input type="checkbox"
                                            id="sales_application__category--렌탈" name="sales_application[category--렌탈]"
                                            class="form-check category__checkbox" value="렌탈"><span
                                            class="check-img"></span>렌탈</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--패브릭"><input type="checkbox"
                                            id="sales_application__category--패브릭" name="sales_application[category--패브릭]"
                                            class="form-check category__checkbox" value="패브릭"><span
                                            class="check-img"></span>패브릭</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--수납/정리"><input type="checkbox"
                                            id="sales_application__category--수납/정리" name="sales_application[category--수납/정리]"
                                            class="form-check category__checkbox" value="수납/정리"><span
                                            class="check-img"></span>수납/정리</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--식품"><input type="checkbox"
                                            id="sales_application__category--식품" name="sales_application[category--식품]"
                                            class="form-check category__checkbox" value="식품"><span
                                            class="check-img"></span>식품</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--가전"><input type="checkbox"
                                            id="sales_application__category--가전" name="sales_application[category--가전]"
                                            class="form-check category__checkbox" value="가전"><span
                                            class="check-img"></span>가전</label></div>
                                <div class="form-check sales-form__form-check"><label class="form-check-label"
                                        for="sales_application__category--DIY/공구"><input type="checkbox"
                                            id="sales_application__category--DIY/공구" name="sales_application[category--DIY/공구]"
                                            class="form-check category__checkbox" value="DIY/공구"><span
                                            class="check-img"></span>DIY/공구</label></div>
                            </div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__about_product"
                                    class="form-label sales-form__form-label">상품 소개<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8"><textarea id="sales_application__about_product"
                                    name="sales_application[about_product]" class="form-control"
                                    placeholder="판매하시는 상품에 대한 설명을 입력해주세요."></textarea></div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__other_market"
                                    class="form-label sales-form__form-label">타입점 쇼핑몰<span
                                        class="sales-form__form-group__required">*</span></label></div>
                            <div class="col-8"><input type="text" id="sales_application__other_market"
                                    name="sales_application[other_market]" class="form-control"
                                    placeholder="예시) 11번가, 쿠팡 등 현재 입점몰을 입력해주세요." value=""></div>
                        </div>
                        <div class="row sales-form__form-group">
                            <div class="offset-1 col-2"><label for="sales_application__sale_file"
                                    class="form-label sales-form__form-label">판매 관련 파일 첨부</label></div>
                            <div class="col-8"><input type="hidden" id="sales_application__sale_file_url"
                                    name="sales_application[sale_file_url]" value=""><label
                                    class="btn btn-sm btn-priority sales-form__file__btn">파일 업로드<input type="file"
                                        id="sales-form__file__uploader" class="sales-form__file--uploader" data-max-size="1048"
                                        accept=".png,.jpg,.jpeg,.pdf,.ppt"></label>
                                <p class="sales-form__file__name">선택된 파일이 없습니다.</p>
                                <p class="sales-form__file__caption">※ 참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로
                                    첨부해주세요.<br>첨부파일 관련 URL주소가 있다면 상품 소개 입력창에 남겨주세요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-center seller-layout__divider">
                        <hr class="col-10 seller-layout__hr">
                    </div>
                    <div class="sales-form__section">
                        <div class="row">
                            <div class="offset-1 col-10">
                                <p class="sales-form__section__title">개인정보 수집 및 이용 동의</p>
                            </div>
                        </div>
                        <div class="row sales-form__private-policy">
                            <div class="offset-1 col-10">
                                <p class="sales-form__private-policy__caption">㈜버킷플레이스는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련
                                    법령상의 개인정보보호 규정을 준수하며, 판매자님이 입점신청 시 필요한 최소한의 개인 정보를 수집합니다.</p>
                                <table class="sales-form__private-policy__info">
                                    <thead>
                                        <tr>
                                            <td>목적</td>
                                            <td>항목</td>
                                            <td>보유기간</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>판매자 식별, 입점 검토, 공지사항의 전달</td>
                                            <td>영업담당자의 이름/전화번호/이메일</td>
                                            <td>입점 처리기간이 종료되는 시점</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="sales-form__private-policy__agree"
                                    class="form-check sales-form__private-policy__agree"><label class="form-check-label"
                                        for="sales-form__private-policy__agree__check"><input type="checkbox"
                                            id="sales-form__private-policy__agree__check" class="form-check"><span
                                            class="check-img"></span>입점신청을 위한 개인정보 수집 및 이용에 동의&nbsp;<span
                                            class="sales-form__private-policy__agree__require">(필수)</span></label></div>
                            </div>
                        </div>
                    </div>
                    <div class="sales-form__btn-apply"><button class="btn btn-lg btn-priority" type="submit">입점신청 완료</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <!-- pooter -->
</body>
</html>