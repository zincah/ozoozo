<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="productListView" items="${productListView}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line"><input
			class="form-check-input check" type="checkbox" value="" /></td>
		<td class="content-table-content-text option-line state0">${productListView.getProduct_id()}</td>
		<td class="content-table-content-text option-line">${productListView.getProduct_seller_code()}</td>
		<td class="content-table-content-text option-line">${productListView.getProduct_title()}</td>
		<td class="content-table-content-text option-line"><fmt:formatNumber
				value="${productListView.getProduct_price()}" type="currency" /></td>
		<td class="content-table-content-text option-line">${productListView.getCategory_name()}</td>
		<td class="content-table-content-text option-line">${productListView.getStatus()}</td>
		<td class="content-table-content-text option-line">${productListView.getProduct_quantity()}</td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${productListView.getProduct_created()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${productListView.getProduct_updated()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
	</tr>
</c:forEach>