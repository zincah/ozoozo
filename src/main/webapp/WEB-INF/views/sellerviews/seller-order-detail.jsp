<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-dialog modal-dialog-centered modal-dialog-order">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">주문 상세조회</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal"
				aria-label="Close"></button>
		</div>
		<div class="modal-body modal-status-select-product">
			<div>
				<span class="content-view-title-text">주문 정보</span>
			</div>
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
								<td class="content-table-title-text option-line">수량</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="selectPostingListView" items="${selectOrderListView}">
								<tr class="content-table-content content-hover">
									<td class="content-table-content-text option-line"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">
										<fmt:formatDate value="${selectOrderListView.getOrder_date()}" pattern="yyyy-MM-dd HH:mm" /></td>
									<td class="content-table-content-text option-line state0"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">
										${selectOrderListView.getOrder_id()}
									</td>
									<td class="content-table-content-text option-line"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderListView.getProduct_seller_code()}</td>
									<td class="content-table-content-text option-line"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderListView.getProduct_title()}</td>
									<td class="content-table-content-text option-line"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">
										${selectOrderListView.getOption1()}
										<c:if test="${selectOrderListView.getOption2() ne ''}">
											 / ${selectOrderListView.getOption2()}
										</c:if>
									</td>
									<td class="content-table-content-text option-line"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderListView.getQuantity()}</td>
									<td class="content-table-content-text option-line"
										data-bs-toggle="modal" data-bs-target="#modal-view-order">${selectOrderListView.getPayment()}</td>
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
							<div class="col">${orderShippingView.getUser_email()}</div>
							<div class="col-2 view-title-last">총 결제금액</div>
							<div class="col">${orderShippingView.getPayment_total()}</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">결제방법</div>
							<div class="col">${orderShippingView.getPayment_way()}</div>
							<div class="col-2 view-title-last">결제정보</div>
							<div class="col">${orderShippingView.getPayment_info()}</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">택배회사</div>
							<div class="col">${orderShippingView.getDelivery()}</div>
							<div class="col-2 view-title-last">송장번호</div>
							<div class="col">${orderShippingView.getInvoice_number()}</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title-last">배송금액</div>
							<div class="col">${orderShippingView.getShipping_fee()}</div>
							<div class="col-2 view-title-last">배송메세지</div>
							<div class="col">${orderShippingView.getMemo()}</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">배송지</div>
							<div class="col">${orderShippingView.getAddress1()} ${orderShippingView.getAddress2()}</div>							
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>