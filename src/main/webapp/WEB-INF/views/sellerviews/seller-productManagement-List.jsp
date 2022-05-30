<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" value="${totalcount}" id="totalcount">
<input type="hidden" value="${pageMaker.getPageNum()}" id="pageMakerGetPageNum">
<input type="hidden" value="${pageMaker.getAmount()}" id="pageMakerGetAmount">
<c:forEach var="searchProductList" items="${searchProductList}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line checkTd">
			<c:if test="${searchProductList.getStatus() ne '승인대기'}">
				<input class="form-check-input check" type="checkbox" value="" />
			</c:if>
			<c:if test="${searchProductList.getStatus() eq '승인대기'}">
				<input class="form-check-input" type="checkbox" value="" disabled />
			</c:if>
		</td>
		<td class="content-table-content-text option-line state0">${searchProductList.getProduct_id()}</td>
		<td class="content-table-content-text option-line">${searchProductList.getProduct_seller_code()}</td>
		<td class="content-table-content-text option-line">${searchProductList.getProduct_title()}</td>
		<td class="content-table-content-text option-line"><fmt:formatNumber
				value="${searchProductList.getProduct_price()}" type="currency" /></td>
		<td class="content-table-content-text option-line">${searchProductList.getCategory_name()}</td>
		<td class="content-table-content-text option-line productListStatus">${searchProductList.getStatus()}</td>
		<td class="content-table-content-text option-line">${searchProductList.getProduct_quantity()}</td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${searchProductList.getProduct_created()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${searchProductList.getProduct_updated()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
	</tr>
</c:forEach>