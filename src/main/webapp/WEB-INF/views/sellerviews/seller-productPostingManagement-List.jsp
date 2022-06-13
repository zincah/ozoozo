<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="searchPostingList" items="${searchPostingList}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line checkTd">
			<c:if test="${searchPostingList.getPost_status() ne '승인대기' and searchPostingList.getPost_status() ne '보류' and !searchPostingList.isToday_deal() and searchPostingList.getDeal_status() ne '신청'}">
				<input class="form-check-input check" type="checkbox" value="" />
			</c:if>
			<c:if test="${searchPostingList.getPost_status() eq '승인대기' or searchPostingList.getPost_status() eq '보류' or searchPostingList.isToday_deal() or searchPostingList.getDeal_status() eq '신청'}">
				<input class="form-check-input" type="checkbox" value="" disabled />
			</c:if>
		</td>
		<td class="content-table-content-text option-line state0">${searchPostingList.getPost_id()}</td>
		<td class="content-table-content-text option-line">${searchPostingList.getStar_ratio()}</td>
		<td class="content-table-content-text option-line">
		${searchPostingList.getPost_name()}
		<c:if test="${searchPostingList.isToday_deal()}">
			<img class="badgeicon" alt="[오늘의딜]" title="오늘의딜" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/badgeIcon-deal.gif">
		</c:if>
		</td>
		<!-- 딜 유무에 따른 할인율 데이터 -->
		<c:if test="${searchPostingList.isToday_deal()}">
			<td class="content-table-content-text option-line" style="color:#ff778e">
				${searchPostingList.getDeal_saleratio()}%
			</td>
		</c:if>
		<c:if test="${!searchPostingList.isToday_deal()}">
			<td class="content-table-content-text option-line">
				${searchPostingList.getSale_ratio()}%
			</td>
		</c:if>
		<!-- 딜 유무에 따른 판매 금액 데이터 -->
		<c:if test="${searchPostingList.isToday_deal()}">
			<td class="content-table-content-text option-line" style="color:#ff778e"><fmt:formatNumber
					value="${searchPostingList.getDeal_saleprice()}" type="currency" /></td>
		</c:if>
		<c:if test="${!searchPostingList.isToday_deal()}">
			<td class="content-table-content-text option-line"><fmt:formatNumber
					value="${searchPostingList.getWhole_price()}" type="currency" /></td>
		</c:if>
		<td class="content-table-content-text option-line">${searchPostingList.getPost_couponid()}</td>
		<td class="content-table-content-text option-line">${searchPostingList.getCate_name()}</td>
		<td class="content-table-content-text option-line">${searchPostingList.getPost_status()}</td>
		<td class="content-table-content-text option-line"><fmt:formatDate
				value="${searchPostingList.getPost_created()}"
				pattern="yyyy-MM-dd HH:mm" /></td>
		<td class="content-table-content-text option-line">
			<c:if test="${searchPostingList.getDeal_time() ne null}">
				<fmt:formatDate
						value="${searchPostingList.getDeal_time()}"
						pattern="yyyy-MM-dd HH:mm" />
						 ~ 
				<fmt:formatDate
						value="${searchPostingList.getDeal_endtime()}"
						pattern="yyyy-MM-dd HH:mm" />
			</c:if>
			<c:if test="${searchPostingList.getDeal_status() eq '신청'}">
							오늘의딜 승인대기중
			</c:if>
		</td>
	</tr>
</c:forEach>