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
								<td class="content-table-title-text option-line">주문번호(그룹주문번호)</td>
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
									<td class="content-table-content-text option-line state0">${selectPostingListView.getPost_id()}</td>
									<td class="content-table-content-text option-line">${selectPostingListView.getStar_ratio()}</td>
									<td class="content-table-content-text option-line">
										${selectPostingListView.getPost_name()} <c:if
											test="${selectPostingListView.isToday_deal()}">
											<img class="badgeicon" alt="[오늘의딜]" title="오늘의딜"
												src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/badgeIcon-deal.gif">
										</c:if>
									</td>
									<td class="content-table-content-text option-line">${selectPostingListView.getSale_ratio()}%
										+ 10%</td>
									<td class="content-table-content-text option-line"><fmt:formatNumber
											value="${selectPostingListView.getWhole_price()}" type="currency" /></td>
									<td class="content-table-content-text option-line">${selectPostingListView.getPost_couponid()}</td>
									<td class="content-table-content-text option-line">${selectPostingListView.getCate_name()}</td>
									<td class="content-table-content-text option-line">${selectPostingListView.getPost_status()}</td>
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
							<div class="col-2 view-title">주문자</div>
							<div class="col">이영</div>
							<div class="col-2 view-title-last">결제금액</div>
							<div class="col">42,500</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">결제방법</div>
							<div class="col">카드결제</div>
							<div class="col-2 view-title-last">결제정보</div>
							<div class="col">신한카드 0113-23-****</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">배송방법</div>
							<div class="col">택배</div>
							<div class="col-2 view-title-last">배송금액</div>
							<div class="col">2,500</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">배송지</div>
							<div class="col">[12345] 경기도 어쩌구 저쩌구 125-21</div>
							<div class="col-2 view-title-last">배송메세지</div>
							<div class="col">던지지 마세요.</div>
						</div>
					</div>
				</div>
				<div class="product-list-group">
					<div
						class="container container-option container-option-topPadding bottomline">
						<div class="row optionGroup1">
							<div class="col-2 view-title">택배회사</div>
							<div class="col">CJ대한통운</div>
							<div class="col-2 view-title-last">송장번호</div>
							<div class="col">12387589317</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>