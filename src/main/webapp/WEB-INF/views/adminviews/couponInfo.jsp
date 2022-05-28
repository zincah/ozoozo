<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<tr class="content-table-content">
    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">등록일</td>
    <td colspan="2" class="content-table-content-text" id="info_date"><fmt:formatDate value="${couponViewData.coupon_create}" pattern="yyyy-MM-dd"/> </td>
    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">담당자</td>
    <td colspan="2" class="content-table-content-text" id="info_charge">이인하</td>
</tr>

<tr class="content-table-content">
    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">시작일</td>
    <td colspan="2" class="content-table-content-text"><fmt:formatDate value="${couponViewData.coupon_startdate}"
    pattern="yyyy-MM-dd"/>

    </td>
    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">종료일</td>
    <td colspan="2" class="content-table-content-text">
        <fmt:formatDate value="${couponViewData.coupon_enddate}" pattern="yyyy-MM-dd"/>

    </td>

</tr>

<tr class="content-table-content">

    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">쿠폰 사용조건</td>
    <td colspan="2" class="content-table-content-text">
        <input type="number" class="form-control table-input" id="coupon_more" value="${couponViewData.coupon_more}">

    </td>


    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5;">할인 금액(할인율)</td>
    <td colspan="2" class="content-table-content-text">
        <input type="number" class="form-control table-input" id="coupon_discount" value="${couponViewData.coupon_discount}">

    </td>
</tr>

<tr class="content-table-content">
    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5">쿠폰 제목</td>
    <td colspan="5" class="content-table-content-text">
        <input type="text" class="form-control table-input" id="coupon_title" style="display: inherit" value="${couponViewData.coupon_title}">
    </td>
</tr>
<tr class="content-table-content">
    <td colspan="1" class="content-table-content-text content-table-title" style="background-color: #f5f5f5">쿠폰 내용</td>
    <td colspan="5" class="content-table-content-text">
        <textarea class="form-control table-input" id="coupon_content" >${couponViewData.coupon_subtitle}</textarea>
    </td>
</tr>

<tr class="content-table-content text-end">
    <td colspan="6">
        <button type="button" class="btn btn-secondary modi_btn" value="${couponViewData.coupon_id}">수정</button>
        <button type="button" class="btn btn-secondary stop_btn">중지</button>
        <button type="button" class="btn btn-danger del_btn">삭제</button>

    </td>
</tr>
