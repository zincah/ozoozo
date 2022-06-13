<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach items="${couponList}" var="coupon">
    <tr class="content-table-content content-hover">
        <td class="content-table-content-text">
            <input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault" />
        </td>
        <td class="content-table-content-text">

            <div class="coupon_title"><button class="btn clickbtn" value="${coupon.coupon_id}">${coupon.coupon_title}</button>

            </div>
            <div class="coupon_sub_title">${coupon.coupon_subtitle}</div>

        </td>
        <td class="content-table-content-text">${coupon.coupon_type}</td>
        <!--<td class="content-table-content-text">0회</td>-->
        <td class="content-table-content-text"><fmt:formatDate value="${coupon.coupon_startdate}" pattern="yyyy-MM-dd " /><span>~</span><fmt:formatDate value="${coupon.coupon_enddate}" pattern="yyyy-MM-dd "/> </td>
        <td class="content-table-content-text"><fmt:formatDate value="${coupon.coupon_create}" pattern="yyyy-MM-dd "/> </td>
        <td class="content-table-content-text">${coupon.coupon_id}</td>
        <td class="content-table-content-text state0">${coupon.coupon_status}</td>
    </tr>
</c:forEach>