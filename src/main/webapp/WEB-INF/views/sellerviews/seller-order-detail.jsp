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
					<td class="content-table-title-text option-line">주문날짜</td>
					<td class="content-table-title-text option-line">주문번호</td>
					<td class="content-table-title-text option-line">판매자 상품코드</td>
					<td class="content-table-title-text option-line">상품명</td>
					<td class="content-table-title-text option-line">옵션정보</td>
					<td class="content-table-title-text option-line">판매가</td>
					<td class="content-table-title-text option-line">주문 수량</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="orderDetailList" items="${orderDetailList}">
					<tr class="content-table-content content-hover">
						<td class="content-table-content-text option-line"
							data-bs-toggle="modal" data-bs-target="#modal-view-order"><fmt:formatDate
								value="${orderDetailList.getOrder_date()}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td class="content-table-content-text option-line state0"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">
							${orderDetailList.getOrder_id()}</td>
						<td class="content-table-content-text option-line"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderDetailList.getProduct_seller_code()}</td>
						<td class="content-table-content-text option-line"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderDetailList.getProduct_title()}</td>
						<td class="content-table-content-text option-line"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">
							${orderDetailList.getOption1()} <c:if
								test="${orderDetailList.getOption2() ne ''}">
											 / ${orderDetailList.getOption2()}
										</c:if>
						</td>
						<td class="content-table-content-text option-line"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderDetailList.getProduct_price()}</td>
						<td class="content-table-content-text option-line"
							data-bs-toggle="modal" data-bs-target="#modal-view-order">${orderDetailList.getQuantity()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="marginTop">
	<span class="content-view-title-text">결제/배송 정보</span>
</div>
<div class="modal-delete-select-product marginTop1"
	id="selectOrderDetailView2">
	<div class="product-list-group">
		<div
			class="container container-option container-option-topPadding bottomline topline">
			<div class="row optionGroup1">
				<div class="col-2 view-title">주문자 이메일</div>
				<div class="col">${orderDetailPayment.getUser_email()}</div>
				<div class="col-2 view-title-last">최종 결제금액(결제금액-할인금액)</div>
				<div class="col">${orderDetailPayment.getPy_final()}</div>
			</div>
		</div>
	</div>
	<div class="product-list-group">
		<div
			class="container container-option container-option-topPadding bottomline">
			<div class="row optionGroup1">
				<div class="col-2 view-title">결제수단</div>
				<div class="col">${orderDetailPayment.getPayment_way()}</div>
				<div class="col-2 view-title-last">결제정보</div>
				<div class="col">${orderDetailPayment.getPayment_info()}</div>
			</div>
		</div>
	</div>
	<div class="product-list-group">
		<div
			class="container container-option container-option-topPadding bottomline">
			<div class="row optionGroup1">
				<div class="col-2 view-title">택배회사</div>
				<div class="col">${orderDetailPayment.getDelivery()}</div>
				<div class="col-2 view-title-last">송장번호</div>
				<div class="col">${orderDetailPayment.getInvoice_number()}</div>
			</div>
		</div>
	</div>
	<div class="product-list-group">
		<div
			class="container container-option container-option-topPadding bottomline">
			<div class="row optionGroup1">
				<div class="col-2 view-title-last">배송금액</div>
				<div class="col">${orderDetailPayment.getShipping_fee()}</div>
				<div class="col-2 view-title-last">배송메세지</div>
				<div class="col">${orderDetailPayment.getMemo()}</div>
			</div>
		</div>
	</div>
	<div class="product-list-group">
		<div
			class="container container-option container-option-topPadding bottomline">
			<div class="row optionGroup1">
				<div class="col-2 view-title">배송지</div>
				<div class="col">${orderDetailPayment.getAddress1()}
					${orderDetailPayment.getAddress2()}</div>
			</div>
		</div>
	</div>
</div>