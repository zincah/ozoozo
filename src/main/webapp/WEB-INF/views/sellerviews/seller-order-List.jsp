<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="searchOrderList" items="${searchOrderList}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line checkTd">
			<c:if test="${searchOrderList.getOrder_status() ne '배송중'}">
				<input class="form-check-input check" type="checkbox" value="" />
			</c:if>
			<c:if test="${searchOrderList.getOrder_status() eq '배송중'}">
				<input class="form-check-input" type="checkbox" value="" disabled />
			</c:if>
		</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">
			<fmt:formatDate value="${searchOrderList.getOrder_date()}" pattern="yyyy-MM-dd HH:mm" /></td>
		<td class="content-table-content-text option-line state0"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getOrder_id()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getOrder_status()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getProduct_seller_code()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getProduct_title()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">
			${searchOrderList.getOption1()}
			<c:if test="${searchOrderList.getOption2() ne ''}">
				 / ${searchOrderList.getOption2()}
			</c:if>
		</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getQuantity()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getReceiver()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getPhone_num()}</td>
		<td class="content-table-content-text option-line"
			data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getAddress1()}</td>
	</tr>
</c:forEach>