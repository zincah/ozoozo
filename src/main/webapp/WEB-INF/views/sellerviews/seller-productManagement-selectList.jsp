<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="selectProductListView" items="${selectProductListView}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line state0">${selectProductListView.getProduct_id()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getProduct_seller_code()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getProduct_title()}</td>
		<td class="content-table-content-text option-line"><fmt:formatNumber
				value="${selectProductListView.getProduct_price()}" type="currency" /></td>
		<td class="content-table-content-text option-line">${selectProductListView.getCategory_name()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getStatus()}</td>
		<td class="content-table-content-text option-line">${selectProductListView.getProduct_quantity()}</td>
	</tr>
</c:forEach>