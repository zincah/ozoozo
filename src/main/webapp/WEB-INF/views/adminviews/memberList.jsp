<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${userList }" var="user">
	<tr class="content-table-content content-hover">
	  <td class="content-table-content-text option-line"><input class="form-check-input form-check-input-margin" type="checkbox" value="" id="flexCheckDefault1" /></td>
	  <td class="content-table-content-text option-line state0">${user.user_num }</td>
	<td class="content-table-content-text option-line">${user.nickname }</td>
	<td class="content-table-content-text option-line">${user.user_email }</td>
	<td class="content-table-content-text option-line">${user.user_type }</td>
	<td class="content-table-content-text option-line">0</td>
	<td class="content-table-content-text option-line">
<c:choose>
	<c:when test="${user.gender == true}">남성</c:when>
	<c:when test="${user.gender == false}">여성</c:when>
	<c:otherwise>-</c:otherwise>
</c:choose>

	</td>
	<td class="content-table-content-text option-line">
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.join_date}"/>
	</td>
	<td class="content-table-content-text option-line">2022-04-12 16:44</td>
	<td class="content-table-content-text option-line">0</td>
	<td class="content-table-content-text option-line">${user.user_status }</td>
</tr>
</c:forEach>