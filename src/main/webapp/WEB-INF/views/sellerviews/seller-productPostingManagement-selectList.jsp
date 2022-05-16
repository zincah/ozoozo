<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="selectPostingListView" items="${selectPostingListView}">
	<tr class="content-table-content content-hover">
		<td class="content-table-content-text option-line state0">${selectPostingListView.getPost_id()}</td>
		<td class="content-table-content-text option-line">${selectPostingListView.getStar_ratio()}</td>
		<td class="content-table-content-text option-line">
		${selectPostingListView.getPost_name()}
		<c:if test="${selectPostingListView.isToday_deal()}">
			<img class="badgeicon" alt="[오늘의딜]" title="오늘의딜" src="https://ozobuc.s3.ap-northeast-2.amazonaws.com/source/badgeIcon-deal.gif">
		</c:if>
		</td>
		<td class="content-table-content-text option-line">${selectPostingListView.getSale_ratio()}%</td>
		<td class="content-table-content-text option-line"><fmt:formatNumber
				value="${selectPostingListView.getWhole_price()}" type="currency" /></td>
		<td class="content-table-content-text option-line">${selectPostingListView.getPost_couponid()}</td>
		<td class="content-table-content-text option-line">${selectPostingListView.getCate_name()}</td>
		<td class="content-table-content-text option-line">${selectPostingListView.getPost_status()}</td>
	</tr>
</c:forEach>