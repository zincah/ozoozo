<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="selectOrderList" items="${selectOrderList}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order"><fmt:formatDate
				value="${selectOrderList.getOrder_date()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
		<td class="content-table-content-text option-line state0"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">
			${selectOrderList.getOrder_id()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderList.getProduct_seller_code()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderList.getProduct_title()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">
			${selectOrderList.getOption1()} <c:if
				test="${selectOrderList.getOption2() ne ''}">
											 / ${selectOrderList.getOption2()}
										</c:if>
		</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order"><fmt:formatNumber
				value="${selectOrderList.getProduct_price()}" pattern="#,###" /></td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderList.getQuantity()}</td>
	</tr>
</c:forEach>