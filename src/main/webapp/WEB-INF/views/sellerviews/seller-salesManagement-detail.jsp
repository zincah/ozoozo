<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-delete-select-product">
	<div class="product-list-group">
		<table class="table table-box-style">
			<thead>
				<tr class="content-table-title">
					<td class="content-table-title-text option-line">날짜</td>
					<td class="content-table-title-text option-line">주문번호(그룹)</td>
					<td class="content-table-title-text option-line">구분</td>
					<td class="content-table-title-text option-line">결제금액</td>
					<td class="content-table-title-text option-line">수량</td>
					<td class="content-table-title-text option-line">할인</td>
					<td class="content-table-title-text option-line">배송비</td>
					<td class="content-table-title-text option-line">판매이익</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="salesDetailListView" items="${salesDetailListView}" varStatus="status">
					<tr class="content-table-content">
						<td class="content-table-content-text option-line">
							<fmt:formatDate value="${salesDetailListView.getOrder_date()}" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td class="content-table-content-text option-line state0">
							${salesDetailListView.getOrder_id()}
							(${salesDetailListView.getOrder_num()})
						</td>
						<td class="content-table-content-text option-line">${salesDetailListView.getPayment_way()}</td>
						<td class="content-table-content-text option-line">
							<fmt:formatNumber value="${salesDetailListView.getPayment_total()}" pattern="#,###" />
						</td>
						<td class="content-table-content-text option-line">
							<fmt:formatNumber value="${salesDetailListView.getQuantity()}" pattern="#,###" />
						</td>
						<td class="content-table-content-text option-line">
							<fmt:formatNumber value="${salesDetailListView.getPy_discount()}" pattern="#,###" />
						</td>
						<td class="content-table-content-text option-line">
							<fmt:formatNumber value="${salesDetailListView.getShipping_fee()}" pattern="#,###" />
						</td>
						<td class="content-table-content-text option-line">
							<fmt:formatNumber value="${salesDetailListView.getPy_final()}" pattern="#,###" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>