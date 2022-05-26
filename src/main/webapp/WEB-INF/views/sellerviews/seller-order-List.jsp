<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="searchOrderList" items="${searchOrderList}" varStatus="status">
	<c:choose>
		<c:when test="${searchOrderList.getRefund_id() ne null and searchOrderList.getOrder_status() ne '환불처리'}"></c:when>
		<c:otherwise>
			<tr class="content-table-content content-hover">
				<td class="content-table-content-text option-line checkTd">
					<c:choose>
						<c:when test="${searchOrderList.getOrder_status() ne '배송완료' and searchOrderList.getOrder_status() ne '구매확정'}">
								<input class="form-check-input check" type="checkbox" value="" />
						</c:when>
						<c:otherwise>
								<input class="form-check-input" type="checkbox" value="" disabled />
						</c:otherwise>
					</c:choose>
				</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">
					<fmt:formatDate value="${searchOrderList.getOrder_date()}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td class="content-table-content-text option-line state0" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">
					<span name="orderId${status.index}">${searchOrderList.getOrder_id()}</span>
					(<span name="orderList${status.index}">${searchOrderList.getOrder_num()}</span>)
				</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getOrder_status()}</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getProduct_seller_code()}</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getProduct_title()}</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">
					${searchOrderList.getOption1()}
					<c:if test="${searchOrderList.getOption2() ne ''}">
						 / ${searchOrderList.getOption2()}
					</c:if>
				</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getQuantity()}</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getReceiver()}</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getPhone_num()}</td>
				<td class="content-table-content-text option-line" onclick="orderDetailView(${status.index})"
					data-bs-toggle="modal" data-bs-target="#modal-view-order">${searchOrderList.getAddress1()}</td>
			</tr>
		</c:otherwise>
	</c:choose>
</c:forEach>