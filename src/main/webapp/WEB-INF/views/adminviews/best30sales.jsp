<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<input type="hidden" value="${totalCount }" id="bestCount">
<input type="hidden" value="${pageMaker.getPageNum()}" id="pageNum">
<c:forEach items="${bestList }" var="best">
<tr class="content-table-content content-hover">
   <td class="content-table-content-text option-line">
     <input class="check2 form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" />
   </td>
   <td class="content-table-content-text option-line">${best.post_id }</td>
   <td class="content-table-content-text option-line">${best.company_name }</td>
   <td class="content-table-content-text option-line">${best.post_name }</td>
   <td class="content-table-content-text option-line">${best.cate_name }</td>
   <td class="content-table-content-text option-line">
		<fmt:formatNumber type="number" maxFractionDigits="3" value="${best.sale_price}" var="saleprice"/>
           		${saleprice }
	</td>
   <td class="content-table-content-text option-line">${best.quantity }</td>
   <td class="content-table-content-text option-line">
		<fmt:formatNumber type="number" maxFractionDigits="3" value="${best.payment}" var="payment"/>
           		${payment }
	</td>
   <td class="content-table-content-text option-line">${best.cnt }</td>
   <td class="content-table-content-text option-line">
		<fmt:formatDate value="${best.post_created }" pattern="yyyy-MM-dd HH:mm" />
	</td>
   <c:choose>
   	<c:when test="${best.today_deal eq true }">
   		<td class="content-table-content-text">오늘의딜</td>
   	</c:when>
   	<c:when test="${best.today_deal eq false }">
   		<td class="content-table-content-text">-</td>
   	</c:when>
   </c:choose>
 </tr>
</c:forEach>